# CRM — Django Application

A custom CRM built with Django 6.1 (customers, leads, pipelines, tasks, meetings, quotes/invoices, tickets, email, reports, and admin).

## Requirements

- Python 3.12+
- MySQL 5.7+ / 8.x (running on port `8889` — e.g., MAMP default)

## 0. Set Up the Virtual Environment

Create and activate a virtual environment from the project root (the folder containing `manage.py`):

```bash
python3 -m venv venv
source venv/bin/activate        # macOS/Linux
# venv\Scripts\activate         # Windows
source venv/bin/activate && python3 manage.py runserver
```

> The venv only needs to be created once. Activate it in every new terminal session before running any `python`/`pip`/`manage.py` commands below.

With the venv active, install the dependencies (`django`, `pymysql`, `Pillow`):

```bash
pip install django pymysql pillow
```

To leave the virtual environment:

```bash
deactivate
```

## 1. Configure the Database

Settings live in `myapp/settings.py`. Defaults are:

| Setting   | Value          |
|-----------|----------------|
| ENGINE    | mysql          |
| NAME      | `CRM_djangodb` |
| USER      | `root`         |
| PASSWORD  | `root`         |
| HOST      | `127.0.0.1`    |
| PORT      | `8889`         |

Create the database (UTF-8 required):

```sql
CREATE DATABASE CRM_djangodb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

> If your MySQL credentials differ, edit the `DATABASES` block in `myapp/settings.py`.

## 2. Apply Migrations & Seed Demo Data

Run from the project root (the folder containing `manage.py`):

```bash
python3 manage.py migrate
python3 manage.py seed_data        # optional: fills the DB with demo data
```

The seeder creates a login for every user with password `Admin@123`, including:

| Username | Role        |
|----------|-------------|
| `admin`  | Super Admin |

(You can also create your own superuser with `python3 manage.py createsuperuser`.)

## 3. Run the Development Server

```bash
python3 manage.py runserver
```

Then open <http://127.0.0.1:8000/> and log in (`admin` / `Admin@123`).

## Notes

- **Media uploads** (e.g., profile avatars) are saved to `media/` and served automatically when `DEBUG = True`.
- **Email** uses the console backend in development — outgoing mail is printed to the runserver terminal instead of being sent. Update `EMAIL_BACKEND` in `myapp/settings.py` for real SMTP delivery.
- **Static files**: collected to `staticfiles/` with `python3 manage.py collectstatic` when deploying.


<img src="https://raw.githubusercontent.com/cai-ro-coders/-CRM-Customer-Relationship-Management-system-Using-Python-Django-MySQL-Complete-Project/refs/heads/main/1.png" alt="Cairocoders Ednalan">
<img src="https://raw.githubusercontent.com/cai-ro-coders/-CRM-Customer-Relationship-Management-system-Using-Python-Django-MySQL-Complete-Project/refs/heads/main/2.png" alt="Cairocoders Ednalan">
