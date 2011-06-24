import os.path
import sys

PROJECT_ROOT = os.path.realpath(os.path.dirname(__file__))
sys.path.insert(0, os.path.join(PROJECT_ROOT, "apps"))

DEBUG = False
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
STATIC_ROOT = os.path.join(PROJECT_ROOT, "static_cache")

MEDIA_URL = 'http://andrewramos.s3.amazonaws.com/media/'
STATIC_URL = 'http://andrewramos.s3.amazonaws.com/static/'

ADMIN_MEDIA_PREFIX = 'http://andrewramos.s3.amazonaws.com/static/admin/'

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
#	 'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
	'mobile.middleware.MobileMiddleware',
	'pagination.middleware.PaginationMiddleware',
	'django.middleware.cache.FetchFromCacheMiddleware',
)

URL_FILEBROWSER_MEDIA = MEDIA_URL + 'filebrowser/'

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
	'easy_thumbnails',
	'taggit',
	'shorturls',
	'typogrify',
	'django_extensions',
	# 'haystack',
	# 'memcache_status',
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
AWS_STORAGE_BUCKET_NAME = 'andrewramos'

# models with shortened URLs
SHORTEN_MODELS = {
	'a': 'blog.article',
	'c': 'blog.casestudy',
	's': 'blog.shortpost',
	'q': 'blog.quote',
}

# HAYSTACK_SEARCH_ENGINE = 'whoosh'
# HAYSTACK_WHOOSH_PATH = os.path.join(PROJECT_ROOT, 'search_index')
# HAYSTACK_SITECONF = 'search_sites'
# HAYSTACK_XAPIAN_PATH = os.path.join(PROJECT_ROOT, 'xapian_index')
# HAYSTACK_SEARCH_ENGINE = 'xapian'

# CACHES = {
# 	'default': {
# 		'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
# 		'LOCATION': '127.0.0.1:11211',
# 	}
# }

try:
	from local_settings import *
except ImportError:
	pass