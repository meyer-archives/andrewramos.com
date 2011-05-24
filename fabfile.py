from __future__ import with_statement
import os

from django.core import management
import project.settings
management.setup_environ(project.settings)

from fabric.api import *

def update_db():
	local('gondor sqldump primary -- | psql -U andrewramos -d andrewramos')

def deploy():
	local('gondor deploy primary master')

def crunch_media():
	# Clear media directories
	local('rm -rf %s/media/' % project.settings.WEB_ROOT)
	# local('rm -rf %s/-/' % project.settings.WEB_ROOT)

	# Collect and crunch files
	local('./manage.py collectstatic --noinput')
	local('./manage.py compress --force')

	# Copy media to deploy folder
	local('cp -R ./media/ %s/media/' % project.settings.WEB_ROOT)
	# local('cp -R ./-/ %s/-/' % project.settings.WEB_ROOT)