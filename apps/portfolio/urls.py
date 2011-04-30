from django.conf.urls.defaults import *
from portfolio.views import portfolio_home, portfolio_single
from django.views.decorators.cache import cache_page

urlpatterns = patterns('portfolio.views',
    url(r'^$', cache_page(portfolio_home,60*15), name='portfolio_home'),
    url(r'^(?P<project_slug>[\w-]+)/$', cache_page(portfolio_single,60*15), name='portfolio_single'),
)