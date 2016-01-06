<form class="form-horizontal" name="payment" action="<?php echo $action; ?>" method="post">
    <input type="hidden" name="cart" value="<?php echo $cart; ?>">
    <input type="hidden" name="signature" value="<?php echo $signature; ?>">
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <img id="button-paypal" src="http://sandbox.google.com/checkout/buttons/checkout.gif?merchant_id=<?php echo $merchant; ?>&w=180&h=46&style=white&variant=text&loc=en_US" height="46" width="180" alt="Fast checkout through Google" />
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    /** Confirm */
    $('#button-paypal').click(function() {
        $.ajax({
            url: 'index.php?route=payment/google_checkout/send',
            type: 'post',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', 'form[name="payment"]'),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json['cart']) {
                    $('input[name="cart"]', 'form[name="payment"]').val(json['cart']);
                    $('input[name="signature"]', 'form[name="payment"]').val(json['signature']);
                    
                    $('form[name="payment"]').submit();
                    
                } else if (json.error) {
                    $(this).stepWarning(json.error);
                }
            }
        });
    });
});
</script> 








