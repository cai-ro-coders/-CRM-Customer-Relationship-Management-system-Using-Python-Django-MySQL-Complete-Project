from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.db import models


class Role(models.Model):
    name = models.CharField(max_length=50, unique=True)
    description = models.CharField(max_length=255, blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'roles'

    def __str__(self):
        return self.name


class Permission(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=120, unique=True)
    module = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'permissions'

    def __str__(self):
        return f'{self.module}.{self.slug}'


class RolePermission(models.Model):
    role = models.ForeignKey(Role, on_delete=models.CASCADE, db_column='role_id')
    permission = models.ForeignKey(Permission, on_delete=models.CASCADE, db_column='permission_id')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'role_permissions'
        unique_together = ('role', 'permission')


class UserManager(BaseUserManager):
    def create_user(self, username, email=None, password=None, **extra):
        if not username:
            raise ValueError('Username is required')
        email = self.normalize_email(email) if email else ''
        user = self.model(username=username, email=email, **extra)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email=None, password=None, **extra):
        extra.setdefault('status', 'Active')
        role, _ = Role.objects.get_or_create(name='Super Admin', defaults={'description': 'Full system access'})
        extra['role'] = role
        return self.create_user(username, email, password, **extra)


class User(AbstractBaseUser):
    STATUS_CHOICES = [('Active', 'Active'), ('Inactive', 'Inactive'), ('Suspended', 'Suspended')]

    role = models.ForeignKey(Role, on_delete=models.PROTECT, db_column='role_id', null=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    username = models.CharField(max_length=50, unique=True)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=20, blank=True, default='')
    avatar = models.ImageField(upload_to='avatars/', blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, default='')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Active')
    last_login = models.DateTimeField(blank=True, null=True)
    remember_token = models.CharField(max_length=100, blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    objects = UserManager()
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email', 'first_name', 'last_name']

    class Meta:
        db_table = 'users'

    @property
    def is_active(self):
        return self.status == 'Active'

    @property
    def is_staff(self):
        return self.is_superuser

    @property
    def is_superuser(self):
        return bool(self.role and self.role.name == 'Super Admin')

    @property
    def full_name(self):
        return f'{self.first_name} {self.last_name}'.strip()

    def get_full_name(self):
        return self.full_name

    def get_short_name(self):
        return self.first_name

    def has_role(self, *names):
        return bool(self.role and self.role.name in names)

    def has_permission(self, slug):
        if self.is_superuser:
            return True
        if not self.role:
            return False
        return RolePermission.objects.filter(role=self.role, permission__slug=slug).exists()

    def __str__(self):
        return self.username


class Customer(models.Model):
    TYPE_CHOICES = [('Individual', 'Individual'), ('Business', 'Business')]
    STATUS_CHOICES = [('Active', 'Active'), ('Inactive', 'Inactive'), ('Prospect', 'Prospect')]

    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='assigned_to', null=True, blank=True,
                                    related_name='customers')
    customer_code = models.CharField(max_length=30, unique=True)
    company_name = models.CharField(max_length=150)
    customer_type = models.CharField(max_length=20, choices=TYPE_CHOICES, default='Business')
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=20, blank=True, default='')
    mobile = models.CharField(max_length=20, blank=True, default='')
    website = models.CharField(max_length=150, blank=True, default='')
    industry = models.CharField(max_length=80, blank=True, default='')
    tax_number = models.CharField(max_length=50, blank=True, default='')
    billing_address = models.CharField(max_length=255, blank=True, default='')
    shipping_address = models.CharField(max_length=255, blank=True, default='')
    city = models.CharField(max_length=80, blank=True, default='')
    state = models.CharField(max_length=80, blank=True, default='')
    country = models.CharField(max_length=80, blank=True, default='')
    postal_code = models.CharField(max_length=20, blank=True, default='')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Active')
    notes = models.TextField(blank=True, default='')
    image = models.ImageField(upload_to='customers/', blank=True, null=True)
    is_deleted = models.BooleanField(default=False, db_index=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'customers'
        indexes = [models.Index(fields=['email']), models.Index(fields=['company_name'])]

    @property
    def full_name(self):
        return f'{self.first_name} {self.last_name}'.strip()

    def __str__(self):
        return f'{self.customer_code} - {self.company_name}'


class CustomerContact(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id', related_name='contacts')
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    designation = models.CharField(max_length=80, blank=True, default='')
    email = models.CharField(max_length=100, blank=True, default='')
    phone = models.CharField(max_length=20, blank=True, default='')
    mobile = models.CharField(max_length=20, blank=True, default='')
    is_primary = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'customer_contacts'

    @property
    def full_name(self):
        return f'{self.first_name} {self.last_name}'.strip()


class CustomerTag(models.Model):
    name = models.CharField(max_length=50, unique=True)
    color = models.CharField(max_length=20, default='#6c757d')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'customer_tags'

    def __str__(self):
        return self.name


class CustomerTagMap(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id')
    tag = models.ForeignKey(CustomerTag, on_delete=models.CASCADE, db_column='tag_id')

    class Meta:
        db_table = 'customer_tag_map'
        unique_together = ('customer', 'tag')


class CustomerDocument(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id', related_name='documents')
    uploaded_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='uploaded_by', null=True)
    file_name = models.CharField(max_length=255)
    file_path = models.FileField(upload_to='customer_docs/')
    file_size = models.BigIntegerField(default=0)
    file_type = models.CharField(max_length=100, blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'customer_documents'


class LeadSource(models.Model):
    name = models.CharField(max_length=80, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'lead_sources'

    def __str__(self):
        return self.name


class LeadStatus(models.Model):
    name = models.CharField(max_length=80, unique=True)
    color = models.CharField(max_length=20, default='#6c757d')
    sort_order = models.IntegerField(default=0)

    class Meta:
        db_table = 'lead_statuses'
        ordering = ['sort_order']

    def __str__(self):
        return self.name


class Lead(models.Model):
    PRIORITY_CHOICES = [('Low', 'Low'), ('Medium', 'Medium'), ('High', 'High'), ('Urgent', 'Urgent')]

    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='assigned_to', null=True, blank=True,
                                    related_name='leads')
    source = models.ForeignKey(LeadSource, on_delete=models.SET_NULL, db_column='source_id', null=True, blank=True)
    status = models.ForeignKey(LeadStatus, on_delete=models.SET_NULL, db_column='status_id', null=True, blank=True)
    company = models.CharField(max_length=150, blank=True, default='')
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=100, blank=True, default='')
    phone = models.CharField(max_length=20, blank=True, default='')
    website = models.CharField(max_length=150, blank=True, default='')
    expected_revenue = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES, default='Medium')
    notes = models.TextField(blank=True, default='')
    converted_customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, db_column='converted_customer_id',
                                           null=True, blank=True, related_name='converted_leads')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'leads'

    @property
    def full_name(self):
        return f'{self.first_name} {self.last_name}'.strip()


class LeadActivity(models.Model):
    lead = models.ForeignKey(Lead, on_delete=models.CASCADE, db_column='lead_id', related_name='activities')
    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    activity = models.CharField(max_length=100)
    description = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'lead_activities'
        ordering = ['-created_at']


class Pipeline(models.Model):
    name = models.CharField(max_length=100, unique=True)
    is_default = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pipelines'

    def __str__(self):
        return self.name


class DealStage(models.Model):
    pipeline = models.ForeignKey(Pipeline, on_delete=models.CASCADE, db_column='pipeline_id', related_name='stages')
    name = models.CharField(max_length=80)
    color = models.CharField(max_length=20, default='#0d6efd')
    sort_order = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'deal_stages'
        ordering = ['sort_order']

    def __str__(self):
        return self.name


class Deal(models.Model):
    STATUS_CHOICES = [('Open', 'Open'), ('Won', 'Won'), ('Lost', 'Lost')]

    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, db_column='customer_id', null=True, blank=True)
    lead = models.ForeignKey(Lead, on_delete=models.SET_NULL, db_column='lead_id', null=True, blank=True)
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='assigned_to', null=True, blank=True)
    stage = models.ForeignKey(DealStage, on_delete=models.PROTECT, db_column='stage_id', null=True)
    deal_name = models.CharField(max_length=150)
    expected_value = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    probability = models.PositiveSmallIntegerField(default=50)
    expected_close_date = models.DateField(blank=True, null=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='Open')
    notes = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'deals'


