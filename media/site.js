if(!window.console){window.console={log:function(){return false}}}
jQuery(function($) {

function AwesomeGallery( jqObject ){
	var slides = ["zero"];
	var timer = false;
	var currentSlide = 0;
	var totalSlides = 0;
	var crossFade = true;
	var slides = ["zero"];

	jqObject.each(function(i,obj){
		slides.push($(obj).hide());
		totalSlides++;
	});

	slides[1].show();
	var currentSlide = 1;
	var active = true;

	console.log("Initializing gallery...");

	this.prev = function(){
		console.log("Previous");
		return this.select("prev");
	}

	this.next = function(){
		console.log("Next");
		return this.select("next");
	}

	this.select = function(slideNum){
		var oldCurrentSlide = currentSlide;

		if( slideNum == currentSlide ){
			console.log("Already on slide "+slideNum);
			return false;
		}

		if( slideNum == "next" ) {
			if( currentSlide + 1 > totalSlides ){
				console.log("No more slides");
				slideNum = 1;
			} else {
				slideNum = currentSlide + 1;
			}
		} else {
			if( slideNum == 'prev' ){
				if( currentSlide - 1 < 1 ){
					console.log("No previous slides");
				} else {
					slideNum = currentSlide - 1;
				}
			}
		}

		if( typeof(slides[slideNum]) != "undefined" ){
			currentSlide = slideNum;
		} else {
			console.log("Slide "+slideNum+" doesn't exist.");
			return false;
		}

		console.log(oldCurrentSlide+" => "+currentSlide+" - total: "+totalSlides);

		if( active ){
			active = false;
			if( crossFade ){
				slides[currentSlide].css({zIndex:100}).fadeIn(250,function(){
					slides[currentSlide].css({zIndex:50});
					slides[oldCurrentSlide].hide();
					active = true;
				}).trigger("slideChange",{"currentSlide":currentSlide});
			} else {
				slides[oldCurrentSlide].fadeOut(300,function(){
					slides[currentSlide].fadeIn(300,function(){
						active = true;
					});
				}).trigger("slideChange",{"currentSlide":currentSlide});
			}
		} else {
			console.log("Slideshow inactive. Hold your horses.");
		}
	}
}

$.fn.extend({
	slideshowify: function(options) {
		var settings = $.extend({}, $.fn.slideshowify.defaults, options);
		return this.each(function(){
			var $g = $(this);
			var $slides = $g.addClass("slideshow-active").find("ul>li").hide();
			var $clickers = $("<div class='slideshow-links'></div>");
			var gallery = new AwesomeGallery( $g );
			var currentSlide;
			var animating;
			var $nextButton = $("<a href='gallery-next'>Next</a>");
			var $prevButton = $("<a href='gallery-prev'>Previous</a>");

			$slides.each(function(i){
				var $slide = $(this);
				var $clicker = $("<a href='#slide-"+(i+1)+"'>Show slide "+(i+1)+"</a>").click(function(){
					gallery.select(i);
				}).appendTo($clickers);
			});

			if( $slides.length > 1 ){
				$nextButton.click(function(){$(this).trigger("slideNext");return false;});
				$prevButton.click(function(){$(this).trigger("slidePrev");return false;});
				$g.append($clickers).append($nextButton).append($prevButton);
			}
		});
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
