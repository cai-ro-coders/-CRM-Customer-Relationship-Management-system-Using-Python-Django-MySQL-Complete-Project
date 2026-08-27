from django import template
from django.templatetags.static import static

register = template.Library()

MIME_ICONS = {
    'pdf': 'fa-solid fa-file-pdf',
    'image': 'fa-solid fa-file-image',
    'word': 'fa-solid fa-file-word',
    'excel': 'fa-solid fa-file-excel',
    'powerpoint': 'fa-solid fa-file-powerpoint',
    'video': 'fa-solid fa-file-video',
    'audio': 'fa-solid fa-file-audio',
    'zip': 'fa-solid fa-file-zipper',
    'text': 'fa-solid fa-file-lines',
}

_MIME_PREFIXES = [
    ('application/pdf', 'pdf'),
    ('image/', 'image'),
    ('application/msword', 'word'),
    ('application/vnd.openxmlformats-officedocument.wordprocessingml', 'word'),
    ('application/vnd.ms-excel', 'excel'),
    ('application/vnd.openxmlformats-officedocument.spreadsheetml', 'excel'),
    ('text/csv', 'excel'),
    ('application/vnd.ms-powerpoint', 'powerpoint'),
    ('application/vnd.openxmlformats-officedocument.presentationml', 'powerpoint'),
    ('video/', 'video'),
    ('audio/', 'audio'),
    ('application/zip', 'zip'),
    ('application/x-zip-compressed', 'zip'),
    ('application/x-7z-compressed', 'zip'),
    ('application/gzip', 'zip'),
    ('application/x-rar-compressed', 'zip'),
    ('text/', 'text'),
]

_EXT_ICONS = {
    'pdf': 'pdf', 'png': 'image', 'jpg': 'image', 'jpeg': 'image',
    'gif': 'image', 'webp': 'image', 'svg': 'image',
    'doc': 'word', 'docx': 'word', 'rtf': 'word',
    'xls': 'excel', 'xlsx': 'excel', 'csv': 'excel',
    'ppt': 'powerpoint', 'pptx': 'powerpoint',
    'mp4': 'video', 'mov': 'video', 'avi': 'video',
    'mp3': 'audio', 'wav': 'audio', 'm4a': 'audio',
    'zip': 'zip', 'rar': 'zip', '7z': 'zip', 'gz': 'zip',
    'txt': 'text', 'md': 'text', 'log': 'text',
}


@register.filter
def file_icon(mime_or_name):
    s = (str(mime_or_name) if mime_or_name else '').lower()
    if not s:
        return MIME_ICONS['text']
    for prefix, key in _MIME_PREFIXES:
        if s.startswith(prefix):
            return MIME_ICONS[key]
    ext = s.rsplit('.', 1)[-1] if '.' in s else s
    return MIME_ICONS.get(_EXT_ICONS.get(ext), 'fa-solid fa-file')


@register.simple_tag
def static_v(path):
    """static file URL with mtime cache-buster (?v=...) so browsers pick up changes."""
    from django.conf import settings
    import time
    url = static(path)
    try:
        for root in [getattr(settings, 'BASE_DIR', None)] + list(getattr(settings, 'STATICFILES_DIRS', [])):
            candidate = root / path if root else None
            if candidate and candidate.exists():
                return f'{url}?v={int(candidate.stat().st_mtime)}'
    except Exception:
        pass
    return url