class Task(models.Model):
    PRIORITY_CHOICES = [('Low', 'Low'), ('Medium', 'Medium'), ('High', 'High'), ('Urgent', 'Urgent')]
    STATUS_CHOICES = [('Pending', 'Pending'), ('In Progress', 'In Progress'), ('Completed', 'Completed'),
                      ('Cancelled', 'Cancelled')]

    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='assigned_to', null=True, blank=True,
                                    related_name='tasks')
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, db_column='customer_id', null=True, blank=True)
    lead = models.ForeignKey(Lead, on_delete=models.SET_NULL, db_column='lead_id', null=True, blank=True)
    deal = models.ForeignKey(Deal, on_delete=models.SET_NULL, db_column='deal_id', null=True, blank=True)
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, default='')
    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES, default='Medium')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Pending')
    due_date = models.DateField(blank=True, null=True)
    reminder_date = models.DateField(blank=True, null=True)
    completed_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tasks'


class Meeting(models.Model):
    TYPE_CHOICES = [('Call', 'Call'), ('Video', 'Video Call'), ('In Person', 'In Person')]
    STATUS_CHOICES = [('Scheduled', 'Scheduled'), ('Completed', 'Completed'), ('Cancelled', 'Cancelled')]

    organizer = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='organizer_id', null=True,
                                  related_name='meetings')
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, db_column='customer_id', null=True, blank=True)
    lead = models.ForeignKey(Lead, on_delete=models.SET_NULL, db_column='lead_id', null=True, blank=True)
    title = models.CharField(max_length=200)
    location = models.CharField(max_length=150, blank=True, default='')
    meeting_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField(blank=True, null=True)
    description = models.TextField(blank=True, default='')
    meeting_type = models.CharField(max_length=20, choices=TYPE_CHOICES, default='Call')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Scheduled')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'meetings'


