from decimal import Decimal

from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, permission_required, log_activity, log_audit
from crm.models import (Lead, LeadSource, LeadStatus, LeadActivity, Customer, Note,
                        DealStage, Deal)
from crm.utils.datatables import datatables_query, parse_columns


@crm_login_required
def lead_list(request):
    return render(request, 'leads/list.html', {
        'users': _active_users(),
        'sources': LeadSource.objects.all(),
        'statuses': LeadStatus.objects.all(),
        'priorities': [choice[0] for choice in Lead.PRIORITY_CHOICES],
    })


def _active_users():
    from crm.models import User
    return User.objects.filter(status='Active')


@crm_login_required
def lead_data(request):
    qs = Lead.objects.select_related('assigned_to', 'source', 'status')
    if request.GET.get('status_id'):
        qs = qs.filter(status_id=request.GET['status_id'])
    if request.GET.get('source_id'):
        qs = qs.filter(source_id=request.GET['source_id'])
    if request.GET.get('priority'):
        qs = qs.filter(priority=request.GET['priority'])
    if request.GET.get('assigned_to'):
        qs = qs.filter(assigned_to_id=request.GET['assigned_to'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['first_name__icontains', 'last_name__icontains', 'company__icontains',
                       'email__icontains', 'phone__icontains'])
    prio_badge = {'Low': 'secondary', 'Medium': 'info', 'High': 'warning', 'Urgent': 'danger'}
    data = [{
        'id': l.id,
        'name': l.full_name,
        'company': l.company or '-',
        'email': l.email or '-',
        'phone': l.phone or '-',
        'source': l.source.name if l.source else '-',
        'status': l.status.name if l.status else '-',
        'status_color': l.status.color if l.status else '#6c757d',
        'priority': l.priority,
        'priority_class': prio_badge.get(l.priority, 'secondary'),
        'expected_revenue': f'{l.expected_revenue:,.2f}',
        'assigned_to': l.assigned_to.full_name if l.assigned_to else '-',
        'created_at': l.created_at.strftime('%d %b %Y'),
        'converted': bool(l.converted_customer_id),
    } for l in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def lead_save(request):
    pk = request.POST.get('id')
    first, last = request.POST.get('first_name', '').strip(), request.POST.get('last_name', '').strip()
    if not first or not last:
        return JsonResponse({'success': False, 'message': 'Lead name is required.'}, status=400)
    if pk:
        l = get_object_or_404(Lead, pk=pk)
        old_status = l.status.name if l.status else None
        action = 'updated'
    else:
        l = Lead()
        old_status = None
        action = 'created'
    for f in ['company', 'email', 'phone', 'website']:
        setattr(l, f, request.POST.get(f, '').strip())
    l.first_name, l.last_name = first, last
    rev = request.POST.get('expected_revenue', '0').replace(',', '') or '0'
    try:
        l.expected_revenue = Decimal(rev)
    except Exception:
        return JsonResponse({'success': False, 'message': 'Invalid revenue amount.'}, status=400)
    l.priority = request.POST.get('priority', 'Medium')
    l.notes = request.POST.get('notes', '')
    l.source_id = request.POST.get('source_id') or None
    l.status_id = request.POST.get('status_id') or None
    l.assigned_to_id = request.POST.get('assigned_to') or None
    l.save()
    new_status = l.status.name if l.status else None
    LeadActivity.objects.create(
        lead=l, user=request.user,
        activity='Created' if action == 'created' else ('Status Changed' if old_status != new_status else 'Updated'),
        description=f'Lead {action} by {request.user.get_full_name()}'
                    + (f' ({old_status} -> {new_status})' if old_status != new_status and action == 'updated' else ''))
    log_activity(request.user, 'leads', action, l.pk, request)
    return JsonResponse({'success': True, 'message': f'Lead {action}.'})


@crm_login_required
def lead_get(request, pk):
    l = get_object_or_404(Lead, pk=pk)
    return JsonResponse({'success': True, 'lead': {
        'id': l.id, 'company': l.company, 'first_name': l.first_name, 'last_name': l.last_name,
        'email': l.email, 'phone': l.phone, 'website': l.website,
        'expected_revenue': str(l.expected_revenue), 'priority': l.priority, 'notes': l.notes,
        'source_id': l.source_id, 'status_id': l.status_id, 'assigned_to': l.assigned_to_id,
    }})


@crm_login_required
@require_POST
def lead_delete(request, pk):
    l = get_object_or_404(Lead, pk=pk)
    Note.objects.filter(lead=l).delete()
    l.activities.all().delete()
    Deal.objects.filter(lead=l).update(lead=None)
    l.delete()
    log_audit(request.user, 'leads', pk, 'DELETE', {'name': l.full_name}, None, request)
    return JsonResponse({'success': True, 'message': 'Lead deleted.'})


@crm_login_required
def lead_detail(request, pk):
    l = get_object_or_404(Lead, pk=pk)
    return render(request, 'leads/detail.html', {
        'lead': l,
        'activities': l.activities.select_related('user'),
        'notes': l.note_list.select_related('user'),
        'users': _active_users(),
        'statuses': LeadStatus.objects.all(),
        'sources': LeadSource.objects.all(),
        'deals': Deal.objects.filter(lead=l).select_related('stage'),
    })


@crm_login_required
@require_POST
def lead_convert(request, pk):
    """Convert a lead into a customer."""
    l = get_object_or_404(Lead, pk=pk)
    if l.converted_customer_id:
        return JsonResponse({'success': False, 'message': 'Lead is already converted.'}, status=400)
    next_id = (Customer.objects.order_by('-id').values_list('id', flat=True).first() or 0) + 1
    c = Customer(
        assigned_to=l.assigned_to,
        customer_code=f'CUS-{next_id:05d}',
        company_name=l.company or f'{l.full_name} (Individual)',
        customer_type='Business' if l.company else 'Individual',
        first_name=l.first_name, last_name=l.last_name,
        email=l.email, phone=l.phone, website=l.website,
        notes=f'Converted from lead #{l.pk}.',
        status='Active',
    )
    c.save()
    l.converted_customer = c
    l.save(update_fields=['converted_customer'])
    LeadActivity.objects.create(lead=l, user=request.user, activity='Converted',
                                description=f'Lead converted to customer {c.customer_code}')
    log_activity(request.user, 'leads', 'converted', l.pk, request)
    notify_user(request.user, 'Lead converted',
                f'{l.full_name} converted to customer {c.customer_code}.')
    return JsonResponse({'success': True, 'message': f'Converted to {c.customer_code}.',
                         'customer_id': c.pk})


def notify_user(user, title, message, ntype='success'):
    from crm.models import Notification
    Notification.objects.create(user=user, title=title, message=message, type=ntype)


# ---------------- Lead sources / statuses ----------------

@crm_login_required
def source_list_page(request):
    return render(request, 'marketing/lead_sources.html')


@crm_login_required
def source_data(request):
    rows = [{'id': s.id, 'name': s.name, 'usage': s.lead_set.count()}
            for s in LeadSource.objects.all()]
    return JsonResponse({'data': rows})


@crm_login_required
@require_POST
def source_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('name', '').strip()
    if not name:
        return JsonResponse({'success': False, 'message': 'Name required.'}, status=400)
    if pk:
        s = get_object_or_404(LeadSource, pk=pk)
        action = 'updated'
    else:
        s = LeadSource()
        action = 'created'
    s.name = name
    try:
        s.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'Source already exists.'}, status=400)
    log_activity(request.user, 'lead_sources', action, s.pk, request)
    return JsonResponse({'success': True, 'message': f'Source {action}.'})


