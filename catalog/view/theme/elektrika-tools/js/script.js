jQuery(document).ready(function() {

    jQuery('.swipe-control').click(function() {
        if (jQuery(this).parents('body').hasClass('ind')) {
            jQuery(this).parents('body').removeClass('ind');
            return false
        }
        else {
            jQuery(this).parents('body').addClass('ind');
            return false
        }
    });

    /* Ajax Cart */
    $('body').delegate('#cart > .heading a','click', function() {
        $('#cart').addClass('active');

        $('#cart').load('index.php?route=module/cart #cart > *');

        $('body').delegate('#cart','mouseleave', function() {
            $(this).removeClass('active');
        });
    });

    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});
