from django.shortcuts import get_object_or_404
from django.http import Http404
from content.models import StaticPage
from blog.models import *
from content.models import FrontPageContent
from utils.decorators import render_to
from itertools import chain

@render_to()
def page_single(request, page_slug):
    single_page = get_object_or_404(StaticPage, slug=page_slug)
    if single_page.status == 'd' and not request.user.is_authenticated():
        raise Http404

    if single_page.slug == 'about':
        page_template = 'content/page_about.html'
    else:
        page_template = 'content/page_default.html'
    return { 'page': single_page, 'TEMPLATE': page_template }

@render_to('front_page.html')
def front_page(request):
    articles = Article.objects.filter(status='p',is_featured=True).order_by("-date_published")
    case_studies = CaseStudy.objects.filter(status='p',is_featured=True).order_by("-date_published")
    short_posts = ShortPost.objects.filter(status='p',is_featured=True).order_by("-date_published")
    quotes = Quote.objects.filter(status='p',is_featured=True).order_by("-date_published")

    featured_posts = chain(
        articles,
        case_studies,
        short_posts,
        quotes,
    )

    featured_content = FrontPageContent.objects.filter(enabled=True).order_by("-pk")

    return {
        'featured_posts': sorted(featured_posts, key=lambda x: x.date_published, reverse=True),
        'featured_content': featured_content
    }