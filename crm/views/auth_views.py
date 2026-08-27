import secrets
from datetime import timedelta

from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.utils import timezone
from django.views.decorators.csrf import ensure_csrf_cookie
from django.views.decorators.http import require_POST

from crm.middleware import AuditMiddleware
from crm.models import User, LoginLog, Role
from crm.utils import log_activity


@ensure_csrf_cookie
def login_view(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    return render(request, 'auth/login.html')


@require_POST
def login_submit(request):
    username = request.POST.get('username', '').strip()
    password = request.POST.get('password', '')
    remember = request.POST.get('remember_me')

    user = None
    try:
        candidate = User.objects.filter(username=username).first() or \
                    User.objects.filter(email=username).first()
    except Exception:
        candidate = None

    error = None
    if not candidate:
        error = 'Invalid username or password.'
    elif candidate.status == 'Suspended':
        error = 'Your account has been suspended. Contact the administrator.'
    elif candidate.status == 'Inactive':
        error = 'Your account is inactive. Contact the administrator.'

    if not error:
        user = authenticate(request, username=candidate.username if candidate else '', password=password)

    if user is None:
        if error is None:
            error = 'Invalid username or password.'
        return JsonResponse({'success': False, 'message': error}, status=401)

    # Remember me -> persistent session for 30 days
    if remember:
        request.session.set_expiry(timedelta(days=30))
    else:
        request.session.set_expiry(0)

    login(request, user)
    User.objects.filter(pk=user.pk).update(last_login=timezone.now())

    ua = request.META.get('HTTP_USER_AGENT', '')
    LoginLog.objects.create(
        user=user,
        ip_address=getattr(request, 'client_ip', ''),
        browser=AuditMiddleware.browser_name(ua),
        operating_system=AuditMiddleware.os_name(ua),
    )
    log_activity(user, 'authentication', 'login', request=request)
    return JsonResponse({'success': True, 'redirect': '/'})


def logout_view(request):
    from crm.models import LoginLog as LL
    last_log = LL.objects.filter(user=request.user.id, logout_time__isnull=True).first()
    if last_log:
        LL.objects.filter(pk=last_log.pk).update(logout_time=timezone.now())
    log_activity(request.user, 'authentication', 'logout', request=request)
    logout(request)
    messages.success(request, 'You have been logged out.')
    return redirect('login')


@ensure_csrf_cookie
def forgot_password(request):
    if request.method == 'POST':
        email = request.POST.get('email', '').strip().lower()
        user = User.objects.filter(email=email).first()
        if user:
            token = secrets.token_urlsafe(32)
            user.remember_token = token
            user.save(update_fields=['remember_token'])
            reset_link = request.build_absolute_uri(f'/reset-password/{token}/')
            # Console backend prints the email; also surface link in dev response
            from django.core.mail import send_mail
            send_mail('CRM Password Reset',
                      f'Use this link to reset your password:\n{reset_link}',
                      'crm@localhost', [user.email], fail_silently=True)
            log_activity(None, 'authentication', 'password_reset_requested', user.pk, request)
            return JsonResponse({'success': True,
                                 'message': f'Reset link sent to your email. (Dev link: {reset_link})'})
        return JsonResponse({'success': False, 'message': 'No account found with that email.'},
                            status=404)
    return render(request, 'auth/forgot_password.html')


def reset_password(request, token):
    user = User.objects.filter(remember_token=token).first()
    if not user:
        messages.error(request, 'Invalid or expired reset link.')
        return redirect('forgot_password')

    if request.method == 'POST':
        p1 = request.POST.get('password')
        p2 = request.POST.get('confirm_password')
        if not p1 or len(p1) < 6:
            return JsonResponse({'success': False, 'message': 'Password must be at least 6 characters.'})
        if p1 != p2:
            return JsonResponse({'success': False, 'message': 'Passwords do not match.'})
        user.set_password(p1)
        user.remember_token = ''
        user.save(update_fields=['password', 'remember_token'])
        log_activity(user, 'authentication', 'password_reset', user.pk, request)
        return JsonResponse({'success': True, 'message': 'Password reset successfully.',
                             'redirect': '/login/'})
    return render(request, 'auth/reset_password.html', {'token': token})


def change_password(request):
    if request.method == 'POST':
        current = request.POST.get('current_password')
        new = request.POST.get('new_password')
        confirm = request.POST.get('confirm_password')
        if not request.user.check_password(current):
            return JsonResponse({'success': False, 'message': 'Current password is incorrect.'})
        if not new or len(new) < 6:
            return JsonResponse({'success': False, 'message': 'New password must be at least 6 characters.'})
        if new != confirm:
            return JsonResponse({'success': False, 'message': 'New passwords do not match.'})
        request.user.set_password(new)
        request.user.save(update_fields=['password'])
        update_session_auth_hash(request, request.user)
        log_activity(request.user, 'profile', 'password_changed', request.user.pk, request)
        return JsonResponse({'success': True, 'message': 'Password changed successfully.'})
    return render(request, 'auth/change_password.html')


def profile_view(request):
    if request.method == 'POST':
        user = request.user
        user.first_name = request.POST.get('first_name', '').strip()[:50]
        user.last_name = request.POST.get('last_name', '').strip()[:50]
        user.email = request.POST.get('email', '').strip()[:100]
        user.phone = request.POST.get('phone', '').strip()[:20]
        user.address = request.POST.get('address', '').strip()[:255]
        avatar = request.FILES.get('avatar')
        if avatar:
            ext = avatar.name.split('.')[-1].lower()
            allowed = {'jpg', 'jpeg', 'png', 'gif', 'webp'}
            if ext not in allowed or avatar.size > 3 * 1024 * 1024:
                return JsonResponse({'success': False,
                                     'message': 'Avatar must be an image under 3MB.'})
            user.avatar = avatar
        try:
            user.save()
        except Exception:
            return JsonResponse({'success': False, 'message': 'Email already in use.'})
        log_activity(user, 'profile', 'updated', user.pk, request)
        return JsonResponse({'success': True, 'message': 'Profile updated.'})

    login_history = LoginLog.objects.filter(user=request.user)[:10]
    return render(request, 'auth/profile.html', {'login_history': login_history})
