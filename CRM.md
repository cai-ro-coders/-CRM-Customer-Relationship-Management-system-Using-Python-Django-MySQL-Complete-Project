AI 

CRM Customer Relationship Management system Using Python Django MySQL Complete Project

Build a Complete Admin CRM Customer Relationship Management system 
MVC Architecture Python Django, MySQL for database operations, Bootstrap 5, HTML5, CSS3, JavaScript, jQuery, AJAX, Font Awesome, SweetAlert2, 
DataTables, Chart.js 
follow modern PHP best practices using PDO and MVC architecture with Secure coding practices
MySQL database : 
database name : CRM_djangodb
username : root
password : root

CRM Customer Relationship Management system Database Schema

users
    id (PK)
    role_id (FK → roles.id)
    first_name
    last_name
    username
    email
    password
    phone
    avatar
    address
    status
    last_login
    remember_token
    created_at
    updated_at

roles
    id (PK)
    name
    description
    created_at
    updated_at

permissions
    id (PK)
    name
    slug
    module
    created_at
    updated_at

role_permissions
    id (PK)
    role_id (FK → roles.id)
    permission_id (FK → permissions.id)
    created_at

customers
    id (PK)
    assigned_to (FK → users.id)
    customer_code
    company_name
    customer_type
    first_name
    last_name
    email
    phone
    mobile
    website
    industry
    tax_number
    billing_address
    shipping_address
    city
    state
    country
    postal_code
    status
    notes
    image
    created_at
    updated_at

customer_contacts
    id (PK)
    customer_id (FK → customers.id)
    first_name
    last_name
    designation
    email
    phone
    mobile
    is_primary
    created_at
    updated_at

customer_tags
    id (PK)
    name
    color
    created_at
    updated_at

customer_tag_map
    id (PK)
    customer_id (FK → customers.id)
    tag_id (FK → customer_tags.id)

customer_documents
    id (PK)
    customer_id (FK → customers.id)
    uploaded_by (FK → users.id)
    file_name
    file_path
    file_size
    file_type
    created_at

lead_sources
    id (PK)
    name
    created_at

lead_statuses
    id (PK)
    name
    color
    sort_order

leads
    id (PK)
    assigned_to (FK → users.id)
    source_id (FK → lead_sources.id)
    status_id (FK → lead_statuses.id)
    company
    first_name
    last_name
    email
    phone
    website
    expected_revenue
    priority
    notes
    converted_customer_id (FK → customers.id)
    created_at
    updated_at

lead_activities
    id (PK)
    lead_id (FK → leads.id)
    user_id (FK → users.id)
    activity
    description
    created_at

deal_stages
    id (PK)
    pipeline_id (FK → pipelines.id)
    name
    color
    sort_order
    created_at
    updated_at

deals
    id (PK)
    customer_id (FK → customers.id)
    lead_id (FK → leads.id)
    assigned_to (FK → users.id)
    stage_id (FK → deal_stages.id)
    deal_name
    expected_value
    probability
    expected_close_date
    status
    notes
    created_at
    updated_at

tasks
    id (PK)
    assigned_to (FK → users.id)
    customer_id (FK → customers.id)
    lead_id (FK → leads.id)
    deal_id (FK → deals.id)
    title
    description
    priority
    status
    due_date
    reminder_date
    completed_at
    created_at
    updated_at

meetings
    id (PK)
    organizer_id (FK → users.id)
    customer_id (FK → customers.id)
    lead_id (FK → leads.id)
    title
    location
    meeting_date
    start_time
    end_time
    description
    meeting_type
    status
    created_at
    updated_at

meeting_attendees
    id (PK)
    meeting_id (FK → meetings.id)
    user_id (FK → users.id)

products
    id (PK)
    category_id (FK → product_categories.id)
    sku
    product_name
    description
    unit_price
    tax_rate
    stock_quantity
    status
    created_at
    updated_at

product_categories
    id (PK)
    category_name
    description
    created_at
    updated_at

quotes
    id (PK)
    customer_id (FK → customers.id)
    created_by (FK → users.id)
    quote_number
    quote_date
    expiry_date
    subtotal
    tax
    discount
    total
    status
    notes
    created_at
    updated_at

quote_items
    id (PK)
    quote_id (FK → quotes.id)
    product_id (FK → products.id)
    quantity
    price
    tax
    discount
    total

invoices
    id (PK)
    customer_id (FK → customers.id)
    quote_id (FK → quotes.id)
    created_by (FK → users.id)
    invoice_number
    invoice_date
    due_date
    subtotal
    tax
    discount
    total
    paid_amount
    balance
    status
    notes
    created_at
    updated_at

