from types import SimpleNamespace

from django.http import JsonResponse
from django.shortcuts import render
from django.utils import timezone
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, log_activity, notify
from crm.models import Task, Customer, Lead, Deal
from crm.utils.datatables import datatables_query, parse_columns


@crm_login_required
def task_list(request):
    scope = request.GET.get('scope', 'all')
    return render(request, 'tasks/list.html', {
        'users': _users(),
        'customers': Customer.objects.filter(is_deleted=False),
        'leads': Lead.objects.all()[:200],
        'deals': Deal.objects.all()[:200],
        'statuses': [choice[0] for choice in Task.STATUS_CHOICES],
        'priorities': [choice[0] for choice in Task.PRIORITY_CHOICES],
        'scope': scope,
    })


@crm_login_required
def task_board(request):
    today = timezone.now().date()
    prio_class = {'Low': 'secondary', 'Medium': 'info', 'High': 'warning', 'Urgent': 'danger'}
    tasks = (Task.objects.select_related('assigned_to', 'customer', 'lead', 'deal')
             .exclude(status='Cancelled'))
    items = []
    for t in tasks:
        related = (t.customer.company_name if t.customer else
                   (t.lead.full_name if t.lead else
                    (t.deal.deal_name if t.deal else None)))
        items.append(SimpleNamespace(
            pk=t.pk, title=t.title, priority=t.priority,
            priority_class=prio_class.get(t.priority, 'secondary'), status=t.status,
            due_date=t.due_date.strftime('%d %b %Y') if t.due_date else None,
            overdue=bool(t.due_date and t.due_date < today and t.status != 'Completed'),
            related=related, assigned_to=t.assigned_to,
        ))
    board = [{'status': s, 'tasks': [i for i in items if i.status == s]}
             for s in ('Pending', 'In Progress', 'Completed')]
    return render(request, 'tasks/board.html', {'board': board})


def _users():
    from crm.models import User
    return User.objects.filter(status='Active')


@crm_login_required
def task_data(request):
    qs = Task.objects.select_related('assigned_to', 'customer', 'lead', 'deal')
    scope = request.GET.get('scope')
    if scope == 'my':
        qs = qs.filter(assigned_to=request.user)
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    if request.GET.get('priority'):
        qs = qs.filter(priority=request.GET['priority'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['title__icontains', 'description__icontains',
                       'customer__company_name__icontains'])
    prio_class = {'Low': 'secondary', 'Medium': 'info', 'High': 'warning', 'Urgent': 'danger'}
    status_class = {'Pending': 'secondary', 'In Progress': 'primary',
                    'Completed': 'success', 'Cancelled': 'dark'}
    today = timezone.now().date()
    data = [{
        'id': t.id,
        'title': t.title,
        'description': (t.description or '')[:80],
        'priority': t.priority,
        'priority_class': prio_class.get(t.priority, 'secondary'),
        'status': t.status,
        'status_class': status_class.get(t.status, 'secondary'),
        'due_date': t.due_date.strftime('%d %b %Y') if t.due_date else '-',
        'overdue': bool(t.due_date and t.due_date < today and t.status not in ('Completed', 'Cancelled')),
        'reminder_date': t.reminder_date.strftime('%d %b %Y') if t.reminder_date else '-',
        'related': (t.customer.company_name if t.customer else
                    (t.lead.full_name if t.lead else
                     (t.deal.deal_name if t.deal else '-'))),
        'assigned_to': t.assigned_to.full_name if t.assigned_to else '-',
    } for t in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def task_save(request):
    pk = request.POST.get('id')
    title = request.POST.get('title', '').strip()
    if not title:
        return JsonResponse({'success': False, 'message': 'Title is required.'}, status=400)
    if pk:
        t = get_object_or_404(Task, pk=pk)
        action = 'updated'
    else:
        t = Task()
        action = 'created'
    old_status = t.status
    t.title = title
    t.description = request.POST.get('description', '')
    t.priority = request.POST.get('priority', 'Medium')
    t.status = request.POST.get('status', 'Pending')
    due = request.POST.get('due_date')
    reminder = request.POST.get('reminder_date')
    t.due_date = due or None
    t.reminder_date = reminder or None
    if t.status == 'Completed' and not t.completed_at:
        from datetime import datetime
        t.completed_at = timezone.now()
    elif t.status != 'Completed':
        t.completed_at = None
    t.customer_id = request.POST.get('customer_id') or None
    t.lead_id = request.POST.get('lead_id') or None
    t.deal_id = request.POST.get('deal_id') or None
    t.assigned_to_id = request.POST.get('assigned_to') or None
    t.save()
    if t.status != old_status and t.status == 'Completed' and t.assigned_to:
        notify(t.assigned_to, 'Task completed',
               f'"{t.title}" marked as completed by {request.user.get_full_name()}.', 'success')
    log_activity(request.user, 'tasks', action, t.pk, request)
    return JsonResponse({'success': True, 'message': f'Task {action}.'})


from django.shortcuts import get_object_or_404


@crm_login_required
def task_get(request, pk):
    t = get_object_or_404(Task, pk=pk)
    return JsonResponse({'success': True, 'task': {
        'id': t.id, 'title': t.title, 'description': t.description,
        'priority': t.priority, 'status': t.status,
        'due_date': t.due_date.isoformat() if t.due_date else '',
        'reminder_date': t.reminder_date.isoformat() if t.reminder_date else '',
        'customer_id': t.customer_id, 'lead_id': t.lead_id, 'deal_id': t.deal_id,
        'assigned_to': t.assigned_to_id,
    }})


@crm_login_required
@require_POST
def task_toggle_status(request, pk):
    """Quick AJAX complete/reopen toggle."""
    t = get_object_or_404(Task, pk=pk)
    t.status = 'Completed' if t.status != 'Completed' else 'Pending'
    t.completed_at = timezone.now() if t.status == 'Completed' else None
    t.save(update_fields=['status', 'completed_at', 'updated_at'])
    log_activity(request.user, 'tasks', 'status_changed', t.pk, request)
    return JsonResponse({'success': True, 'message': f'Task {t.status.lower()}.', 'status': t.status})


@crm_login_required
@require_POST
def task_delete(request, pk):
    t = get_object_or_404(Task, pk=pk)
    t.delete()
    log_activity(request.user, 'tasks', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Task deleted.'})
