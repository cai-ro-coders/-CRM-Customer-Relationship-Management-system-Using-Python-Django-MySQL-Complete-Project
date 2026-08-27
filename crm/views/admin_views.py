from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, permission_required, log_activity, log_audit
from crm.models import (User, Role, Permission, RolePermission, ActivityLog, LoginLog,
                        AuditLog, Notification)
from crm.utils.datatables import datatables_query, parse_columns


# ================= USERS =================

@crm_login_required
@permission_required('users.view')
def user_list(request):
    return render(request, 'admin/users.html', {'roles': Role.objects.all()})


@crm_login_required
def user_data(request):
    qs = User.objects.select_related('role')
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    if request.GET.get('role_id'):
        qs = qs.filter(role_id=request.GET['role_id'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['username__icontains', 'first_name__icontains', 'last_name__icontains',
                       'email__icontains', 'phone__icontains'])
    status_class = {'Active': 'success', 'Inactive': 'secondary', 'Suspended': 'danger'}
    data = [{
        'id': u.id,
        'avatar': u.avatar.url if u.avatar else '',
        'name': u.full_name,
        'username': u.username,
        'email': u.email,
        'phone': u.phone or '-',
        'role': u.role.name if u.role else '-',
        'status': u.status,
        'status_class': status_class.get(u.status, 'secondary'),
        'last_login': u.last_login.strftime('%d %b %Y %H:%M') if u.last_login else 'Never',
    } for u in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def user_save(request):
    if not request.user.has_permission('users.create') and not request.user.is_superuser:
        return JsonResponse({'success': False, 'message': 'Permission denied.'}, status=403)
    pk = request.POST.get('id')
    username = request.POST.get('username', '').strip()
    email = request.POST.get('email', '').strip()
    first = request.POST.get('first_name', '').strip()
    last = request.POST.get('last_name', '').strip()
    if not username or not email or not first:
        return JsonResponse({'success': False, 'message': 'Username, email and first name required.'}, status=400)

    if pk:
        u = get_object_or_404(User, pk=pk)
        action = 'updated'
        old_role = u.role.name if u.role else None
    else:
        password = request.POST.get('password')
        if not password or len(password) < 6:
            return JsonResponse({'success': False, 'message': 'Password must be at least 6 characters.'}, status=400)
        u = User()
        action = 'created'
        old_role = None

    u.username, u.email = username, email
    u.first_name, u.last_name = first, last
    u.phone = request.POST.get('phone', '')
    u.address = request.POST.get('address', '')
    u.status = request.POST.get('status', 'Active')
    role_id = request.POST.get('role_id')
    u.role_id = role_id or None
    avatar = request.FILES.get('avatar')
    if avatar:
        ext = avatar.name.split('.')[-1].lower()
        if ext not in {'jpg', 'jpeg', 'png', 'gif', 'webp'} or avatar.size > 3 * 1024 * 1024:
            return JsonResponse({'success': False, 'message': 'Avatar must be an image under 3MB.'}, status=400)
        u.avatar = avatar
    new_password = request.POST.get('password')
    if new_password and pk:
        u.set_password(new_password)
    try:
        u.save()
        if not pk:  # created
            u.set_password(new_password or 'Admin@123')
            u.save(update_fields=['password'])
    except Exception:
        return JsonResponse({'success': False, 'message': 'Username or email already exists.'}, status=400)

    new_role = u.role.name if u.role else None
    if action == 'updated' and old_role != new_role:
        log_audit(request.user, 'users', u.pk, 'ROLE_CHANGE',
                  {'role': old_role}, {'role': new_role}, request)
    log_activity(request.user, 'users', action, u.pk, request)
    return JsonResponse({'success': True, 'message': f'User {action}.'})


@crm_login_required
def user_get(request, pk):
    u = get_object_or_404(User, pk=pk)
    return JsonResponse({'success': True, 'user': {
        'id': u.id, 'username': u.username, 'email': u.email,
        'first_name': u.first_name, 'last_name': u.last_name,
        'phone': u.phone, 'address': u.address, 'status': u.status,
        'role_id': u.role_id,
    }})


@crm_login_required
@require_POST
def user_delete(request, pk):
    if int(pk) == request.user.id:
        return JsonResponse({'success': False, 'message': "You can't delete your own account."}, status=400)
    u = get_object_or_404(User, pk=pk)
    log_audit(request.user, 'users', pk, 'DELETE', {'username': u.username}, None, request)
    u.login_logs.all().delete()
    u.notifications.all().delete()
    u.delete()
    log_activity(request.user, 'users', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'User deleted.'})


# ================= ROLES =================

@crm_login_required
@permission_required('roles.view')
def role_list(request):
    return render(request, 'admin/roles.html')


@crm_login_required
@permission_required('roles.view')
def role_form(request, pk=None):
    r = get_object_or_404(Role, pk=pk) if pk else None
    selected = list(r.rolepermission_set.values_list('permission__id', flat=True)) if r else []
    modules = []
    for p in Permission.objects.order_by('module', 'slug'):
        if not modules or modules[-1]['module'] != p.module:
            modules.append({'module': p.module,
                            'label': p.module.replace('_', ' ').title(), 'perms': []})
        modules[-1]['perms'].append(p)
    return render(request, 'admin/role_form.html', {'role': r, 'modules': modules, 'selected': selected})


@crm_login_required
def role_data(request):
    rows = []
    for r in Role.objects.all():
        rows.append({
            'id': r.id, 'name': r.name, 'description': r.description or '-',
            'user_count': r.user_set.count(),
            'permission_count': r.rolepermission_set.count(),
        })
    return JsonResponse({'data': rows})


@crm_login_required
def role_get(request, pk):
    r = get_object_or_404(Role, pk=pk)
    perms = list(r.rolepermission_set.values_list('permission__slug', flat=True))
    all_perms = [{'slug': p.slug, 'name': p.name, 'module': p.module}
                 for p in Permission.objects.order_by('module', 'slug')]
    return JsonResponse({'success': True, 'role': {
        'id': r.id, 'name': r.name, 'description': r.description},
        'permissions': perms, 'all_permissions': all_perms})


@crm_login_required
@require_POST
def role_save(request):
    if not request.user.has_permission('roles.update') and not request.user.is_superuser:
        return JsonResponse({'success': False, 'message': 'Permission denied.'}, status=403)
    pk = request.POST.get('id')
    name = request.POST.get('name', '').strip()
    if not name:
        return JsonResponse({'success': False, 'message': 'Role name required.'}, status=400)
    with_role_update = bool(pk)
    if pk:
        r = get_object_or_404(Role, pk=pk)
        old_desc = r.description
    else:
        r = Role()
        old_desc = None
    r.name = name
    r.description = request.POST.get('description', '')
    try:
        r.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'Role already exists.'}, status=400)

    perm_ids = request.POST.getlist('permissions[]')
    r.rolepermission_set.all().delete()
    RolePermission.objects.bulk_create(
        [RolePermission(role=r, permission_id=p) for p in perm_ids])

    if with_role_update:
        log_audit(request.user, 'roles', r.pk, 'UPDATE',
                  {'description': old_desc},
                  {'description': r.description, 'permissions': len(perm_ids)}, request)
    log_activity(request.user, 'roles', 'updated' if pk else 'created', r.pk, request)
    return JsonResponse({'success': True, 'message': f'Role {"updated" if pk else "created"}.'})


