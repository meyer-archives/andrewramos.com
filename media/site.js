jQuery(function($) {
$.fn.extend({
	slideshowify: function(options) {
		var settings = $.extend({}, $.fn.slideshowify.defaults, options);
		return this.each(
			function(){
				var $g = $(this);
				var o = $.metadata ? $.extend({}, settings, $g.metadata()) : settings;
				var $slides = $g.addClass("slideshow-active").find("ul>li").hide();
				var $clickers = $("<div class='slideshow-links'></div>");
				var currentSlide;
				var animating;
				var currentClicker;

				var $next = $("<a href='#' class='next-slide'>Next slide</a>").click(function(){
					if( currentClicker.length && currentClicker.next().length )
						currentClicker.next().click();
					return false;
				});
				var $prev = $("<a href='#' class='prev-slide'>Previous slide</a>").click(function(){
					if( currentClicker.length && currentClicker.prev().length )
						currentClicker.prev().click();
					return false;
				});

				$slides.each(function(i){
					var $slide = $(this);
					var $clicker = $("<a href='#slide-"+(i+1)+"'>Show slide "+(i+1)+"</a>").click(function(){
						if( animating || currentSlide == $slide.index() )
							return false;
						currentClicker = $clicker;
						if( $clicker.next().length ){
							$next.show();
						} else {
							$next.hide();
						}
						if( $clicker.prev().length ){
							$prev.show();
						} else {
							$prev.hide();
						}
						$clicker.addClass("current").siblings().removeClass("current");
						$slide.css({zIndex:100}).fadeIn(250,function(){
							$slide.css({zIndex:50}).siblings().hide()
							animating = false;
						});
						currentSlide = $slide.index();
						return false;
					}).appendTo($clickers);
				});

				if( $slides.length > 1 ){
					$clickers.find("a:first").click();
					$g.append($clickers).append($next).append($prev);
				}

				return this;
			}
		);
	}
});
$.fn.slideshowify.defaults = {
	transition: 'slide' // Not in use yet
};
});

$(document).ready(function() {
	var $btt = $("a#back-to-top").hide();
	var timer;
	function btt_toggle(){
		if( $btt.length && $("#content-inner").height() > $(document).height() ){
			$btt.fadeIn(400);
		} else {
			$btt.fadeOut(400);
		}
	}
	btt_toggle();
	$(window).resize(function(){
		clearTimeout(timer);
		timer = setTimeout(btt_toggle,750);
	})
	// What a dumb name.
	$(".slideshow").slideshowify();
});