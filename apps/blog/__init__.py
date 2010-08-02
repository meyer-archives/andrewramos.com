from rpc4django import rpcmethod
from blog.models import BlogPost

@rpcmethod(name='wp.getUsersBlogs')
def get_blogs(username, password):
	"""Retrieve the blogs of the user."""
	print "xmlrpc method: get_blogs"
	blogs = [{
		'isAdmin':1,
		'url':'http://hotsauce.local:8080/',
		'blogid':1,
		'blogName':'BLOGNAME',
		'xmlrpc':'xmlrpc.php'
	}]
	return blogs

@rpcmethod(name='wp.getPage')
def get_page(blog_id, page_id, username, password):
	"""
	WordPress: Retrieve page.
	Returns a dictionary of page meta based on the page ID.
	"""
	print "xmlrpc method: get_page"
	page = {
		'dateCreated': '0',
		'userid': 1, 
		'page_id': 1,
		'page_status': 'draft',
		'description': 'DESCRIPTION',
		'title': 'TITLE',
		'link': 'http://example.com/link/to/page',
		'permaLink': 'http://example.com/permalink/to/page',
		'categories': ['category1','category2'],
		'excerpt': 'POST EXCERPT',
		'text_more': 'FULL PAGE EXTENDED',
		'mt_allow_comments': 0, # 0 or 1
		'mt_allow_pings': 0, # 0 or 1
		'wp_slug': 'page-slug',
		'wp_password': '', # post password
		'wp_author': 'AUTHOR NAME',
		'wp_page_parent_id': 0,
		'wp_page_parent_title': 'PARENT PAGE TITLE',
		'wp_page_order': 8675,
		'wp_author_id': 1,
		'wp_author_display_name': 'AUTHOR DISPLAY NAME',
		'date_created_gmt': '',
		'custom_fields': [],
		'wp_page_template': 'default'
	}
	return page


@rpcmethod(name='wp.getPages')
def get_pages(*args,**kwargs):
	"""
	Returns an array of pages, or an empty array if no pages are found.
	"""
	print "xmlrpc method: get_pages"
	pages = []
	
	return pages

@rpcmethod(name='wp.newPage')
def new_page(*args,**kwargs):
	"""
	Returns 'mw_newPost'.
	"""
	print "xmlrpc method: new_page"
	pass

@rpcmethod(name='wp.deletePage')
def delete_page(*args,**kwargs):
	"""
	Returns true on success 
	"""
	print "xmlrpc method: delete_page"
	return True

@rpcmethod(name='wp.editPage')
def edit_page(*args,**kwargs):
	"""
	Returns 'mw_editPost'
	"""
	print "xmlrpc method: get_comment"

@rpcmethod(name='wp.getPageList')
def get_page_list(*args,**kwargs):
	"""
	Returns an array of pages
	"""
	print "xmlrpc method: get_page_list"
	return []

@rpcmethod(name='wp.getAuthors')
def get_authors(*args,**kwargs):
	"""
	Returns an array of authors
	"""
	print "xmlrpc method: get_authors"
	authors = [{
		'user_id':1,
		'user_login':'AUTHORLOGIN',
		'display_name':'AUTHORNICENAME'
	}]

@rpcmethod(name='wp.getCategories')
def get_categories(*args,**kwargs):
	"""docstring for get_categories"""
	print "xmlrpc method: get_categories"

@rpcmethod(name='wp.getTags')
def get_tags(*args,**kwargs):
	"""
	Returns an array of tags
	"""
	print "xmlrpc method: get_tags"
	tags = [{
		'tag_id': 1,
		'name': 'DEMOTAG',
		'count': 44,
		'slug': 'DEMOTAG-SLUG',
		'html_url': 'http://example.com/demotag-html-url',
		'rss_url': 'http://example.com/demotag-rss-url'
	}]

@rpcmethod(name='wp.newCategory')
def new_category(*args,**kwargs):
	"""
	Returns the category ID
	"""
	print "xmlrpc method: new_category"
	return 868

