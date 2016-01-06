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
                    <form class="form-horizontal" name="payment" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend><?php echo $text_your_payment; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_tax; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="tax" value="<?php echo $tax; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_payment; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="payment" value="cheque" <?php echo ($payment == 'cheque') ? 'checked' : ''; ?>/>
                                            <?php echo $text_cheque; ?>
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="payment" value="paypal" <?php echo ($payment == 'paypal') ? 'checked' : ''; ?> />
                                            <?php echo $text_paypal; ?>
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="payment" value="bank" <?php echo ($payment == 'bank') ? 'checked' : ''; ?> />
                                            <?php echo $text_bank; ?>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group payment payment-cheque">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_cheque; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="cheque" value="<?php echo $cheque; ?>" />
                                </div>
                            </div>
                            <div class="form-group payment payment-paypal">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_paypal; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="paypal" value="<?php echo $paypal; ?>" />
                                </div>
                            </div>
                            <div class="form-group payment payment-bank">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_bank_name; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="bank_name" value="<?php echo $bank_name; ?>" />
                                </div>
                            </div>
                            <div class="form-group payment payment-bank">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_bank_branch_number; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" />
                                </div>
                            </div>
                            <div class="form-group payment payment-bank">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_bank_swift_code; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" />
                                </div>
                            </div>
                            <div class="form-group payment payment-bank">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_bank_account_name; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="bank_account_name" value="<?php echo $bank_account_name; ?>" />
                                </div>
                            </div>
                            <div class="form-group payment payment-bank">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_bank_account_number; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="bank_account_number" value="<?php echo $bank_account_number; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                    <a class="btn btn-default" href="<?php echo $back; ?>" title="<?php echo $button_back; ?>"><?php echo $button_back; ?></a>
                                    <button type="submit" class="btn btn-primary" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></button>
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
    // PAYMENT TYPE
    $('input[name="payment"]', 'form[name="register"]').change(function() {
        $('div.form-group.payment', this.form).state('none').find(':input[required]').attr('required', false);
        $('div.form-group.payment.payment-' + this.value, this.form).state(false).find(':input[pattern], :input[data-pattern]').attr('required', true);
    });
    
    // BIND FORM STORAGE
    $('form[name="register"]').formStorage({
        prefix: 'register_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('input[name="payment"]:checked', 'form[name="register"]').change();
});
</script>
</body>
</html>