class MeetingAttendee(models.Model):
    meeting = models.ForeignKey(Meeting, on_delete=models.CASCADE, db_column='meeting_id', related_name='attendees')
    user = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')

    class Meta:
        db_table = 'meeting_attendees'
        unique_together = ('meeting', 'user')


class ProductCategory(models.Model):
    category_name = models.CharField(max_length=100, unique=True)
    description = models.CharField(max_length=255, blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'product_categories'

    def __str__(self):
        return self.category_name


class Product(models.Model):
    STATUS_CHOICES = [('Active', 'Active'), ('Inactive', 'Inactive')]

    category = models.ForeignKey(ProductCategory, on_delete=models.SET_NULL, db_column='category_id', null=True,
                                 blank=True)
    sku = models.CharField(max_length=50, unique=True)
    product_name = models.CharField(max_length=150)
    description = models.TextField(blank=True, default='')
    unit_price = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    tax_rate = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    stock_quantity = models.IntegerField(default=0)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='Active')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'products'


class Quote(models.Model):
    STATUS_CHOICES = [('Draft', 'Draft'), ('Sent', 'Sent'), ('Accepted', 'Accepted'), ('Declined', 'Declined'),
                      ('Expired', 'Expired')]

    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id')
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='created_by', null=True)
    quote_number = models.CharField(max_length=30, unique=True)
    quote_date = models.DateField()
    expiry_date = models.DateField(blank=True, null=True)
    subtotal = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    tax = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    discount = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    total = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    status = models.CharField(max_length=15, choices=STATUS_CHOICES, default='Draft')
    notes = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'quotes'


