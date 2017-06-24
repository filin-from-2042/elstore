<?php require_once(DIR_APPLICATION .'view/theme/bootstrap3/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="guest_shipping">
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
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-guest-shipping" class="btn btn-primary" title="<?php echo $button_continue; ?>" data-loading-text="<?php echo $button_continue; ?>..."><?php echo $button_continue; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="guest_shipping"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=checkout/checkout/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // GET GEO IP
    <?php if ($init_geo_ip) { ?>
        getGeoIp('form[name="guest_shipping"]');
    <?php } ?>
    
    // BIND FORM STORAGE
    $('form[name="guest_shipping"]').formStorage({
        prefix: 'shipping_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('select[name="country_id"]', 'form[name="guest_shipping"]').change();
});
</script>