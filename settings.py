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
		'ENGINE':	'django.db.backends.postgresql_psycopg2',
		'NAME':		'andrewramos',
		'USER':		'webdev',
		'PASSWORD':	'password',
		'HOST':		'localhost',
		'PORT':		'5432',
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

MEDIA_URL = '/media/'

ADMIN_MEDIA_PREFIX = '/media/admin/'

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
	'django.middleware.common.CommonMiddleware',
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.auth.backends.RemoteUserBackend',
	'django.contrib.messages.middleware.MessageMiddleware',
#	'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
	'mobile.middleware.MobileMiddleware',
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
#	'django.contrib.flatpages',
	'django.contrib.messages',
	'django.contrib.admin',
	'django.contrib.admindocs',
	'south',
	'easy_thumbnails',
	'tagging',
	'django_wysiwyg',
	'shorturls',
	'annoying',
	'typogrify',
	'django_extensions',

	# My apps
	'utils',
	'blog',
	'portfolio',
	'contact_form',
	'pages',
)

# models with shortened URLs
SHORTEN_MODELS = {
	'a': 'blog.article',
	'c': 'blog.casestudy',
	's': 'blog.shortpost',
	'q': 'blog.quote',
}

try:
	from settings_local import *
except ImportError:
	pass