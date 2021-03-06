<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container">
    <div class="row">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">

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
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <a class="btn btn-primary" href="<?php echo $register; ?>" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
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
                                        <input type="email" class="form-control" name="email" value="<?php echo $email; ?>" required />
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
                                        <a href="<?php echo $forgotten; ?>" title="<?php echo $text_forgotten; ?>"><?php echo $text_forgotten; ?></a>
                                        <button type="submit" class="btn btn-primary" title="<?php echo $button_login; ?>"><?php echo $button_login; ?></button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <!-- heading title -->



                </div>
            </div>
            <br />
            <!-- bottom -->
            <?php if ($content_bottom) { ?>
                <div id="bottom" class="row"><div class="<?php echo $bootstrap->bottom; ?>"><?php echo $content_bottom; ?></div></div>
            <?php } ?>
        </div>
        <!-- left -->
        <?php if ($column_left) { ?>
            <div id="left" class="<?php echo $bootstrap->left; ?>"><?php echo $column_left; ?></div>
        <?php } ?>
        <!-- right -->
        <?php if ($column_right) { ?>
            <div id="right" class="<?php echo $bootstrap->right; ?>"><?php echo $column_right; ?></div>
        <?php } ?>
    </div>
</div>
<!-- footer -->
<?php echo $footer; ?>
<!-- js -->
<script>
jQuery(function($) {
    // BIND FORM STORAGE
    $('form[name="login"]').formStorage({
        prefix: 'user_',
        check: true
    });
});
</script>
</body>
</html>