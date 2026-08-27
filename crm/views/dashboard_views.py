from datetime import timedelta

from django.db.models import Sum, Count, Q, F, DecimalField
from django.db.models.functions import Coalesce
from django.shortcuts import render
from django.utils import timezone

from crm.decorators import crm_login_required
from crm.middleware import AuditMiddleware
from crm.models import (Customer, Lead, Deal, Task, Meeting, ActivityLog, Notification,
                        DealStage)


@crm_login_required
def dashboard(request):
    today = timezone.now().date()
    month_start = today.replace(day=1)

    total_customers = Customer.objects.filter(is_deleted=False).count()
    total_leads = Lead.objects.count()
    active_leads = Lead.objects.exclude(status__name__in=['Unqualified']).count()
    open_deals = Deal.objects.filter(status='Open').count()

    revenue_agg = Deal.objects.filter(status='Won').aggregate(v=Coalesce(Sum('expected_value'), Decimal('0')))
    total_revenue = revenue_agg['v']
    pipeline_value = Deal.objects.filter(status='Open').aggregate(
        v=Coalesce(Sum('expected_value'), Decimal('0')))['v']

    tasks_due_today = Task.objects.filter(due_date=today).exclude(status__in=['Completed', 'Cancelled']).count()
    upcoming_meetings = Meeting.objects.filter(meeting_date__gte=today,
                                               status='Scheduled').order_by('meeting_date', 'start_time')[:5]
    new_customers_month = Customer.objects.filter(created_at__date__gte=month_start,
                                                  is_deleted=False).count()

    # Monthly sales (won deals) last 12 months
    monthly_labels, monthly_data = [], []
    for i in range(11, -1, -1):
        m = (today.replace(day=1) - timedelta(days=1))
        for _ in range(i):
            m = m.replace(day=1) - timedelta(days=1)
        m_start = m.replace(day=1)
        next_m = (m_start + timedelta(days=32)).replace(day=1)
        val = Deal.objects.filter(status='Won', created_at__date__gte=m_start,
                                  created_at__date__lt=next_m).aggregate(
            v=Coalesce(Sum('expected_value'), Decimal('0')))['v']
        monthly_labels.append(m_start.strftime('%b %Y'))
        monthly_data.append(float(val))

    # Lead sources pie
    source_stats = (Lead.objects.values('source__name')
                    .annotate(c=Count('id')).order_by('-c'))
    lead_source_labels = [s['source__name'] or 'Unknown' for s in source_stats]
    lead_source_data = [s['c'] for s in source_stats]

    # Sales performance line: deals created vs won per month
    perf_created, perf_won = [], []
    for label, m_start, next_m in _months(today):
        c = Deal.objects.filter(created_at__date__gte=m_start, created_at__date__lt=next_m).count()
        w = Deal.objects.filter(status='Won', updated_at__date__gte=m_start,
                                updated_at__date__lt=next_m).count()
        perf_created.append(c)
        perf_won.append(w)
    perf_labels = [lbl for lbl, _, _ in _months(today)]

    # Revenue projection (open deals weighted by probability per week ahead)
    proj_labels, proj_data = [], []
    weighted_total = 0
    for wk in range(0, 12):
        start = today + timedelta(weeks=wk)
        end = start + timedelta(days=7)
        val = Deal.objects.filter(status='Open', expected_close_date__gte=start,
                                  expected_close_date__lt=end).aggregate(
            v=Coalesce(Sum(F('expected_value') * F('probability'), output_field=DecimalField()),
                       Decimal('0')))['v'] / 100
        weighted_total += float(val)
        proj_labels.append(start.strftime('%d %b'))
        proj_data.append(round(weighted_total, 2))

    # Deal velocity: avg days between creation and last update for won deals
    won_deals = Deal.objects.filter(status='Won', updated_at__gt=F('created_at'))
    velocity_days = 0
    if won_deals.exists():
        deltas = [(d.updated_at.date() - d.created_at.date()).days for d in won_deals]
        velocity_days = round(sum(deltas) / len(deltas), 1)

    win_rate = 0
    closed = Deal.objects.filter(status__in=['Won', 'Lost']).count()
    if closed:
        win_rate = round(Deal.objects.filter(status='Won').count() * 100.0 / closed, 1)

    recent_activities = ActivityLog.objects.select_related('user')[:8]
    my_tasks = Task.objects.filter(assigned_to=request.user).exclude(
        status__in=['Completed', 'Cancelled']).order_by('due_date')[:6]

    context = {
        'stats': {
            'total_customers': total_customers,
            'total_leads': total_leads,
            'active_leads': active_leads,
            'open_deals': open_deals,
            'total_revenue': total_revenue,
            'pipeline_value': pipeline_value,
            'tasks_due_today': tasks_due_today,
            'new_customers_month': new_customers_month,
            'velocity_days': velocity_days,
            'win_rate': win_rate,
        },
        'monthly_labels': monthly_labels,
        'monthly_data': monthly_data,
        'lead_source_labels': lead_source_labels,
        'lead_source_data': lead_source_data,
        'perf_labels': perf_labels,
        'perf_created': perf_created,
        'perf_won': perf_won,
        'proj_labels': proj_labels,
        'proj_data': proj_data,
        'recent_activities': recent_activities,
        'upcoming_meetings': upcoming_meetings,
        'my_tasks': my_tasks,
    }
    return render(request, 'dashboard.html', context)


def _months(today):
    out = []
    cur = today.replace(day=1)
    for i in range(11, -1, -1):
        m = (cur - timedelta(days=i * 28)).replace(day=1)
        nxt = (m + timedelta(days=32)).replace(day=1)
        out.append((m.strftime('%b %Y'), m, nxt))
    return out


from decimal import Decimal  # noqa: E402
