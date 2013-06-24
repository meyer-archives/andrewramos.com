from django.template import Library, Node, Variable, loader, TemplateSyntaxError
from django.template.context import Context
from django.utils.safestring import mark_safe
from django.contrib.admin.templatetags.admin_list import result_headers
from string import capitalize
import re

register = Library()

from django import template
from django.core import urlresolvers

@register.simple_tag(takes_context=True)
def current(context, url_regex, return_value=' class="current"', **kwargs):
	request = context.get('request')
	print request
	if request is None:
		return ''
	return re.search(url_regex, context.get('request').path_info) and return_value or ""

def current_url_equals(context, url_name, **kwargs):
	resolved = False
	try:
		resolved = urlresolvers.resolve(context.get('request').path)
	except:
		pass
	matches = resolved and resolved.url_name == url_name
	if matches and kwargs:
		for key in kwargs:
			kwarg = kwargs.get(key)
			resolved_kwarg = resolved.kwargs.get(key)
			if not resolved_kwarg or kwarg != resolved_kwarg:
				return False
	return matches

@register.filter
def camelcase(value):
	if value.lower() == "iphone":
		return "iPhone"
	if value.lower() == "ipad":
		return "iPad"
	if value.lower() == "ipod":
		return "iPod"
	if value.lower() == "imac":
		return "iMac"
	if value.lower() == "macbook":
		return "MacBook"
	if value.lower() == "macbook pro":
		return "MacBookPro"
	return "".join([capitalize(w) for w in re.split(re.compile("[\W_]*"), value)])

@register.simple_tag
def is_current_OLD(request, pattern, return_class='current'):
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