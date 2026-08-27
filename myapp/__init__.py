import pymysql

# Emulate mysqlclient so Django's version check passes
pymysql.install_as_MySQLdb()
pymysql.version_info = (2, 2, 8, "final", 0)
pymysql.VERSION = (2, 2, 8, "final", 0)
pymysql.__version__ = "2.2.8"

# Allow Django to run against MySQL 5.7 (MAMP)
from django.db.backends.base import base as _db_base
_db_base.BaseDatabaseWrapper.check_database_version_supported = lambda self: None