invoice_items
    id (PK)
    invoice_id (FK → invoices.id)
    product_id (FK → products.id)
    quantity
    price
    tax
    discount
    total

payments
    id (PK)
    invoice_id (FK → invoices.id)
    customer_id (FK → customers.id)
    payment_method
    transaction_reference
    amount
    payment_date
    notes
    created_at

ticket_categories
    id (PK)
    name
    created_at

tickets
    id (PK)
    customer_id (FK → customers.id)
    assigned_to (FK → users.id)
    category_id (FK → ticket_categories.id)
    ticket_number
    subject
    priority
    status
    description
    created_at
    updated_at

ticket_replies
    id (PK)
    ticket_id (FK → tickets.id)
    user_id (FK → users.id)
    message
    attachment
    created_at

email_templates
    id (PK)
    name
    subject
    body
    created_at
    updated_at

email_logs
    id (PK)
    customer_id (FK → customers.id)
    user_id (FK → users.id)
    template_id (FK → email_templates.id)
    recipient
    subject
    status
    sent_at

notifications
    id (PK)
    user_id (FK → users.id)
    title
    message
    type
    is_read
    created_at

activity_logs
    id (PK)
    user_id (FK → users.id)
    module
    action
    record_id
    ip_address
    user_agent
    created_at

login_logs
    id (PK)
    user_id (FK → users.id)
    login_time
    logout_time
    ip_address
    browser
    operating_system

attachments
    id (PK)
    user_id (FK → users.id)
    module
    record_id
    file_name
    file_path
    file_type
    file_size
    created_at

notes
    id (PK)
    customer_id (FK → customers.id)
    lead_id (FK → leads.id)
    deal_id (FK → deals.id)
    user_id (FK → users.id)
    note
    created_at

settings
    id (PK)
    company_name
    company_email
    company_phone
    address
    city
    state
    country
    postal_code
    currency
    timezone
    language
    logo
    smtp_host
    smtp_port
    smtp_username
    smtp_password
    smtp_encryption
    created_at
    updated_at

audit_logs
    id (PK)
    user_id (FK → users.id)
    table_name
    record_id
    action
    old_values
    new_values
    ip_address
    created_at

pipelines
    id (PK)
    name
    is_default
    created_at
    updated_at

Generate Realistic Data 50 records

Develop a responsive web application with a modern dashboard and clean user interface.

Authentication Module

Implement:

- Login
- Logout
- Remember Me
- Forgot Password
- Reset Password
- Change Password
- Role Based Access Control (RBAC)
- Login History
- Secure Login
- User Profile Management
- Password hashing using password_hash()
- CSRF protection
- XSS Protection
- Session management
- SQL injection protection using PDO prepared statements
- Input validation and sanitization

Dashboard
Create an attractive Bootstrap dashboard showing:

Features:
- Total Customers
- Total Leads
- Active Deals
- Sales Revenue
- Tasks Due Today
- Upcoming Meetings
- New Customers This Month
- Monthly Sales Graph
- Lead Sources Pie Chart
- Sales Performance Line Chart
- Recent Activities
- Notifications
- Total Revenue
	Sum of all closed/won deals
- Active Leads
	Count of leads currently in pipeline stages (excluding closed/lost)
- Revenue Projection
	Line graph showing projected revenue over time (weekly/monthly)
- Deal Velocity
	Average time (in days) to close a deal
- Live Activity Feed
	Real-time or recent actions (e.g., lead created, deal moved, task completed)

Use Chart.js for all charts.
------------------------------------
- Pipeline
	-Drag-and-drop deals between stages
	-Each deal contains:
		Name
		Value
		Contact
		Stage
		Expected close date
------------------------------------

User Management

- CRUD Users
- Roles
- Permissions
- User Activity Log
- User Status
- User Profile Picture

Roles:

- Super Admin
- Admin
- Manager
- Sales Representative
- Support Staff

------------------------------------

Customer Module

Customer CRUD

Fields:

- Customer ID
- First Name
- Last Name
- Company
- Email
- Phone
- Mobile
- Website
- Industry
- Customer Type
- Status
- Address
- City
- State
- Country
- Postal Code
- Notes
- Profile Image

Features:

- Search
- Filter
- Pagination
- DataTables
- AJAX CRUD
- Soft Delete
- Customer Timeline
- Customer Notes
- Customer Documents
- Customer Tags

------------------------------------
Lead Management

Fields:
- Lead Name
- Company
- Email
- Phone
- Source
- Status
- Assigned To
- Expected Revenue
- Priority

Lead Pipeline
Lead Conversion
Lead Notes
Lead Activities
------------------------------------
Sales Pipeline

