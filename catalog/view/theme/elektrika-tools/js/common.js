
function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}
function getChar(event) {
    if (event.which == null) {
        if (event.keyCode < 32) return null;
        return String.fromCharCode(event.keyCode) // IE
    }

    if (event.which!=0 && event.charCode!=0) {
        if (event.which < 32) return null;
        return String.fromCharCode(event.which)
    }

    return null;
}
function showNotification(notificationText, fadeOut)
{
    $('#notification').html('<div class="success alert alert-success" style="display: none;">' + notificationText + '<button type="button" class="close" data-dismiss="alert">×</button></div>');
    $('.success').fadeIn('slow');

    var fadeOut = fadeOut || true;
    if(fadeOut) setTimeout(function() {$('.success').fadeOut(1000)},3000)
}

function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
                showNotification(json['success']);
                $('#cart-total').html(json['total']);
            }
        }
    });
}
function addToWishList(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {

                showNotification(json['success']);
                $('#wishlist-total').html(json['total']);
            }
        }
    });
}

function addToCompare(product_id) {
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                showNotification(json['success']);
                $('#compare-total').html(json['total']);
            }
        }
    });
}
// инициализации бустраповских подсказок
function initTooltips(selector)
{
    selector = selector || '[data-toggle="tooltip"]';
    $(selector).tooltip();
}
// переключение внешнего вида корзины
function toggleCart(event)
{
    var $cartContent = $('#cart .content');
    var $cart = $('#cart');
    if ($cartContent.is(":visible")) {
        $cart.removeClass('active');
    } else  {
        $cart.addClass('active');
    }
}
// очистка поиска в шапке
function cancelSearch()
{
    var $search = $('#search');
    $search.removeClass('focused').find('.tips-list').removeClass('filled').empty();
    $search('#search').find('input').val('');
}