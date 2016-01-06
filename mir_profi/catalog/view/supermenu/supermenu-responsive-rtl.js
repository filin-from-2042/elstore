/* This part of code is by Flo from shopencart.com */
(function($) {

 function superdropdownalign() {
	
	$('#supermenu').removeAttr("class");
	$('#supermenu-mobile').removeAttr("class");
	var supermenu_width = $('#supermenu').outerWidth('false');
	if (supermenu_width < 850 && supermenu_width >= 670) {
		$('#supermenu').addClass('respmedium');
	} else if (supermenu_width < 670) {
		$('#supermenu').removeClass('respmedium');
		$('#supermenu').addClass('respsmall');
		$('#supermenu-mobile').addClass('showsupnow');
	}

	$('#supermenu ul > li > a + div').each(function(index, element) {	
		
		$(this).css('margin-right', '0px');
		if ($(this).outerWidth('false') > (supermenu_width - 8)) {
			$(this).css('width', (Math.round(supermenu_width)) - 20) + 'px');
		}
		var supermenu = $('#supermenu').offset();
		var ddown = $(this).parent();
		var offset_right = ($(window).width() - (ddown.offset().left + ddown.outerWidth('false')));
		
		var i = (offset_right + $(this).outerWidth()) - (supermenu.left + supermenu_width);
		if (i > 0) {
			$(this).css('margin-right', '-' + (i + 4) + 'px');
		}
		var supermenu_right = ($(window).width() - (supermenu.left + supermenu_width));
		var y = offset_right - supermenu_right;
		var z = $('#supermenu').outerWidth('false') - (200 + y);
		if($(this).find('.inflyouttoright').outerWidth('false') > z ) {
		$(this).find('.inflyouttoright').css('width', (z - 25) + 'px');
		}
	});
 }
 var timpderesize;
 $(window).resize(function() {
    clearTimeout(timpderesize);
    timpderesize = setTimeout(superdropdownalign, 500);
 });
 if (!($.browser.msie && ($.browser.version == 8 || $.browser.version == 7 || $.browser.version == 6))) {
 window.addEventListener("orientationchange", superdropdownalign, false);
 }
$(document).ready(function() {
    superdropdownalign();
	$( '#supermenu > ul > li.mkids' ).doubleTapToGo();
	$( '#supermenu ul li div.bigdiv.withflyout > .withchildfo.hasflyout' ).doubleTapToGo();
	$('#supermenu-mobile  ul  li  div  .withchild .toexpand, #supermenu-mobile  ul  li  div  .withchild ul li .toexpandkids, #supermenu  ul  li  div  .withchild  .mainexpand, #supermenu  ul  li  div  .withimage .name .mainexpand').bind('click', function() {
		var kidon = $(this).parent().hasClass('exped');
		if (!kidon) {
			$(this).parent().addClass('exped');
			kidon = true;
		} else {
			$(this).parent().removeClass('exped');
			kidon = false;
		}
	});
	var superparent = $('#supermenu-mobile ul li.tlli').hasClass('exped');
	$('#supermenu-mobile ul li.tlli a').bind('click', function() {
		if (!superparent) {
			$(this).parent().find('.bigdiv').slideDown(300);
			$(this).parent().addClass('exped');
			superparent = true;
		} else {
			$(this).parent().find('.bigdiv').slideUp(300);
			$(this).parent().removeClass('exped');
			superparent = false;
		}
	});
});
})(jQuery);
/*  This part of code by:
	By Osvaldas Valutis, www.osvaldas.info
	Available for use under the MIT License
*/
;(function( $, window, document, undefined )
{
	$.fn.doubleTapToGo = function( params )
	{
		if( !( 'ontouchstart' in window ) &&
			!navigator.msMaxTouchPoints &&
			!navigator.userAgent.toLowerCase().match( /windows phone os 7/i ) ) return false;

		this.each( function()
		{
			var curItem = false;

			$( this ).on( 'click', function( e )
			{
				var item = $( this );
				if( item[ 0 ] != curItem[ 0 ] )
				{
					e.preventDefault();
					curItem = item;
				}
			});

			$( document ).on( 'click touchstart MSPointerDown', function( e )
			{
				var resetItem = true,
					parents	  = $( e.target ).parents();

				for( var i = 0; i < parents.length; i++ )
					if( parents[ i ] == curItem[ 0 ] )
						resetItem = false;

				if( resetItem )
					curItem = false;
			});
		});
		return this;
	};
})( jQuery, window, document );