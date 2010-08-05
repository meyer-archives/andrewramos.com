from django.contrib.admin.templatetags.admin_list import items_for_result, result_headers
from django.template import Library
from django.utils.safestring import mark_safe
from easy_thumbnails.templatetags import thumbnail

register = Library()

def results(cl, additional_links):
	for item in cl.result_list:
		result_list = list(items_for_result(cl,item,None))
		for link in additional_links:
			result_list.append(link['url_template'] % item.id)
		yield "".join(result_list)

def extended_result_list(cl, additional_links):
	"""
	Rewrite of original function to add an additional columns after each result
	in the change list.
	"""
	headers = list(result_headers(cl))
	for header in additional_links:
		headers.append(header)

	return {
		'cl': cl,
		'result_headers': headers,
		'results': list(results(cl, additional_links))
	}

# This function is an example template tag for use in an overridden change_list.html template.
#@register.inclusion_tag("admin/portfolio/PortfolioPiece/change_list_results.html")
def gallery_result_list(cl):
	additional_links = (
		{ 'text': 'Image',
		  'sortable': False,
		  'url_template': '<td><a href="%s/"></a></td>'
		},
	)
	return extended_result_list(cl, additional_links)

# Modified section of change_list.html template.
# Override the original result_list templatetag to add a registration link for each person #}
# {% block result_list %}{% result_list cl %}{% endblock %} #}
#{% block result_list %}{% person_result_list cl %}{% endblock %}