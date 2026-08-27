from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

from crm import views

urlpatterns = [
    # Auth
    path('login/', views.login_view, name='login'),
    path('login/submit/', views.login_submit, name='login_submit'),
    path('logout/', views.logout_view, name='logout'),
    path('forgot-password/', views.forgot_password, name='forgot_password'),
    path('reset-password/<str:token>/', views.reset_password, name='reset_password'),
    path('change-password/', views.change_password, name='change_password'),
    path('profile/', views.profile_view, name='profile'),

    # Dashboard
    path('', views.dashboard, name='dashboard'),

    # Customers
    path('customers/', views.customer_list, name='customer_list'),
    path('customers/new/', views.customer_form, name='customer_new'),
    path('customers/data/', views.customer_data),
    path('customers/save/', views.customer_save),
    path('customers/<int:pk>/', views.customer_detail, name='customer_detail'),
    path('customers/<int:pk>/edit/', views.customer_form, name='customer_edit'),
    path('customers/<int:pk>/get/', views.customer_get),
    path('customers/<int:pk>/delete/', views.customer_delete),
    path('customers/<int:pk>/restore/', views.customer_restore),
    path('customers/<int:pk>/force-delete/', views.customer_force_delete),
    path('customers/trash/', views.customer_trash, name='customer_trash'),
    path('customers/trash/data/', views.customer_trash_data),
    path('customers/export/', views.customer_export),

    # Contacts
    path('contacts/', views.contact_list_page, name='contact_list'),
    path('contacts/data/', views.contact_data),
    path('contacts/save/', views.contact_save),
    path('contacts/<int:pk>/delete/', views.contact_delete),

    # Notes / Documents
    path('notes/add/', views.note_add),
    path('notes/<int:pk>/delete/', views.note_delete),
    path('documents/upload/', views.document_upload),
    path('documents/<int:pk>/delete/', views.document_delete),

    # Tags
    path('tags/', views.tag_list_page, name='tag_list'),
    path('tags/data/', views.tag_data),
    path('tags/save/', views.tag_save),
    path('tags/<int:pk>/delete/', views.tag_delete),

    # Leads
    path('leads/', views.lead_list, name='lead_list'),
    path('leads/data/', views.lead_data),
    path('leads/save/', views.lead_save),
    path('leads/<int:pk>/', views.lead_detail, name='lead_detail'),
    path('leads/<int:pk>/get/', views.lead_get),
    path('leads/<int:pk>/delete/', views.lead_delete),
    path('leads/<int:pk>/convert/', views.lead_convert),
    path('lead-sources/', views.source_list_page, name='lead_source_list'),
    path('lead-sources/data/', views.source_data),
    path('lead-sources/save/', views.source_save),
    path('lead-sources/<int:pk>/delete/', views.source_delete),
    path('lead-statuses/', views.status_list_page, name='lead_status_list'),
    path('lead-statuses/data/', views.status_data),
    path('lead-statuses/save/', views.status_save),
    path('lead-statuses/<int:pk>/delete/', views.status_delete),

    # Pipelines & Deals
    path('pipelines/', views.pipeline_board, name='pipeline_board'),
    path('pipelines/manage/', views.pipeline_list_page, name='pipeline_manage'),
    path('pipelines/data/', views.pipeline_data),
    path('pipelines/save/', views.pipeline_save),
    path('pipelines/<int:pk>/delete/', views.pipeline_delete),
    path('deals/', views.deal_list, name='deal_list'),
    path('deals/data/', views.deal_data),
    path('deals/save/', views.deal_save),
    path('deals/<int:pk>/get/', views.deal_get),
    path('deals/<int:pk>/delete/', views.deal_delete),
    path('deals/move-stage/', views.deal_move_stage),

    # Tasks
    path('tasks/', views.task_list, name='task_list'),
    path('tasks/board/', views.task_board, name='task_board'),
    path('tasks/data/', views.task_data),
    path('tasks/save/', views.task_save),
    path('tasks/<int:pk>/get/', views.task_get),
    path('tasks/<int:pk>/toggle/', views.task_toggle_status),
    path('tasks/<int:pk>/delete/', views.task_delete),

    # Meetings / Calendar
    path('meetings/', views.meeting_list, name='meeting_list'),
    path('meetings/data/', views.meeting_data),
    path('meetings/save/', views.meeting_save),
    path('meetings/<int:pk>/get/', views.meeting_get),
    path('meetings/<int:pk>/delete/', views.meeting_delete),
    path('calendar/', views.calendar_page, name='calendar'),
    path('calendar/events/', views.calendar_events),
    path('reminders/', views.reminders_page, name='reminders'),

    # Products
    path('products/', views.product_list, name='product_list'),
    path('products/data/', views.product_data),
    path('products/save/', views.product_save),
    path('products/<int:pk>/get/', views.product_get),
    path('products/<int:pk>/delete/', views.product_delete),
    path('categories/', views.category_list_page, name='category_list'),
    path('categories/data/', views.category_data),
    path('categories/save/', views.category_save),
    path('categories/<int:pk>/delete/', views.category_delete),

    # Quotes
    path('quotes/', views.quote_list, name='quote_list'),
    path('quotes/data/', views.quote_data),
    path('quotes/save/', views.quote_save),
    path('quotes/<int:pk>/', views.quote_detail_page, name='quote_detail'),
    path('quotes/<int:pk>/get/', views.quote_get),
    path('quotes/<int:pk>/delete/', views.quote_delete),
    path('quotes/<int:pk>/convert/', views.quote_convert),
    path('quotes/<int:pk>/pdf/', views.quote_pdf),

    # Invoices
    path('invoices/', views.invoice_list, name='invoice_list'),
    path('invoices/data/', views.invoice_data),
    path('invoices/save/', views.invoice_save),
    path('invoices/<int:pk>/', views.invoice_detail_page, name='invoice_detail'),
    path('invoices/<int:pk>/get/', views.invoice_get),
    path('invoices/<int:pk>/delete/', views.invoice_delete),
    path('invoices/<int:pk>/pdf/', views.invoice_pdf),

    # Payments
    path('payments/', views.payment_list, name='payment_list'),
    path('payments/data/', views.payment_data),
    path('payments/save/', views.payment_save),
    path('payments/<int:pk>/delete/', views.payment_delete),

    # Tickets
    path('tickets/', views.ticket_list, name='ticket_list'),
    path('tickets/data/', views.ticket_data),
    path('tickets/save/', views.ticket_save),
    path('tickets/<int:pk>/', views.ticket_detail_page, name='ticket_detail'),
    path('tickets/<int:pk>/get/', views.ticket_get),
    path('tickets/<int:pk>/delete/', views.ticket_delete),
    path('tickets/<int:pk>/replies/add/', views.reply_add),
    path('ticket-categories/', views.category_list_page, name='ticket_category_list'),
    path('ticket-categories/data/', views.category_data),
    path('ticket-categories/save/', views.category_save),
    path('ticket-categories/<int:pk>/delete/', views.category_delete),

    # Email
    path('email/templates/', views.template_list, name='email_templates'),
    path('email/templates/data/', views.template_data),
    path('email/templates/<int:pk>/get/', views.template_get),
    path('email/templates/save/', views.template_save),
    path('email/templates/<int:pk>/delete/', views.template_delete),
    path('email/bulk/', views.bulk_email_page, name='bulk_email'),
    path('email/bulk/send/', views.bulk_email_send),
    path('email/logs/', views.log_list, name='email_logs'),
    path('email/logs/data/', views.log_data),

    # Administration
    path('users/', views.user_list, name='user_list'),
    path('users/data/', views.user_data),
    path('users/save/', views.user_save),
    path('users/<int:pk>/get/', views.user_get),
    path('users/<int:pk>/delete/', views.user_delete),
    path('roles/', views.role_list, name='role_list'),
    path('roles/new/', views.role_form, name='role_new'),
    path('roles/<int:pk>/edit/', views.role_form, name='role_edit'),
    path('roles/data/', views.role_data),
    path('roles/<int:pk>/get/', views.role_get),
    path('roles/save/', views.role_save),
    path('roles/<int:pk>/delete/', views.role_delete),
    path('permissions/', views.permission_list, name='permission_list'),
    path('activity-logs/', views.activity_log_page, name='activity_logs'),
    path('activity-logs/data/', views.activity_log_data),
    path('login-logs/', views.login_log_page, name='login_logs'),
    path('login-logs/data/', views.login_log_data),
    path('login-logs/<int:pk>/delete/', views.login_log_delete),
    path('audit-logs/', views.audit_log_page, name='audit_logs'),
    path('audit-logs/data/', views.audit_log_data),

    # Notifications
    path('notifications/', views.notification_list_page, name='notification_list'),
    path('notifications/poll/', views.notification_poll),
    path('notifications/mark-read/', views.notification_mark_read),
    path('notifications/<int:pk>/mark-read/', views.notification_mark_read),

    # Reports
    path('reports/', views.reports_home, name='reports_home'),
    path('reports/sales/', views.sales_report),
    path('reports/customers/', views.customer_report),
    path('reports/leads/', views.lead_report),
    path('reports/revenue/', views.revenue_report),
    path('reports/invoices/', views.invoice_report),
    path('reports/payments/', views.payment_report),
    path('reports/products/', views.product_report),
    path('reports/tickets/', views.ticket_report),
    path('reports/employees/', views.employee_report),
    path('reports/tasks/', views.task_report),

    # Documents / Files
    path('file-manager/', views.file_manager, name='file_manager'),
    path('attachments/upload/', views.attachment_upload),
    path('attachments/<int:pk>/delete/', views.attachment_delete),
    path('knowledge-base/', views.knowledge_base, name='knowledge_base'),

    # Settings
    path('settings/', views.settings_page, name='settings'),
    path('settings/save/', views.settings_save),
    path('settings/backup/', views.backup_page, name='backup'),
    path('settings/backup/download/', views.backup_download),
    path('settings/system-info/', views.system_info, name='system_info'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
