from django.conf.urls.defaults import *

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	(r'^portfolio/', include('portfolio.urls')),
	(r'^blog/', include('blog.urls')),
#	(r'^blog/', include('basic.blog.urls')),
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),
    (r'^admin/', include(admin.site.urls)),
	(r'^xmlrpc.php$', 'rpc4django.views.serve_rpc_request'),
)
