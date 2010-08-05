from blog.models import Article, CaseStudy, ShortPost, Quote
from itertools import chain
from annoying.decorators import render_to

@render_to('front_page.html')
def front_page(request):
	articles = Article.objects.all().order_by("date_added")
	case_studies = CaseStudy.objects.all().order_by("date_added")
	short_posts = ShortPost.objects.all().order_by("date_added")
	quotes = Quote.objects.all().order_by("date_added")

	return {
		'blog_stream': list(chain(articles, case_studies, short_posts, quotes)),
	}