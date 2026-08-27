import os
import random
from datetime import timedelta
from decimal import Decimal

from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand
from django.utils import timezone

from crm.models import (
    Role, Permission, RolePermission, User, Customer, CustomerContact, CustomerTag,
    CustomerTagMap, CustomerDocument, LeadSource, LeadStatus, Lead, LeadActivity,
    Pipeline, DealStage, Deal, Task, Meeting, MeetingAttendee, ProductCategory,
    Product, Quote, QuoteItem, Invoice, InvoiceItem, Payment, TicketCategory,
    Ticket, TicketReply, EmailTemplate, EmailLog, Notification, ActivityLog,
    LoginLog, Attachment, Note, Setting, AuditLog,
)

random.seed(42)

FIRST_NAMES = [
    'James', 'Mary', 'Robert', 'Patricia', 'John', 'Jennifer', 'Michael', 'Linda',
    'David', 'Elizabeth', 'William', 'Barbara', 'Richard', 'Susan', 'Joseph',
    'Jessica', 'Thomas', 'Sarah', 'Charles', 'Karen', 'Christopher', 'Lisa',
    'Daniel', 'Nancy', 'Matthew', 'Betty', 'Anthony', 'Sandra', 'Mark', 'Ashley',
    'Steven', 'Emily', 'Andrew', 'Donna', 'Joshua', 'Michelle', 'Kevin', 'Carol',
    'Brian', 'Amanda', 'George', 'Melissa', 'Timothy', 'Deborah', 'Ronald',
    'Stephanie', 'Jason', 'Rebecca', 'Ryan', 'Laura',
]
LAST_NAMES = [
    'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis',
    'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson',
    'Taylor', 'Moore', 'Jackson', 'Martin', 'Lee', 'Perez', 'Thompson', 'White',
    'Harris', 'Sanchez', 'Clark', 'Ramirez', 'Lewis', 'Robinson', 'Walker',
    'Young', 'Allen', 'King', 'Wright', 'Scott', 'Torres', 'Nguyen', 'Hill',
    'Flores', 'Green', 'Adams', 'Nelson', 'Baker', 'Hall', 'Rivera', 'Campbell',
    'Mitchell', 'Carter', 'Roberts', 'Gomez',
]
COMPANIES = [
    'Apex Global Solutions', 'BlueSky Technologies', 'Summit Peak Industries',
    'NovaStar Enterprises', 'Quantum Leap Systems', 'Golden Gate Trading',
    'Silverline Consulting', 'Pacific Rim Logistics', 'Ironclad Security',
    'Emerald City Software', 'Redwood Analytics', 'Crescent Moon Media',
    'Titan Industrial Group', 'Falcon Ridge Partners', 'Crystal Clear Water Co',
    'Mountain High Outfitters', 'Urban Jungle Landscaping', 'Coastal Breeze Hotels',
    'Pioneer Medical Group', 'Stellar Dynamics Corp', 'Vanguard Financial Services',
    'Horizon Broadband Networks', 'Maple Leaf Foods Inc', 'Sunrise Bakery Chain',
    'Thunderbolt Gaming Studios', 'Whispering Pines Resorts', 'Lightning Bolt Energy',
    'Diamond Edge Jewelers', 'Phoenix Rising Fitness', 'Ocean Blue Seafood Market',
    'Grand Central Stationers', 'Happy Trails Travel Agency', 'Smart Home Innovations',
    'Prime Time Entertainment', 'Fresh Farm Organics', 'Metro City Realty',
    'Elite Auto Dealership', 'Precision Engineering Works', 'Global Trade Consortium',
    'NextGen Robotics Labs', 'Cloud Nine Air Services', 'Bright Future Academy',
    'Swift Courier Express', 'Reliable Plumbing Pros', 'Elegant Interiors Studio',
    'Mighty Movers Relocation', 'Pure Glow Beauty Spa', 'Tasty Bite Restaurants',
    'Secure Vault Banking', 'Wise Owl Bookstores', 'Zenith Insurance Brokers',
]
INDUSTRIES = [
    'Technology', 'Healthcare', 'Finance', 'Retail', 'Manufacturing', 'Education',
    'Real Estate', 'Hospitality', 'Logistics', 'Telecommunications', 'Construction', 'Marketing',
]
LOCATIONS = [
    ('New York', 'NY', 'USA'), ('Los Angeles', 'CA', 'USA'), ('Chicago', 'IL', 'USA'),
    ('Houston', 'TX', 'USA'), ('Phoenix', 'AZ', 'USA'), ('Philadelphia', 'PA', 'USA'),
    ('San Antonio', 'TX', 'USA'), ('Dallas', 'TX', 'USA'), ('Austin', 'TX', 'USA'),
    ('Seattle', 'WA', 'USA'), ('Denver', 'CO', 'USA'), ('Boston', 'MA', 'USA'),
    ('London', 'England', 'UK'), ('Manchester', 'England', 'UK'),
    ('Toronto', 'Ontario', 'Canada'), ('Vancouver', 'BC', 'Canada'),
    ('Sydney', 'NSW', 'Australia'), ('Melbourne', 'VIC', 'Australia'),
    ('Singapore', '', 'Singapore'), ('Berlin', 'Berlin', 'Germany'),
    ('Munich', 'Bavaria', 'Germany'), ('Dubai', 'Dubai', 'UAE'),
    ('Manila', 'Metro Manila', 'Philippines'), ('Cebu City', 'Cebu', 'Philippines'),
    ('Tokyo', 'Kanto', 'Japan'),
]
STREET_PARTS = ['Main St', 'Oak Ave', 'Maple Dr', 'Cedar Ln', 'Park Rd', 'Lake View Blvd',
                'Sunset Blvd', 'River Rd', 'Hill Crest Ave', 'Commerce Way']

MODULES = ['dashboard', 'customers', 'contacts', 'leads', 'deals', 'pipelines', 'tasks',
           'meetings', 'products', 'categories', 'quotes', 'invoices', 'payments',
           'tickets', 'email_templates', 'email_logs', 'users', 'roles', 'permissions',
           'reports', 'settings', 'notifications', 'activity_logs', 'login_logs', 'audit_logs']