@crm_login_required
@require_POST
def source_delete(request, pk):
    s = get_object_or_404(LeadSource, pk=pk)
    Lead.objects.filter(source=s).update(source=None)
    s.delete()
    return JsonResponse({'success': True, 'message': 'Source deleted.'})


@crm_login_required
def status_list_page(request):
    return render(request, 'marketing/lead_statuses.html')


@crm_login_required
def status_data(request):
    rows = [{'id': s.id, 'name': s.name, 'color': s.color, 'sort_order': s.sort_order,
             'usage': s.lead_set.count()} for s in LeadStatus.objects.all()]
    return JsonResponse({'data': rows})


@crm_login_required
@require_POST
def status_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('name', '').strip()
    color = request.POST.get('color', '#6c757d') or '#6c757d'
    sort_order = request.POST.get('sort_order') or 0
    if not name:
        return JsonResponse({'success': False, 'message': 'Name required.'}, status=400)
    if pk:
        s = get_object_or_404(LeadStatus, pk=pk)
        action = 'updated'
    else:
        s = LeadStatus()
        action = 'created'
    s.name, s.color, s.sort_order = name, color, int(sort_order)
    try:
        s.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'Status already exists.'}, status=400)
    return JsonResponse({'success': True, 'message': f'Status {action}.'})


@crm_login_required
@require_POST
def status_delete(request, pk):
    s = get_object_or_404(LeadStatus, pk=pk)
    Lead.objects.filter(status=s).update(status=None)
    s.delete()
    return JsonResponse({'success': True, 'message': 'Status deleted.'})
