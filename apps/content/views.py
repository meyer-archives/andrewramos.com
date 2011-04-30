from django.shortcuts import get_object_or_404
from django.http import Http404
from blog.models import *
from content.models import FrontPageContent
from utils.decorators import render_to
from itertools import chain

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