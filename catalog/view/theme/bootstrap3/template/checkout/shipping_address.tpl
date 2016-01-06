<?php require_once('/../../config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="shipping_address">
    <input type="hidden" name="shipping_address" value="existing" pattern="^(existing|new)$" required />
    <?php if ($addresses) { ?>
        <ul id="shipping-tabs" class="nav nav-tabs nav-justified">
            <li class="active">
                <a href="#tab-shipping_existing" title="<?php echo $text_address_existing; ?>" data-toggle="tab"><?php echo $text_address_existing; ?></a>
            </li>
            <li>
                <a href="#tab-shipping_new" title="<?php echo $text_address_new; ?>" data-toggle="tab"><?php echo $text_address_new; ?></a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-shipping_existing" class="tab-pane active">
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
            <div id="tab-shipping_new" class="tab-pane">
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
    <?php } ?>
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-shipping-address" class="btn btn-primary" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    // SHIPPING ADDRESS
    <?php if ($addresses) { ?>
        $('#shipping-tabs a').click(function() {
            var shipping = this.hash.split('_').slice(-1)[0];
            
            $(':input[required]', 'form[name="shipping_address"]').attr('required', false);
            $(':input[pattern], :input[data-pattern]', '#tab-shipping_' + shipping).attr('required', true);
            
            $('input[name="shipping_address"]', 'form[name="shipping_address"]').val(shipping);
            
            if (window.sessionStorage) window.sessionStorage.setItem('shipping_shipping_address', shipping);
        });
    <?php } ?>
    
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="shipping_address"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=checkout/checkout/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // GET GEO IP
    <?php if ($init_geo_ip) { ?>
        getGeoIp('form[name="shipping_address"]');
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="shipping_address"]').formStorage({
        prefix: 'shipping_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('select[name="country_id"]', 'form[name="shipping_address"]').change();
    
    <?php if ($addresses) { ?>
        if (window.sessionStorage && window.sessionStorage['shipping_shipping_address']) {
            $('#shipping-tabs a[href$="#tab-shipping_' + window.sessionStorage['shipping_shipping_address'] + '"]').click();
        } else {
            $('#shipping-tabs a:first').click();
        }
    <?php } ?>
});
</script>