ACTIONS = [('view', 'View'), ('create', 'Create'), ('update', 'Update'), ('delete', 'Delete')]

BUSINESS = ['customers', 'contacts', 'leads', 'deals', 'pipelines', 'tasks', 'meetings',
            'quotes', 'invoices', 'payments', 'tickets']
ROLE_MATRIX = {
    'Admin': {'v': MODULES, 'c': MODULES, 'u': MODULES, 'd': MODULES},
    'Manager': {'v': MODULES, 'c': BUSINESS, 'u': BUSINESS, 'd': []},
    'Sales Representative': {
        'v': ['dashboard'] + BUSINESS + ['products', 'categories', 'reports', 'notifications'],
        'c': ['customers', 'contacts', 'leads', 'deals', 'tasks', 'meetings', 'quotes', 'invoices', 'payments'],
        'u': ['customers', 'contacts', 'leads', 'deals', 'tasks', 'meetings', 'quotes'],
        'd': [],
    },
    'Support Staff': {
        'v': ['dashboard', 'tickets', 'customers', 'contacts', 'products', 'tasks',
              'meetings', 'reports', 'notifications'],
        'c': ['tickets'], 'u': ['tickets', 'customers', 'tasks'], 'd': [],
    },
}


def rand_dt(days_back=365):
    return timezone.now() - timedelta(days=random.randint(0, days_back),
                                      hours=random.randint(0, 23), minutes=random.randint(0, 59))


def rand_person():
    f, l = random.choice(FIRST_NAMES), random.choice(LAST_NAMES)
    return f, l


def slugify_name(name):
    return name.lower().replace(' ', '-')


