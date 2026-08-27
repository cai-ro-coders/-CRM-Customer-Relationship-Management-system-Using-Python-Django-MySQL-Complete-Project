import json
from datetime import timedelta
from decimal import Decimal

from django.db.models import Sum, Count, Q, F, DecimalField
from django.db.models.functions import Coalesce
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, log_activity
from crm.models import Pipeline, DealStage, Deal, Customer, Lead
from crm.utils.datatables import datatables_query, parse_columns


@crm_login_required
def pipeline_board(request):
    pipelines = Pipeline.objects.all()
    selected = request.GET.get('pipeline')
    pipeline = None
    if selected:
        pipeline = pipelines.filter(pk=selected).first()
    if not pipeline:
        pipeline = pipelines.filter(is_default=True).first() or pipelines.first()
    stages = DealStage.objects.filter(pipeline=pipeline)
    deals = (Deal.objects.filter(stage__pipeline=pipeline)
             .select_related('customer', 'lead', 'stage', 'assigned_to'))
    stage_data = []
    for st in stages:
        st_deals = [d for d in deals if d.stage_id == st.id]
        stage_data.append({
            'stage': st,
            'deals': st_deals,
            'total': sum(d.expected_value for d in st_deals),
        })
    forecast = sum(d.expected_value * d.probability / 100 for d in deals if d.status == 'Open')
    won_value = sum(d.expected_value for d in deals if d.status == 'Won')
    closed = deals.filter(status__in=['Won', 'Lost']).count() or 1
    win_rate = round(deals.filter(status='Won').count() * 100.0 / max(closed, 1), 1)

    return render(request, 'pipeline/board.html', {
        'pipelines': pipelines,
        'pipeline': pipeline,
        'stage_data': stage_data,
        'forecast': forecast,
        'won_value': won_value,
        'win_rate': win_rate,
        'open_count': deals.filter(status='Open').count(),
        'customers': Customer.objects.filter(is_deleted=False),
        'leads': Lead.objects.all()[:200],
        'users': _users(),
    })


@crm_login_required
def deal_list(request):
    return render(request, 'pipeline/deals.html', {
        'users': _users(), 'customers': Customer.objects.filter(is_deleted=False),
        'leads': Lead.objects.all()[:200],
        'stages': DealStage.objects.select_related('pipeline'),
        'pipelines': Pipeline.objects.all(),
    })


def _users():
    from crm.models import User
    return User.objects.filter(status='Active')


