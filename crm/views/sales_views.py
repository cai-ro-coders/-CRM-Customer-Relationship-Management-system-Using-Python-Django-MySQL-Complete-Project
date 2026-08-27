import json
from datetime import timedelta
from decimal import Decimal

from django.db import transaction
from django.db.models import Sum, Q
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, log_activity
from crm.models import (Quote, QuoteItem, Invoice, InvoiceItem, Payment,
                        Customer, Product)
from crm.utils.datatables import datatables_query, parse_columns


def _customers():
    return Customer.objects.filter(is_deleted=False)


def _products():
    return Product.objects.filter(status='Active')


# ================= QUOTES =================

@crm_login_required
def quote_list(request):
    today = timezone.now().date()
    stats = {
        'total': Quote.objects.count(),
        'accepted_value': Quote.objects.filter(status='Accepted').aggregate(
            s=Sum('total'))['s'] or 0,
        'pending': Quote.objects.filter(status='Sent').count(),
    }
    return render(request, 'sales/quotes.html', {
        'customers': _customers(), 'products': _products(), 'stats': stats,
    })


@crm_login_required
def quote_data(request):
    qs = Quote.objects.select_related('customer', 'created_by')
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['quote_number__icontains', 'customer__company_name__icontains'])
    status_class = {'Draft': 'secondary', 'Sent': 'primary', 'Accepted': 'success',
                    'Declined': 'danger', 'Expired': 'warning'}
    data = [{
        'id': q.id,
        'quote_number': q.quote_number,
        'customer': q.customer.company_name,
        'quote_date': q.quote_date.strftime('%d %b %Y'),
        'expiry_date': q.expiry_date.strftime('%d %b %Y') if q.expiry_date else '-',
        'total': f'{q.total:,.2f}',
        'status': q.status,
        'status_class': status_class.get(q.status, 'secondary'),
        'created_by': q.created_by.full_name if q.created_by else '-',
    } for q in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
def quote_detail_page(request, pk):
    q = get_object_or_404(Quote.objects.select_related('customer', 'created_by'), pk=pk)
    return render(request, 'sales/quote_detail.html', {'quote': q})


@crm_login_required
@require_POST
def quote_save(request):
    """Creates/updates a quote with line items sent as JSON."""
    try:
        payload = json.loads(request.POST.get('items', '[]'))
    except ValueError:
        return JsonResponse({'success': False, 'message': 'Invalid items payload.'}, status=400)

    customer_id = request.POST.get('customer_id')
    if not customer_id:
        return JsonResponse({'success': False, 'message': 'Customer is required.'}, status=400)

    with transaction.atomic():
        pk = request.POST.get('id')
        if pk:
            q = get_object_or_404(Quote, pk=pk)
            action = 'updated'
            q.items.all().delete()
        else:
            year = timezone.now().year
            next_num = (Quote.objects.order_by('-id').values_list('id', flat=True).first() or 0) + 1
            q = Quote(quote_number=f'QT-{year}-{next_num:04d}', created_by=request.user)
            action = 'created'

        q.customer_id = customer_id
        q.quote_date = request.POST.get('quote_date') or timezone.now().date()
        exp = request.POST.get('expiry_date')
        q.expiry_date = exp or None
        q.status = request.POST.get('status', 'Draft')
        q.notes = request.POST.get('notes', '')
        q.discount = Decimal(request.POST.get('discount_total', '0').replace(',', '') or '0')
        q.save()

        subtotal, tax_total = Decimal('0'), Decimal('0')
        for it in payload:
            product_id = it.get('product_id') or None
            qty = Decimal(str(it.get('quantity', 1) or 1))
            price = Decimal(str(it.get('price', 0) or 0))
            tax_rate = Decimal(str(it.get('tax', 0) or 0))
            disc_rate = Decimal(str(it.get('discount', 0) or 0))
            line_sub = qty * price
            line_tax = line_sub * tax_rate / 100
            line_disc = line_sub * disc_rate / 100
            total = (line_sub + line_tax - line_disc).quantize(Decimal('.01'))
            QuoteItem.objects.create(quote=q, product_id=product_id, quantity=qty,
                                     price=price, tax=tax_rate, discount=disc_rate, total=total)
            subtotal += line_sub
            tax_total += line_tax
        q.subtotal = subtotal.quantize(Decimal('.01'))
        q.tax = tax_total.quantize(Decimal('.01'))
        q.total = (subtotal + tax_total - q.discount).quantize(Decimal('.01'))
        q.save()

    log_activity(request.user, 'quotes', action, q.pk, request)
    return JsonResponse({'success': True, 'message': f'Quote {action}.', 'id': q.pk})


@crm_login_required
def quote_get(request, pk):
    q = get_object_or_404(Quote.objects.prefetch_related('items'), pk=pk)
    items = [{'product_id': i.product_id, 'product_name': i.product.product_name if i.product else '',
              'quantity': str(i.quantity), 'price': str(i.price), 'tax': str(i.tax),
              'discount': str(i.discount), 'total': str(i.total)} for i in q.items.all()]
    return JsonResponse({'success': True, 'quote': {
        'id': q.id, 'customer_id': q.customer_id,
        'quote_date': q.quote_date.isoformat(),
        'expiry_date': q.expiry_date.isoformat() if q.expiry_date else '',
        'status': q.status, 'notes': q.notes, 'discount_total': str(q.discount),
    }, 'items': items})


@crm_login_required
@require_POST
def quote_delete(request, pk):
    q = get_object_or_404(Quote, pk=pk)
    q.items.all().delete()
    Invoice.objects.filter(quote=q).update(quote=None)
    q.delete()
    log_activity(request.user, 'quotes', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Quote deleted.'})


@crm_login_required
@require_POST
def quote_convert(request, pk):
    """Convert quote to invoice."""
    q = get_object_or_404(Quote.objects.prefetch_related('items'), pk=pk)
    if not q.items.exists():
        return JsonResponse({'success': False, 'message': 'Quote has no items.'}, status=400)
    with transaction.atomic():
        next_num = (Invoice.objects.order_by('-id').values_list('id', flat=True).first() or 0) + 1
        today = timezone.now().date()
        inv = Invoice(customer=q.customer, quote=q, created_by=request.user,
                      invoice_number=f'INV-{today.year}-{next_num:04d}',
                      invoice_date=today, due_date=today + timedelta(days=30),
                      subtotal=q.subtotal, tax=q.tax, discount=q.discount, total=q.total,
                      paid_amount=0, balance=q.total, status='Sent', notes=f'From {q.quote_number}')
        inv.save()
        for i in q.items.all():
            InvoiceItem.objects.create(invoice=inv, product=i.product, quantity=i.quantity,
                                       price=i.price, tax=i.tax, discount=i.discount, total=i.total)
    log_activity(request.user, 'invoices', 'created_from_quote', inv.pk, request)
    return JsonResponse({'success': True, 'message': f'Invoice {inv.invoice_number} created.',
                         'invoice_id': inv.pk})


@crm_login_required
def quote_pdf(request, pk):
    """Printable HTML invoice (browser print -> PDF)."""
    q = get_object_or_404(Quote.objects.select_related('customer', 'created_by')
                          .prefetch_related('items__product'), pk=pk)
    from crm.models import Setting
    return render(request, 'sales/print_quote.html', {'quote': q, 'setting': Setting.objects.first()})


# ================= INVOICES =================

@crm_login_required
def invoice_list(request):
    stats = {
        'total_billed': Invoice.objects.exclude(status='Cancelled').aggregate(s=Sum('total'))['s'] or 0,
        'total_paid': Invoice.objects.aggregate(s=Sum('paid_amount'))['s'] or 0,
        'overdue_count': Invoice.objects.filter(status='Overdue').count(),
    }
    return render(request, 'sales/invoices.html', {
        'customers': _customers(), 'products': _products(), 'stats': stats,
    })


@crm_login_required
def invoice_data(request):
    qs = Invoice.objects.select_related('customer', 'created_by')
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['invoice_number__icontains', 'customer__company_name__icontains'])
    status_class = {'Draft': 'secondary', 'Sent': 'primary', 'Partial': 'info',
                    'Paid': 'success', 'Overdue': 'danger', 'Cancelled': 'dark'}
    data = [{
        'id': v.id,
        'invoice_number': v.invoice_number,
        'customer': v.customer.company_name,
        'invoice_date': v.invoice_date.strftime('%d %b %Y'),
        'due_date': v.due_date.strftime('%d %b %Y') if v.due_date else '-',
        'total': f'{v.total:,.2f}',
        'paid_amount': f'{v.paid_amount:,.2f}',
        'balance': f'{v.balance:,.2f}',
        'status': v.status,
        'status_class': status_class.get(v.status, 'secondary'),
    } for v in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
def invoice_detail_page(request, pk):
    v = get_object_or_404(Invoice.objects.select_related('customer', 'created_by')
                          .prefetch_related('items__product', 'payments'), pk=pk)
    return render(request, 'sales/invoice_detail.html', {'invoice': v})


@crm_login_required
@require_POST
def invoice_save(request):
    try:
        payload = json.loads(request.POST.get('items', '[]'))
    except ValueError:
        return JsonResponse({'success': False, 'message': 'Invalid items payload.'}, status=400)
    customer_id = request.POST.get('customer_id')
    if not customer_id:
        return JsonResponse({'success': False, 'message': 'Customer is required.'}, status=400)

    with transaction.atomic():
        pk = request.POST.get('id')
        if pk:
            v = get_object_or_404(Invoice, pk=pk)
            action = 'updated'
            v.items.all().delete()
        else:
            year = timezone.now().year
            next_num = (Invoice.objects.order_by('-id').values_list('id', flat=True).first() or 0) + 1
            v = Invoice(invoice_number=f'INV-{year}-{next_num:04d}', created_by=request.user,
                        paid_amount=0, balance=0)
            action = 'created'
        v.customer_id = customer_id
        v.invoice_date = request.POST.get('invoice_date') or timezone.now().date()
        due = request.POST.get('due_date')
        v.due_date = due or None
        v.notes = request.POST.get('notes', '')
        v.discount = Decimal(request.POST.get('discount_total', '0').replace(',', '') or '0')
        v.save()

        subtotal, tax_total = Decimal('0'), Decimal('0')
        for it in payload:
            qty = Decimal(str(it.get('quantity', 1) or 1))
            price = Decimal(str(it.get('price', 0) or 0))
            tax_rate = Decimal(str(it.get('tax', 0) or 0))
            disc_rate = Decimal(str(it.get('discount', 0) or 0))
            line_sub = qty * price
            line_tax = line_sub * tax_rate / 100
            line_disc = line_sub * disc_rate / 100
            total = (line_sub + line_tax - line_disc).quantize(Decimal('.01'))
            InvoiceItem.objects.create(invoice=v, product_id=it.get('product_id') or None,
                                       quantity=qty, price=price, tax=tax_rate,
                                       discount=disc_rate, total=total)
            subtotal += line_sub
            tax_total += line_tax
        v.subtotal = subtotal.quantize(Decimal('.01'))
        v.tax = tax_total.quantize(Decimal('.01'))
        v.total = (subtotal + tax_total - v.discount).quantize(Decimal('.01'))

        # recompute balance/paid/status
        paid_sum = v.payments.aggregate(s=Sum('amount'))['s'] or Decimal('0')
        v.paid_amount = paid_sum
        v.balance = (v.total - paid_sum).quantize(Decimal('.01'))
        _sync_invoice_status(v)
        v.save()

    log_activity(request.user, 'invoices', action, v.pk, request)
    return JsonResponse({'success': True, 'message': f'Invoice {action}.', 'id': v.pk})


def _sync_invoice_status(inv):
    today = timezone.now().date()
    if inv.status == 'Cancelled':
        return
    if inv.balance <= 0 and inv.total > 0:
        inv.status = 'Paid'
    elif inv.paid_amount > 0:
        inv.status = 'Partial'
    elif inv.due_date and inv.due_date < today and inv.status != 'Draft':
        inv.status = 'Overdue'
    elif inv.status in ('Paid', 'Partial', 'Overdue'):
        inv.status = 'Sent'


@crm_login_required
def invoice_get(request, pk):
    v = get_object_or_404(Invoice.objects.prefetch_related('items'), pk=pk)
    items = [{'product_id': i.product_id, 'product_name': i.product.product_name if i.product else '',
              'quantity': str(i.quantity), 'price': str(i.price), 'tax': str(i.tax),
              'discount': str(i.discount), 'total': str(i.total)} for i in v.items.all()]
    return JsonResponse({'success': True, 'invoice': {
        'id': v.id, 'customer_id': v.customer_id,
        'invoice_date': v.invoice_date.isoformat(),
        'due_date': v.due_date.isoformat() if v.due_date else '',
        'notes': v.notes, 'discount_total': str(v.discount), 'status': v.status,
    }, 'items': items})


@crm_login_required
@require_POST
def invoice_delete(request, pk):
    v = get_object_or_404(Invoice, pk=pk)
    v.items.all().delete()
    v.payments.all().delete()
    v.delete()
    log_activity(request.user, 'invoices', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Invoice deleted.'})


@crm_login_required
def invoice_pdf(request, pk):
    """Printable HTML invoice (browser print -> PDF)."""
    v = get_object_or_404(Invoice.objects.select_related('customer', 'created_by')
                          .prefetch_related('items__product', 'payments'), pk=pk)
    from crm.models import Setting
    return render(request, 'sales/print_invoice.html',
                  {'invoice': v, 'setting': Setting.objects.first()})


# ================= PAYMENTS =================

@crm_login_required
def payment_list(request):
    return render(request, 'sales/payments.html', {'invoices': Invoice.objects.all()[:300]})


@crm_login_required
def payment_data(request):
    qs = Payment.objects.select_related('invoice', 'customer')
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['transaction_reference__icontains', 'customer__company_name__icontains',
                       'invoice__invoice_number__icontains'])
    data = [{
        'id': p.id,
        'payment_date': p.payment_date.strftime('%d %b %Y'),
        'invoice': p.invoice.invoice_number if p.invoice else '-',
        'invoice_id': p.invoice_id,
        'customer': p.customer.company_name,
        'payment_method': p.payment_method,
        'transaction_reference': p.transaction_reference or '-',
        'amount': f'{p.amount:,.2f}',
    } for p in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def payment_save(request):
    invoice = get_object_or_404(Invoice, pk=request.POST.get('invoice_id'))
    try:
        amount = Decimal((request.POST.get('amount') or '0').replace(',', ''))
    except Exception:
        return JsonResponse({'success': False, 'message': 'Invalid amount.'}, status=400)
    if amount <= 0:
        return JsonResponse({'success': False, 'message': 'Amount must be positive.'}, status=400)
    pay_date = request.POST.get('payment_date') or timezone.now().date()
    pay = Payment(invoice=invoice, customer=invoice.customer,
                  payment_method=request.POST.get('payment_method', 'Cash'),
                  transaction_reference=request.POST.get('transaction_reference', ''),
                  amount=amount, payment_date=pay_date,
                  notes=request.POST.get('notes', ''))
    pay.save()

    # update invoice totals & status
    paid_sum = invoice.payments.aggregate(s=Sum('amount'))['s'] or Decimal('0')
    invoice.paid_amount = paid_sum
    invoice.balance = (invoice.total - paid_sum).quantize(Decimal('.01'))
    if invoice.status == 'Draft':
        invoice.status = 'Sent'
    _sync_invoice_status(invoice)
    invoice.save()
    log_activity(request.user, 'payments', 'recorded', pay.pk, request)
    return JsonResponse({'success': True, 'message': 'Payment recorded.',
                         'balance': str(invoice.balance), 'status': invoice.status})


@crm_login_required
@require_POST
def payment_delete(request, pk):
    from django.db.models import Sum as _S
    p = get_object_or_404(Payment, pk=pk)
    invoice = p.invoice
    p.delete()
    paid_sum = invoice.payments.aggregate(s=_S('amount'))['s'] or Decimal('0')
    invoice.paid_amount = paid_sum
    invoice.balance = (invoice.total - paid_sum).quantize(Decimal('.01'))
    _sync_invoice_status(invoice)
    invoice.save()
    log_activity(request.user, 'payments', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Payment deleted.'})
