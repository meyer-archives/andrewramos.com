import os.path
import sys

PROJECT_ROOT = os.path.realpath(os.path.dirname(__file__))
sys.path.insert(0, os.path.join(PROJECT_ROOT, "apps"))

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
	('Michael Meyer', '[REDACTED]'),
)

MANAGERS = ADMINS

DATABASES = {
	'default': {
		'ENGINE':	 'django.db.backends.postgresql_psycopg2',
		'NAME':		   'andrewramos',
		'USER':		   'andrewramos',
		'PASSWORD':	   'andrewramos',
		'HOST':		   'localhost',
		'PORT':		   '5432',
	}
}

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = True
USE_L10N = True

FIXTURE_DIRS = (
	os.path.join(PROJECT_ROOT, "fixtures"),
)

MEDIA_ROOT = os.path.join(PROJECT_ROOT, "media")
STATIC_ROOT = os.path.join(PROJECT_ROOT, "static")

MEDIA_URL = 'http://andrewramos.s3.amazonaws.com/'
STATIC_URL = 'http://andrewramos.s3.amazonaws.com/'

ADMIN_MEDIA_PREFIX = 'http://andrewramos.s3.amazonaws.com/admin/'

SECRET_KEY = '[REDACTED]'

TEMPLATE_LOADERS = (
	'django.template.loaders.filesystem.Loader',
	'django.template.loaders.app_directories.Loader',
)

TEMPLATE_CONTEXT_PROCESSORS = (
	"django.core.context_processors.auth",
	"django.core.context_processors.request",
	"django.core.context_processors.media",
)

MIDDLEWARE_CLASSES = (
	'django.middleware.cache.UpdateCacheMiddleware',
	'django.middleware.common.CommonMiddleware',
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.auth.backends.RemoteUserBackend',
	'django.contrib.messages.middleware.MessageMiddleware',
	'mobile.middleware.MobileMiddleware',
	'pagination.middleware.PaginationMiddleware',
	'django.middleware.cache.FetchFromCacheMiddleware',
)

ROOT_URLCONF = 'urls'

MOBILE_TEMPLATE_DIRS = (
	os.path.join(PROJECT_ROOT, "templates_mobile"),
	os.path.join(PROJECT_ROOT, "templates"),
)

SITE_TEMPLATE_DIRS = (
	os.path.join(PROJECT_ROOT, "templates"),
)

TEMPLATE_DIRS = SITE_TEMPLATE_DIRS

INSTALLED_APPS = (
	'django.contrib.auth',
	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.sites',
	'django.contrib.messages',
	'django.contrib.admin',
	'django.contrib.admindocs',
	'django.contrib.markup',
	# 'rpc4django',
	'south',
	'taggit',
	'shorturls',
	'typogrify',
	'django_extensions',
	'haystack',
	'pagination',
	'fabtastic',
	'athumb',
	'mediasync',

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

DJANGO_STATIC_CLOSURE_COMPILER = 'closure --warning_level QUIET --third_party'
DJANGO_STATIC_YUI_COMPRESSOR = 'yuicompressor'

MEDIASYNC = {
	'BACKEND': 'mediasync.backends.s3',
	'AWS_KEY': AWS_ACCESS_KEY_ID,
	'AWS_SECRET': AWS_SECRET_ACCESS_KEY,
	'AWS_BUCKET': 'media.andrewramos.com',
	'SERVE_REMOTE': True,
	'EMULATE_COMBO': False,
	'DOCTYPE': 'html5',
	'EXPIRATION_DAYS': 365 * 10,
	'AWS_BUCKET_CNAME': False,
	'CSS_PATH': 'css',
	'JS_PATH': 'js',
	'JOINED': {
		'all.css': [
			 'style.css',
		],
		'all.js': [
			'jquery-1.6.1.js',
			'site.js',
		],
	},
	'PROCESSORS': (
		'utils.mediasync_processors.css_minifier',
		'utils.mediasync_processors.js_minifier',
	),
}

# models with shortened URLs
SHORTEN_MODELS = {
	'a': 'blog.article',
	'c': 'blog.casestudy',
	's': 'blog.shortpost',
	'q': 'blog.quote',
}

HAYSTACK_CONNECTIONS = {
	'default': {
		'ENGINE': 'haystack.backends.solr_backend.SolrEngine',
		'URL': 'http://localhost:8983/solr/core0',
		'TIMEOUT': 60 * 5,
		'INCLUDE_SPELLING': True,
	},
}

HAYSTACK_CONNECTIONS = {
	'default': {
		'ENGINE': 'haystack.backends.solr_backend.SolrEngine',
		'URL': 'http://localhost:8983/solr/core0',
		'TIMEOUT': 60 * 5,
		'INCLUDE_SPELLING': True,
	},
}

MEDIA_CACHE_BUSTER = '1'

try:
	from local_settings import *
except ImportError:
	pass