<?php require_once('/../../config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<?php include('/../module/notification.tpl'); ?>
<form class="form-horizontal" name="shipping_method">
    <?php if ($shipping_methods) { ?>
        <h3><?php echo $text_shipping_method; ?></h3>
        <?php foreach ($shipping_methods as $shipping_method) { ?>
            <fieldset>
                <legend><?php echo $shipping_method['title']; ?></legend>
                <div class="form-group">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <?php if (!$shipping_method['error']) { ?>
                            <?php foreach ($shipping_method['quote'] as $quote) { ?>
                                <div class="radio">
                                    <label>
                                        <?php if ($quote['code'] == $code || !$code) { ?>
                                            <?php $code = $quote['code']; ?>
                                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked />
                                        <?php } else { ?>
                                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
                                        <?php } ?>
                                        <?php echo $quote['title']; ?>
                                        <b class="text-danger pull-right"><?php echo $quote['text']; ?></b>
                                    </label>
                                </div>
                            <?php } ?>
                        <?php } else { ?>
                            <p class="form-control-static text-warning" role="status"><?php echo $shipping_method['error']; ?></p>
                        <?php } ?>
                    </div>
                </div>
                <br />
            </fieldset>
        <?php } ?>
    <?php } ?>
    <fieldset>
        <legend></legend>
        <br />
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $text_comments; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <textarea class="form-control" name="comment" rows="5" spellcheck><?php echo $comment; ?></textarea>
            </div>
        </div>
    </fieldset>
    <br />
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-shipping-method" class="btn btn-primary" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
    // BIND FORM STORAGE
    $('form[name="shipping_method"]').formStorage({
        prefix: 'order_'
    });
</script>