from django.contrib.syndication.views import Feed
from blog.models import *
from django.conf import settings
from itertools import chain
from django.utils.feedgenerator import Atom1Feed
import datetime
import smartypants
import pprint

class LatestEntriesFeed(Feed):
    domain = 'andrewramos.com'
    title = 'AndrewRamos.com'
    link = 'http://feeds.feedburner.com/andrewramos'
    description = 'The blog of Andrew Ramos'
    feed_type = Atom1Feed

    author_name = 'Andrew Ramos'
    author_link = 'http://andrewramos.com/'

    def feed_copyright(self):
        now = datetime.datetime.now()
        return 'Copyright &copy; %s Andrew Ramos' % now.year

    def items(self):
        articles = Article.objects.filter(status='p').all().order_by("-date_published")
        case_studies = CaseStudy.objects.filter(status='p').all().order_by("-date_published")
        short_posts = ShortPost.objects.filter(status='p').all().order_by("-date_published")
        quotes = Quote.objects.filter(status='p').all().order_by("-date_published")

        results = chain(
            articles,
            case_studies,
            short_posts,
            quotes,
        )

        return sorted(results, key=lambda x: x.date_published, reverse=True)

    def item_title(self, item):
        return smartypants.smartyPants(item.title)

    def item_description(self, item):
        content = []
        if item._meta.verbose_name == "article":
            for image in item.images.all():
                content.append('<p><img src="%s%s"></p>' % ('http://media.andrewramos.com/', image.image))
            content.append(smartypants.smartyPants(item.content))
            return "".join(content)
        elif item._meta.verbose_name == "short post":
            if item.link:
                return "%s <a href='%s'>%s</a>" % (smartypants.smartyPants(item.content),item.link,item.link,)
            else:
                return smartypants.smartyPants(item.content)
        elif item._meta.verbose_name == "quote":
            if item.author:
                return "%s <p><em>&mdash; %s</em></p>" % (smartypants.smartyPants(item.content),item.author)
            else:
                return "%s" % smartypants.smartyPants(item.content)
        elif item._meta.verbose_name == "case study":
            return smartypants.smartyPants(item.content)
        else:
            return "Error: blog post type not supported!"

    def item_pubdate(self, item):
        return item.date_published