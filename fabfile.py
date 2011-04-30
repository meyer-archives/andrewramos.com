from __future__ import with_statement
import os

from django.core import management
import settings
management.setup_environ(settings)

from fabric.api import *
# This will import every command, you may need to get more selective if
# you aren't using all of the stuff we do.
# For example:
#from fabtastic.fabric.commands.c_common import *
#from fabtastic.fabric.commands.c_git import git_pull
from fabtastic.fabric.commands import *
from fabtastic.fabric.commands.c_gunicorn import gunicorn_restart_workers

"""
Here are some deployment related settings. These can be pulled from your
settings.py if you'd prefer. We keep strictly deployment-related stuff in
our fabfile.py, but you don't have to.
"""

env.REMOTE_CODEBASE_PATH = '/www/django/andrewramos'
env.PIP_REQUIREMENTS_PATH = 'requirements.txt'
env.REMOTE_VIRTUALENV_NAME = 'looklab'

env.GUNICORN_PID_PATH = os.path.join('/www/', 'gunicorn.pid')

def dev():
	"""
	Sets env.hosts to the sole staging server. No roledefs means that all
	deployment tasks get ran on every member of env.hosts.
	"""
	env.hosts = ['webdev@andrewramos.com:8675']

def update_db():
	run('cd /www/django/looklab/ && workon looklab && ./manage.py ft_dump_db db_latest.bz2')
	get('/www/django/looklab/db_latest.bz2','db_latest.bz2')
	local('./manage.py ft_restore_db db_latest.bz2')

def deploy():
	"""
	Full git deployment. Migrations, reloading gunicorn.
	"""
	git_pull()
	south_migrate()
#	 gunicorn_restart_workers()
	sudo('/etc/init.d/supervisord restart')
#	flush_cache()
#	 local('./manage.py syncmedia')
#	 mediasync_syncmedia()

def deploy_soft():
	"""
	Just checkout the latest source, don't reload.
	"""
	git_pull()
	print("--- Soft Deployment complete. ---")