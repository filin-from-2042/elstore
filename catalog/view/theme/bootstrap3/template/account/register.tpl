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
                    <p class="lead"><?php echo $text_account_already; ?></p>
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
                            <div class="form-group <?php echo (count($customer_groups) <= 1) ? 'sr-only' : ''; ?>">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_customer_group; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" <?php echo ($customer_group['customer_group_id'] == $customer_group_id) ? 'checked' : ''; ?> />
                                                <?php echo $customer_group['name']; ?>
                                            </label>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_company_id; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="company_id" value="<?php echo $company_id; ?>" required />
                                    <?php if ($error_company_id) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_company_id; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_tax_id; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="tax_id" value="<?php echo $tax_id; ?>" required />
                                    <?php if ($error_tax_id) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_tax_id; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_country; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <select class="form-control" name="country_id" pattern="^\d+$" required>
                                        <option value=""><?php echo $text_select; ?></option>
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
                            <legend><?php echo $text_your_password; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <b class="text-danger">*</b>
                                    <?php echo $entry_password; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="password" class="form-control" name="password" value="" pattern="^[a-zA-Z\d]{4,20}$" required />
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
                                    <input type="password" class="form-control" name="confirm" value="" pattern="^[a-zA-Z\d]{4,20}$" required />
                                    <?php if ($error_confirm) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_confirm; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><?php echo $text_newsletter; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_newsletter; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <label class="radio-inline">
                                        <input type="radio" name="newsletter" value="1" <?php echo $newsletter ? 'checked' : ''; ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="newsletter" value="0" <?php echo !$newsletter ? 'checked' : ''; ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
                            </div>
                        </fieldset>
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
                        <br />
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
    // GET CUSTOMER GROUP
    var customer_groups = [];
	
    <?php foreach ($customer_groups as $customer_group) { ?>
        customer_groups[<?php echo $customer_group['customer_group_id']; ?>] = {
            company_id_display: '<?php echo $customer_group['company_id_display']; ?>',
            company_id_required: '<?php echo $customer_group['company_id_required']; ?>',
            tax_id_display: '<?php echo $customer_group['tax_id_display']; ?>',
            tax_id_required: '<?php echo $customer_group['tax_id_required']; ?>'
        };
    <?php } ?>
    
    $('input[name="customer_group_id"]', 'form[name="register"]').change(function() {
        getCustomerGroup.call(this, customer_groups);
    });
    
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="register"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=account/register/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
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
    $('input[name="customer_group_id"]:checked', 'form[name="register"]').change();
    
    $('select[name="country_id"]', 'form[name="register"]').change();
});
</script>
</body>
</html>