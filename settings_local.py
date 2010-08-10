DATABASES = {
	'default': {
		'ENGINE':	'django.db.backends.sqlite3',
		'NAME':		'data.db',
		'USER':		'',
		'PASSWORD':	'',
		'HOST':		'',
		'PORT':		'',
	}
}

# DATABASES = {
# 	'default': {
# 		'ENGINE':	'django.db.backends.postgresql_psycopg2',
# 		'NAME':		'sierrajava',
# 		'USER':		'dbuser',
# 		'PASSWORD':	'dbpass',
# 		'HOST':		'localhost',
# 		'PORT':		'5432',
# 	}
# }

MEDIA_URL = 'http://hotsauce.local:9007/'
ADMIN_MEDIA_PREFIX = 'http://hotsauce.local:9007/admin/'

DEBUG = True
TEMPLATE_DEBUG = DEBUG