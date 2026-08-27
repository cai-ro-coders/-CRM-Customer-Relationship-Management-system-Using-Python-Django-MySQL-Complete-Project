from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, log_activity, notify
from crm.models import Ticket, TicketCategory, TicketReply, Customer
from crm.utils.datatables import datatables_query, parse_columns


@crm_login_required
def ticket_list(request):
    return render(request, 'support/tickets.html', {
        'customers': Customer.objects.filter(is_deleted=False),
        'categories': TicketCategory.objects.all(),
        'agents': _agents(),
    })


def _agents():
    from crm.models import User
    return User.objects.filter(status='Active')


@crm_login_required
def ticket_data(request):
    qs = Ticket.objects.select_related('customer', 'assigned_to', 'category')
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    if request.GET.get('priority'):
        qs = qs.filter(priority=request.GET['priority'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['ticket_number__icontains', 'subject__icontains',
                       'customer__company_name__icontains'])
    prio_class = {'Low': 'secondary', 'Medium': 'info', 'High': 'warning', 'Urgent': 'danger'}
    status_class = {'Open': 'danger', 'In Progress': 'primary', 'On Hold': 'warning',
                    'Closed': 'success'}
    data = [{
        'id': t.id,
        'ticket_number': t.ticket_number,
        'subject': t.subject,
        'customer': t.customer.company_name,
        'category': t.category.name if t.category else '-',
        'priority': t.priority,
        'priority_class': prio_class.get(t.priority, 'secondary'),
        'status': t.status,
        'status_class': status_class.get(t.status, 'secondary'),
        'assigned_to': t.assigned_to.full_name if t.assigned_to else '-',
        'created_at': t.created_at.strftime('%d %b %Y'),
        'replies': t.replies.count(),
    } for t in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def ticket_save(request):
    pk = request.POST.get('id')
    subject = request.POST.get('subject', '').strip()
    customer_id = request.POST.get('customer_id')
    if not subject or not customer_id:
        return JsonResponse({'success': False, 'message': 'Customer and subject are required.'}, status=400)
    if pk:
        t = get_object_or_404(Ticket, pk=pk)
        action = 'updated'
    else:
        next_num = (Ticket.objects.order_by('-id').values_list('id', flat=True).first() or 0) + 1
        t = Ticket(ticket_number=f'TKT-{next_num:05d}')
        action = 'created'
    t.customer_id = customer_id
    t.subject = subject
    t.description = request.POST.get('description', '')
    t.priority = request.POST.get('priority', 'Medium')
    t.status = request.POST.get('status', 'Open')
    t.category_id = request.POST.get('category_id') or None
    t.assigned_to_id = request.POST.get('assigned_to') or None
    t.save()
    if action == 'created' and t.assigned_to and t.assigned_to != request.user:
        notify(t.assigned_to, 'New support ticket',
               f'Ticket {t.ticket_number} assigned to you: {t.subject}', 'warning')
    log_activity(request.user, 'tickets', action, t.pk, request)
    return JsonResponse({'success': True, 'message': f'Ticket {action}.'})


@crm_login_required
def ticket_get(request, pk):
    t = get_object_or_404(Ticket, pk=pk)
    return JsonResponse({'success': True, 'ticket': {
        'id': t.id, 'subject': t.subject, 'description': t.description,
        'priority': t.priority, 'status': t.status,
        'category_id': t.category_id, 'assigned_to': t.assigned_to_id,
        'customer_id': t.customer_id,
    }})


@crm_login_required
@require_POST
def ticket_delete(request, pk):
    t = get_object_or_404(Ticket, pk=pk)
    t.replies.all().delete()
    t.delete()
    log_activity(request.user, 'tickets', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Ticket deleted.'})


@crm_login_required
def ticket_detail_page(request, pk):
    t = get_object_or_404(Ticket.objects.select_related('customer', 'assigned_to', 'category'), pk=pk)
    return render(request, 'support/ticket_detail.html', {
        'ticket': t, 'replies': t.replies.select_related('user'),
    })


@crm_login_required
@require_POST
def reply_add(request, pk):
    t = get_object_or_404(Ticket, pk=pk)
    message = request.POST.get('message', '').strip()
    if not message:
        return JsonResponse({'success': False, 'message': 'Message cannot be empty.'}, status=400)
    r = TicketReply(ticket=t, user=request.user, message=message)
    attachment = request.FILES.get('attachment')
    if attachment:
        r.attachment = attachment
    r.save()
    # reopen closed tickets on customer-facing activity? keep status logic simple
    log_activity(request.user, 'tickets', 'replied', t.pk, request)
    return JsonResponse({'success': True, 'message': 'Reply posted.',
                         'reply': {'user': request.user.get_full_name(),
                                   'when': r.created_at.strftime('%d %b %Y %H:%M')}})


# ---------------- Categories ----------------

@crm_login_required
def category_list_page(request):
    return render(request, 'support/categories.html')


@crm_login_required
def category_data(request):
    rows = [{'id': c.id, 'name': c.name, 'ticket_count': c.ticket_set.count()}
            for c in TicketCategory.objects.all()]
    return JsonResponse({'data': rows})


@crm_login_required
@require_POST
def category_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('name', '').strip()
    if not name:
        return JsonResponse({'success': False, 'message': 'Name required.'}, status=400)
    if pk:
        c = get_object_or_404(TicketCategory, pk=pk)
        action = 'updated'
    else:
        c = TicketCategory()
        action = 'created'
    c.name = name
    try:
        c.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'Category already exists.'}, status=400)
    return JsonResponse({'success': True, 'message': f'Category {action}.'})


@crm_login_required
@require_POST
def category_delete(request, pk):
    c = get_object_or_404(TicketCategory, pk=pk)
    Ticket.objects.filter(category=c).update(category=None)
    c.delete()
    return JsonResponse({'success': True, 'message': 'Category deleted.'})
