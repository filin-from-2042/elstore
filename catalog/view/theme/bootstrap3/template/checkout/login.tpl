<?php require_once(DIR . THEME .'/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="login">
    <fieldset>
        <legend><?php echo $text_returning_customer; ?></legend>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_email; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="email" class="form-control" name="email" value="" pattern="^.+@.+\..+$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_password; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="password" class="form-control" name="password" value="" pattern="^[a-zA-Z\d]{4,20}$" required />
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                <a class="btn btn-default" href="<?php echo $forgotten; ?>" title="<?php echo $text_forgotten; ?>"><?php echo $text_forgotten; ?></a>
                <button type="button" id="button-login" class="btn btn-primary" title="<?php echo $button_login; ?>" data-loading-text="<?php echo $button_login; ?>..."><?php echo $button_login; ?></button>
            </div>
        </div>
    </fieldset>
</form>
<form class="form-horizontal">
    <fieldset>
        <legend><?php echo $text_new_customer; ?></legend>
        <br />
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                <button type="button" id="button-account-register" class="btn btn-primary" title="<?php echo $text_register; ?>" data-loading-text="<?php echo $text_register; ?>..."><?php echo $text_register; ?></button>
                <button type="button" id="button-account-guest" class="btn btn-primary" title="<?php echo $text_guest; ?>" data-loading-text="<?php echo $text_guest; ?>..."><?php echo $text_guest; ?></button>
            </div>
        </div>
    </fieldset>
</form>
<!-- js -->
<script>
jQuery(function($) {
    // FORM INPUT SUPPORT
    $('form[name="login"]').inputSupport();
    
    // BIND FORM STORAGE
    $('form[name="login"]').formStorage({
        prefix: 'user_',
        check: true
    });
});
</script>