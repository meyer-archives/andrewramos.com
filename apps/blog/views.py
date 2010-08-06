from django.shortcuts import get_object_or_404
from blog.models import Article, CaseStudy, ShortPost, Quote, Image
from itertools import chain
from annoying.decorators import render_to
from django.contrib.contenttypes.models import ContentType

@render_to('blog/index_blog.html')
def index(request):
	articles = Article.objects.select_related('content_type').all().order_by("-date_published")
	case_studies = CaseStudy.objects.select_related('content_type').all().order_by("-date_published")
	short_posts = ShortPost.objects.all().order_by("-date_published")
	quotes = Quote.objects.all().order_by("-date_published")

	results = chain(
		articles,
		case_studies,
		short_posts,
		quotes,
	)

	return { "entries": sorted(results, key=lambda x: x.date_published, reverse=True) }

@render_to('blog/index_archives.html')
def archives(request):
	articles = Article.objects.select_related('content_type').all().order_by("-date_published")
	case_studies = CaseStudy.objects.select_related('content_type').all().order_by("-date_published")
	short_posts = ShortPost.objects.all().order_by("-date_published")
	quotes = Quote.objects.all().order_by("-date_published")

	results = chain(
		articles,
		case_studies,
		short_posts,
		quotes,
	)

	return { "entries": sorted(results, key=lambda x: x.date_published, reverse=True) }

@render_to('blog/blog_single.html')
def article_single(request, post_slug):
	article_single = get_object_or_404(Article.objects.select_related('content_type'), slug=post_slug)
	images = ContentType.objects.get_for_model(article_single)
	print Image.objects.filter(object_id=article_single.id)

	return {
		'entry': article_single
	}

@render_to('blog/blog_single.html')
def casestudy_single(request, post_slug):
	return {
		'entry': get_object_or_404(CaseStudy.objects.select_related('content_type'), slug=post_slug)
	}

@render_to('blog/blog_single.html')
def shortpost_single(request, post_slug):
	return {
		'entry': get_object_or_404(ShortPost, slug=post_slug)
	}

@render_to('blog/blog_single.html')
def quote_single(request, post_slug):
	return {
		'entry': get_object_or_404(Quote, slug=post_slug)
	}