class Command(BaseCommand):
    help = 'Seed database with realistic CRM data (50 records per table)'

    def handle(self, *args, **options):
        self.stdout.write('Clearing existing data...')
        for model in [AuditLog, LoginLog, ActivityLog, Notification, EmailLog, EmailTemplate,
                      TicketReply, Ticket, TicketCategory, Payment, InvoiceItem, Invoice,
                      QuoteItem, Quote, Product, ProductCategory, MeetingAttendee, Meeting,
                      Task, Deal, DealStage, Pipeline, LeadActivity, Lead, LeadStatus,
                      LeadSource, CustomerDocument, CustomerTagMap, CustomerTag,
                      CustomerContact, Customer, Note, Attachment, User, RolePermission,
                      Permission, Role, Setting]:
            model.objects.all().delete()

        self.seed_settings()
        roles = self.seed_roles()
        perms = self.seed_permissions()
        self.seed_role_permissions(roles, perms)
        users = self.seed_users(roles)
        sources = self.seed_lead_sources()
        lead_statuses = self.seed_lead_statuses()
        pipelines, stages = self.seed_pipelines()
        ticket_cats = self.seed_ticket_categories()
        prod_cats = self.seed_product_categories()
        tags = self.seed_tags()
        customers = self.seed_customers(users)
        self.seed_contacts(customers)
        self.seed_tag_map(customers, tags)
        self.seed_documents(customers, users)
        leads = self.seed_leads(users, sources, lead_statuses, customers)
        self.seed_lead_activities(leads, users)
        deals = self.seed_deals(customers, leads, users, stages)
        self.seed_tasks(deals, customers, leads, users)
        self.seed_meetings(users, customers, leads)
        products = self.seed_products(prod_cats)
        self.seed_quotes_and_invoices(customers, users, products)
        self.seed_tickets(customers, users, ticket_cats)
        self.seed_emails(customers, users)
        self.seed_notifications(users)
        self.seed_logs(users)
        self.seed_notes(customers, leads, deals, users)
        self.seed_attachments(users)

        self.stdout.write(self.style.SUCCESS(
            'Seeding complete.\n'
            '  Super Admin : admin / Admin@123\n'
            '  Manager     : rsmith / Admin@123\n'
            '  Sales Rep   : mjohnson / Admin@123\n'
            '  Support     : sgrace / Admin@123'
        ))

    def seed_settings(self):
        Setting.objects.create(
            company_name='TechNova Solutions Inc.', company_email='info@technova.com',
            company_phone='+1 (555) 123-4567', address='452 Commerce Way', city='Austin',
            state='TX', country='USA', postal_code='78701', currency='USD',
            timezone='America/Chicago', language='en', smtp_host='smtp.technova.com',
            smtp_port='587', smtp_username='crm@technova.com', smtp_password='secret123',
            smtp_encryption='tls',
        )
        self.stdout.write('  settings OK')

    def seed_roles(self):
        roles = []
        for name, desc in [
            ('Super Admin', 'Full unrestricted access to the system'),
            ('Admin', 'Administrative access to all modules'),
            ('Manager', 'Team management and reporting access'),
            ('Sales Representative', 'Manages customers, leads and deals'),
            ('Support Staff', 'Handles customer support tickets'),
        ]:
            roles.append(Role.objects.create(name=name, description=desc))
        self.stdout.write('  roles OK')
        return roles

    def seed_permissions(self):
        perms = {}
        for module in MODULES:
            for action, label in ACTIONS:
                p = Permission.objects.create(
                    name=f'{label} {module.replace("_", " ").title()}',
                    slug=f'{module}.{action}', module=module)
                perms[f'{module}.{action}'] = p
        self.stdout.write(f'  permissions OK ({len(perms)})')
        return perms

    def seed_role_permissions(self, roles, perms):
        count = 0
        for role in roles:
            matrix = ROLE_MATRIX.get(role.name)
            if matrix is None:  # Super Admin gets everything
                for p in perms.values():
                    RolePermission.objects.create(role=role, permission=p)
                    count += 1
                continue
            for action_key, action in [('v', 'view'), ('c', 'create'), ('u', 'update'), ('d', 'delete')]:
                for module in matrix[action_key]:
                    key = f'{module}.{action}'
                    if key in perms:
                        RolePermission.objects.create(role=role, permission=perms[key])
                        count += 1
        self.stdout.write(f'  role_permissions OK ({count})')

    def seed_users(self, roles):
        role_by_name = {r.name: r for r in roles}
        users = []

        def mk(username, fn, ln, role_name, idx):
            city, state, country = random.choice(LOCATIONS)
            u = User(username=username, first_name=fn, last_name=ln,
                     email=f'{username}@technova.com', phone=f'+1 555-{random.randint(100,999)}-{random.randint(1000,9999)}',
                     address=f'{random.randint(10, 999)} {random.choice(STREET_PARTS)}, {city}',
                     status='Active' if random.random() > 0.06 else 'Inactive',
                     role=role_by_name[role_name])
            u.set_password('Admin@123')
            u.save()
            User.objects.filter(pk=u.pk).update(created_at=rand_dt(700), updated_at=rand_dt(30),
                                                last_login=rand_dt(14))
            users.append(u)

        mk('admin', 'Alvin', 'Duran', 'Super Admin', 0)
        mk('rsmith', 'Robert', 'Smith', 'Admin', 1)
        mk('ljohnson', 'Lisa', 'Johnson', 'Admin', 2)
        mk('mgr_davis', 'Angela', 'Davis', 'Manager', 3)
        for i in range(4):
            f, l = rand_person()
            mk(f'mgr_{f.lower()}.{l.lower()}', f, l, 'Manager', i + 4)
        sales_firsts = ['Michael', 'Sarah', 'James', 'Emily', 'David', 'Ashley', 'Chris', 'Amanda',
                        'Daniel', 'Jessica', 'Matt', 'Nicole', 'Kevin', 'Rachel', 'Brian', 'Laura',
                        'Justin', 'Megan', 'Eric', 'Stephanie', 'Aaron', 'Olivia', 'Nathan', 'Grace',
                        'Victor', 'Hannah', 'Oscar', 'Julia']
        for i, sf in enumerate(sales_firsts):
            sl = LAST_NAMES[(i * 7) % len(LAST_NAMES)]
            uname = f'{sf[0].lower()}{sl.lower()}' if i else 'mjohnson'
            if i == 0:
                uname = 'mjohnson'
            mk(uname, sf, sl, 'Sales Representative', 8 + i)
        support_names = [('Samuel', 'Grace', 'sgrace'), ('Priya', 'Patel', 'ppatel'),
                         ('Diego', 'Ramirez', 'dramirez'), ('Chloe', 'Kim', 'ckim'),
                         ('Ibrahim', 'Hassan', 'ihassan')]
        for sf, sl, un in support_names:
            mk(un, sf, sl, 'Support Staff', 36)
        extra = User.objects.count()
        while extra < 50:
            f, l = rand_person()
            uname = f'{f.lower()}.{l.lower()}{extra}'
            try:
                mk(uname, f, l, random.choice(['Manager', 'Sales Representative', 'Support Staff']), extra)
            except Exception:
                pass
            extra = User.objects.count()
        self.stdout.write(f'  users OK ({User.objects.count()})')
        return users

    def seed_lead_sources(self):
        names = ['Website', 'Referral', 'Cold Call', 'Social Media', 'Email Campaign',
                 'Trade Show', 'Partner', 'Advertisement']
        for n in names:
            LeadSource.objects.create(name=n, created_at=rand_dt(400))
        return list(LeadSource.objects.all())

    def seed_lead_statuses(self):
        data = [('New', '#0dcaf0', 1), ('Contacted', '#6f42c1', 2), ('Qualified', '#198754', 3),
                ('Working', '#fd7e14', 4), ('Unqualified', '#dc3545', 5)]
        out = []
        for n, c, o in data:
            out.append(LeadStatus.objects.create(name=n, color=c, sort_order=o))
        return out

    def seed_pipelines(self):
        p1 = Pipeline.objects.create(name='Sales Pipeline', is_default=True, created_at=rand_dt(500))
        p2 = Pipeline.objects.create(name='Renewal Pipeline', is_default=False, created_at=rand_dt(300))
        stages = []
        for n, c, o in [('New', '#6c757d', 1), ('Qualified', '#0dcaf0', 2), ('Proposal', '#0d6efd', 3),
                        ('Negotiation', '#ffc107', 4), ('Won', '#198754', 5), ('Lost', '#dc3545', 6)]:
            stages.append(DealStage.objects.create(pipeline=p1, name=n, color=c, sort_order=o))
        for n, c, o in [('Renewal Due', '#ffc107', 1), ('Renewal Negotiation', '#fd7e14', 2),
                        ('Renewed', '#198754', 3), ('Churned', '#dc3545', 4)]:
            DealStage.objects.create(pipeline=p2, name=n, color=c, sort_order=o)
        return [p1, p2], stages

    def seed_ticket_categories(self):
        for n in ['Technical Issue', 'Billing', 'Sales Inquiry', 'Account Access',
                  'Feature Request', 'General']:
            TicketCategory.objects.create(name=n, created_at=rand_dt(400))
        return list(TicketCategory.objects.all())

    def seed_product_categories(self):
        cats = []
        for n, d in [
            ('Electronics', 'Laptops, monitors and gadgets'),
            ('Software', 'Licenses and SaaS subscriptions'),
            ('Office Supplies', 'Everyday office consumables'),
            ('Furniture', 'Desks, chairs and fittings'),
            ('Networking', 'Routers, switches, access points'),
            ('Accessories', 'Keyboards, mice, cables'),
            ('Services', 'Professional and consulting services'),
            ('Peripherals', 'Printers, scanners, webcams'),
        ]:
            cats.append(ProductCategory.objects.create(category_name=n, description=d,
                                                       created_at=rand_dt(500)))
        return cats

    def seed_tags(self):
        tags = []
        for n, c in [('VIP', '#dc3545'), ('Wholesale', '#0d6efd'), ('Retail', '#198754'),
                     ('High Value', '#ffc107'), ('At Risk', '#fd7e14'), ('New', '#0dcaf0'),
                     ('Enterprise', '#6f42c1'), ('SMB', '#20c997')]:
            tags.append(CustomerTag.objects.create(name=n, color=c, created_at=rand_dt(450)))
        return tags

    def seed_customers(self, users):
        reps = [u for u in users if u.role.name in ('Sales Representative', 'Manager', 'Admin')]
        customers = []
        for idx, company in enumerate(COMPANIES, start=1):
            f, l = rand_person()
            city, state, country = random.choice(LOCATIONS)
            c = Customer(
                assigned_to=random.choice(reps),
                customer_code=f'CUS-{idx:05d}',
                company_name=company,
                customer_type=random.choice(['Business', 'Business', 'Business', 'Individual']),
                first_name=f, last_name=l,
                email=f'contact@{slugify_name(company)[:18].strip("-")}.com',
                phone=f'+1 {random.randint(200,989)}-{random.randint(200,999)}-{random.randint(1000,9999)}',
                mobile=f'+1 {random.randint(200,989)}-{random.randint(200,999)}-{random.randint(1000,9999)}',
                website=f'https://www.{slugify_name(company)[:24].strip("-")}.com',
                industry=random.choice(INDUSTRIES),
                tax_number=f'TX-{random.randint(10000000, 99999999)}',
                billing_address=f'{random.randint(10, 999)} {random.choice(STREET_PARTS)}',
                shipping_address=f'{random.randint(10, 999)} {random.choice(STREET_PARTS)}',
                city=city, state=state, country=country,
                postal_code=str(random.randint(10000, 99999)),
                status=random.choice(['Active'] * 7 + ['Prospect'] * 2 + ['Inactive']),
                notes=f'Key account. Prefers communication via email. Follow up quarterly.',
            )
            c.save()
            Customer.objects.filter(pk=c.pk).update(created_at=rand_dt(365))
            customers.append(c)
        # soft-delete a few to demonstrate trash
        for c in random.sample(customers, 4):
            Customer.objects.filter(pk=c.pk).update(is_deleted=True)
        self.stdout.write(f'  customers OK ({len(customers)})')
        return customers

    def seed_contacts(self, customers):
        count = 0
        for c in customers[:25]:
            for _ in range(2):
                f, l = rand_person()
                cc = CustomerContact(
                    customer=c, first_name=f, last_name=l,
                    designation=random.choice(['CEO', 'CTO', 'CFO', 'Procurement Manager',
                                               'IT Director', 'Operations Head', 'HR Manager',
                                               'Marketing Lead']),
                    email=f'{f.lower()}.{l.lower()}@{slugify_name(c.company_name)[:16].strip("-")}.com',
                    phone=f'+1 {random.randint(200,989)}-{random.randint(200,999)}-{random.randint(1000,9999)}',
                    mobile=f'+1 {random.randint(200,989)}-{random.randint(200,999)}-{random.randint(1000,9999)}',
                    is_primary=(count % 2 == 0),
                )
                cc.save()
                CustomerContact.objects.filter(pk=cc.pk).update(created_at=rand_dt(300))
                count += 1
        self.stdout.write(f'  customer_contacts OK ({count})')

    def seed_tag_map(self, customers, tags):
        pairs = set()
        rows = []
        while len(rows) < 80:
            pair = (random.choice(customers), random.choice(tags))
            if (pair[0].id, pair[1].id) not in pairs:
                pairs.add((pair[0].id, pair[1].id))
                rows.append(CustomerTagMap(customer=pair[0], tag=pair[1]))
        CustomerTagMap.objects.bulk_create(rows)
        self.stdout.write(f'  customer_tag_map OK ({len(rows)})')

    def seed_documents(self, customers, users):
        doc_types = [
            ('Contract_{co}.pdf', 'application/pdf'), ('Invoice_Archive_{co}.pdf', 'application/pdf'),
            ('SLA_Agreement_{co}.pdf', 'application/pdf'), ('Requirements_{co}.docx',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),
            ('Meeting_Notes_{co}.txt', 'text/plain'), ('Price_List_2026.xlsx',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
        ]
        count = 0
        for c in random.sample(customers, 25):
            template, mime = random.choice(doc_types)
            fname = template.format(co=slugify_name(c.company_name).title().replace('-', ''))
            content = b'%PDF-1.4\n% CRM seeded document\n' + os.urandom(random.randint(2048, 16384))
            doc = CustomerDocument(customer=c, uploaded_by=random.choice(users), file_name=fname,
                                   file_size=len(content), file_type=mime)
            doc.file_path.save(fname, ContentFile(content), save=True)
            CustomerDocument.objects.filter(pk=doc.pk).update(created_at=rand_dt(200))
            count += 1
        self.stdout.write(f'  customer_documents OK ({count})')

    def seed_leads(self, users, sources, lead_statuses, customers):
        reps = [u for u in users if u.role.name in ('Sales Representative', 'Manager')]
        leads = []
        product_words = ['CRM Platform', 'Network Setup', 'Consulting Package', 'Hardware Bundle',
                         'Software License', 'Annual Support Plan', 'Cloud Migration',
                         'Security Audit', 'Training Program', 'Managed Services']
        for idx in range(1, 51):
            f, l = rand_person()
            company = random.choice(COMPANIES) + (' ' + random.choice(['LLC', 'Group', 'Ltd', '']) ).strip()
            ld = Lead(
                assigned_to=random.choice(reps),
                source=random.choice(sources),
                status=random.choice(lead_statuses),
                company=company, first_name=f, last_name=l,
                email=f'{f.lower()}.{l.lower()}@{slugify_name(company)[:14].strip("-") or "lead"}.com',
                phone=f'+1 {random.randint(200,989)}-{random.randint(200,999)}-{random.randint(1000,9999)}',
                website=f'https://www.{slugify_name(company)[:20].strip("-")}.com',
                expected_revenue=Decimal(random.randint(5, 250)) * Decimal('1000'),
                priority=random.choice(['Low', 'Medium', 'Medium', 'High', 'Urgent']),
                notes=f'Interested in {random.choice(product_words)}.',
            )
            ld.save()
            Lead.objects.filter(pk=ld.pk).update(created_at=rand_dt(180))
            leads.append(ld)
        # convert ~10 leads into existing customers
        for ld in random.sample(leads, 10):
            cust = random.choice(customers)
            Lead.objects.filter(pk=ld.pk).update(converted_customer_id=cust.pk)
        self.stdout.write(f'  leads OK ({len(leads)})')
        return leads

    def seed_lead_activities(self, leads, users):
        acts = ['Created', 'Call Made', 'Email Sent', 'Meeting Scheduled', 'Quote Sent',
                'Follow Up', 'Status Changed', 'Note Added']
        descs = ['Initial outreach completed.', 'Discussed pricing and timeline.',
                 'Sent product brochure and case study.', 'Decision maker identified.',
                 'Waiting for internal approval.', 'Requested demo next week.',
                 'Budget confirmed for this quarter.', 'Competitor comparison requested.']
        rows = [LeadActivity(lead=random.choice(leads), user=random.choice(users),
                             activity=random.choice(acts), description=random.choice(descs),
                             created_at=rand_dt(120)) for _ in range(50)]
        LeadActivity.objects.bulk_create(rows)
        self.stdout.write(f'  lead_activities OK ({len(rows)})')

    def seed_deals(self, customers, leads, users, stages):
        reps = [u for u in users if u.role.name in ('Sales Representative', 'Manager')]
        deals = []
        today = timezone.now().date()
        for idx in range(1, 51):
            stage = random.choices(stages, weights=[15, 15, 15, 15, 20, 10])[0]
            status = {'Won': 'Won', 'Lost': 'Lost'}.get(stage.name, 'Open')
            customer = random.choice(customers)
            d = Deal(
                customer=customer,
                lead=random.choice(leads),
                assigned_to=random.choice(reps),
                stage=stage,
                deal_name=f'{customer.company_name} - {random.choice(["Platform License", "Implementation", "Annual Contract", "Upgrade", "Expansion", "Pilot Project"])}',
                expected_value=Decimal(random.randint(5, 240)) * Decimal('1000'),
                probability={'New': 20, 'Qualified': 40, 'Proposal': 60, 'Negotiation': 75,
                             'Won': 100, 'Lost': 0}[stage.name],
                expected_close_date=today + timedelta(days=random.randint(-120, 90)),
                status=status,
                notes='Standard terms apply.',
            )
            d.save()
            created = rand_dt(150)
            closed_shift = timedelta(days=random.randint(7, 75))
            Deal.objects.filter(pk=d.pk).update(
                created_at=created,
                updated_at=(created + closed_shift) if status != 'Open' else created + timedelta(days=random.randint(1, 20)))
            deals.append(d)
        self.stdout.write(f'  deals OK ({len(deals)})')
        return deals

    def seed_tasks(self, deals, customers, leads, users):
        staff = list(User.objects.filter(status='Active'))
        titles = ['Prepare quotation', 'Follow-up call', 'Send proposal document',
                  'Schedule product demo', 'Contract review', 'Onboarding kickoff',
                  'Collect signed documents', 'Quarterly business review',
                  'Update account information', 'Resolve billing question',
                  'Technical deep-dive session', 'Renewal discussion']
        today = timezone.now().date()
        rows = []
        for i in range(1, 61):
            status = random.choices(['Pending', 'In Progress', 'Completed', 'Cancelled'],
                                    weights=[35, 25, 30, 10])[0]
            due = today + timedelta(days=random.randint(-30, 30))
            t = Task(
                assigned_to=random.choice(staff),
                customer=random.choice(customers) if random.random() < 0.8 else None,
                lead=random.choice(leads) if random.random() < 0.3 else None,
                deal=random.choice(deals) if random.random() < 0.3 else None,
                title=random.choice(titles),
                description='Auto-generated task from CRM seeding.',
                priority=random.choice(['Low', 'Medium', 'Medium', 'High', 'Urgent']),
                status=status,
                due_date=due,
                reminder_date=due - timedelta(days=random.randint(1, 3)),
                completed_at=timezone.now() - timedelta(days=random.randint(0, 20)) if status == 'Completed' else None,
            )
            rows.append(t)
        Task.objects.bulk_create(rows)
        Task.objects.update(updated_at=rand_dt(30))
        self.stdout.write(f'  tasks OK ({len(rows)})')

    def seed_meetings(self, users, customers, leads):
        organizers = list(User.objects.filter(status='Active'))
        today = timezone.now().date()
        rows = []
        for i in range(1, 41):
            start_hour = random.randint(9, 16)
            rows.append(Meeting(
                organizer=random.choice(organizers),
                customer=random.choice(customers) if random.random() < 0.85 else None,
                lead=random.choice(leads) if random.random() < 0.25 else None,
                title=random.choice(['Discovery Call', 'Product Demo', 'Quarterly Review',
                                     'Contract Negotiation', 'Kick-off Meeting', 'Support Review',
                                     'Renewal Discussion', 'Training Session']),
                location=random.choice(['Zoom', 'Google Meet', 'Client Office', 'Head Office Boardroom', 'Phone']),
                meeting_date=today + timedelta(days=random.randint(-45, 45)),
                start_time=f'{start_hour:02d}:00',
                end_time=f'{min(start_hour + 1, 18):02d}:00',
                description='Discuss project scope and next steps.',
                meeting_type=random.choice(['Call', 'Video', 'In Person']),
                status=random.choices(['Scheduled', 'Completed', 'Cancelled'], weights=[55, 35, 10])[0],
            ))
        Meeting.objects.bulk_create(rows)
        att_count = 0
        for m in Meeting.objects.all():
            atts = random.sample(organizers, k=min(len(organizers), random.randint(1, 3)))
            MeetingAttendee.objects.bulk_create(
                [MeetingAttendee(meeting=m, user=u) for u in atts if u.id != (m.organizer_id or 0)])
            att_count += len(atts)
        self.stdout.write(f'  meetings OK ({len(rows)}), attendees OK ({att_count})')

    def seed_products(self, cats):
        catalog = [
            ('Laptop Pro 14"', 'Electronics', 1299.00), ('Laptop Ultra 16"', 'Electronics', 1899.00),
            ('27" 4K Monitor', 'Electronics', 449.00), ('USB-C Docking Station', 'Accessories', 189.00),
            ('Mechanical Keyboard', 'Accessories', 129.00), ('Wireless Mouse Elite', 'Accessories', 79.00),
            ('Noise-Cancel Headset', 'Accessories', 249.00), ('HD Webcam Pro', 'Peripherals', 119.00),
            ('Laser Printer X500', 'Peripherals', 599.00), ('Document Scanner S200', 'Peripherals', 379.00),
            ('Wi-Fi 6 Router', 'Networking', 299.00), ('24-Port Switch', 'Networking', 899.00),
            ('Mesh Wi-Fi System', 'Networking', 499.00), ('VPN Appliance', 'Networking', 1299.00),
            ('CRM Software License', 'Software', 89.00), ('Accounting Software', 'Software', 349.00),
            ('Antivirus Suite', 'Software', 59.00), ('Design Suite Subscription', 'Software', 229.00),
            ('Project Mgmt Tool', 'Software', 149.00), ('Backup Service Cloud', 'Software', 199.00),
            ('Standing Desk', 'Furniture', 649.00), ('Ergonomic Chair', 'Furniture', 429.00),
            ('Conference Table', 'Furniture', 1249.00), ('Filing Cabinet', 'Furniture', 219.00),
            ('Whiteboard XL', 'Furniture', 159.00), ('A4 Paper Ream (Pack 10)', 'Office Supplies', 42.00),
            ('Toner Cartridge Black', 'Office Supplies', 89.00), ('Stapler Heavy Duty', 'Office Supplies', 19.00),
            ('Notebook Pack (5)', 'Office Supplies', 24.00), ('Pen Set Premium', 'Office Supplies', 15.00),
            ('IT Consulting Hour', 'Services', 150.00), ('Staff Training Day', 'Services', 1200.00),
            ('System Integration', 'Services', 4500.00), ('Data Migration Service', 'Services', 2800.00),
            ('Security Audit', 'Services', 3200.00), ('Tablet 11"', 'Electronics', 699.00),
            ('Smartphone X', 'Electronics', 999.00), ('Portable Projector', 'Electronics', 549.00),
            ('External SSD 2TB', 'Electronics', 239.00), ('Graphics Tablet', 'Peripherals', 329.00),
            ('Barcode Scanner', 'Peripherals', 179.00), ('Label Printer', 'Peripherals', 149.00),
            ('Cash Drawer', 'Electronics', 139.00), ('POS Terminal', 'Electronics', 749.00),
            ('Server Rack 12U', 'Networking', 1099.00), ('Patch Panel 48', 'Networking', 159.00),
            ('Ethernet Cable Cat6 (305m)', 'Networking', 189.00), ('Surge Protector', 'Accessories', 39.00),
            ('Monitor Arm Dual', 'Accessories', 129.00), ('Desk Lamp LED', 'Accessories', 49.00),
        ]
        rows = []
        for idx, (name, cat, price) in enumerate(catalog[:50], start=1):
            rows.append(Product(
                category=next((c for c in cats if c.category_name == cat), cats[0]),
                sku=f'PRD-{idx:05d}', product_name=name,
                description=f'High-quality {name.lower()} for business use.',
                unit_price=Decimal(str(price)), tax_rate=Decimal(random.choice(['0', '5', '8', '10', '12'])),
                stock_quantity=random.choice([0, 5, 25, 50, 120, 300]),
                status='Active' if random.random() > 0.08 else 'Inactive',
            ))
        Product.objects.bulk_create(rows)
        Product.objects.update(created_at=rand_dt(400), updated_at=rand_dt(60))
        self.stdout.write(f'  products OK ({len(rows)})')
        return list(Product.objects.all())

    def seed_quotes_and_invoices(self, customers, users, products):
        today = timezone.now().date()
        quotes_created = 0
        invoices_created = 0
        payments_created = 0

        def build_items(parent):
            items, subtotal, tax_total = [], Decimal('0'), Decimal('0')
            for _ in range(random.randint(1, 4)):
                p = random.choice(products)
                qty = Decimal(random.randint(1, 10))
                price = p.unit_price
                rate = p.tax_rate
                line_sub = qty * price
                line_tax = line_sub * rate / Decimal('100')
                disc_rate = Decimal(random.choice(['0', '0', '0', '5', '10']))
                line_disc = line_sub * disc_rate / Decimal('100')
                total = line_sub + line_tax - line_disc
                subtotal += line_sub
                tax_total += line_tax
                fk_field = 'quote' if isinstance(parent, Quote) else 'invoice'
                items.append(QuoteItem(**{fk_field: parent, 'product': p, 'quantity': qty,
                                          'price': price, 'tax': rate, 'discount': disc_rate,
                                          'total': total}) if isinstance(parent, Quote)
                             else InvoiceItem(**{fk_field: parent, 'product': p, 'quantity': qty,
                                                 'price': price, 'tax': rate, 'discount': disc_rate,
                                                 'total': total}))
            return items, subtotal.quantize(Decimal('.01')), tax_total.quantize(Decimal('.01'))

        # ---- Quotes ----
        for i in range(1, 31):
            q = Quote(customer=random.choice(customers), created_by=random.choice(users),
                      quote_number=f'QT-{today.year}-{i:04d}',
                      quote_date=today - timedelta(days=random.randint(10, 200)),
                      expiry_date=today + timedelta(days=random.randint(-30, 60)),
                      status=random.choices(['Draft', 'Sent', 'Accepted', 'Declined', 'Expired'],
                                            weights=[10, 30, 35, 15, 10])[0],
                      notes='Thank you for your business.')
            q.save()
            items, sub, tax = build_items(q)
            QuoteItem.objects.bulk_create(items)
            discount = Decimal(random.choice(['0', '0', '50', '100', '250']))
            Quote.objects.filter(pk=q.pk).update(subtotal=sub, tax=tax, discount=discount,
                                                 total=(sub + tax - discount).quantize(Decimal('.01')),
                                                 created_at=rand_dt(220))
            quotes_created += 1

        # ---- Invoices ----
        accepted_quotes = list(Quote.objects.filter(status='Accepted'))[:15]
        for i in range(1, 41):
            inv_date = today - timedelta(days=random.randint(5, 240))
            inv = Invoice(customer=random.choice(customers),
                          quote=accepted_quotes[i % len(accepted_quotes)] if accepted_quotes and i <= 15 else None,
                          created_by=random.choice(users),
                          invoice_number=f'INV-{inv_date.year}-{i:04d}',
                          invoice_date=inv_date,
                          due_date=inv_date + timedelta(days=random.choice([14, 21, 30])),
                          status=random.choices(['Draft', 'Sent', 'Partial', 'Paid', 'Overdue', 'Cancelled'],
                                                weights=[8, 25, 17, 35, 12, 3])[0],
                          notes='Payment due within stated terms.')
            inv.save()
            items, sub, tax = build_items(inv)
            InvoiceItem.objects.bulk_create(items)
            discount = Decimal(random.choice(['0', '0', '75', '150']))
            total = (sub + tax - discount).quantize(Decimal('.01'))

            paid = Decimal('0')
            if inv.status == 'Paid':
                paid = total
            elif inv.status == 'Partial':
                paid = (total * Decimal(random.choice(['0.3', '0.5', '0.7']))).quantize(Decimal('.01'))
            balance = (total - paid).quantize(Decimal('.01'))
            if inv.status == 'Draft':
                final_status = 'Draft'
            elif inv.status == 'Cancelled':
                final_status = 'Cancelled'
            elif balance <= 0:
                final_status = 'Paid'
            elif inv.due_date and inv.due_date < today:
                final_status = 'Overdue'
            elif paid > 0:
                final_status = 'Partial'
            else:
                final_status = 'Sent'

            Invoice.objects.filter(pk=inv.pk).update(
                subtotal=sub, tax=tax, discount=discount, total=total,
                paid_amount=paid, balance=balance, status=final_status,
                created_at=rand_dt(260))
            invoices_created += 1

            # payments
            if paid > 0:
                remaining = paid
                n_pay = 1 if paid >= total else random.choice([1, 2])
                for pi in range(n_pay):
                    amount = remaining if pi == n_pay - 1 else (paid / 2).quantize(Decimal('.01'))
                    remaining -= amount
                    pay_date = inv_date + timedelta(days=random.randint(1, 25))
                    pay = Payment(invoice=inv, customer=inv.customer,
                                  payment_method=random.choice(['Cash', 'Bank Transfer', 'Credit Card',
                                                                'PayPal', 'Check']),
                                  transaction_reference=f'TXN-{random.randint(100000, 999999)}',
                                  amount=amount, payment_date=pay_date, notes='')
                    pay.save()
                    payments_created += 1

        self.stdout.write(f'  quotes OK ({quotes_created}), invoices OK ({invoices_created}), payments OK ({payments_created})')

    def seed_tickets(self, customers, users, cats):
        agents = [u for u in users if u.role.name in ('Support Staff', 'Admin', 'Manager')]
        subjects = ['Cannot log in to portal', 'Invoice PDF not downloading', 'Request feature: dark mode',
                    'Billing discrepancy on last invoice', 'API returns 500 error', 'Slow dashboard loading',
                    'Password reset link expired', 'Add more team members', 'Export data to Excel fails',
                    'Mobile app crash on startup', 'Change primary contact person', 'Payment method declined',
                    'Integration with email broken', 'Need higher storage quota', 'Report shows wrong totals']
        rows = []
        for i in range(1, 36):
            created = rand_dt(120)
            status = random.choices(['Open', 'In Progress', 'On Hold', 'Closed'], weights=[25, 25, 15, 35])[0]
            rows.append(Ticket(
                customer=random.choice(customers),
                assigned_to=random.choice(agents),
                category=random.choice(cats),
                ticket_number=f'TKT-{i:05d}',
                subject=random.choice(subjects),
                priority=random.choice(['Low', 'Medium', 'Medium', 'High', 'Urgent']),
                status=status,
                description='Customer reported this issue through the support portal.',
                created_at=None,
            ))
        Ticket.objects.bulk_create(rows)
        replies = []
        msg_pool = [
            'Thank you for reaching out. We are investigating this issue.',
            'Could you please share a screenshot of the error?',
            'Our engineering team has deployed a fix. Please verify.',
            'This has been escalated to level 2 support.',
            'We have applied a workaround on our side. Please retry.',
            'Glad to hear the issue is resolved. Closing this ticket.',
            'Your request has been queued for the next release.',
        ]
        for t in Ticket.objects.all():
            for _ in range(random.randint(1, 3)):
                replies.append(TicketReply(ticket=t, user=random.choice(agents),
                                           message=random.choice(msg_pool)))
        TicketReply.objects.bulk_create(replies)
        Ticket.objects.update(updated_at=rand_dt(10))
        self.stdout.write(f'  tickets OK ({len(rows)}), replies OK ({len(replies)})')

    def seed_emails(self, customers, users):
        templates_data = [
            ('Welcome New Customer', 'Welcome to TechNova, {{customer_name}}!',
             'Dear {{contact_name}},\n\nThank you for choosing TechNova Solutions. Your account is ready.\n\nBest regards,\nThe TechNova Team'),
            ('Quotation Follow Up', 'Following up on your quotation {{quote_number}}',
             'Hello {{contact_name}},\n\nI wanted to follow up regarding the quotation we sent. Do you have any questions?\n\nRegards,\n{{sender_name}}'),
            ('Invoice Reminder', 'Invoice {{invoice_number}} - Payment Reminder',
             'Dear Customer,\n\nThis is a friendly reminder that invoice {{invoice_number}} is due on {{due_date}}.\n\nThank you.'),
            ('Meeting Invitation', 'Invitation: {{meeting_title}}',
             'Hi {{contact_name}},\n\nYou are invited to {{meeting_title}} on {{meeting_date}} at {{start_time}}.\n\nPlease confirm availability.'),
            ('Ticket Resolved', 'Your ticket {{ticket_number}} has been resolved',
             'Hello,\n\nYour support ticket {{ticket_number}} has been marked as resolved. Reply within 7 days to reopen.\n\nSupport Team'),
            ('Newsletter - Monthly Updates', 'TechNova Monthly Newsletter',
             'Here are this month highlights: new features, upcoming webinars and customer stories.'),
        ]
        templates = []
        for name, subj, body in templates_data:
            t = EmailTemplate(name=name, subject=subj, body=body)
            t.save()
            EmailTemplate.objects.filter(pk=t.pk).update(created_at=rand_dt(500))
            templates.append(t)
        logs = []
        for _ in range(50):
            c = random.choice(customers)
            tpl = random.choice(templates)
            logs.append(EmailLog(customer=c, user=random.choice(users), template=tpl,
                                 recipient=c.email, subject=tpl.subject,
                                 status=random.choices(['Sent', 'Failed', 'Opened'],
                                                       weights=[70, 10, 20])[0]))
        EmailLog.objects.bulk_create(logs)
        self.stdout.write(f'  email_templates OK ({len(templates)}), email_logs OK ({len(logs)})')

    def seed_notifications(self, users):
        titles_msgs = [
            ('New lead assigned', 'You have been assigned a new lead.', 'info'),
            ('Deal won!', 'Congratulations! A deal was marked as Won.', 'success'),
            ('Task overdue', 'One of your tasks is past its due date.', 'warning'),
            ('Invoice overdue', 'An invoice is overdue for payment.', 'danger'),
            ('New support ticket', 'A new ticket requires attention.', 'info'),
            ('Payment received', 'A payment was recorded against an invoice.', 'success'),
        ]
        rows = []
        for u in users[:20]:
            for _ in range(random.randint(1, 4)):
                title, msg, ntype = random.choice(titles_msgs)
                rows.append(Notification(user=u, title=title, message=msg, type=ntype,
                                         is_read=random.random() < 0.4))
        Notification.objects.bulk_create(rows)
        self.stdout.write(f'  notifications OK ({len(rows)})')

    def seed_logs(self, users):
        acts = [('customers', 'created'), ('customers', 'updated'), ('leads', 'created'),
                ('leads', 'status_changed'), ('deals', 'stage_moved'), ('deals', 'created'),
                ('tasks', 'completed'), ('tasks', 'created'), ('invoices', 'created'),
                ('invoices', 'sent'), ('payments', 'recorded'), ('tickets', 'replied'),
                ('users', 'updated'), ('settings', 'updated'), ('quotes', 'accepted')]
        act_rows = [ActivityLog(user=random.choice(users), module=m, action=a,
                                record_id=random.randint(1, 50),
                                ip_address=f'192.168.1.{random.randint(2, 254)}',
                                user_agent=random.choice([
                                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0',
                                    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4',
                                    'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0'])) 
                    for m, a in [random.choice(acts) for _ in range(100)]]
        ActivityLog.objects.bulk_create(act_rows)
        ActivityLog.objects.update(created_at=rand_dt(60))

        browsers = ['Chrome 126', 'Firefox 127', 'Safari 17.4', 'Edge 126']
        oss = ['Windows 11', 'macOS Sonoma', 'Ubuntu 24.04', 'iOS 17', 'Android 14']
        login_rows = []
        for _ in range(100):
            u = random.choice(users)
            lt = rand_dt(90)
            login_rows.append(LoginLog(user=u, logout_time=lt + timedelta(minutes=random.randint(5, 480)),
                                       ip_address=f'112.198.{random.randint(0,255)}.{random.randint(2,254)}',
                                       browser=random.choice(browsers), operating_system=random.choice(oss)))
        LoginLog.objects.bulk_create(login_rows)
        # pair login/logout times consistently
        for row in login_rows:
            lt = rand_dt(90)
            LoginLog.objects.filter(pk=row.pk).update(
                login_time=lt,
                logout_time=lt + timedelta(minutes=random.randint(5, 480)))

        tables = ['customers', 'leads', 'deals', 'invoices', 'users', 'settings', 'products']
        audit_rows = []
        for _ in range(50):
            tbl = random.choice(tables)
            rid = random.randint(1, 50)
            new_vals = {'id': rid, 'status': random.choice(['Active', 'Updated', 'Approved']), 'note': 'seed audit entry'}
            old_vals = None if random.random() < 0.5 else {'id': rid, 'status': 'Previous'}
            audit_rows.append(AuditLog(user=random.choice(users), table_name=tbl, record_id=rid,
                                       action=random.choice(['CREATE', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT']),
                                       old_values=old_vals, new_values=new_vals,
                                       ip_address=f'192.168.1.{random.randint(2, 254)}'))
        AuditLog.objects.bulk_create(audit_rows)
        AuditLog.objects.update(created_at=rand_dt(90))
        self.stdout.write(f'  activity_logs OK (100), login_logs OK (100), audit_logs OK (50)')

    def seed_notes(self, customers, leads, deals, users):
        note_texts = [
            'Customer prefers afternoon calls.',
            'Decision maker will be on leave next week.',
            'Asked for a revised proposal with volume discounts.',
            'Budget approved for Q3 implementation.',
            'Competitor evaluation in progress - emphasize support SLAs.',
            'Renewal likely; consider multi-year offer.',
            'Requires SOC2 documentation before signing.',
            'Very satisfied with onboarding experience so far.',
            'Escalated billing concern resolved amicably.',
            'Interested in add-on training packages.',
        ]
        rows = []
        for _ in range(50):
            kind = random.choices(['customer', 'lead', 'deal'], weights=[70, 20, 10])[0]
            rows.append(Note(
                customer=random.choice(customers) if kind == 'customer' else None,
                lead=random.choice(leads) if kind == 'lead' else None,
                deal=random.choice(deals) if kind == 'deal' else None,
                user=random.choice(users), note=random.choice(note_texts)))
        Note.objects.bulk_create(rows)
        Note.objects.update(created_at=rand_dt(180))
        self.stdout.write(f'  notes OK ({len(rows)})')

    def seed_attachments(self, users):
        files = [('Q3_Report.pdf', 'application/pdf'), ('Presentation_Deck.pptx',
                 'application/vnd.openxmlformats-officedocument.presentationml.presentation'),
                 ('Budget_Sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
                 ('Signed_Contract.pdf', 'application/pdf'), ('Logo_Assets.zip', 'application/zip')]
        modules = ['customer', 'lead', 'deal', 'task', 'ticket', 'general']
        count = 0
        for _ in range(30):
            fname, mime = random.choice(files)
            content = b'CRM seeded attachment\n' + os.urandom(random.randint(1024, 8192))
            att = Attachment(user=random.choice(users), module=random.choice(modules),
                             record_id=random.randint(1, 50), file_name=fname,
                             file_type=mime, file_size=len(content))
            att.file_path.save(fname, ContentFile(content), save=True)
            Attachment.objects.filter(pk=att.pk).update(created_at=rand_dt(150))
            count += 1
        self.stdout.write(f'  attachments OK ({count})')
