<?php require_once(DIR . THEME .'/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="register">
    <fieldset>
        <legend><?php echo $text_your_details; ?></legend>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_lastname; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="lastname" value="" pattern="^.{1,32}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_firstname; ?><br />
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="firstname" value="" pattern="^.{1,32}$" required />
            </div>
        </div>
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
                <?php echo $entry_telephone; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="tel" class="form-control" name="telephone" value="" pattern="^[\d\s+\-()]{3,32}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_fax; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="tel" class="form-control" name="fax" value="" />
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
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_confirm; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="password" class="form-control" name="confirm" value="" pattern="^[a-zA-Z\d]{3,20}$" required />
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
                <input type="text" class="form-control" name="company" value="" />
            </div>
        </div>
        <div class="form-group <?php echo (count($customer_groups) <= 1) ? 'sr-only' : ''; ?>">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_customer_group; ?>
                <?php echo count($customer_groups); ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <?php foreach ($customer_groups as $customer_group) { ?>
                    <div class="radio">
                        <label>
                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" <?php echo ($customer_group['customer_group_id'] == $customer_group_id) ? 'checked' : ''; ?>/>
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
                <input type="text" class="form-control" name="company_id" value="" pattern="^.+$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_tax_id; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="tax_id" value="" pattern="^.+$" required />
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
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_zone; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <select class="form-control" name="zone_id" pattern="^\d+$" required></select>
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_city; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="city" value="" pattern="^.{2,128}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_address_1; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="address_1" value="" pattern="^.{3,128}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_address_2; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="address_2" value="" />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_postcode; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="postcode" value="<?php echo $postcode; ?>" />
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend></legend>
        <div class="form-group">
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="newsletter" value="1" />
                        <?php echo $entry_newsletter; ?>
                    </label>
                </div>
            </div>
        </div>
        <?php if ($shipping_required) { ?>
            <div class="form-group">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="shipping_address" value="1" checked />
                            <?php echo $entry_shipping; ?>
                        </label>
                    </div>
                </div>
            </div>
        <?php } ?>
    </fieldset>
    <fieldset>
        <legend></legend>
        <?php if ($text_agree) { ?>
            <div class="form-group">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="agree" value="1" />
                            <b class="text-danger">*</b>
                            <?php echo $text_agree; ?>
                        </label>
                    </div>
                </div>
            </div>
        <?php } ?>
    </fieldset>
    <br />
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" class="btn btn-primary" id="button-register" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    // FORM INPUT SUPPORT
    $('form[name="register"]').inputSupport();
    
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
            url: 'index.php?route=checkout/checkout/country',
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
    
    // GET GEO IP
    <?php if ($init_geo_ip) { ?>
        getGeoIp('form[name="register"]');
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