import os.path
import sys

PROJECT_PATH = os.path.dirname(os.path.abspath(os.path.split(__file__)[0]))
sys.path.insert(0, os.path.join(PROJECT_PATH, "apps"))

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
	('Michael Meyer', '[REDACTED]'),
)

MANAGERS = ADMINS

DATABASES = {
	'default': {
		'ENGINE':   'django.db.backends.postgresql_psycopg2',
		'NAME':     'andrewramos',
		'USER':     'andrewramos',
		'PASSWORD': 'andrewramos',
		'HOST':     'localhost',
		'PORT':     '5432',
	}
}

ALLOWED_HOSTS = []

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = True

USE_L10N = True
USE_TZ = True

MEDIA_ROOT = os.path.join(PROJECT_PATH, "media")
STATIC_ROOT = os.path.join(PROJECT_PATH, "static")

MEDIA_URL = '/media/'
STATIC_URL = '/static/'

STATICFILES_DIRS = ()

STATICFILES_FINDERS = (
	'django.contrib.staticfiles.finders.FileSystemFinder',
	'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

SECRET_KEY = '[REDACTED]'

TEMPLATE_LOADERS = (
	'django.template.loaders.filesystem.Loader',
	'django.template.loaders.app_directories.Loader',
)

TEMPLATE_CONTEXT_PROCESSORS = (
	'django.core.context_processors.static',
	'django.core.context_processors.debug',
	'django.core.context_processors.i18n',
	'django.core.context_processors.media',

	'django.middleware.common.CommonMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',

	'django.contrib.sessions.middleware.SessionMiddleware',
	# 'django.contrib.messages.middleware.MessageMiddleware',

	'django.contrib.auth.context_processors.auth',
	# 'django.contrib.messages.context_processors.messages',
)

MIDDLEWARE_CLASSES = (
	'django.middleware.common.CommonMiddleware',
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.messages.middleware.MessageMiddleware',
	'pagination.middleware.PaginationMiddleware',
)

ROOT_URLCONF = 'project.urls'

WSGI_APPLICATION = 'project.wsgi.application'

TEMPLATE_DIRS = (
	os.path.join(PROJECT_PATH, "templates"),
)

INSTALLED_APPS = (
	'django.contrib.auth',
	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.sites',
	'django.contrib.messages',
	'django.contrib.admin',
	'django.contrib.admindocs',
	'django.contrib.markup',
	'django.contrib.staticfiles',

	# Third-party
	'south',
	'taggit',
	'shorturls',
	'typogrify',
	'django_extensions',
	'pagination',
	'fabtastic',
	'athumb',

	# My apps
	'utils',
	'blog',
	'portfolio',
	'content',
)

DEFAULT_FILE_STORAGE = 'athumb.backends.s3boto.S3BotoStorage_AllPublic'

AWS_ACCESS_KEY_ID = '[REDACTED]'
AWS_SECRET_ACCESS_KEY = '[REDACTED]'
AWS_STORAGE_BUCKET_NAME = 'media.andrewramos.com'

SHORTEN_MODELS = {
	'a': 'blog.article',
	'c': 'blog.casestudy',
	's': 'blog.shortpost',
	'q': 'blog.quote',
}

MEDIA_CACHE_BUSTER = ''

try:
	from settings_local import *
except ImportError:
	pass