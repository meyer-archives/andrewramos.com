from __future__ import with_statement
import os

from django.core import management
import settings
management.setup_environ(settings)

from fabric.api import *

def update_db():
	local('gondor sqldump primary -- | psql -U andrewramos -d andrewramos')

def deploy():
	local('gondor deploy primary master')