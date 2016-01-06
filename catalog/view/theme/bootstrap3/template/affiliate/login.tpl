<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include('/../module/notification.tpl'); ?>
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
            <?php include('/../module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?></h1>
                    <?php echo $text_description; ?>
                    <h2><?php echo $text_returning_affiliate; ?></h2>
                    <p class="lead"><?php echo $text_i_am_returning_affiliate; ?></p>
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
                            <?php if ($redirect) { ?>
                                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                            <?php } ?>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                    <a class="btn btn-default" href="<?php echo $forgotten; ?>" title="<?php echo $text_forgotten; ?>"><?php echo $text_forgotten; ?></a>
                                    <button type="submit" class="btn btn-primary" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <h2><?php echo $text_new_affiliate; ?></h2>
                    <p class="lead"><?php echo $text_register_account; ?></p>
                    <form class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                    <a class="btn btn-primary" href="<?php echo $register; ?>" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
                                </div>
                            </div>
                        </fieldset>
                    </form>
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