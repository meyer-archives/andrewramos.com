from django.shortcuts import get_object_or_404
from portfolio.models import Project, PortfolioPiece
from annoying.decorators import render_to

@render_to()
def portfolio_home(request):
	if request.user.is_authenticated():
		projects = Project.objects.all().select_related()
		return {'projects':projects, 'TEMPLATE':'portfolio/portfolio_home.html'}
	else:
		return {'TEMPLATE':'portfolio/coming_soon.html'}

@render_to('portfolio/portfolio_single.html')
def portfolio_single(request, project_slug):
	project = get_object_or_404(Project, slug=project_slug)
	pieces = project.pieces.all()
	return {'project':project,'pieces':pieces}