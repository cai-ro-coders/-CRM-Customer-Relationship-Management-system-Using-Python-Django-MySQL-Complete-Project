from .auth_views import (login_view, login_submit, logout_view, forgot_password,
                         reset_password, change_password, profile_view)
from .dashboard_views import dashboard
from .customer_views import (customer_list, customer_form, customer_data, customer_save,
                             customer_delete, customer_get, customer_detail, contact_save,
                             contact_delete, contact_list_page, contact_data, note_add,
                             note_delete, document_upload, document_delete, tag_list_page,
                             tag_data, tag_save, tag_delete, customer_trash,
                             customer_trash_data, customer_restore, customer_force_delete,
                             customer_export)
from .lead_views import (lead_list, lead_data, lead_save, lead_get, lead_delete,
                         lead_detail, lead_convert, source_list_page, source_data,
                         source_save, source_delete, status_list_page, status_data,
                         status_save, status_delete)
from .deal_views import (pipeline_board, deal_list, deal_data, deal_save, deal_get,
                         deal_delete, deal_move_stage, pipeline_list_page, pipeline_data,
                         pipeline_save, pipeline_delete)
from .task_views import task_list, task_board, task_data, task_save, task_get, \
    task_toggle_status, task_delete
from .meeting_views import meeting_list, meeting_data, meeting_save, meeting_get, \
    meeting_delete, calendar_page, calendar_events, reminders_page
from .product_views import product_list, product_data, product_save, product_get, \
    product_delete, category_list_page, category_data, category_save, category_delete
from .sales_views import (quote_list, quote_data, quote_detail_page, quote_save, quote_get,
                          quote_delete, quote_convert, quote_pdf, invoice_list, invoice_data,
                          invoice_detail_page, invoice_save, invoice_get, invoice_delete,
                          invoice_pdf, payment_list, payment_data, payment_save, payment_delete)
from .support_views import ticket_list, ticket_data, ticket_save, ticket_get, ticket_delete, \
    ticket_detail_page, reply_add, category_list_page, category_data, category_save, \
    category_delete
from .email_views import template_list, template_data, template_get, template_save, \
    template_delete, bulk_email_page, bulk_email_send, log_list, log_data
from .admin_views import user_list, user_data, user_save, user_get, user_delete, role_list, \
    role_data, role_form, role_get, role_save, role_delete, permission_list, activity_log_page, \
    activity_log_data, login_log_page, login_log_data, login_log_delete, audit_log_page, audit_log_data, \
    notification_list_page, notification_poll, notification_mark_read, settings_page, \
    settings_save, backup_page, backup_download, system_info
from .report_views import (reports_home, sales_report, customer_report, lead_report,
                           revenue_report, invoice_report, payment_report, product_report,
                           ticket_report, employee_report, task_report)
from .misc_views import file_manager, attachment_upload, attachment_delete, knowledge_base

import crm.views.auth_views as _auth  # noqa: F401 (keeps module paths stable)