@crm_login_required
@require_POST
def role_delete(request, pk):
    r = get_object_or_404(Role, pk=pk)
    if r.user_set.exists():
        return JsonResponse({'success': False, 'message': 'Role has users assigned.'}, status=400)
    r.rolepermission_set.all().delete()
    r.delete()
    log_audit(request.user, 'roles', pk, 'DELETE', {'name': r.name}, None, request)
    return JsonResponse({'success': True, 'message': 'Role deleted.'})


# ================= PERMISSIONS =================

@crm_login_required
@permission_required('permissions.view')
def permission_list(request):
    modules = {}
    for p in Permission.objects.order_by('module', 'slug'):
        modules.setdefault(p.module, []).append(p)
    return render(request, 'admin/permissions.html', {'modules': dict(modules)})


# ================= LOGS =================

@crm_login_required
@permission_required('activity_logs.view')
def activity_log_page(request):
    return render(request, 'logs/activity.html')


@crm_login_required
def activity_log_data(request):
    qs = ActivityLog.objects.select_related('user')
    if request.GET.get('module'):
        qs = qs.filter(module=request.GET['module'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['module__icontains', 'action__icontains', 'ip_address__icontains',
                       'user__username__icontains'])
    data = [{
        'id': a.id,
        'created_at': a.created_at.strftime('%d %b %Y %H:%M'),
        'user': a.user.username if a.user else 'System',
        'module': a.module,
        'action': a.action,
        'record_id': a.record_id or '-',
        'ip_address': a.ip_address or '-',
    } for a in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@permission_required('login_logs.view')
def login_log_page(request):
    return render(request, 'logs/login.html')


@crm_login_required
def login_log_data(request):
    qs = LoginLog.objects.select_related('user')
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['user__username__icontains', 'ip_address__icontains',
                       'browser__icontains', 'operating_system__icontains'])
    data = [{
        'id': l.id,
        'user': l.user.username if l.user else '-',
        'login_time': l.login_time.strftime('%d %b %Y %H:%M'),
        'logout_time': l.logout_time.strftime('%d %b %Y %H:%M') if l.logout_time else '-',
        'ip_address': l.ip_address or '-',
        'browser': l.browser or '-',
        'operating_system': l.operating_system or '-',
    } for l in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def login_log_delete(request, pk):
    if not request.user.has_permission('login_logs.delete') and not request.user.is_superuser:
        return JsonResponse({'success': False, 'message': 'Permission denied.'}, status=403)
    log = get_object_or_404(LoginLog, pk=pk)
    log.delete()
    log_activity(request.user, 'login_logs', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Login log deleted.'})


@crm_login_required
@permission_required('audit_logs.view')
def audit_log_page(request):
    return render(request, 'logs/audit.html')


@crm_login_required
def audit_log_data(request):
    qs = AuditLog.objects.select_related('user')
    if request.GET.get('table_name'):
        qs = qs.filter(table_name=request.GET['table_name'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['table_name__icontains', 'action__icontains',
                       'user__username__icontains'])
    action_class = {'CREATE': 'success', 'UPDATE': 'primary', 'DELETE': 'danger',
                    'LOGIN': 'info', 'LOGOUT': 'secondary', 'ROLE_CHANGE': 'warning'}
    import json as _json
    data = [{
        'id': a.id,
        'created_at': a.created_at.strftime('%d %b %Y %H:%M'),
        'user': a.user.username if a.user else 'System',
        'table_name': a.table_name,
        'record_id': a.record_id or '-',
        'action': a.action,
        'action_class': action_class.get(a.action, 'secondary'),
        'old_values': _json.dumps(a.old_values) if a.old_values else '-',
        'new_values': _json.dumps(a.new_values) if a.new_values else '-',
    } for a in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


# ================= NOTIFICATIONS =================

@crm_login_required
def notification_list_page(request):
    notifications = Notification.objects.filter(user=request.user)[:50]
    return render(request, 'misc/notifications.html', {'notifications': notifications})


@crm_login_required
def notification_poll(request):
    """AJAX poller for topbar bell + toasts."""
    since = request.GET.get('since')
    qs = Notification.objects.filter(user=request.user)
    unread = qs.filter(is_read=False).count()
    latest = []
    recent = qs[:5]
    for n in recent:
        latest.append({'id': n.id, 'title': n.title, 'message': n.message,
                       'type': n.type, 'is_read': n.is_read,
                       'when': n.created_at.strftime('%d %b %H:%M')})
    return JsonResponse({'unread': unread, 'notifications': latest})


@crm_login_required
@require_POST
def notification_mark_read(request, pk=None):
    if pk:
        Notification.objects.filter(user=request.user, pk=pk).update(is_read=True)
    else:
        Notification.objects.filter(user=request.user).update(is_read=True)
    return JsonResponse({'success': True, 'message': 'Marked as read.'})


# ================= SETTINGS =================

@crm_login_required
@permission_required('settings.view')
def settings_page(request):
    from crm.models import Setting
    setting = Setting.objects.first()
    return render(request, 'settings/index.html', {'setting': setting})


@crm_login_required
@require_POST
def settings_save(request):
    if not request.user.has_permission('settings.update') and not request.user.is_superuser:
        return JsonResponse({'success': False, 'message': 'Permission denied.'}, status=403)
    from crm.models import Setting as S
    s = S.objects.first() or S()
    fields = ['company_name', 'company_email', 'company_phone', 'address', 'city', 'state',
              'country', 'postal_code', 'currency', 'timezone', 'language',
              'smtp_host', 'smtp_port', 'smtp_username', 'smtp_encryption']
    for f in fields:
        setattr(s, f, request.POST.get(f, '').strip())
    pwd = request.POST.get('smtp_password')
    if pwd:
        s.smtp_password = pwd
    logo = request.FILES.get('logo')
    if logo:
        ext = logo.name.split('.')[-1].lower()
        if ext in {'jpg', 'jpeg', 'png', 'svg', 'webp'}:
            s.logo = logo
    s.theme = request.POST.get('theme', 'light')
    s.save()
    log_audit(request.user, 'settings', s.pk, 'UPDATE', None,
              {'company_name': s.company_name, 'currency': s.currency}, request)
    log_activity(request.user, 'settings', 'updated', s.pk, request)
    return JsonResponse({'success': True, 'message': 'Settings saved.'})


@crm_login_required
def backup_page(request):
    return render(request, 'settings/backup.html')


@crm_login_required
@require_POST
def backup_download(request):
    """Dumps core business data to a JSON backup file."""
    import io
    from django.core import serializers
    from django.http import HttpResponse
    from crm.models import (Customer, CustomerContact, CustomerTag, CustomerTagMap,
                            LeadSource, LeadStatus, Lead, Pipeline, DealStage, Deal,
                            Task, Meeting, ProductCategory, Product, Quote, Invoice,
                            Payment, Ticket, TicketCategory, EmailTemplate, Note)

    data = serializers.serialize('json', [
        obj for model in [Role, Permission, RolePermission, Customer, CustomerContact,
                          CustomerTag, CustomerTagMap, LeadSource, LeadStatus, Lead,
                          Pipeline, DealStage, Deal, Task, Meeting, ProductCategory, Product,
                          Quote, Invoice, Payment, Ticket, TicketCategory, EmailTemplate,
                          Note]
        for obj in model.objects.all()])
    buf = io.StringIO()
    buf.write(data)
    response = HttpResponse(buf.getvalue(), content_type='application/json')
    response['Content-Disposition'] = 'attachment; filename="crm_backup.json"'
    return response


@crm_login_required
def system_info(request):
    import sys
    import django
    import pymysql
    info = {
        'Django Version': django.get_version(),
        'Python Version': sys.version.split()[0],
        'PyMySQL Version': pymysql.__version__,
        'Database Engine': 'MySQL (MAMP)',
        'Time Zone': timezone.get_current_timezone_name(),
        'Users': User.objects.count(),
        'Server Time': timezone.now().strftime('%d %b %Y %H:%M:%S'),
    }
    return render(request, 'settings/system_info.html', {'info': info})
