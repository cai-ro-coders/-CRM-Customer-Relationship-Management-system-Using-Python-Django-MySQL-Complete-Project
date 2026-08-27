import re


class AuditMiddleware:
    """Captures request IP / user agent for activity logging."""

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        request.client_ip = self.get_client_ip(request)
        response = self.get_response(request)
        return response

    @staticmethod
    def get_client_ip(request):
        xff = request.META.get('HTTP_X_FORWARDED_FOR')
        if xff:
            return xff.split(',')[0].strip()
        return request.META.get('REMOTE_ADDR', '')

    @staticmethod
    def browser_name(ua):
        ua = ua or ''
        for name, pattern in [('Edge', r'Edg/'), ('Chrome', r'Chrome/'), ('Firefox', r'Firefox/'),
                              ('Safari', r'Safari/'), ('Opera', r'OPR/')]:
            if re.search(pattern, ua):
                return name
        return 'Unknown'

    @staticmethod
    def os_name(ua):
        ua = ua or ''
        for os_name in ['Windows', 'Mac OS', 'Linux', 'Android', 'iOS']:
            if os_name.lower() in ua.lower():
                return os_name
        return 'Unknown'
