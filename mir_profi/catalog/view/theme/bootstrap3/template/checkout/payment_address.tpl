<?php require_once('/../../config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="payment_address">
    <input type="hidden" name="payment_address" value="existing" pattern="^(existing|new)$" required />
    <?php if ($addresses) { ?>
        <ul id="payment-tabs" class="nav nav-tabs nav-justified">
            <li class="active">
                <a href="#tab-payment_existing" title="<?php echo $text_address_existing; ?>" data-toggle="tab"><?php echo $text_address_existing; ?></a>
            </li>
            <li>
                <a href="#tab-payment_new" title="<?php echo $text_address_new; ?>" data-toggle="tab"><?php echo $text_address_new; ?></a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-payment_existing" class="tab-pane active">
                <div class="form-group">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <select name="address_id" class="form-control" size="5" pattern="^\d+$" required>
                            <?php foreach ($addresses as $address) { ?>
                                <?php $val = $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['zone'] . ', ' . $address['country']; ?>
                                <option value="<?php echo $address['address_id']; ?>" title="<?php echo str_replace('"', '', $val); ?>" <?php echo ($address['address_id'] == $address_id) ? 'selected' : ''; ?>><?php echo $val; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            </div>
            <div id="tab-payment_new" class="tab-pane">
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
                        <?php echo $entry_firstname; ?>
                    </label>
                    <div class="<?php echo $bootstrap->input; ?>">
                        <input type="text" class="form-control" name="firstname" value="" pattern="^.{1,32}$" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="<?php echo $bootstrap->label; ?>">
                        <?php echo $entry_company; ?>
                    </label>
                    <div class="<?php echo $bootstrap->input; ?>">
                        <input type="text" class="form-control" name="company" value="" />
                    </div>
                </div>
                <?php if ($company_id_display) { ?>
                    <div class="form-group">
                        <label class="<?php echo $bootstrap->label; ?>">
                            <b class="text-danger <?php echo $company_id_required ? '' : 'sr-only'; ?>">*</b>
                            <?php echo $entry_company_id; ?>
                        </label>
                        <div class="<?php echo $bootstrap->input; ?>">
                            <input type="text" class="form-control" name="company_id" value="" <?php echo $company_id_required ? 'pattern="^.+$" required' : ''; ?> />
                        </div>
                    </div>
                <?php } ?>
                <?php if ($tax_id_display) { ?>
                    <div class="form-group">
                        <label class="<?php echo $bootstrap->label; ?>">
                            <b class="text-danger <?php echo $tax_id_required ? '' : 'sr-only'; ?>">*</b>
                            <?php echo $entry_tax_id; ?>
                        </label>
                        <div class="<?php echo $bootstrap->input; ?>">
                            <input type="text" class="form-control" name="tax_id" value="" <?php echo $tax_id_required ? 'pattern="^.+$" required' : ''; ?> />
                        </div>
                    </div>
                <?php } ?>
                <div class="form-group">
                    <label class="<?php echo $bootstrap->label; ?>">
                        <b class="text-danger">*</b>
                        <?php echo $entry_country; ?>
                    </label>
                    <div class="<?php echo $bootstrap->input; ?>">
                        <select name="country_id" class="form-control" pattern="^\d+$" required>
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
                        <select name="zone_id" class="form-control" pattern="^\d+$" required></select>
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
                        <input type="text" class="form-control" name="postcode" value="" />
                    </div>
                </div>
            </div>
        </div>
    <?php } else { ?>
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
                <?php echo $entry_firstname; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="firstname" value="" pattern="^.{1,32}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_company; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="company" value="" />
            </div>
        </div>
        <?php if ($company_id_display) { ?>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <b class="text-danger <?php echo $company_id_required ? '' : 'sr-only'; ?>">*</b>
                    <?php echo $entry_company_id; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="text" class="form-control" name="company_id" value="" <?php echo $company_id_required ? 'pattern="^.+$" required' : ''; ?> />
                </div>
            </div>
        <?php } ?>
        <?php if ($tax_id_display) { ?>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <b class="text-danger <?php echo $tax_id_required ? '' : 'sr-only'; ?>">*</b>
                    <?php echo $entry_tax_id; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="text" class="form-control" name="tax_id" value="" <?php echo $tax_id_required ? 'pattern="^.+$" required' : ''; ?> />
                </div>
            </div>
        <?php } ?>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_country; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <select name="country_id" class="form-control" pattern="^\d+$" required>
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
                <select name="zone_id" class="form-control" pattern="^\d+$" required></select>
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
                <input type="text" class="form-control" name="postcode" value="" />
            </div>
        </div>
    <?php } ?>
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-payment-address" class="btn btn-primary" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    // PAYMENT ADDRESS
    <?php if ($addresses) { ?>
        $('#payment-tabs a').click(function() {
            var payment = this.hash.split('_').slice(-1)[0];
            
            $(':input[required]', 'form[name="payment_address"]').attr('required', false);
            $(':input[pattern], :input[data-pattern]', '#tab-payment_' + payment).attr('required', true);
            
            $('input[name="payment_address"]', 'form[name="payment_address"]').val(payment);
            
            if (window.sessionStorage) window.sessionStorage.setItem('user_payment_address', payment);
        });
    <?php } ?>
    
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="payment_address"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=checkout/checkout/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // GET GEO IP
    <?php if ($init_geo_ip) { ?>
        getGeoIp('form[name="payment_address"]');
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="payment_address"]').formStorage({
        prefix: 'user_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('select[name="country_id"]', 'form[name="payment_address"]').change();
    
    <?php if ($addresses) { ?>
        if (window.sessionStorage && window.sessionStorage['user_payment_address']) {
            $('#payment-tabs a[href$="#tab-payment_' + window.sessionStorage['user_payment_address'] + '"]').click();
        } else {
            $('#payment-tabs a:first').click();
        }
    <?php } ?>
});
</script>