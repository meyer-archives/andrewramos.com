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

    entries = QuerySetChain(a,c,s,q)

    return { 'entries': entries }

@render_to('blog/tagged_posts.html')
def tagged_posts(request, slug):
    tag = get_object_or_404(Tag, name=slug)

    a = TaggedItem.objects.get_by_model(Article.objects.filter(status='p'), tag)
    c = TaggedItem.objects.get_by_model(CaseStudy.objects.filter(status='p'), tag)
    s = TaggedItem.objects.get_by_model(ShortPost.objects.filter(status='p'), tag)
    q = TaggedItem.objects.get_by_model(Quote.objects.filter(status='p'), tag)

    entries = QuerySetChain(a,c,s,q)

    return { 'entries': entries, 'tag': tag, }

@render_to('blog/index_archives.html')
def archives(request):
    a = Article.objects.filter(status='p').select_related('content_type').all().order_by("-date_published")
    c = CaseStudy.objects.filter(status='p').select_related('content_type').all().order_by("-date_published")
    s = ShortPost.objects.filter(status='p').all().order_by("-date_published")
    q = Quote.objects.filter(status='p').all().order_by("-date_published")

    entries = QuerySetChain(a,c,s,q)

    return { 'entries': entries }

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