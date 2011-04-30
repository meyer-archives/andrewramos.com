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
		'NAME':		   'ramos_db',
		'USER':		   'ramos_pg',
		'PASSWORD':	   '[REDACTED]',
		'HOST':		   'localhost',
		'PORT':		   '5432',
	}
}

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = True
USE_L10N = True

MEDIA_ROOT = os.path.join(PROJECT_ROOT, "media")

FIXTURE_DIRS = (
	os.path.join(PROJECT_ROOT, "fixtures"),
)

MEDIA_URL = 'http://andrewramos.com/media/'

ADMIN_MEDIA_PREFIX = 'http://andrewramos.com/media/admin/'

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

ROOT_URLCONF = 'andrewramos.urls'

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
	'rpc4django',
	'south',
	'easy_thumbnails',
	'taggit',
	'shorturls',
	'typogrify',
	'django_extensions',
	'haystack',
	'memcache_status',
	'pagination',
	'fabtastic',

	# My apps
	'utils',
	'blog',
	'portfolio',
	'content',
)

# models with shortened URLs
SHORTEN_MODELS = {
	'a': 'blog.article',
	'c': 'blog.casestudy',
	's': 'blog.shortpost',
	'q': 'blog.quote',
}

THUMBNAIL_PREFIX = "r_"
THUMBNAIL_BASEDIR = 'resized'
THUMBNAIL_EXTENSION = 'png'

#HAYSTACK_SEARCH_ENGINE = 'whoosh'
#HAYSTACK_WHOOSH_PATH = os.path.join(PROJECT_ROOT, 'search_index')
HAYSTACK_SITECONF = 'search_sites'
HAYSTACK_XAPIAN_PATH = os.path.join(PROJECT_ROOT, 'xapian_index')
HAYSTACK_SEARCH_ENGINE = 'xapian'

CACHE_BACKEND = 'memcached://127.0.0.1:11211/'

try:
	from settings_local import *
except ImportError:
	pass
