<?php echo $header; ?>
<div class="container">

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div class="row">
        <div class="col-sm-12">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                </li>
                <?php } ?>
            </ul>
        </div>
        <?php if ($column_left){ ?>
        <aside class="col-sm-3">
            <?php echo $column_left; ?>
        </aside>
        <?php } ?>
        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="Имя" id="input-firstname" class="form-control">
                            <?php if ($error_firstname) { ?>
                            <span class="alert alert-danger"><?php echo $error_firstname; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="Фамилия" id="input-lastname" class="form-control">
                            <?php if ($error_lastname) { ?>
                            <span class="alert alert-danger"><?php echo $error_lastname; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="company" value="" placeholder="<?php echo $company; ?>" id="input-company" class="form-control">
                        </div>
                    </div>

                    <?php if ($company_id_display) { ?>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-company-id"><?php echo $entry_company_id; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="company_id" value="<?php echo $company_id; ?>" id="input-company-id" class="form-control">
                            <?php if ($error_company_id) { ?>
                            <span class="alert alert-danger"><?php echo $error_company_id; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if ($tax_id_display) { ?>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="entry-tax-id"><?php echo $entry_tax_id; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="tax_id" value="<?php echo $tax_id; ?>" id="entry-tax-id" class="form-control">
                            <?php if ($error_tax_id) { ?>
                            <span class="alert alert-danger"><?php echo $error_tax_id; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>

                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control">
                            <?php if ($error_address_1) { ?>
                            <span class="alert alert-danger"><?php echo $error_address_1; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="city" value="<?php echo $city; ?>" placeholder="Город" id="input-city" class="form-control">
                            <?php if ($error_city) { ?>
                            <span class="alert alert-danger"><?php echo $error_city; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control">
                            <?php if ($error_postcode) { ?>
                            <span class="alert alert-danger"><?php echo $error_postcode; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                        <div class="col-sm-10">
                            <select name="country_id" id="input-country" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($countries as $country) { ?>
                                <?php if ($country['country_id'] == $country_id) { ?>
                                <option value="<?php echo $country['country_id']; ?>" data-iso2="<?php echo $country['iso_code_2']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $country['country_id']; ?>" data-iso2="<?php echo $country['iso_code_2']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                            <?php if ($error_country) { ?>
                            <span class="alert alert-danger"><?php echo $error_country; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                        <div class="col-sm-10">
                            <select name="zone_id" id="input-zone" class="form-control"></select>
                            <?php if ($error_zone) { ?>
                            <span class="alert alert-danger"><?php echo $error_zone; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_default; ?></label>
                        <div class="col-sm-10">

                            <?php if ($default) { ?>
                            <label class="radio-inline">
                                <input type="radio" name="default" value="1" checked="checked" />
                                <?php echo $text_yes; ?></label>
                            <label class="radio-inline">
                                <input type="radio" name="default" value="0" />
                                <?php echo $text_no; ?>
                            </label>
                            <?php } else { ?>
                                <label class="radio-inline">
                                    <input type="radio" name="default" value="1" />
                                    <?php echo $text_yes; ?>
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="default" value="0" checked="checked" />
                                    <?php echo $text_no; ?>
                                </label>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons clearfix">
                    <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                    <div class="pull-right">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary">
                    </div>
                </div>
            </form>
            <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<script type="text/javascript"><!--
    $('select[name=\'country_id\']').bind('change', function() {
        $.ajax({
            url: 'index.php?route=account/address/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
            },
            complete: function() {
                $('.wait').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('#postcode-required').show();
                } else {
                    $('#postcode-required').hide();
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'zone_id\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
    //--></script>
<?php echo $footer; ?>