from django.http import HttpResponse

def index(request):
	return HttpResponse("Portfolio index page")

def project(request, project_slug):
	return HttpResponse("Project slug: %s" % project_slug)