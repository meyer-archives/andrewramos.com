from django.conf.urls.defaults import *
from portfolio.views import portfolio_home, portfolio_single

urlpatterns = patterns('portfolio.views',
    url(r'^$', portfolio_home, name='portfolio-home'),
    url(r'^(?P<project_slug>[\w-]+)/$', portfolio_single),
)