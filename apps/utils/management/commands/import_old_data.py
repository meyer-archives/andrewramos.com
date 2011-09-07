import os, sys

from django.core.management.base import BaseCommand, CommandError
from django.db.models import signals
from django.db import connection, transaction
from django.conf import settings

class Command(BaseCommand):
	args = ''
	help = 'Imports data from db.sql'

	def handle(self, *args, **options):
		custom_file = os.path.join(settings.PROJECT_ROOT, "db.sql")

		fp = open(custom_file, 'U')
		cursor = connection.cursor()

		try:
			cursor.execute(fp.read().decode(settings.FILE_CHARSET))
		except Exception, e:
			sys.stderr.write("Couldn't execute custom SQL")
			import traceback
			traceback.print_exc()
			transaction.rollback_unless_managed()
		else:
			transaction.commit_unless_managed()

# def load_customized_sql(app, created_models, verbosity=2, **kwargs):