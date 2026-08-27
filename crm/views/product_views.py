from decimal import Decimal

from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_POST
from django.shortcuts import get_object_or_404

from crm.decorators import crm_login_required, log_activity
from crm.models import Product, ProductCategory
from crm.utils.datatables import datatables_query, parse_columns


@crm_login_required
def product_list(request):
    return render(request, 'products/list.html',
                  {'categories': ProductCategory.objects.all()})


@crm_login_required
def product_data(request):
    qs = Product.objects.select_related('category')
    if request.GET.get('category_id'):
        qs = qs.filter(category_id=request.GET['category_id'])
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['sku__icontains', 'product_name__icontains', 'description__icontains'])
    data = [{
        'id': p.id,
        'sku': p.sku,
        'product_name': p.product_name,
        'category': p.category.category_name if p.category else '-',
        'unit_price': f'{p.unit_price:,.2f}',
        'tax_rate': str(p.tax_rate),
        'stock_quantity': p.stock_quantity,
        'stock_class': ('danger' if p.stock_quantity <= 0 else
                        'warning' if p.stock_quantity < 10 else 'success'),
        'status': p.status,
    } for p in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def product_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('product_name', '').strip()
    sku = request.POST.get('sku', '').strip()
    if not name or not sku:
        return JsonResponse({'success': False, 'message': 'SKU and product name are required.'}, status=400)
    try:
        price = Decimal(request.POST.get('unit_price', '0') or '0')
        tax_rate = Decimal(request.POST.get('tax_rate', '0') or '0')
        stock = int(request.POST.get('stock_quantity', '0') or 0)
    except Exception:
        return JsonResponse({'success': False, 'message': 'Invalid numeric value.'}, status=400)
    if pk:
        p = get_object_or_404(Product, pk=pk)
        action = 'updated'
    else:
        p = Product()
        action = 'created'
    p.product_name, p.sku = name, sku
    p.description = request.POST.get('description', '')
    p.unit_price, p.tax_rate, p.stock_quantity = price, tax_rate, stock
    p.status = request.POST.get('status', 'Active')
    p.category_id = request.POST.get('category_id') or None
    try:
        p.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'SKU already exists.'}, status=400)
    log_activity(request.user, 'products', action, p.pk, request)
    return JsonResponse({'success': True, 'message': f'Product {action}.'})


@crm_login_required
def product_get(request, pk):
    p = get_object_or_404(Product, pk=pk)
    return JsonResponse({'success': True, 'product': {
        'id': p.id, 'sku': p.sku, 'product_name': p.product_name, 'description': p.description,
        'unit_price': str(p.unit_price), 'tax_rate': str(p.tax_rate),
        'stock_quantity': p.stock_quantity, 'status': p.status, 'category_id': p.category_id,
    }})


@crm_login_required
@require_POST
def product_delete(request, pk):
    from crm.models import QuoteItem, InvoiceItem
    p = get_object_or_404(Product, pk=pk)
    if QuoteItem.objects.filter(product=p).exists() or InvoiceItem.objects.filter(product=p).exists():
        return JsonResponse({'success': False,
                             'message': 'Product is used in quotes/invoices and cannot be deleted.'},
                            status=400)
    p.delete()
    log_activity(request.user, 'products', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Product deleted.'})


# ---------------- Categories ----------------

@crm_login_required
def category_list_page(request):
    return render(request, 'products/categories.html')


@crm_login_required
def category_data(request):
    rows = [{'id': c.id, 'name': c.category_name, 'description': c.description or '-',
             'product_count': c.product_set.count()} for c in ProductCategory.objects.all()]
    return JsonResponse({'data': rows})


@crm_login_required
@require_POST
def category_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('category_name', '').strip()
    if not name:
        return JsonResponse({'success': False, 'message': 'Category name required.'}, status=400)
    if pk:
        c = get_object_or_404(ProductCategory, pk=pk)
        action = 'updated'
    else:
        c = ProductCategory()
        action = 'created'
    c.category_name = name
    c.description = request.POST.get('description', '')
    try:
        c.save()
    except Exception:
        return JsonResponse({'success': False, 'message': 'Category already exists.'}, status=400)
    return JsonResponse({'success': True, 'message': f'Category {action}.'})


@crm_login_required
@require_POST
def category_delete(request, pk):
    c = get_object_or_404(ProductCategory, pk=pk)
    if c.product_set.exists():
        return JsonResponse({'success': False, 'message': 'Category has products.'}, status=400)
    c.delete()
    return JsonResponse({'success': True, 'message': 'Category deleted.'})
