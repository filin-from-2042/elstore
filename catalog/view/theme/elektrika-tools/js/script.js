jQuery(document).ready(function() {

    jQuery('.swipe-control').click(function() {
        if (jQuery('.swipe').hasClass('ind')) {
            jQuery('.swipe').removeClass('ind');
            return false
        }
        else {
            jQuery('.swipe').addClass('ind');
            return false
        }
    });

    /* Ajax Cart */
    $('body').delegate('#cart > .heading a','click', function() {
        $('#cart').addClass('active');

        $('#cart').load('index.php?route=module/cart #cart > *');

        $(document).mouseup(function (e) {
            var $cart = $('#cart');
            $cart.is(e.target) || 0 !== $cart.has(e.target).length || toggleCart(e);
        })
        /*
        $('body').delegate('#cart','mouseleave', function() {
            $(this).removeClass('active');
        });*/
    });

    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });

    /****************BACK TO TOP*********************/
    var IE='\v'=='v';
    // hide #back-top first
    jQuery("#back-top").hide();
    // fade in #back-top
    jQuery(function () {
        jQuery(window).scroll(function () {
            if (!IE) {
                if (jQuery(this).scrollTop() > 100) {
                    jQuery('#back-top').fadeIn();
                } else {
                    jQuery('#back-top').fadeOut();
                }
            }
            else {
                if (jQuery(this).scrollTop() > 100) {
                    jQuery('#back-top').show();
                } else {
                    jQuery('#back-top').hide();
                }
            }
        });

        // scroll body to 0px on click
        jQuery('#back-top a').click(function () {
            jQuery('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
    });

    /************************ INIT TOOLTIPS ***********************/
    initTooltips();
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })



    /************************ SEARCH ******************************/
    $('#search input[name=\'search\']').parent().find('button').on('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var value = $('input[name=\'search\']').val();

        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }

        location = url;
    });

    $('#search input[name=\'search\']').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('input[name=\'search\']').parent().find('button').trigger('click');
        }
    });


    /*************************** MOBILE HOVER REMOVE *******************************/
    var touch = 'ontouchstart' in document.documentElement
        || navigator.maxTouchPoints > 0
        || navigator.msMaxTouchPoints > 0;

    if (touch) { // remove all :hover stylesheets
        try { // prevent exception on browsers not supporting DOM styleSheets properly
            for (var si in document.styleSheets) {
                var styleSheet = document.styleSheets[si];
                if (!styleSheet.rules) continue;

                for (var ri = styleSheet.rules.length - 1; ri >= 0; ri--) {
                    if (!styleSheet.rules[ri].selectorText) continue;

                    if (styleSheet.rules[ri].selectorText.match(':hover')) {
                        styleSheet.deleteRule(ri);
                    }
                }
            }
        } catch (ex) {}
    }
});