class QuoteItem(models.Model):
    quote = models.ForeignKey(Quote, on_delete=models.CASCADE, db_column='quote_id', related_name='items')
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, db_column='product_id', null=True)
    quantity = models.DecimalField(max_digits=10, decimal_places=2, default=1)
    price = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    tax = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    discount = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    total = models.DecimalField(max_digits=14, decimal_places=2, default=0)

    class Meta:
        db_table = 'quote_items'


class Invoice(models.Model):
    STATUS_CHOICES = [('Draft', 'Draft'), ('Sent', 'Sent'), ('Partial', 'Partial'), ('Paid', 'Paid'),
                      ('Overdue', 'Overdue'), ('Cancelled', 'Cancelled')]

    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id')
    quote = models.ForeignKey(Quote, on_delete=models.SET_NULL, db_column='quote_id', null=True, blank=True)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='created_by', null=True)
    invoice_number = models.CharField(max_length=30, unique=True)
    invoice_date = models.DateField()
    due_date = models.DateField(blank=True, null=True)
    subtotal = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    tax = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    discount = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    total = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    paid_amount = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    balance = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    status = models.CharField(max_length=15, choices=STATUS_CHOICES, default='Draft')
    notes = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'invoices'


class InvoiceItem(models.Model):
    invoice = models.ForeignKey(Invoice, on_delete=models.CASCADE, db_column='invoice_id', related_name='items')
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, db_column='product_id', null=True)
    quantity = models.DecimalField(max_digits=10, decimal_places=2, default=1)
    price = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    tax = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    discount = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    total = models.DecimalField(max_digits=14, decimal_places=2, default=0)

    class Meta:
        db_table = 'invoice_items'


class Payment(models.Model):
    METHOD_CHOICES = [('Cash', 'Cash'), ('Bank Transfer', 'Bank Transfer'), ('Credit Card', 'Credit Card'),
                      ('PayPal', 'PayPal'), ('Check', 'Check')]

    invoice = models.ForeignKey(Invoice, on_delete=models.CASCADE, db_column='invoice_id', related_name='payments')
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id')
    payment_method = models.CharField(max_length=20, choices=METHOD_CHOICES, default='Cash')
    transaction_reference = models.CharField(max_length=100, blank=True, default='')
    amount = models.DecimalField(max_digits=14, decimal_places=2, default=0)
    payment_date = models.DateField()
    notes = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'payments'


class TicketCategory(models.Model):
    name = models.CharField(max_length=80, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'ticket_categories'

    def __str__(self):
        return self.name


class Ticket(models.Model):
    PRIORITY_CHOICES = [('Low', 'Low'), ('Medium', 'Medium'), ('High', 'High'), ('Urgent', 'Urgent')]
    STATUS_CHOICES = [('Open', 'Open'), ('In Progress', 'In Progress'), ('On Hold', 'On Hold'),
                      ('Closed', 'Closed')]

    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id')
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='assigned_to', null=True, blank=True)
    category = models.ForeignKey(TicketCategory, on_delete=models.SET_NULL, db_column='category_id', null=True,
                                 blank=True)
    ticket_number = models.CharField(max_length=30, unique=True)
    subject = models.CharField(max_length=200)
    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES, default='Medium')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Open')
    description = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tickets'


