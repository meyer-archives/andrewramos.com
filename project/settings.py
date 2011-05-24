import os
import sys

PROJECT_PATH = os.path.dirname(os.path.abspath(os.path.split(__file__)[0]))
sys.path.insert(0, os.path.join(PROJECT_PATH, "apps"))

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ADMINS = (
	('Michael Meyer', '[REDACTED]'),
)

MANAGERS = ADMINS

DATABASES = {
	'default': {
		'ENGINE': 'django.db.backends.postgresql_psycopg2',
		'NAME': 'andrewramos',
		'USER': 'andrewramos',
		'PASSWORD': 'andrewramos',
		'HOST': 'localhost',
		'PORT': '5432',
	}
}

ALLOWED_HOSTS = ['localhost','andrewramos.com',]

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = True

USE_L10N = True
USE_TZ = True

MEDIA_ROOT = os.path.join(PROJECT_PATH, "media")
STATIC_ROOT = os.path.join(PROJECT_PATH, "deploy_to_s3/-")

MEDIA_URL = 'http://localhost:8888/media/'
STATIC_URL = 'http://localhost:8888/-/'

MEDIA_URL = '/media/'
STATIC_URL = '/-/'

STATICFILES_DIRS = (
	os.path.join(PROJECT_PATH, "static"),
)

STATICFILES_FINDERS = (
	'django.contrib.staticfiles.finders.FileSystemFinder',
	'django.contrib.staticfiles.finders.AppDirectoriesFinder',
	'compressor.finders.CompressorFinder',
)

# STATICFILES_STORAGE = ''

SECRET_KEY = '[REDACTED]'

TEMPLATE_LOADERS = (
	'django.template.loaders.filesystem.Loader',
	'django.template.loaders.app_directories.Loader',
)

TEMPLATE_CONTEXT_PROCESSORS = (
	# 'django.core.context_processors.static',
	'django.core.context_processors.debug',
	'django.core.context_processors.i18n',
	'django.core.context_processors.media',

	'django.core.context_processors.request',

	'django.contrib.auth.context_processors.auth',
	'django.contrib.messages.context_processors.messages',

	'django.core.context_processors.static',
)

MIDDLEWARE_CLASSES = (
	'django.middleware.common.CommonMiddleware',
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.messages.middleware.MessageMiddleware',
	'pagination.middleware.PaginationMiddleware',
	'staticgenerator.middleware.StaticGeneratorMiddleware',
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
	# 'athumb',
	'staticgenerator',
	'compressor',

	# My apps
	'utils',
	'blog',
	'portfolio',
	'content',
)

# DEFAULT_FILE_STORAGE = 'athumb.backends.s3boto.S3BotoStorage_AllPublic'

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

STATIC_GENERATOR_URLS = (
	r'^/$',
	r'^/blog',
	r'^/about',
	r'^/portfolio',
	r'^/error.html$',
)

WEB_ROOT = os.path.join(PROJECT_PATH, "deploy_to_s3")

COMPRESS_CSS_FILTERS = ('compressor.filters.css_default.CssAbsoluteFilter', 'compressor.filters.yui.YUICSSFilter',)
COMPRESS_JS_FILTERS = ('compressor.filters.closure.ClosureCompilerFilter',)

COMPRESS_YUI_BINARY = 'yuicompressor'
COMPRESS_CLOSURE_COMPILER_BINARY = 'closure-compiler'

COMPRESS_OUTPUT_DIR = ''

try:
	from settings_local import *
except ImportError:
	pass