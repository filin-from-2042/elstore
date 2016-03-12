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
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?></h1>
                    <p class="lead"><?php echo $text_description; ?></p>
                    <form class="form-horizontal" name="voucher" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_to_name; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="text" class="form-control" name="to_name" value="<?php echo $to_name; ?>" required />
                                <?php if ($error_to_name) { ?>
                                    <span class="text-warning"  role="status"><?php echo $error_to_name; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_to_email; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="email" class="form-control" name="to_email" value="<?php echo $to_email; ?>" required />
                                <?php if ($error_to_email) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_to_email; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_from_name; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="text" class="form-control" name="from_name" value="<?php echo $from_name; ?>" required />
                                <?php if ($error_from_name) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_from_name; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_from_email; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="email" class="form-control" name="from_email" value="<?php echo $from_email; ?>" required />
                                <?php if ($error_from_email) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_from_email; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_theme; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <?php foreach ($voucher_themes as $voucher_theme) { ?>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" <?php echo ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) ? 'checked' : ''; ?> required />
                                            <?php echo $voucher_theme['name']; ?>
                                        </label>
                                    </div>
                                <?php } ?>
                                <?php if ($error_theme) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_theme; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $entry_message; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <textarea class="form-control" name="message" rows="5" spellcheck><?php echo $message; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_amount; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="text" class="form-control" name="amount" value="<?php echo $amount; ?>" required />
                                <?php if ($error_amount) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_amount; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="agree" value="1" <?php echo $agree ? 'checked' : ''; ?> required />
                                    <b class="text-danger">*</b>
                                    <?php echo $text_agree; ?>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <button type="submit" class="btn btn-primary" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></button>
                            </div>
                        </div>
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
    $('form[name="voucher"]').formStorage({
        prefix: 'voucher_',
        check: true
    });
});
</script>
</body>
</html>