@crm_login_required
def deal_data(request):
    qs = Deal.objects.select_related('customer', 'lead', 'stage', 'assigned_to')
    if request.GET.get('pipeline_id'):
        qs = qs.filter(stage__pipeline_id=request.GET['pipeline_id'])
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['deal_name__icontains', 'customer__company_name__icontains',
                       'lead__first_name__icontains', 'lead__last_name__icontains'])
    status_class = {'Open': 'primary', 'Won': 'success', 'Lost': 'danger'}
    data = [{
        'id': d.id,
        'deal_name': d.deal_name,
        'customer': d.customer.company_name if d.customer else '-',
        'contact': (d.lead.full_name if d.lead else
                    (d.customer.full_name if d.customer else '-')),
        'stage': d.stage.name if d.stage else '-',
        'stage_color': d.stage.color if d.stage else '#6c757d',
        'expected_value': f'{d.expected_value:,.2f}',
        'probability': d.probability,
        'expected_close_date': d.expected_close_date.strftime('%d %b %Y') if d.expected_close_date else '-',
        'assigned_to': d.assigned_to.full_name if d.assigned_to else '-',
        'status': d.status,
        'status_class': status_class.get(d.status, 'secondary'),
    } for d in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def deal_save(request):
    pk = request.POST.get('id')
    name = request.POST.get('deal_name', '').strip()
    if not name:
        return JsonResponse({'success': False, 'message': 'Deal name required.'}, status=400)
    if pk:
        d = get_object_or_404(Deal, pk=pk)
        action = 'updated'
    else:
        d = Deal()
        action = 'created'
    d.deal_name = name
    try:
        d.expected_value = request.POST.get('expected_value', '0').replace(',', '') or '0'
        d.probability = min(100, max(0, int(request.POST.get('probability', '50') or 50)))
    except ValueError:
        return JsonResponse({'success': False, 'message': 'Invalid numeric value.'}, status=400)
    close_date = request.POST.get('expected_close_date')
    d.expected_close_date = close_date or None
    d.status = request.POST.get('status', 'Open')
    d.notes = request.POST.get('notes', '')
    d.stage_id = request.POST.get('stage_id') or None
    d.customer_id = request.POST.get('customer_id') or None
    d.lead_id = request.POST.get('lead_id') or None
    d.assigned_to_id = request.POST.get('assigned_to') or None
    # keep status consistent with Won/Lost stages
    if d.stage and d.stage.name == 'Won':
        d.status = 'Won'
    elif d.stage and d.stage.name == 'Lost':
        d.status = 'Lost'
    d.save()
    log_activity(request.user, 'deals', action, d.pk, request)
    return JsonResponse({'success': True, 'message': f'Deal {action}.'})


@crm_login_required
def deal_get(request, pk):
    d = get_object_or_404(Deal, pk=pk)
    return JsonResponse({'success': True, 'deal': {
        'id': d.id, 'deal_name': d.deal_name,
        'expected_value': str(d.expected_value), 'probability': d.probability,
        'expected_close_date': d.expected_close_date.isoformat() if d.expected_close_date else '',
        'status': d.status, 'notes': d.notes,
        'stage_id': d.stage_id, 'customer_id': d.customer_id, 'lead_id': d.lead_id,
        'assigned_to': d.assigned_to_id,
    }})


@crm_login_required
@require_POST
def deal_delete(request, pk):
    d = get_object_or_404(Deal, pk=pk)
    d.delete()
    log_activity(request.user, 'deals', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Deal deleted.'})


@crm_login_required
@require_POST
def deal_move_stage(request):
    """Drag & drop endpoint."""
    data = json.loads(request.body)
    deal_id = data.get('deal_id')
    stage_id = data.get('stage_id')
    deal = get_object_or_404(Deal, pk=deal_id)
    stage = get_object_or_404(DealStage, pk=stage_id)
    old_stage = deal.stage.name if deal.stage else None
    deal.stage = stage
    if stage.name == 'Won':
        deal.status, deal.probability = 'Won', 100
    elif stage.name == 'Lost':
        deal.status, deal.probability = 'Lost', 0
    else:
        deal.status = 'Open'
        prob_map = {'New': 20, 'Qualified': 40, 'Proposal': 60, 'Negotiation': 75}
        deal.probability = prob_map.get(stage.name, deal.probability or 50)
    deal.save(update_fields=['stage', 'status', 'probability', 'updated_at'])
    log_activity(request.user, 'deals', f'stage_moved:{old_stage}->{stage.name}', deal.pk, request)

    # pipeline summary per stage after move
    totals = {}
    for st in DealStage.objects.filter(pipeline=deal.stage.pipeline):
        agg = Deal.objects.filter(stage=st, status='Open').aggregate(v=Coalesce(Sum('expected_value'), Decimal('0'), output_field=DecimalField()))
        totals[st.id] = float(agg['v'])
    return JsonResponse({'success': True, 'message': f'Moved to {stage.name}.',
                         'stage_totals': totals})


# ---------------- Pipelines CRUD ----------------

@crm_login_required
def pipeline_list_page(request):
    return render(request, 'pipeline/list.html')


@crm_login_required
def pipeline_data(request):
    rows = []
    for p in Pipeline.objects.all():
        stages = list(p.stages.values('id', 'name', 'color', 'sort_order'))
        rows.append({'id': p.id, 'name': p.name, 'is_default': p.is_default,
                     'stages': stages, 'deal_count': Deal.objects.filter(stage__pipeline=p).count()})
    return JsonResponse({'data': rows})


@crm_login_required
@require_POST
def pipeline_save(request):
    import json as j
    data = j.loads(request.body) if request.content_type == 'application/json' else {
        'name': request.POST.get('name'),
        'is_default': bool(request.POST.get('is_default')),
        'stages': [],
    }
    name = (data.get('name') or '').strip()
    if not name:
        return JsonResponse({'success': False, 'message': 'Pipeline name required.'}, status=400)
    pk = data.get('id')
    if pk:
        p = get_object_or_404(Pipeline, pk=pk)
        action = 'updated'
    else:
        p = Pipeline()
        action = 'created'
    p.name = name
    p.is_default = bool(data.get('is_default'))
    p.save()
    if p.is_default:
        Pipeline.objects.exclude(pk=p.pk).update(is_default=False)
    stages = data.get('stages') or []
    existing_ids = {s['id'] for s in stages if s.get('id')}
    DealStage.objects.filter(pipeline=p).exclude(id__in=existing_ids).delete()
    order = 1
    for s in stages:
        sid = s.get('id')
        defaults = {'name': s.get('name') or '', 'color': s.get('color') or '#0d6efd',
                    'sort_order': order}
        if sid:
            DealStage.objects.filter(pk=sid, pipeline=p).update(**defaults)
        elif defaults['name']:
            DealStage.objects.create(pipeline=p, **defaults)
        order += 1
    log_activity(request.user, 'pipelines', action, p.pk, request)
    return JsonResponse({'success': True, 'message': f'Pipeline {action}.'})


@crm_login_required
@require_POST
def pipeline_delete(request, pk):
    p = get_object_or_404(Pipeline, pk=pk)
    if p.is_default:
        return JsonResponse({'success': False, 'message': 'Cannot delete the default pipeline.'}, status=400)
    if Deal.objects.filter(stage__pipeline=p).exists():
        return JsonResponse({'success': False, 'message': 'Pipeline has deals attached.'}, status=400)
    p.stages.all().delete()
    p.delete()
    return JsonResponse({'success': True, 'message': 'Pipeline deleted.'})
