from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, log_activity
from crm.models import Attachment, Customer, CustomerDocument


@crm_login_required
def file_manager(request):
    attachments = Attachment.objects.select_related('user').order_by('-created_at')[:100]
    docs = CustomerDocument.objects.select_related('customer', 'uploaded_by').order_by('-created_at')[:100]
    return render(request, 'misc/file_manager.html', {
        'attachments': attachments,
        'documents': docs,
    })


@crm_login_required
@require_POST
def attachment_upload(request):
    f = request.FILES.get('file')
    if not f:
        return JsonResponse({'success': False, 'message': 'No file provided.'}, status=400)
    if f.size > 20 * 1024 * 1024:
        return JsonResponse({'success': False, 'message': 'Max file size is 20MB.'}, status=400)
    att = Attachment(user=request.user,
                     module=request.POST.get('module', 'general'),
                     record_id=request.POST.get('record_id') or None,
                     file_name=f.name, file_type=f.content_type or '', file_size=f.size)
    att.file_path.save(f.name, f, save=True)
    log_activity(request.user, 'attachments', 'uploaded', att.pk, request)
    return JsonResponse({'success': True, 'message': 'File uploaded.',
                         'attachment': {'id': att.id, 'name': att.file_name}})


@crm_login_required
@require_POST
def attachment_delete(request, pk):
    att = Attachment.objects.filter(pk=pk).first()
    if att:
        att.file_path.delete(save=False)
        att.delete()
    doc = CustomerDocument.objects.filter(pk=pk).first()
    if doc:
        doc.file_path.delete(save=False)
        doc.delete()
    log_activity(request.user, 'attachments', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'File deleted.'})


@crm_login_required
def knowledge_base(request):
    """Static placeholder knowledge base articles."""
    articles = [
        ('Getting started with the CRM', 'Learn how to navigate the dashboard, manage customers and track deals.'),
        ('Converting leads to customers', 'Step by step guide to qualifying leads and converting them into customers.'),
        ('Creating quotes and invoices', 'How to build line-item quotations and convert them to invoices in one click.'),
        ('Using the deal pipeline board', 'Drag deals between stages, forecast revenue and measure win rate.'),
        ('Support ticket workflow', 'Triage tickets with priorities and statuses, reply and attach files.'),
        ('Email templates & bulk sending', 'Create reusable templates with placeholders and send bulk campaigns.'),
    ]
    return render(request, 'misc/knowledge_base.html', {'articles': articles})
