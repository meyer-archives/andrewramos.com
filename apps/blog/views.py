from django.shortcuts import get_object_or_404
from django.http import Http404
from blog.models import *
from itertools import chain
from utils.decorators import render_to
from django.contrib.contenttypes.models import ContentType
from taggit.models import Tag, TaggedItem
from utils.qschain import QuerySetChain

@render_to('blog/index_blog.html')
def index(request):
    a = Article.objects.filter(status='p').select_related('content_type').all().order_by("-date_published")
    c = CaseStudy.objects.filter(status='p').select_related('content_type').all().order_by("-date_published")
    s = ShortPost.objects.filter(status='p').all().order_by("-date_published")
    q = Quote.objects.filter(status='p').all().order_by("-date_published")

    acsq = QuerySetChain(a,c,s,q)

    return { 'entries': acsq }

    results = chain(
        articles,
        case_studies,
        short_posts,
        quotes,
    )

    return { "entries": sorted(results, key=lambda x: x.date_published, reverse=True) }

@render_to('blog/tagged_posts.html')
def tagged_posts(request, slug):
    unslug = slug.replace('-', ' ')
    tag = get_object_or_404(Tag, name=unslug)

    a = TaggedItem.objects.get_by_model(Article.objects.filter(status='p'), tag)
    c = TaggedItem.objects.get_by_model(CaseStudy.objects.filter(status='p'), tag)
    s = TaggedItem.objects.get_by_model(ShortPost.objects.filter(status='p'), tag)
    q = TaggedItem.objects.get_by_model(Quote.objects.filter(status='p'), tag)

    return { 'entries': QuerySetChain(a,c,s,q), 'tag': unslug, }

    results = chain(
        articles,
        case_studies,
        short_posts,
        quotes,
    )

    return {
        "entries": sorted(results, key=lambda x: x.date_published, reverse=True),
        "tag": unslug,
    }

@render_to('blog/index_archives.html')
def archives(request):
    articles = Article.objects.filter(status='p').select_related('content_type').all().order_by("-date_published")
    case_studies = CaseStudy.objects.filter(status='p').select_related('content_type').all().order_by("-date_published")
    short_posts = ShortPost.objects.filter(status='p').all().order_by("-date_published")
    quotes = Quote.objects.filter(status='p').all().order_by("-date_published")

    results = chain(
        articles,
        case_studies,
        short_posts,
        quotes,
    )

    return { "entries": sorted(results, key=lambda x: x.date_published, reverse=True) }

@render_to('blog/blog_single.html')
def article_single(request, post_slug):
    entry = get_object_or_404(Article.objects.select_related('content_type'), slug=post_slug)
    if entry.status == 'd' and not request.user.is_authenticated():
        raise Http404
    else:
        return {'entry': entry}

@render_to('blog/blog_single.html')
def casestudy_single(request, post_slug):
    entry = get_object_or_404(CaseStudy.objects.select_related('content_type'), slug=post_slug)
    if entry.status == 'd' and not request.user.is_authenticated():
        raise Http404
    else:
        return {'entry': entry}

@render_to('blog/blog_single.html')
def shortpost_single(request, post_slug):
    entry = get_object_or_404(ShortPost.objects.all(), slug=post_slug)
    if entry.status == 'd' and not request.user.is_authenticated():
        raise Http404
    else:
        return {'entry': entry}

@render_to('blog/blog_single.html')
def quote_single(request, post_slug):
    entry = get_object_or_404(Quote.objects.all(), slug=post_slug)
    if entry.status == 'd' and not request.user.is_authenticated():
        raise Http404
    else:
        return {'entry': entry}