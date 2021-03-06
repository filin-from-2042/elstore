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
                    <p class="lead"><?php echo $text_account_already; ?></p>
                    <p class="lead"><?php echo $text_signup; ?></p>
                    <form class="form-horizontal" name="register" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend><?php echo $text_your_details; ?></legend>
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
                                    <?php echo $entry_fax; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="tel" class="form-control" name="fax" value="<?php echo $fax; ?>" />
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><?php echo $text_your_address; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_company; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="company" value="<?php echo $company; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_website; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="url" class="form-control" name="website" value="<?php echo $website; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_country; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <select class="form-control" name="country_id" pattern="^\d+$" required>
                                        <option value="false"><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                            <option value="<?php echo $country['country_id']; ?>" data-iso2="<?php echo $country['iso_code_2']; ?>" <?php echo ($country['country_id'] == $country_id) ? 'selected' : ''; ?>><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                    </select>
                                    <?php if ($error_country) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_country; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_zone; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <select class="form-control" name="zone_id" pattern="^\d+$" required></select>
                                    <?php if ($error_zone) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_zone; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_city; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="city" value="<?php echo $city; ?>" pattern="^.{2,128}$" required />
                                    <?php if ($error_city) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_city; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_address_1; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="address_1" value="<?php echo $address_1; ?>" pattern="^.{3,128}$" required />
                                    <?php if ($error_address_1) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_address_1; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_address_2; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="address_2" value="<?php echo $address_2; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_postcode; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="postcode" value="<?php echo $postcode; ?>" pattern="^.{2,10}$" required />
                                    <?php if ($error_postcode) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_postcode; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><?php echo $text_payment; ?></legend>
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
                        </fieldset>
                        <fieldset>
                            <label><?php echo $text_your_password; ?></label>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_password; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="password" class="form-control" name="password" value="<?php echo $password; ?>" pattern="^[a-zA-Z\d]{4,20}$" required />
                                    <?php if ($error_password) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_password; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_confirm; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="password" class="form-control" name="confirm" value="<?php echo $confirm; ?>" pattern="^[a-zA-Z\d]{4,20}$" required />
                                    <?php if ($error_confirm) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_confirm; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <?php if ($text_agree) { ?>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="agree" value="1" <?php echo $agree ? 'checked' : ''; ?> required />
                                            <b class="text-danger">*</b>
                                            <?php echo $text_agree; ?>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
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
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="register"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=affiliate/register/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // PAYMENT TYPE
    $('input[name="payment"]', 'form[name="register"]').change(function() {
        $('div.form-group.payment', this.form).state('none').find(':input[required]').attr('required', false);
        $('div.form-group.payment.payment-' + this.value, this.form).state(false).find(':input[pattern], :input[data-pattern]').attr('required', true);
    });
    
    // GET TERMS
    <?php preg_match('/information_id=(\d+)/', $text_agree, $agree_url); ?>
    <?php if (isset($agree_url[1])) { ?>
        $('input[name="agree"]', 'form[name="register"]').siblings('a.colorbox').click({ information_id: '<?php echo $agree_url[1]; ?>' }, getTerms);
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="register"]').formStorage({
        prefix: 'user_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('select[name="country_id"]', 'form[name="register"]').change();
    
    $('input[name="payment"]:checked', 'form[name="register"]').change();
});
</script>
</body>
</html>