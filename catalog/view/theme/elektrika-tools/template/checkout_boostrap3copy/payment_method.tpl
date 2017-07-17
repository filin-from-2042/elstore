<script language="Javascript" type="text/javascript">
    $(document).ready(function(){
        $('#button-payment-method').trigger('click');
    });
</script>
<?php require_once(DIR_APPLICATION .'view/theme/bootstrap3/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
<form class="form-horizontal" name="payment_method">
    <?php if ($payment_methods) { ?>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $text_payment_method; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <?php foreach ($payment_methods as $payment_method) { ?>
                    <div class="radio">
                        <label>
                            <?php if ($payment_method['code'] == $code || !$code) { ?>
                                <?php $code = $payment_method['code']; ?>
                                <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked />
                            <?php } else { ?>
                                <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
                            <?php } ?>
                            <?php echo $payment_method['title']; ?>
                        </label>
                    </div>
                <?php } ?>
            </div>
        </div>
        <br />
    <?php } ?>
    <div class="form-group">
        <label class="<?php echo $bootstrap->label; ?>">
            <?php echo $text_comments; ?>
        </label>
        <div class="<?php echo $bootstrap->input; ?>">
            <textarea class="form-control" name="comment" rows="8" spellcheck><?php echo $comment; ?></textarea>
        </div>
    </div>
    <?php if ($text_agree) { ?>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="radio">
                    <label>
                        <input type="checkbox" name="agree" value="1" checked="checked" />
                        <b class="text-danger">*</b>
                        <?php echo $text_agree; ?>
                    </label>
                </div>
            </div>
        </div>
    <?php } ?>
    <br />
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-payment-method" class="btn btn-primary" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($){
    /** GET TERMS */
    window.getTerms = function(e) {
        e.preventDefault();

        oc.modal.html({
            html: '<p>...</p>'
        }).show();

        var url = 'index.php?route=information/information/info&information_id=' + e.data.information_id;

        $.get(url, function(html) {
            oc.modal.html({
                title: $(html).filter('h1').html(),
                html: html
            });
        }, 'html');
    };

    // GET TERMS
    <?php preg_match('/information_id=(\d+)/', $text_agree, $agree_url); ?>
    <?php if (isset($agree_url[1])) { ?>
        $('input[name="agree"]', 'form[name="payment_method"]').siblings('a.colorbox').click({ information_id: '<?php echo $agree_url[1]; ?>' }, getTerms);
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="payment_method"]').formStorage({
        prefix: 'order_'
    });
});
</script>