@rpcmethod(name='wp.deleteCategory')
def delete_category(*args,**kwargs):
	"""
	Returns true on success
	"""
	print "xmlrpc method: delete_category"
	return True

@rpcmethod(name='wp.suggestCategories')
def suggest_categories(*args,**kwargs):
	"""
	Returns an array of categories
	"""
	print "xmlrpc method: suggest_categories"
	categories = [
		{
		'category_id': 22,
		'category_name': 'Twenty-Two'
		},
		{
		'category_id': 868,
		'category_name': 'eight-sixty-eight'
		}
	]
	pass

@rpcmethod(name='wp.uploadFile')
def upload_file(*args,**kwargs):
	"""docstring for upload_file"""
	print "xmlrpc method: upload_file"
	pass

@rpcmethod(name='wp.getCommentCount')
def get_comment_count(*args,**kwargs):
	"""docstring for get_comment_count"""
	print "xmlrpc method: get_comment_count"
	pass

@rpcmethod(name='wp.getPostStatusList')
def get_post_status_list(*args,**kwargs):
	"""docstring for get_post_status_list"""
	print "xmlrpc method: get_post_status_list"
	pass

@rpcmethod(name='wp.getPageStatusList')
def get_page_status_list(*args,**kwargs):
	"""docstring for get_page_status_list"""
	print "xmlrpc method: get_page_status_list"
	pass

@rpcmethod(name='wp.getPageTemplates')
def get_page_templates(*args,**kwargs):
	"""docstring for get_page_templates"""
	print "xmlrpc method: get_page_templates"
	pass

@rpcmethod(name='wp.getOptions')
def get_options(*args,**kwargs):
	"""docstring for get_options"""
	print "xmlrpc method: get_options"
	pass

@rpcmethod(name='wp.setOptions')
def set_options(*args,**kwargs):
	"""docstring for set_options"""
	print "xmlrpc method: set_options"
	pass

@rpcmethod(name='wp.getComment')
def get_comment(*args,**kwargs):
	"""
	
	"""
	print "xmlrpc method: get_comment"
	comment = {
		'date_created_gmt': 0,
		'user_id': 1,
		'comment_id': 252,
		'parent': 0,
		'status': 'approve', # hold, spam
		'content': 'COMMENT CONTENT',
		'link': 'http://example.com/comment-link',
		'post_id':1,
		'post_title':'POST TITLE FROM COMMENT',
		'author': 'COMMENT AUTHOR',
		'author_url': 'http://example.com/comment-author-url',
		'author_email':'comment@author.com',
		'author_ip':'67.23.24.188',
		'type':'not sure'
	}
	pass

@rpcmethod(name='wp.getComments')
def get_comments(*args,**kwargs):
	"""docstring for get_comments"""
	print "xmlrpc method: get_comments"
	pass

@rpcmethod(name='wp.deleteComment')
def delete_comment(*args,**kwargs):
	"""docstring for delete_comment"""
	print "xmlrpc method: delete_comment"
	pass

@rpcmethod(name='wp.editComment')
def edit_comment(*args,**kwargs):
	"""docstring for edit_comment"""
	print "xmlrpc method: edit_comment"
	pass

@rpcmethod(name='wp.newComment')
def new_comment(*args,**kwargs):
	"""docstring for new_comment"""
	print "xmlrpc method: new_comment"
	pass

@rpcmethod(name='wp.getCommentStatusList')
def get_comment_status_list(*args,**kwargs):
	"""docstring for get_comment_status_list"""
	print "xmlrpc method: get_comment_status_list"
	pass

@rpcmethod(name="metaWeblog.getRecentPosts")
def get_recent_posts(*args,**kwargs):
	"""docstring for get_recent_posts"""
	print "xmlrpc method: get_recent_posts"
	pass

@rpcmethod(name="system.multicall")
def system_multicall(*args,**kwargs):
	"""docstring for get_recent_posts"""
	print "xmlrpc method: system_multicall"
	pass