import functools
import json

from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import redirect
from django.contrib import messages

from ..models import ActivityLog, AuditLog, Notification, User
from ..middleware import AuditMiddleware


def log_activity(user, module, action, record_id=None, request=None):
    ActivityLog.objects.create(
        user=user if isinstance(user, User) else None,
        module=module,
        action=action,
        record_id=record_id,
        ip_address=getattr(request, 'client_ip', '') if request else '',
        user_agent=(request.META.get('HTTP_USER_AGENT', '')[:255] if request else ''),
    )


def log_audit(user, table_name, record_id, action, old_values=None, new_values=None, request=None):
    AuditLog.objects.create(
        user=user if isinstance(user, User) else None,
        table_name=table_name,
        record_id=record_id,
        action=action,
        old_values=old_values,
        new_values=new_values,
        ip_address=getattr(request, 'client_ip', '') if request else '',
    )


def notify(user, title, message='', ntype='info'):
    Notification.objects.create(user=user, title=title, message=message, type=ntype)


def model_to_dict_simple(instance, exclude=('password', 'remember_token')):
    data = {}
    for field in instance._meta.fields:
        if field.name in exclude:
            continue
        val = getattr(instance, field.name)
        data[field.name] = str(val) if val is not None else None
    return data


crm_login_required = login_required


def permission_required(slug):
    def decorator(view_func):
        @functools.wraps(view_func)
        def wrapper(request, *args, **kwargs):
            if not request.user.is_authenticated:
                return redirect('login')
            if not request.user.has_permission(slug):
                if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                    return JsonResponse({'success': False, 'message': 'Permission denied.'}, status=403)
                messages.error(request, 'You do not have permission to access that module.')
                return redirect('dashboard')
            return view_func(request, *args, **kwargs)
        return wrapper
    return decorator


def ajax_post(view_func):
    """Ensures the view is called via POST with a JSON or form body; returns parsed payload."""
    @functools.wraps(view_func)
    def wrapper(request, *args, **kwargs):
        if request.method != 'POST':
            return JsonResponse({'success': False, 'message': 'POST required'}, status=405)
        if request.content_type and 'application/json' in request.content_type:
            try:
                request.JSON = json.loads(request.body or b'{}')
            except (ValueError, TypeError):
                request.JSON = {}
        else:
            request.JSON = None
        return view_func(request, *args, **kwargs)
    return wrapper
