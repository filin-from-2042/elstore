<?php require_once(DIR_APPLICATION .'view/theme/bootstrap3/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="guest">
    <fieldset>
        <legend><?php echo $text_your_details; ?></legend>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_lastname; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="lastname" value="<?php echo $lastname; ?>" pattern="^.{1,32}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_firstname; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="firstname" value="<?php echo $firstname; ?>" pattern="^.{1,32}$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_email; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="email" class="form-control" name="email" value="<?php echo $email; ?>" pattern="^.+@.+\..+$" required />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <b class="text-danger">*</b>
                <?php echo $entry_telephone; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="tel" class="form-control" name="telephone" value="<?php echo $telephone; ?>" pattern="^[\d\s+\-()]{3,32}$" required />
            </div>
        </div>

    </fieldset>


    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-guest" class="btn btn-primary" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    // FORM INPUT SUPPORT
    $('form[name="guest"]').inputSupport();
    
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
    
    $('input[name="customer_group_id"]', 'form[name="guest"]').change(function() {
        getCustomerGroup.call(this, customer_groups);
    });
    
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="guest"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=checkout/checkout/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // GET GEO IP
    <?php if ($init_geo_ip) { ?>
        getGeoIp('form[name="guest"]');
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="guest"]').formStorage({
        prefix: 'guest_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('input[name="customer_group_id"]:checked', 'form[name="guest"]').change();
    
    $('select[name="country_id"]', 'form[name="guest"]').change();
});
</script>