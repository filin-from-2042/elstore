<?php require_once(DIR_APPLICATION .'view/theme/bootstrap3/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>

<div class="col-sm-6 col-xs-12 new-customer well">
    <div class="heading">
        <i class="fa fa-file-text-o"></i>
        <div class="extra-wrap">
            <h2>Новый клиент</h2>
            <strong>Регистрация</strong>
        </div>
    </div>
    <form class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <p class="form-control-static"><?php echo $text_register_account; ?></p>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <a class="btn btn-primary" href="index.php?route=account/register" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
                    <button type="button" id="button-account-guest" class="btn btn-primary" title="<?php echo $text_guest; ?>" data-loading-text="<?php echo $text_guest; ?>..."><?php echo $text_guest; ?></button>
                </div>
            </div>
        </fieldset>
    </form>
</div>

<div class="col-sm-6 col-xs-12 return-customer well">
    <div class="heading">
        <i class="fa fa-key"></i>
        <h2>Зарегистрированный клиент</h2>
        <strong>Войти в Личный Кабинет</strong>
    </div>
    <form class="form-horizontal" name="login" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <fieldset>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_email; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="email" class="form-control" name="email" value="<?php echo (isset($email)?$email:''); ?>" required />
                </div>
            </div>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_password; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="password" class="form-control" name="password" value="<?php echo $password; ?>" pattern="^[a-zA-Z\d]{4,20}$" required />
                </div>
            </div>
            <?php if (isset($redirect)) { ?>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            <?php } ?>
            <div class="form-group">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                    <a class="btn btn-default" href="<?php echo $forgotten; ?>" title="<?php echo $text_forgotten; ?>"><?php echo $text_forgotten; ?></a>
                    <button type="button" id="button-login" class="btn btn-primary" title="<?php echo $button_login; ?>" data-loading-text="<?php echo $button_login; ?>..."><?php echo $button_login; ?></button>
                </div>
            </div>
        </fieldset>
    </form>
</div>

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