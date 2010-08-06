from django.template import Library, Node, Variable, loader, TemplateSyntaxError
from django.template.context import Context
from django.utils.safestring import mark_safe
from django.contrib.admin.templatetags.admin_list import result_headers
import re

register = Library()

@register.simple_tag
def is_current(request, pattern, return_class='current'):
	return re.search(pattern, request.path_info) and return_class or ""


@register.tag(name='captureas')
def do_captureas(parser, token):
	try:
		tag_name, args = token.contents.split(None, 1)
	except ValueError:
		raise TemplateSyntaxError("'captureas' node requires a variable name.")
	nodelist = parser.parse(('endcaptureas',))
	parser.delete_first_token()
	return CaptureasNode(nodelist, args)

class CaptureasNode(Node):
	def __init__(self, nodelist, varname):
		self.nodelist = nodelist
		self.varname = varname

	def render(self, context):
		output = self.nodelist.render(context)
		context[self.varname] = output
		return ''