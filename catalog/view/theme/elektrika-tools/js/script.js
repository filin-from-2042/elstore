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
//        $('#cart').addClass('active');

        $('#cart').load('index.php?route=module/cart #cart > *');
        toggleCart();
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


    $(document).mouseup(function (e) {
        var $cart = $('#cart');
        $cart.is(e.target) || 0 !== $cart.has(e.target).length || $cart.removeClass('active');
        var $search = $('#search');
        $search.is(e.target) || 0 !== $search.has(e.target).length || cancelSearch();
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
    });

    /************************ SEARCH ******************************/
    // отключение скролла документа на время работы с поиском только для пк и браузеров кроме IE
    if(window.innerWidth >= 912)
    {
        var ua = window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");

        if (msie ==-1 && !navigator.userAgent.match(/Trident.*rv\:11\./))
        {
            jQuery('#search').mouseover(function()
            {
                window.oldScrollPos = $(window).scrollTop();

                $(window).on('scroll.scrolldisabler',function ( event ) {
                    $(window).scrollTop( window.oldScrollPos );
                    event.preventDefault();
                });
            });
            jQuery('#search').mouseout(function()
            {
                $(window).off('scroll.scrolldisabler')
            });
        }
    }
    jQuery('#search input').focus(function(){
        $(this).closest('#search').addClass('focused');
    });
    // поисковой запрос при вводе в строку поиска
    jQuery('#search input').on('input',function(e){
        var stext = $(this).val();
        if(stext.length < 2) return;
        $.ajax({
            url: 'index.php?route=common/header/getSearchTips',
            type: 'POST',
            data: {search_text:stext},
            success: function(data) {
                var tipsContainer = $('#search .tips-list');
                tipsContainer.empty();
                if(data)
                {
                    data = JSON.parse(data);
                    if('categories' in data)
                    {
                        tipsContainer.append('<div class="tip header"><span>Категории</span></div>');
                        for(var category in data.categories)
                        {
                            tipsContainer.append('<div class="tip"><a href="'+data.categories[category].href+'">'+data.categories[category].name+'</a></div>');
                        }
                    }
                    if('products' in data)
                    {
                        tipsContainer.append('<div class="tip header"><span>Товары</span></div>');
                        for(var product in data.products)
                        {
                            tipsContainer.append('<div class="tip"><a href="'+data.products[product].href+'">'+'<span class="product-code">'+data.products[product].code+'</span>'+data.products[product].name+'</a></div>');
                        }
                    }
                    if('manufacturers' in data)
                    {
                        tipsContainer.append('<div class="tip header"><span>Производители</span></div>');
                        for(var manufacturer in data.manufacturers)
                        {
                            tipsContainer.append('<div class="tip"><a href="'+data.manufacturers[manufacturer].href+'">'+data.manufacturers[manufacturer].name+'</a></div>');
                        }
                    }
                    tipsContainer.append('<div class="tip all"><a href="/search?search='+stext+'">Все результаты</a></div>');
                    tipsContainer.addClass('filled');
                }
            }
        });
    });

    $('#search input[name=\'search\']').parent().find('button').on('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var value = $('input[name=\'search\']').val();

        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }

        location = url;
    });
    // обработка нажатия стрелок вверх,вниз и ввод в поле поиска
    $('#search input[name=\'search\']').on('keydown', function(e) {
        var tipsList = $('header #search .tips-list');
        var active = tipsList.find('div.tip.active');
        // up
        if (e.keyCode == 38) {
            var nextActive;
            if(active.length > 0)
            {
                if(tipsList.find('div.tip.header:first').is(active.prev('div.tip'))){
                    $('.tips-list').scrollTop(0);
                    return;
                }
                active.removeClass('active');
                nextActive = active.prev('div.tip');
            }else return;

            if(nextActive.find('a').length > 0)
            {
                nextActive.addClass('active');
            }else{
                nextActive.next().addClass('active');
            }

            var currListScrollTop = $('.tips-list').scrollTop();
            var listHeight = $('.tips-list').height();
            var actElementOffset = nextActive.position().top;

            if( actElementOffset < 0 )
            {
                $('.tips-list').scrollTop(currListScrollTop + actElementOffset);
            }
        }
        // down
        if (e.keyCode == 40) {
            var nextActive;
            if(active.length > 0)
            {
                if(active.is(tipsList.find('div.tip:last'))) return;
                active.removeClass('active');
                nextActive = active.next('div.tip')
            }else{
                nextActive = tipsList.find('div.tip:first')
            }
            if(nextActive.find('a').length > 0)
            {
                nextActive.addClass('active');
            }else{
                nextActive.next().addClass('active');
            }

            var currListScrollTop = $('.tips-list').scrollTop();
            var listHeight = $('.tips-list').height();
            var actElementOffset = nextActive.position().top;

            if( listHeight <= actElementOffset)
            {
                var diff = actElementOffset -  listHeight
                $('.tips-list').scrollTop(diff + currListScrollTop  + nextActive.height());
            }
        }
        // enter
        if (e.keyCode == 13) {
            if(active.length>0) location.href = active.find('a').attr('href');
            else $('input[name=\'search\']').parent().find('button').trigger('click');
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