Stages:
- New
- Qualified
- Proposal
- Negotiation
- Won
- Lost

Features:
- Kanban Board
- Drag & Drop
- Revenue Forecast
- Win Rate

------------------------------------
Task Management

CRUD Tasks
Status
Priority
Due Date
Reminders
Recurring Tasks
------------------------------------
Meeting Scheduler
Calendar
Meetings
Google Calendar Ready
------------------------------------
Contact Management
Multiple Contacts per Customer
Phone
Email
Position
Notes
------------------------------------
Email Module
Email Templates
Bulk Email
SMTP Configuration
Email Logs
------------------------------------
Support Ticket System
Ticket CRUD
Priorities
Status
Replies
Attachments
------------------------------------
Products & Services
CRUD Products
Categories
Pricing
Taxes
Inventory
------------------------------------
Invoice Module
Create Invoice
Invoice PDF
Invoice Status
Payment Tracking
Tax Calculation
Discounts
------------------------------------
Quotation Module
Create Quotations
Convert Quote to Invoice
PDF Export
------------------------------------
Reports Module
Generate reports:
Sales Report
Customer Report
Lead Report
Revenue Report
Employee Report
Task Report
Support Report
Export:
PDF
Excel
CSV
------------------------------------
Notification System
Toast Notifications
Email Notifications
SMS Ready
In-app Notifications
------------------------------------
File Manager
Upload Documents
Images
Contracts
Invoices
Customer Files
------------------------------------
Settings Module
Company Settings
SMTP Settings
Currency
Language
Timezone
Theme
Logo
Backup
------------------------------------
Audit Logs
Track:
Login
Logout
CRUD Operations
Role Changes
Deleted Records
------------------------------------
Database
Generate normalized MySQL database.
Include:
- Foreign Keys
- Indexes
- Constraints
- Seed Data
------------------------------------
Coding Standards
Use:
- SOLID Principles
- DRY
- KISS
- PSR Standards
- Repository Pattern where appropriate
- Services Layer
- Helper Functions
- Reusable Components
------------------------------------
AJAX
Use AJAX for:
- CRUD Operations
- Search
- Pagination
- Filters
- Status Updates
- Notifications
- File Uploads
------------------------------------
Professional Admin Dashboard
Responsive
Mobile Friendly
Dark Mode Ready
Loading Spinners
Skeleton Loaders
Modern Cards
Beautiful Tables
Animations
Hover Effects
Bootstrap Modals
------------------------------------
DataTables
Include:
Server-side Processing
Sorting
Searching
Filtering
Export Buttons
Print
CSV
Excel
PDF
------------------------------------
SweetAlert2
Use for:
Delete Confirmation
Success Messages
Errors
Warnings
Confirmations
------------------------------------

Sidebar Menu Structure
Dashboard
│
├── Dashboard
│
├── CRM
│   ├── Customers
│   ├── Customer Contacts
│   ├── Leads
│   ├── Pipelines
│   ├── Deals
│   ├── Activities
│   ├── Calendar
│   └── Notes
│
├── Sales
│   ├── Quotations
│   ├── Invoices
│   ├── Payments
│   ├── Products
│   ├── Categories
│   └── Revenue
│
├── Support
│   ├── Tickets
│   ├── Ticket Categories
│   └── Knowledge Base
│
├── Marketing
│   ├── Email Templates
│   ├── Bulk Email
│   ├── Campaigns
│   ├── Lead Sources
│   └── Customer Tags
│
├── Tasks
│   ├── My Tasks
│   ├── All Tasks
│   └── Task Board
│
├── Meetings
│   ├── Meetings
│   ├── Calendar
│   └── Reminders
│
├── Documents
│   ├── Customer Documents
│   ├── Contracts
│   ├── Attachments
│   └── File Manager
│
├── Reports
│   ├── Dashboard Reports
│   ├── Sales Report
│   ├── Customer Report
│   ├── Lead Report
│   ├── Invoice Report
│   ├── Payment Report
│   ├── Product Report
│   ├── Ticket Report
│   ├── User Activity Report
│   └── Revenue Report
│
├── Administration
│   ├── Users
│   ├── Roles
│   ├── Permissions
│   ├── Activity Logs
│   ├── Login Logs
│   ├── Notifications
│   ├── Audit Logs
│   └── Backups
│
├── Settings
│   ├── Company Settings
│   ├── General Settings
│   ├── Email (SMTP)
│   ├── Currency
│   ├── Taxes
│   ├── Languages
│   ├── Timezone
│   ├── Appearance
│   ├── Integrations
│   └── System Information
│
└── Account
    ├── My Profile
    ├── Change Password
    ├── Two-Factor Authentication
    └── Logout