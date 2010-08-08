from django.shortcuts import get_object_or_404
from django.http import Http404
from content.models import StaticPage
from blog.models import Article, CaseStudy, ShortPost, Quote
from annoying.decorators import render_to
from itertools import chain

@render_to()
def page_single(request, page_slug):
	single_page = get_object_or_404(StaticPage, slug=page_slug)
	if single_page.page_status == 'd' and not request.user.is_authenticated():
		raise Http404

	if single_page.slug == 'about':
		page_template = 'content/page_about.html'
	else:
		page_template = 'content/page_default.html'
	return { 'page': single_page, 'TEMPLATE': page_template }

@render_to('front_page.html')
def front_page(request):
	articles = Article.objects.filter(post_status='p',is_featured=True)
	case_studies = CaseStudy.objects.filter(post_status='p',is_featured=True)
	short_posts = ShortPost.objects.filter(post_status='p',is_featured=True)
	quotes = Quote.objects.filter(post_status='p',is_featured=True)

	featured = chain(
		articles,
		case_studies,
		short_posts,
		quotes,
	)
	
	return { 'featured_posts': sorted(featured, key=lambda x: x.date_published, reverse=True) }