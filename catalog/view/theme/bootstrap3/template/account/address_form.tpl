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
                    <form class="form-horizontal" name="address" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend><?php echo $text_edit_address; ?></legend>
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
                                    <?php echo $entry_company; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="company" value="<?php echo $company; ?>" />
                                </div>
                            </div>
                            <?php if ($company_id_display) { ?>
                                <div class="form-group">
                                    <label class="<?php echo $bootstrap->label; ?>">
                                        <?php echo $entry_company_id; ?>
                                    </label>
                                    <div class="<?php echo $bootstrap->input; ?>">
                                        <input type="text" class="form-control" name="company_id" value="<?php echo $company_id; ?>" />
                                        <?php if ($error_company_id) { ?>
                                            <span class="text-warning" role="status"><?php echo $error_company_id; ?></span>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($tax_id_display) { ?>
                                <div class="form-group">
                                    <label class="<?php echo $bootstrap->label; ?>">
                                        <?php echo $entry_tax_id; ?>
                                    </label>
                                    <div class="<?php echo $bootstrap->input; ?>">
                                        <input type="text" class="form-control" name="tax_id" value="<?php echo $tax_id; ?>" />
                                        <?php if ($error_tax_id) { ?>
                                            <span class="text-warning" role="status"><?php echo $error_tax_id; ?></span>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
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
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_default; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                        <label class="radio-inline">
                                            <input type="radio" name="default" value="1" <?php echo $default ? 'checked' : ''; ?> />
                                            <?php echo $text_yes; ?>
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="default" value="0" <?php echo !$default ? 'checked' : ''; ?> />
                                            <?php echo $text_no; ?>
                                        </label>
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
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="address"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=account/address/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // BIND FORM STORAGE
    $('form[name="address"]').formStorage({
        prefix: 'user_',
        check: true
    });
    
    // TRIGGER INPUTS
    $('select[name="country_id"]', 'form[name="address"]').change();
});
</script>
</body>
</html>