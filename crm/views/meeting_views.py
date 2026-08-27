from datetime import datetime, timedelta, date

from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.views.decorators.http import require_POST

from crm.decorators import crm_login_required, log_activity, notify
from crm.models import Meeting, MeetingAttendee, Customer, Lead, Task
from crm.utils.datatables import datatables_query, parse_columns


def _users():
    from crm.models import User
    return User.objects.filter(status='Active')


@crm_login_required
def meeting_list(request):
    today = timezone.now().date()
    return render(request, 'meetings/list.html', {
        'users': _users(),
        'customers': Customer.objects.filter(is_deleted=False),
        'leads': Lead.objects.all()[:200],
        'upcoming': Meeting.objects.filter(meeting_date__gte=today).order_by('meeting_date', 'start_time')[:8],
    })


@crm_login_required
def meeting_data(request):
    qs = (Meeting.objects.select_related('organizer', 'customer', 'lead')
          .prefetch_related('attendees__user'))
    if request.GET.get('status'):
        qs = qs.filter(status=request.GET['status'])
    if request.GET.get('type'):
        qs = qs.filter(meeting_type=request.GET['type'])
    page, draw, total, filtered = datatables_query(
        request, qs, columns=parse_columns(request),
        search_fields=['title__icontains', 'location__icontains',
                       'customer__company_name__icontains'])
    status_class = {'Scheduled': 'primary', 'Completed': 'success', 'Cancelled': 'danger'}
    data = [{
        'id': m.id,
        'title': m.title,
        'customer': m.customer.company_name if m.customer else '-',
        'meeting_type': m.meeting_type,
        'location': m.location or '-',
        'date': m.meeting_date.strftime('%d %b %Y'),
        'time': f'{m.start_time.strftime("%H:%M")}' + (f' - {m.end_time.strftime("%H:%M")}' if m.end_time else ''),
        'status': m.status,
        'status_class': status_class.get(m.status, 'secondary'),
        'organizer': m.organizer.full_name if m.organizer else '-',
        'attendees': [a.user.full_name for a in m.attendees.all() if a.user],
    } for m in page]
    return JsonResponse({'draw': draw, 'recordsTotal': total, 'recordsFiltered': filtered, 'data': data})


@crm_login_required
@require_POST
def meeting_save(request):
    pk = request.POST.get('id')
    title = request.POST.get('title', '').strip()
    meeting_date = request.POST.get('meeting_date')
    start_time = request.POST.get('start_time')
    if not title or not meeting_date or not start_time:
        return JsonResponse({'success': False, 'message': 'Title, date and start time are required.'}, status=400)
    if pk:
        m = get_object_or_404(Meeting, pk=pk)
        action = 'updated'
    else:
        m = Meeting(organizer=request.user)
        action = 'created'
    m.title = title
    m.meeting_date = meeting_date
    m.start_time = start_time
    end = request.POST.get('end_time')
    m.end_time = end or None
    m.location = request.POST.get('location', '')
    m.description = request.POST.get('description', '')
    m.meeting_type = request.POST.get('meeting_type', 'Call')
    m.status = request.POST.get('status', 'Scheduled')
    m.customer_id = request.POST.get('customer_id') or None
    m.lead_id = request.POST.get('lead_id') or None
    m.save()

    attendee_ids = [a for a in request.POST.getlist('attendees[]') or request.POST.getlist('attendees') if a]
    MeetingAttendee.objects.filter(meeting=m).exclude(user_id__in=attendee_ids).delete()
    for uid in attendee_ids:
        MeetingAttendee.objects.get_or_create(meeting=m, user_id=uid)
        # notify attendees about new meetings
        if action == 'created':
            try:
                from crm.models import User
                u = User.objects.get(pk=uid)
                if u.id != request.user.id:
                    notify(u, 'Meeting invitation', f'You were invited to "{m.title}" on {m.meeting_date}.')
            except Exception:
                pass

    log_activity(request.user, 'meetings', action, m.pk, request)
    return JsonResponse({'success': True, 'message': f'Meeting {action}.'})


