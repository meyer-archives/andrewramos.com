// Infinite Scroll jQuery plugin
// copyright Paul Irish, licensed GPL & MIT
// version 1.5.100504 modded for Ligonier.org
 
;(function($){
	$.fn.infinitescroll = function(options,callback){
		function getIDbyURL(url){
			return url.match(/page=(\d+)$/)[1];
		}

		function ucfirst(name){
			return name[0].toUpperCase() + name.slice(1);
		}

		function allDone(){
			// console.log("No more where that came from (link: "+props.current+")");
			link[props.current].html(opts.doneText[props.current]).addClass("disabled");
			page[props.current] = "alldone";
		}

		function loadPage(nextprev){
			if( page[nextprev] == "alldone" )
				return;
			if( props.current ){
				// console.log("Already ajaxing ("+props.current+"). Wait your turn!!");
				return;
			}
			var $link = $(this);
			props.current = nextprev;

			// console.log("loadPage("+nextprev+")");

			link[nextprev].html(opts.loadingText[nextprev]).addClass("loading");

			box = $('<div/>');
			frag = document.createDocumentFragment();
			var loadPath = path + props.page[nextprev] + ' ' + opts.itemSelector;
			// console.log( "Loading: " + loadPath );
			box.load( loadPath, null, loadCallback); 
		}

		function loadCallback(){
			var children = box.children().get();

			$(children).addClass("new").each(function(){
				$(this).find("a").attr("href", $(this).find("a").attr("href") + "?prevpage=" + props.page[props.current] );
			}).bindTapEvents();

			props.current == "next" ? props.page[props.current]++ : props.page[props.current]--;
			// console.log( ucfirst(props.current) + " page: " + props.page[props.current] );

			if(children.length == 0)
				return $.event.trigger( "ajaxError", [{status:404}] );

			while (box[0].firstChild)
				frag.appendChild( box[0].firstChild );

			if( props.current == "next" )
				$(opts.contentSelector).append(frag);
			else
				$(opts.contentSelector).prepend(frag);

			link[props.current].removeClass("loading").html(opts.loadText[props.current]);
			callback.call( opts.contentSelector, children );

			if(	props.current=="prev" &&
				props.page["prev"] == 0
			)	allDone("prev");
			else
			if(	lastPageID &&
				props.current=="next" &&
				lastPageID == props.page["next"]
			)	allDone("next");

			props.current = false;
		}

		var opts = $.extend({}, $.infinitescroll.defaults, options),
			props = $.infinitescroll, // shorthand
			box, frag;
		callback = callback || function(){};
		opts.contentSelector = $(this)[0];

		var opg = {
			next: $(opts.pageSelector.next),
			prev: $(opts.pageSelector.prev)
		};

		var lastPage = $(opts.pageSelector.last);
		var lastPageID = false;

		if( lastPage.length )
			lastPageID = getIDbyURL(lastPage.attr("href"));

		var link = {
			next: null,
			prev: null
		};

		// Hard coded. Not good. Whatever.
		var path = "./?page=";

		$.each(opg,function(nextprev,$obj){
			var formattedName = ucfirst(nextprev);
			if( $obj.length ){
				props.page[nextprev] = getIDbyURL($obj.attr("href"));
				// console.log(formattedName+" page: "+props.page[nextprev]);
				link[nextprev] = $("<a class='roundrect' href='#'>"+opts.loadText[nextprev]+"</a>")
					.click(function(){
						loadPage(nextprev);
						return false;
					});
				nextprev == "next" ? $(opts.contentSelector).after(link[nextprev]) : $(opts.contentSelector).before(link[nextprev]);
				link[nextprev].wrap("<div class='infinite-scroll-wrapper "+nextprev+"'></div>");
			}// else {
				// console.log(formattedName+" page: none");
			// }
		});

		$(document).ajaxError(function(e,xhr,opt){
			// console.log("ajaxError callback: "+xhr.status);
			if (xhr.status == 404){
				allDone(props.current);
				props.current = false;
			}
		});

		$(opts.navSelector).hide();

		return this;
	}


	// options and read-only properties object
	$.infinitescroll = {
		defaults: {
			loadText: {
				prev			: "Load previous items",
				next			: "Load next items"
			},
			loadingText: {
				prev			: "Loading previous items&hellip;",
				next			: "Loading next items&hellip;"
			},
			doneText: {
				prev			: "No more previous items to load.",
				next			: "No more next items to load."
			},
			pageSelector: {
				prev			: "#pagination a.prev",
				next			: "#pagination a.next",
				last			: "#pagination a.last" // If it exists
			},
			navSelector			: "#pagination", // Hide this
			itemSelector		: "ul#infinite>li" // Items to load into $(this)
		},
		page					: {},
		current			: false
	};

})(jQuery);
