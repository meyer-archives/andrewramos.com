from django.shortcuts import get_object_or_404
from django.http import Http404
from portfolio.models import Project, PortfolioPiece
from utils.decorators import render_to

@render_to('portfolio/portfolio_home.html')
def portfolio_home(request):
    projects = Project.objects.filter(status='p').select_related()
    return {'projects':projects}

@render_to('portfolio/portfolio_single.html')
def portfolio_single(request, project_slug):
    project = get_object_or_404(Project, slug=project_slug)
    if project.status == 'd' and not request.user.is_authenticated():
        raise Http404
    else:
        return {'project':project}