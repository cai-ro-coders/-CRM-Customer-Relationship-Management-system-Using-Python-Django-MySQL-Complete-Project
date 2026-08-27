"""DataTables server-side processing helper."""
from django.db.models import Q, F, Value
from django.db.models.functions import Concat


def datatables_query(request, queryset, columns, search_fields):
    """
    columns: list of dicts {data: 'name', name: 'db_field' or None (computed), searchable: bool, orderable: bool}
    search_fields: list of ORM lookups for global search e.g. ['first_name__icontains', ...]
    Returns (queryset, total_count, filtered_count).
    """
    draw = int(request.GET.get('draw', 1))
    start = int(request.GET.get('start', 0))
    length = int(request.GET.get('length', 10))
    if length < 0:  # DataTables "All"
        length = queryset.count() or 1
    search_value = request.GET.get('search[value]', '').strip()

    total_count = queryset.count()

    # Global search
    if search_value:
        q = Q()
        for lookup in search_fields:
            q |= Q(**{lookup: search_value})
        # numeric search on pk
        if search_value.isdigit():
            q |= Q(pk=int(search_value))
        queryset = queryset.filter(q)

    # Column filters sent as columns[i][search][value]
    i = 0
    while request.GET.get(f'columns[{i}][data]') is not None:
        col_search = request.GET.get(f'columns[{i}][search][value]', '').strip()
        if col_search:
            col_name = request.GET.get(f'columns[{i}][name]', '')
            col_data = request.GET.get(f'columns[{i}][data]', '')
            target = col_name or col_data
            if target and '__' in str(target):
                queryset = queryset.filter(**{f'{target}__icontains': col_search})
        i += 1

    filtered_count = queryset.count()

    # Ordering
    order_clauses = []
    order_col = request.GET.get('order[0][column]')
    if order_col is not None:
        col_idx = int(order_col)
        if col_idx < len(columns):
            col = columns[col_idx]
            field = col.get('order_field') or col.get('name')
            direction = '-' if request.GET.get('order[0][dir]') == 'desc' else ''
            if field:
                order_clauses.append(f'{direction}{field}')
    if not order_clauses:
        order_clauses = ['-id']

    # Extra select/annotate provided by caller via queryset already; apply ordering safely
    try:
        queryset = queryset.order_by(*order_clauses)
    except Exception:
        queryset = queryset.order_by('-id')

    page = queryset[start:start + length]
    return page, draw, total_count, filtered_count


def parse_columns(request):
    """Parses DataTables column config from GET params."""
    columns = []
    i = 0
    while request.GET.get(f'columns[{i}][data]') is not None:
        columns.append({
            'data': request.GET.get(f'columns[{i}][data]'),
            'name': request.GET.get(f'columns[{i}][name]', ''),
            'searchable': request.GET.get(f'columns[{i}][searchable]') == 'true',
            'orderable': request.GET.get(f'columns[{i}][orderable]') == 'true',
        })
        i += 1
    return columns
