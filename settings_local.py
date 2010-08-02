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

MEDIA_URL = 'http://armedia'
ADMIN_MEDIA_PREFIX = 'http://armedia/admin/'