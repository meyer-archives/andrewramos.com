$(document).ready(function() {
	var $btt = $("a#back-to-top").hide();
	if( $btt.length && $("#content-inner").height() > $(document).height() )
		$btt.show();
	
});
