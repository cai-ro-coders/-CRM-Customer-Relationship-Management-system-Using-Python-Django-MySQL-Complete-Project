import json

from django.db.models import Q
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, permission_required, ajax_post, log_activity, log_audit
from crm.middleware import AuditMiddleware  # noqa: F401
from crm.models import (Customer, CustomerContact, CustomerTag, CustomerTagMap,
                        CustomerDocument, Note, Task, Deal, Invoice, Ticket, User)
from crm.utils.datatables import datatables_query, parse_columns


def _customer_payload(c):
    return {
        'id': c.id,
        'customer_code': c.customer_code,
        'company_name': c.company_name,
        'full_name': c.full_name,
        'first_name': c.first_name,
        'last_name': c.last_name,
        'email': c.email,
        'phone': c.phone,
        'mobile': c.mobile,
        'website': c.website,
        'industry': c.industry,
        'tax_number': c.tax_number,
        'customer_type': c.customer_type,
        'billing_address': c.billing_address,
        'shipping_address': c.shipping_address,
        'city': c.city,
        'state': c.state,
        'country': c.country,
        'postal_code': c.postal_code,
        'status': c.status,
        'notes': c.notes,
        'assigned_to_id': c.assigned_to_id,
        'assigned_to': c.assigned_to.full_name if c.assigned_to else '',
    }


@crm_login_required
def customer_list(request):
    import json
    users = [{'id': u.id, 'name': u.full_name}
             for u in User.objects.filter(status='Active')]
    return render(request, 'customers/list.html', {
        'users_json': json.dumps(users),
        'tags': CustomerTag.objects.all(),
    })


@crm_login_required
def customer_form(request, pk=None):
    """Full-page create/edit form (replaces the old modal)."""
    customer = get_object_or_404(Customer, pk=pk) if pk else None
    return render(request, 'customers/form.html', {
        'users': User.objects.filter(status='Active'),
        'tags': CustomerTag.objects.all(),
        'customer': customer,
        'customer_tags': list(customer.customertagmap_set.values_list('tag_id', flat=True)) if customer else [],
    })


