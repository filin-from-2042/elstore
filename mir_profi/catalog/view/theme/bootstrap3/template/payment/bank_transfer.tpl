<h2><?php echo $text_instruction; ?></h2>
<p><?php echo $text_description; ?></p>
<p><?php echo $bank; ?></p>
<p><?php echo $text_payment; ?></p>
<br />
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
        <button type="button" id="button-confirm" class="btn btn-primary" title="<?php echo $button_confirm; ?>" data-loading-text="<?php echo $button_confirm; ?>..."><?php echo $button_confirm; ?></button>
    </div>
</div>
<!-- js -->
<script>
jQuery(function($) {
    /** Confirm */
    $('#button-confirm').click(function() {
        $.ajax({
            async: false,
            url: 'index.php?route=payment/bank_transfer/confirm',
            type: 'get',
            context: this,
            success: function(json) {
                location = '<?php echo $continue; ?>';
            }
        });
    });
});
</script>