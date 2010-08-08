django.jQuery(function($){
	/*
	 * jQuery autoResize (textarea auto-resizer)
	 * @copyright James Padolsey http://james.padolsey.com
	 * @version 1.04
	 */

	$.fn.autoResize = function(options) {
		var settings = $.extend({
			extraSpace : 50,
			limit: 100000
		}, options);

		this.filter('textarea').each(function(){
			var textarea = $(this).css({resize:'none','overflow-y':'hidden'}),
			origHeight = textarea.height(),
				clone = (function(){

					var props = ['height','width','lineHeight','textDecoration','letterSpacing'],
						propOb = {};

					$.each(props, function(i, prop){
						propOb[prop] = textarea.css(prop);
					});

					return textarea.clone().removeAttr('id').removeAttr('name').css({
						position: 'absolute',
						top: 0,
						left: -9999
					}).css(propOb).attr('tabIndex','-1').insertBefore(textarea);

				})(),
				lastScrollTop = null,
				updateSize = function() {
					clone.height(0).val($(this).val()).scrollTop(10000);

					var scrollTop = Math.max(clone.scrollTop(), origHeight) + settings.extraSpace,
						toChange = $(this).add(clone);

					if (lastScrollTop === scrollTop) { return; }
					lastScrollTop = scrollTop;

					if ( scrollTop >= settings.limit ) {
						$(this).css('overflow-y','');
						return;
					}
					toChange.height(scrollTop);
				};

			textarea
				.unbind('.dynSiz')
				.bind('keyup.dynSiz', updateSize)
				.bind('keydown.dynSiz', updateSize)
				.bind('change.dynSiz', updateSize)
				.trigger('keyup.dynSiz');

		});
		return this;
	};

	var $t = $("textarea#id_content_markdown").attr({rows:10}).autoResize();
	var $markdown_preview = $("<div class='markdown-preview'></div>");
	var converter = new Showdown.converter();
	var timer = false;

	function render_html(){
		var html = converter.makeHtml($t.val());
		$markdown_preview.html(html)
	}
	setTimeout(render_html,300)

	$t.keyup(function(){
		clearTimeout(timer);
		timer = setTimeout(render_html,300)
	}).wrap("<div class='markdown-preview-container'></div>").after($markdown_preview);
})