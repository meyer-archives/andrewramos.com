from django.conf.urls.defaults import *
from blog.views import index, archives, article_single, shortpost_single, casestudy_single, quote_single, tagged_posts
from blog.feeds import LatestEntriesFeed
from django.views.decorators.cache import cache_page

urlpatterns = patterns('blog.views',
    url(r'^$', index, name='blog_home'),
    url(r'^archives/$', cache_page(archives,60*15), name='blog_archives'),
    url(r'^article/(?P<post_slug>[\w-]+)/$', cache_page(article_single, 60*15), name='article_single'),
    url(r'^short-post/(?P<post_slug>[\w-]+)/$', cache_page(shortpost_single, 60*15), name='shortpost_single'),
    url(r'^case-study/(?P<post_slug>[\w-]+)/$', cache_page(casestudy_single,60*15), name='casestudy_single'),
    url(r'^quote/(?P<post_slug>[\w-]+)/$', cache_page(quote_single,60*15), name='quote_single'),
    url(r'^feed/$', LatestEntriesFeed(),name="rss-feed"),
    url(r'^tags/(?P<slug>[\w-]+)/$', cache_page(tagged_posts,60*15), name='tagged_posts'),
)