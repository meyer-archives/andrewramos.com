from django.shortcuts import get_object_or_404
from portfolio.models import Project, PortfolioPiece
from annoying.decorators import render_to

@render_to('portfolio/portfolio_home.html')
def portfolio_home(request):
	projects = Project.objects.all().select_related()
	return {'projects':projects}

@render_to('portfolio/portfolio_single.html')
def portfolio_single(request, project_slug):
	project = get_object_or_404(Project, slug=project_slug)
	pieces = project.pieces.all()
	return {'project':project,'pieces':pieces}