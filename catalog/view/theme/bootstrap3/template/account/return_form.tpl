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
                    <?php echo $text_description; ?>
                    <br />
                    <form class="form-horizontal" name="return" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend><?php echo $text_order; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_lastname; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="lastname" value="<?php echo $lastname; ?>" pattern="^.{1,32}$" required />
                                    <?php if ($error_lastname) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_lastname; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_firstname; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="firstname" value="<?php echo $firstname; ?>" pattern="^.{1,32}$" required />
                                    <?php if ($error_firstname) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_firstname; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_email; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="email" class="form-control" name="email" value="<?php echo $email; ?>" required />
                                    <?php if ($error_email) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_email; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_telephone; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="tel" class="form-control" name="telephone" value="<?php echo $telephone; ?>" required />
                                    <?php if ($error_telephone) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_telephone; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_order_id; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="order_id" value="<?php echo $order_id; ?>" required />
                                    <?php if ($error_order_id) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_order_id; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_date_ordered; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="date_ordered" value="<?php echo $date_ordered; ?>" />
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><?php echo $text_product; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_product; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="product" value="<?php echo $product; ?>" required />
                                    <?php if ($error_product) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_product; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_model; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="model" value="<?php echo $model; ?>" required />
                                    <?php if ($error_model) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_model; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_quantity; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="number" class="form-control" name="quantity" value="<?php echo $quantity; ?>" min="1" style="width: 85px;" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_reason; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <?php foreach ($return_reasons as $return_reason) { ?>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" <?php echo ($return_reason['return_reason_id'] == $return_reason_id) ? 'checked' : ''; ?>required />
                                                <?php echo $return_reason['name']; ?>
                                            </label>
                                        </div>
                                    <?php } ?>
                                    <?php if ($error_reason) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_reason; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_opened; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <label class="radio-inline">
                                        <input type="radio" name="opened" value="1" <?php echo $opened ? 'checked' : ''; ?>/>
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="opened" value="0" <?php echo !$opened ? 'checked' : ''; ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_fault_detail; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <textarea name="comment" class="form-control" rows="6" spellcheck><?php echo $comment; ?></textarea>
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $entry_captcha; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <div class="captcha-group input-group">
                                    <div class="input-group-btn">
                                        <img src="index.php?route=account/return/captcha" alt="captcha" />
                                        <button type="button" class="btn btn-default" name="reCaptcha" style="margin-left: -3px;"><span class="glyphicon glyphicon-refresh"></span></button>
                                    </div>
                                    <input type="text" class="form-control" name="captcha" value="<?php echo $captcha; ?>" style="min-width: 75px;" pattern="^.{6}$" required />
                                </div>
                                <?php if ($error_captcha) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_captcha; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <?php if ($text_agree) { ?>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="agree" value="1" <?php echo $agree ? 'checked' : ''; ?> required />
                                        <b class="text-danger">*</b>
                                        <?php echo $text_agree; ?>
                                    </label>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <a class="btn btn-default" href="<?php echo $back; ?>" title="<?php echo $button_back; ?>"><?php echo $button_back; ?></a>
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
<script src="<?php echo THEME_JS_JQUERYUI; ?>"></script>
<script>
jQuery(function($) {
    // DATE & TIME FORMAT
    $('head').append('<link rel="stylesheet" href="<?php echo THEME_CSS_JQUERYUI; ?>" />');
    
    $('input[name="date_ordered"]', 'form[name="return"]').datepicker({dateFormat: 'yy-mm-dd'});
    
    // BIND INPUT CAPTCHA
    $('button[name="reCaptcha"]', 'form[name="return"]').click(function() {
        $(this).closest('div.captcha-group')
            .state(false)
            .find('img').attr('src', 'index.php?route=account/return/captcha/' + new Date().getTime()).end()
            .find('input[name="captcha"]').val('');
    });
    
    // GET TERMS
    <?php preg_match('/information_id=(\d+)/', $text_agree, $agree_url); ?>
    <?php if (isset($agree_url[1])) { ?>
        $('input[name="agree"]', 'form[name="return"]').siblings('a.colorbox').click({ information_id: '<?php echo $agree_url[1]; ?>' }, getTerms);
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="return"]').formStorage({
        prefix: 'return_<?php echo $order_id; ?>_',
        check: true
    });
});
</script> 
</body>
</html>