@crm_login_required
def meeting_get(request, pk):
    m = get_object_or_404(Meeting, pk=pk)
    return JsonResponse({'success': True, 'meeting': {
        'id': m.id, 'title': m.title, 'location': m.location,
        'meeting_date': m.meeting_date.isoformat(),
        'start_time': m.start_time.strftime('%H:%M'),
        'end_time': m.end_time.strftime('%H:%M') if m.end_time else '',
        'description': m.description, 'meeting_type': m.meeting_type, 'status': m.status,
        'customer_id': m.customer_id, 'lead_id': m.lead_id,
        'attendees': list(m.attendees.values_list('user_id', flat=True)),
    }})


@crm_login_required
@require_POST
def meeting_delete(request, pk):
    m = get_object_or_404(Meeting, pk=pk)
    m.attendees.all().delete()
    m.delete()
    log_activity(request.user, 'meetings', 'deleted', pk, request)
    return JsonResponse({'success': True, 'message': 'Meeting deleted.'})


@crm_login_required
def calendar_page(request):
    return render(request, 'meetings/calendar.html')


def _is_iso_date(value):
    try:
        date.fromisoformat(str(value)[:10])
        return True
    except (TypeError, ValueError):
        return False


@crm_login_required
def calendar_events(request):
    """FullCalendar JSON feed."""
    start = request.GET.get('start')
    end = request.GET.get('end')
    qs = Meeting.objects.exclude(status='Cancelled')
    if start and _is_iso_date(start):
        qs = qs.filter(meeting_date__gte=start[:10])
    if end and _is_iso_date(end):
        qs = qs.filter(meeting_date__lte=end[:10])
    color_map = {'Call': '#0d6efd', 'Video': '#6f42c1', 'In Person': '#198754'}
    events = [{
        'id': m.id,
        'title': f'{m.start_time.strftime("%H:%M")} {m.title}',
        'start': f'{m.meeting_date.isoformat()}T{m.start_time.strftime("%H:%M:%S")}',
        'end': f'{m.meeting_date.isoformat()}T{m.end_time.strftime("%H:%M:%S")}' if m.end_time else None,
        'backgroundColor': color_map.get(m.meeting_type, '#6c757d'),
        'extendedProps': {
            'type': m.meeting_type,
            'customer': m.customer.company_name if m.customer else '',
            'status': m.status,
        },
    } for m in qs]
    # task due dates as all-day reminders too
    tasks = Task.objects.exclude(status__in=['Completed', 'Cancelled']).exclude(due_date=None)
    if start and _is_iso_date(start):
        tasks = tasks.filter(due_date__gte=start[:10])
    if end and _is_iso_date(end):
        tasks = tasks.filter(due_date__lte=end[:10])
    prio_color = {'Low': '#adb5bd', 'Medium': '#ffc107', 'High': '#fd7e14', 'Urgent': '#dc3545'}
    for t in tasks:
        events.append({'id': f'task-{t.pk}', 'title': f'Task due: {t.title}',
                       'start': t.due_date.isoformat(), 'allDay': True,
                       'backgroundColor': prio_color.get(t.priority, '#6c757d')})
    return JsonResponse(events, safe=False)


@crm_login_required
def reminders_page(request):
    today = timezone.now().date()
    soon = today + timedelta(days=7)
    upcoming_meetings = Meeting.objects.filter(meeting_date__gte=today, meeting_date__lte=soon,
                                               status='Scheduled').order_by('meeting_date')
    due_tasks = Task.objects.filter(due_date__gte=today - timedelta(days=30), due_date__lte=soon,
                                    assigned_to=request.user).exclude(
        status__in=['Completed', 'Cancelled']).order_by('due_date')
    overdue_tasks = Task.objects.filter(due_date__lt=today, assigned_to=request.user).exclude(
        status__in=['Completed', 'Cancelled']).order_by('due_date')
    return render(request, 'meetings/reminders.html', {
        'upcoming_meetings': upcoming_meetings,
        'due_tasks': due_tasks,
        'overdue_tasks': overdue_tasks,
    })
