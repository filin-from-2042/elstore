$(document).ready(function()
{
    $('#clearCartModal .clear-action').click(function(e)
    {
        e.preventDefault();
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/cart/clear',
            type: 'post',
            context: this,
            success: function(responce) {
                 location.href = location.href;
            }
        });
    });
});