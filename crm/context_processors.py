from .models import Setting, Notification


def globals(request):
    setting = Setting.objects.first()
    unread_notifications = 0
    if request.user.is_authenticated:
        unread_notifications = Notification.objects.filter(user=request.user, is_read=False).count()
    return {
        'app_setting': setting,
        'unread_notifications': unread_notifications,
        'currency_symbol': '$',
    }
