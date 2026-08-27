from django.core.mail import send_mail
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_POST
from django.shortcuts import get_object_or_404

from crm.decorators import crm_login_required, log_activity
from crm.models import EmailTemplate, EmailLog, Customer
from crm.utils.datatables import datatables_query, parse_columns


@crm_login_required
def template_list(request):
    return render(request, 'email/templates.html')


@crm_login_required
def template_data(request):
    rows = [{'id': t.id, 'name': t.name, 'subject': t.subject,
             'updated_at': t.updated_at.strftime('%d %b %Y'),
             'usage': t.emaillog_set.count()} for t in EmailTemplate.objects.all()]
    return JsonResponse({'data': rows})


@crm_login_required
def template_get(request, pk):
    t = get_object_or_404(EmailTemplate, pk=pk)
    return JsonResponse({'success': True, 'template': {
        'id': t.id, 'name': t.name, 'subject': t.subject, 'body': t.body}})


@crm_login_required
@require_POST
def template_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('name', '').strip()
    subject = request.POST.get('subject', '').strip()
    if not name or not subject:
        return JsonResponse({'success': False, 'message': 'Name and subject required.'}, status=400)
    if pk:
        t = get_object_or_404(EmailTemplate, pk=pk)
        action = 'updated'
    else:
        t = EmailTemplate()
        action = 'created'
    t.name, t.subject = name, subject
    t.body = request.POST.get('body', '')
    try:
        t.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'Template name exists.'}, status=400)
    log_activity(request.user, 'email_templates', action, t.pk, request)
    return JsonResponse({'success': True, 'message': f'Template {action}.'})


@crm_login_required
@require_POST
def template_delete(request, pk):
    t = get_object_or_404(EmailTemplate, pk=pk)
    EmailLog.objects.filter(template=t).update(template=None)
    t.delete()
    return JsonResponse({'success': True, 'message': 'Template deleted.'})


@crm_login_required
def bulk_email_page(request):
    return render(request, 'email/bulk.html', {
        'templates': EmailTemplate.objects.all(),
        'customers': Customer.objects.filter(is_deleted=False),
    })


@crm_login_required
@require_POST
def bulk_email_send(request):
    """Queue emails to selected customers via console backend and log them."""
    template_id = request.POST.get('template_id')
    customer_ids = request.POST.getlist('customer_ids[]')
    custom_subject = request.POST.get('subject', '').strip()
    custom_body = request.POST.get('body', '').strip()
    tpl = EmailTemplate.objects.filter(pk=template_id).first() if template_id else None
    if not tpl and not custom_body:
        return JsonResponse({'success': False, 'message': 'Select a template or write content.'}, status=400)

    sent, failed = 0, 0
    for cid in customer_ids:
        c = Customer.objects.filter(pk=cid).first()
        if not c:
            continue
        subject = custom_subject or tpl.subject
        body = custom_body or tpl.body
        body = body.replace('{{customer_name}}', c.company_name) \
                   .replace('{{contact_name}}', c.full_name) \
                   .replace('{{sender_name}}', request.user.get_full_name())
        try:
            send_mail(subject, body, 'crm@localhost', [c.email], fail_silently=False)
            status = 'Sent'
            sent += 1
        except Exception:
            status = 'Failed'
            failed += 1
        EmailLog.objects.create(customer=c, user=request.user, template=tpl,
                                recipient=c.email, subject=subject, status=status)
    log_activity(request.user, 'email_logs', f'bulk_sent({sent})', None, request)
    msg = f'{sent} email(s) queued/sent'
    if failed:
        msg += f', {failed} failed'
    return JsonResponse({'success': True, 'message': msg + '.'})


@crm_login_required
def log_list(request):
    return render(request, 'email/logs.html')


@crm_login_required
def log_data(request):
    qs = EmailLog.objects.select_related('customer', 'user', 'template')
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['recipient__icontains', 'subject__icontains',
                       'customer__company_name__icontains'])
    status_class = {'Sent': 'success', 'Failed': 'danger', 'Opened': 'info'}
    data = [{
        'id': e.id,
        'sent_at': e.sent_at.strftime('%d %b %Y %H:%M'),
        'recipient': e.recipient,
        'customer': e.customer.company_name if e.customer else '-',
        'subject': e.subject,
        'template': e.template.name if e.template else '-',
        'status': e.status,
        'status_class': status_class.get(e.status, 'secondary'),
    } for e in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})
