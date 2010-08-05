from django.shortcuts import get_object_or_404
from pages.models import Page
from annoying.decorators import render_to

@render_to()
def page_single(request, page_slug):
	single_page = get_object_or_404(Page, slug=page_slug)
	if single_page.slug == 'about':
		page_template = 'pages/about.html'
	else:
		page_template = 'pages/default.html'
	return { 'page': single_page, 'TEMPLATE': page_template }