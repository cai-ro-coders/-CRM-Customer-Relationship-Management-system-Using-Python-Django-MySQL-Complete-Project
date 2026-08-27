"""Convenience re-exports for view decorators."""
from django.contrib.auth.decorators import login_required

from crm.utils import log_activity, log_audit, notify, permission_required, ajax_post

crm_login_required = login_required
