from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from blog.models import BlogPost, Article, CaseStudy, ShortPost, Quote

def index(request):
	return HttpResponse("Blog index page")

def single_post(request, post_slug):
	post = get_object_or_404(Article, slug=post_slug)
	print post.objects.all()
	return HttpResponse("Post slug: %s" % post_slug)

def archives_index(request):
	return HttpResponse("Archives index")