@crm_login_required
def customer_data(request):
    """DataTables server-side processing endpoint."""
    qs = (Customer.objects.filter(is_deleted=False)
          .select_related('assigned_to'))
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    if request.GET.get('type'):
        qs = qs.filter(customer_type=request.GET['type'])

    search_fields = ['company_name__icontains', 'first_name__icontains', 'last_name__icontains',
                     'email__icontains', 'phone__icontains', 'mobile__icontains',
                     'city__icontains', 'country__icontains', 'customer_code__icontains']
    page, draw, total, filtered = datatables_query(
        request, qs,
        columns=parse_columns(request),
        search_fields=search_fields)

    data = []
    for c in page:
        tags = [t.tag.name for t in c.customertagmap_set.select_related('tag')[:4]]
        data.append({
            'id': c.id,
            'customer_code': c.customer_code,
            'company_name': c.company_name,
            'name': c.full_name,
            'email': c.email,
            'phone': c.phone or c.mobile,
            'city': c.city,
            'country': c.country,
            'industry': c.industry,
            'customer_type': c.customer_type,
            'status': c.status,
            'tags': ', '.join(tags),
            'assigned_to': c.assigned_to.full_name if c.assigned_to else '-',
            'created_at': c.created_at.strftime('%d %b %Y'),
        })
    return JsonResponse({'draw': draw, 'recordsTotal': total,
                         'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def customer_save(request):
    """AJAX create/update."""
    pk = request.POST.get('id')
    company = request.POST.get('company_name', '').strip()
    first = request.POST.get('first_name', '').strip()
    last = request.POST.get('last_name', '').strip()
    email = request.POST.get('email', '').strip()

    errors = []
    if not company:
        errors.append('Company name is required.')
    if not first or not last:
        errors.append('First and last name are required.')
    if not email:
        errors.append('Email is required.')
    if request.FILES.get('image') and request.FILES['image'].size > 3 * 1024 * 1024:
        errors.append('Image must be under 3MB.')
    if errors:
        return JsonResponse({'success': False, 'message': ' '.join(errors)}, status=400)

    if pk:
        c = get_object_or_404(Customer, pk=pk)
        old = {k: getattr(c, k) for k in ('company_name', 'email', 'status')}
        action = 'updated'
    else:
        c = Customer()
        next_id = (Customer.objects.order_by('-id').values_list('id', flat=True).first() or 0) + 1
        c.customer_code = f'CUS-{next_id:05d}'
        old = None
        action = 'created'

    fields = ['company_name', 'customer_type', 'first_name', 'last_name', 'email', 'phone',
              'mobile', 'website', 'industry', 'tax_number', 'billing_address',
              'shipping_address', 'city', 'state', 'country', 'postal_code', 'status', 'notes']
    for f in fields:
        setattr(c, f, request.POST.get(f, '').strip())
    assigned = request.POST.get('assigned_to')
    c.assigned_to_id = int(assigned) if assigned else None
    image = request.FILES.get('image')
    if image:
        ext = image.name.split('.')[-1].lower()
        if ext not in {'jpg', 'jpeg', 'png', 'gif', 'webp'}:
            return JsonResponse({'success': False, 'message': 'Invalid image type.'}, status=400)
        c.image = image
    c.save()

    # tags
    tag_ids = request.POST.getlist('tags[]') or request.POST.getlist('tags')
    if tag_ids:
        CustomerTagMap.objects.filter(customer=c).exclude(tag_id__in=tag_ids).delete()
        for tid in tag_ids:
            CustomerTagMap.objects.get_or_create(customer=c, tag_id=tid)

    log_activity(request.user, 'customers', action, c.pk, request)
    log_audit(request.user, 'customers', c.pk,
              'UPDATE' if action == 'updated' else 'CREATE', old,
              {'company_name': c.company_name, 'email': c.email}, request)
    return JsonResponse({'success': True, 'message': f'Customer {action}.',
                         'customer': _customer_payload(c)})


@crm_login_required
@require_POST
def customer_delete(request, pk):
    """Soft delete."""
    c = get_object_or_404(Customer, pk=pk)
    c.is_deleted = True
    c.save(update_fields=['is_deleted'])
    log_activity(request.user, 'customers', 'deleted', c.pk, request)
    log_audit(request.user, 'customers', c.pk, 'DELETE',
              {'company_name': c.company_name}, None, request)
    return JsonResponse({'success': True, 'message': 'Customer moved to trash.'})


@crm_login_required
def customer_get(request, pk):
    c = get_object_or_404(Customer, pk=pk)
    payload = _customer_payload(c)
    payload['tag_ids'] = list(c.customertagmap_set.values_list('tag_id', flat=True))
    return JsonResponse({'success': True, 'customer': payload})


@crm_login_required
def customer_detail(request, pk):
    c = get_object_or_404(Customer, pk=pk)
    contacts = c.contacts.all()
    notes = c.note_list.select_related('user')
    documents = c.documents.all().order_by('-created_at')
    tasks = Task.objects.filter(customer=c)[:10]
    deals = Deal.objects.filter(customer=c).select_related('stage')
    invoices = Invoice.objects.filter(customer=c).order_by('-invoice_date')[:10]
    tickets = Ticket.objects.filter(customer=c).order_by('-created_at')[:10]
    timeline = sorted(
        [{'when': d.created_at, 'icon': 'fa-file-invoice-dollar',
          'text': f'Invoice {d.invoice_number} ({d.status}) - ${d.total}'}
         for d in invoices] +
        [{'when': t.created_at, 'icon': 'fa-life-ring',
          'text': f'Ticket {t.ticket_number}: {t.subject} ({t.status})'}
         for t in tickets] +
        [{'when': n.created_at, 'icon': 'fa-sticky-note', 'text': n.note[:90]}
         for n in notes[:15]] +
        [{'when': dl.created_at, 'icon': 'fa-handshake',
          'text': f'Deal "{dl.deal_name}" ({dl.status})'} for dl in deals] +
        [{'when': tk.created_at, 'icon': 'fa-tasks',
          'text': f'Task: {tk.title} ({tk.status})'} for tk in tasks],
        key=lambda x: x['when'], reverse=True)[:25]

    context = {
        'customer': c,
        'contacts': contacts,
        'notes': notes,
        'documents': documents,
        'deals': deals,
        'invoices': invoices,
        'tickets': tickets,
        'timeline': timeline,
        'users': User.objects.filter(status='Active'),
        'tags': CustomerTag.objects.all(),
        'customer_tags': list(c.customertagmap_set.values_list('tag_id', flat=True)),
    }
    return render(request, 'customers/detail.html', context)


# ---------------- Contacts ----------------

@crm_login_required
@require_POST
def contact_save(request):
    pk = request.POST.get('id')
    customer = get_object_or_404(Customer, pk=request.POST.get('customer_id'))
    first = request.POST.get('first_name', '').strip()
    last = request.POST.get('last_name', '').strip()
    if not first or not last:
        return JsonResponse({'success': False, 'message': 'Contact name is required.'}, status=400)
    if pk:
        ct = get_object_or_404(CustomerContact, pk=pk)
        action = 'updated'
    else:
        ct = CustomerContact(customer=customer)
        action = 'created'
    ct.first_name = first
    ct.last_name = last
    ct.designation = request.POST.get('designation', '').strip()
    ct.email = request.POST.get('email', '').strip()
    ct.phone = request.POST.get('phone', '').strip()
    ct.mobile = request.POST.get('mobile', '').strip()
    is_primary = str(request.POST.get('is_primary')) == '1'
    ct.is_primary = is_primary
    ct.save()
    if is_primary:
        CustomerContact.objects.filter(customer=customer).exclude(pk=ct.pk).update(is_primary=False)
    log_activity(request.user, 'contacts', action, ct.pk, request)
    return JsonResponse({'success': True, 'message': f'Contact {action}.'})


@crm_login_required
@require_POST
def contact_delete(request, pk):
    ct = get_object_or_404(CustomerContact, pk=pk)
    ct.delete()
    log_activity(request.user, 'contacts', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Contact deleted.'})


@crm_login_required
def contact_list_page(request):
    return render(request, 'customers/contacts.html')


@crm_login_required
def contact_data(request):
    qs = CustomerContact.objects.select_related('customer')
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['first_name__icontains', 'last_name__icontains', 'email__icontains',
                       'phone__icontains', 'mobile__icontains', 'designation__icontains',
                       'customer__company_name__icontains'])
    data = [{
        'id': r.id,
        'name': r.full_name,
        'designation': r.designation or '-',
        'customer': r.customer.company_name,
        'customer_id': r.customer_id,
        'email': r.email or '-',
        'phone': r.phone or '-',
        'mobile': r.mobile or '-',
        'is_primary': bool(r.is_primary),
    } for r in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


# ---------------- Notes ----------------

@crm_login_required
@require_POST
def note_add(request):
    note_text = request.POST.get('note', '').strip()
    customer_id = request.POST.get('customer_id')
    lead_id = request.POST.get('lead_id')
    deal_id = request.POST.get('deal_id')
    if not note_text:
        return JsonResponse({'success': False, 'message': 'Note cannot be empty.'}, status=400)
    n = Note(user=request.user, note=note_text,
             customer_id=customer_id or None, lead_id=lead_id or None, deal_id=deal_id or None)
    n.save()
    log_activity(request.user, 'notes', 'created', n.pk, request)
    return JsonResponse({'success': True, 'message': 'Note added.',
                         'note': {'id': n.id, 'note': n.note,
                                  'user': request.user.get_full_name(),
                                  'created_at': n.created_at.strftime('%d %b %Y %H:%M')}})


@crm_login_required
@require_POST
def note_delete(request, pk):
    n = get_object_or_404(Note, pk=pk)
    if not (request.user.is_superuser or n.user_id == request.user.id):
        return JsonResponse({'success': False, 'message': 'Not allowed.'}, status=403)
    n.delete()
    return JsonResponse({'success': True, 'message': 'Note deleted.'})


# ---------------- Documents ----------------

@crm_login_required
@require_POST
def document_upload(request):
    customer = get_object_or_404(Customer, pk=request.POST.get('customer_id'))
    f = request.FILES.get('file')
    if not f:
        return JsonResponse({'success': False, 'message': 'No file provided.'}, status=400)
    if f.size > 20 * 1024 * 1024:
        return JsonResponse({'success': False, 'message': 'Max file size is 20MB.'}, status=400)
    doc = CustomerDocument(customer=customer, uploaded_by=request.user,
                           file_name=f.name, file_size=f.size, file_type=f.content_type or '')
    doc.file_path.save(f.name, f, save=True)
    log_activity(request.user, 'documents', 'uploaded', doc.pk, request)
    return JsonResponse({'success': True, 'message': 'Document uploaded.',
                         'document': {'id': doc.id, 'file_name': doc.file_name,
                                      'file_size': doc.file_size,
                                      'uploaded': doc.created_at.strftime('%d %b %Y')}})


@crm_login_required
@require_POST
def document_delete(request, pk):
    doc = get_object_or_404(CustomerDocument, pk=pk)
    doc.file_path.delete(save=False)
    doc.delete()
    log_activity(request.user, 'documents', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Document deleted.'})


# ---------------- Tags (marketing module too) ----------------

@crm_login_required
def tag_list_page(request):
    return render(request, 'marketing/tags.html')


@crm_login_required
def tag_data(request):
    rows = []
    for t in CustomerTag.objects.all():
        rows.append({'id': t.id, 'name': t.name, 'color': t.color,
                     'usage': t.customertagmap_set.count()})
    return JsonResponse({'data': rows})


@crm_login_required
@require_POST
def tag_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('name', '').strip()
    color = request.POST.get('color', '#6c757d').strip() or '#6c757d'
    if not name:
        return JsonResponse({'success': False, 'message': 'Tag name required.'}, status=400)
    if pk:
        t = get_object_or_404(CustomerTag, pk=pk)
        action = 'updated'
    else:
        t = CustomerTag()
        action = 'created'
    t.name = name
    t.color = color
    try:
        t.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'A tag with this name exists.'}, status=400)
    log_activity(request.user, 'customer_tags', action, t.pk, request)
    return JsonResponse({'success': True, 'message': f'Tag {action}.'})


@crm_login_required
@require_POST
def tag_delete(request, pk):
    t = get_object_or_404(CustomerTag, pk=pk)
    CustomerTagMap.objects.filter(tag=t).delete()
    t.delete()
    log_activity(request.user, 'customer_tags', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Tag deleted.'})


# ---------------- Trash / export ----------------

@crm_login_required
def customer_trash(request):
    return render(request, 'customers/trash.html')


@crm_login_required
def customer_trash_data(request):
    qs = Customer.objects.filter(is_deleted=True)
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['company_name__icontains', 'email__icontains'])
    data = [{'id': c.id, 'customer_code': c.customer_code, 'company_name': c.company_name,
             'email': c.email, 'deleted': c.updated_at.strftime('%d %b %Y')} for c in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def customer_restore(request, pk):
    c = get_object_or_404(Customer, pk=pk)
    c.is_deleted = False
    c.save(update_fields=['is_deleted'])
    log_activity(request.user, 'customers', 'restored', c.pk, request)
    return JsonResponse({'success': True, 'message': 'Customer restored.'})


@crm_login_required
@require_POST
def customer_force_delete(request, pk):
    c = get_object_or_404(Customer, pk=pk)
    c.delete()
    log_audit(request.user, 'customers', pk, 'DELETE', {'company': c.company_name}, None, request)
    return JsonResponse({'success': True, 'message': 'Customer permanently deleted.'})


@crm_login_required
def customer_export(request):
    fmt = request.GET.get('format', 'csv')
    qs = Customer.objects.filter(is_deleted=False).select_related('assigned_to')
    header = ['ID', 'Code', 'Company', 'Name', 'Email', 'Phone', 'Mobile', 'Industry',
              'City', 'State', 'Country', 'Type', 'Status', 'Assigned To']
    rows = [[c.id, c.customer_code, c.company_name, c.full_name, c.email, c.phone, c.mobile,
             c.industry, c.city, c.state, c.country, c.customer_type, c.status,
             c.assigned_to.full_name if c.assigned_to else ''] for c in qs]
    if fmt == 'excel':
        content = export_xls(header, rows)
        resp = HttpResponse(content, content_type='application/vnd.ms-excel')
        resp['Content-Disposition'] = 'attachment; filename="customers.xls"'
        return resp
    content = export_csv(header, rows)
    resp = HttpResponse(content, content_type='text/csv')
    resp['Content-Disposition'] = 'attachment; filename="customers.csv"'
    return resp


def export_csv(header, rows):
    import csv
    import io
    buf = io.StringIO()
    writer = csv.writer(buf)
    writer.writerow(header)
    writer.writerows(rows)
    return buf.getvalue()


def export_xls(header, rows):
    """Simple Excel-compatible HTML table (opens natively in Excel)."""
    html = ['<table border="1"><tr>']
    html += [f'<th>{h}</th>' for h in header]
    html.append('</tr>')
    for row in rows:
        html.append('<tr>' + ''.join(f'<td>{("" if v is None else v)}</td>' for v in row) + '</tr>')
    html.append('</table>')
    return ''.join(html)