class TicketReply(models.Model):
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, db_column='ticket_id', related_name='replies')
    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    message = models.TextField()
    attachment = models.FileField(upload_to='attachments/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'ticket_replies'
        ordering = ['created_at']


class EmailTemplate(models.Model):
    name = models.CharField(max_length=100, unique=True)
    subject = models.CharField(max_length=200)
    body = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'email_templates'


class EmailLog(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id', null=True, blank=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    template = models.ForeignKey(EmailTemplate, on_delete=models.SET_NULL, db_column='template_id', null=True,
                                 blank=True)
    recipient = models.CharField(max_length=150)
    subject = models.CharField(max_length=200)
    status = models.CharField(max_length=20, default='Sent')
    sent_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'email_logs'
        ordering = ['-sent_at']


class Notification(models.Model):
    TYPE_CHOICES = [('info', 'info'), ('success', 'success'), ('warning', 'warning'), ('danger', 'danger')]

    user = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id', related_name='notifications')
    title = models.CharField(max_length=150)
    message = models.TextField(blank=True, default='')
    type = models.CharField(max_length=10, choices=TYPE_CHOICES, default='info')
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'notifications'
        ordering = ['-created_at']


class ActivityLog(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    module = models.CharField(max_length=50)
    action = models.CharField(max_length=50)
    record_id = models.IntegerField(null=True, blank=True)
    ip_address = models.CharField(max_length=45, blank=True, default='')
    user_agent = models.CharField(max_length=255, blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'activity_logs'
        ordering = ['-created_at']


class LoginLog(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id', related_name='login_logs')
    login_time = models.DateTimeField(auto_now_add=True)
    logout_time = models.DateTimeField(blank=True, null=True)
    ip_address = models.CharField(max_length=45, blank=True, default='')
    browser = models.CharField(max_length=100, blank=True, default='')
    operating_system = models.CharField(max_length=100, blank=True, default='')

    class Meta:
        db_table = 'login_logs'
        ordering = ['-login_time']


class Attachment(models.Model):
    MODULE_CHOICES = [('customer', 'Customer'), ('lead', 'Lead'), ('deal', 'Deal'), ('task', 'Task'),
                      ('ticket', 'Ticket'), ('invoice', 'Invoice'), ('quote', 'Quote'), ('general', 'General')]

    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    module = models.CharField(max_length=20, choices=MODULE_CHOICES, default='general')
    record_id = models.IntegerField(null=True, blank=True)
    file_name = models.CharField(max_length=255)
    file_path = models.FileField(upload_to='attachments/')
    file_type = models.CharField(max_length=100, blank=True, default='')
    file_size = models.BigIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'attachments'


class Note(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customer_id', null=True, blank=True,
                                 related_name='note_list')
    lead = models.ForeignKey(Lead, on_delete=models.CASCADE, db_column='lead_id', null=True, blank=True,
                             related_name='note_list')
    deal = models.ForeignKey(Deal, on_delete=models.CASCADE, db_column='deal_id', null=True, blank=True,
                             related_name='note_list')
    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    note = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'notes'
        ordering = ['-created_at']


class Setting(models.Model):
    company_name = models.CharField(max_length=150, default='My Company')
    company_email = models.CharField(max_length=100, blank=True, default='')
    company_phone = models.CharField(max_length=30, blank=True, default='')
    address = models.CharField(max_length=255, blank=True, default='')
    city = models.CharField(max_length=80, blank=True, default='')
    state = models.CharField(max_length=80, blank=True, default='')
    country = models.CharField(max_length=80, blank=True, default='')
    postal_code = models.CharField(max_length=20, blank=True, default='')
    currency = models.CharField(max_length=10, default='USD')
    timezone = models.CharField(max_length=50, default='UTC')
    language = models.CharField(max_length=10, default='en')
    logo = models.ImageField(upload_to='logos/', blank=True, null=True)
    smtp_host = models.CharField(max_length=150, blank=True, default='')
    smtp_port = models.CharField(max_length=10, blank=True, default='')
    smtp_username = models.CharField(max_length=150, blank=True, default='')
    smtp_password = models.CharField(max_length=150, blank=True, default='')
    smtp_encryption = models.CharField(max_length=10, blank=True, default='tls')
    theme = models.CharField(max_length=10, default='light')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'settings'


class AuditLog(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='user_id', null=True)
    table_name = models.CharField(max_length=64)
    record_id = models.IntegerField(null=True, blank=True)
    action = models.CharField(max_length=20)
    old_values = models.JSONField(blank=True, null=True)
    new_values = models.JSONField(blank=True, null=True)
    ip_address = models.CharField(max_length=45, blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'audit_logs'
        ordering = ['-created_at']
