<?php include('/../module/notification.tpl'); ?>
<?php require_once('/../../config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="payment">
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <img src="https://cdn.klarna.com/public/images/<?php echo $iso_code_2; ?>/badges/v1/invoice/<?php echo $iso_code_2; ?>_invoice_badge_std_blue.png?width=150&eid=<?php echo $merchant ?>" />
        </div>
    </div>
    <fieldset>
        <legend><?php echo $text_additional; ?></legend>
        <?php if (!$company) { ?>
            <?php if ($iso_code_3 == 'DEU' || $iso_code_3 == 'NLD') { ?>
                <div class="form-group">
                    <label class="<?php echo $bootstrap->label; ?>">
                        <?php echo $entry_dob; ?>
                    </label>
                    <div class="<?php echo $bootstrap->input; ?>">
                        <select class="form-control" name="pno_day">
                            <option value=""><?php echo $text_day; ?></option>
                            <?php foreach ($days as $day) { ?>
                                <option value="<?php echo $day['value']; ?>"><?php echo $day['text']; ?></option>
                            <?php } ?>
                        </select>
                        <select class="form-control" name="pno_month">
                            <option value=""><?php echo $text_month; ?></option>
                            <?php foreach ($months as $month) { ?>
                                <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
                            <?php } ?>
                        </select>
                        <select class="form-control" name="pno_year">
                            <option value=""><?php echo $text_year; ?></option>
                            <?php foreach ($years as $year) { ?>
                                <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            <?php } else { ?>
                <div class="form-group">
                    <label class="<?php echo $bootstrap->label; ?>">
                        <?php echo $entry_pno; ?>
                    </label>
                    <div class="<?php echo $bootstrap->input; ?>">
                        <input type="text" class="form-control" name="pno" value="" />
                    </div>
                </div>
            <?php } ?>
        <?php } else { ?>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_company; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="text" class="form-control" name="pno" value="" />
                </div>
            </div>
        <?php } ?>
        <?php if ($iso_code_3 == 'DEU' || $iso_code_3 == 'NLD') { ?>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_gender; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <label class="radio-inline">
                        <input type="radio" name="gender" value="1" id="male" />
                        <?php echo $text_male; ?>
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" value="0" id="female" />
                        <?php echo $text_female; ?>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_street; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="text" class="form-control" name="street" value="<?php echo $street; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_house_no; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="text" class="form-control" name="house_no" value="<?php echo $street_number; ?>" />
                </div>
            </div>
        <?php } ?>
        <?php if ($iso_code_3 == 'NLD') { ?>
            <div class="form-group">
                <label class="<?php echo $bootstrap->label; ?>">
                    <?php echo $entry_house_ext; ?>
                </label>
                <div class="<?php echo $bootstrap->input; ?>">
                    <input type="text" class="form-control" name="house_ext" value="<?php echo $street_extension; ?>" />
                </div>
            </div>
        <?php } ?>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_phone_no; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="phone_no" value="<?php echo $phone_number; ?>" />
            </div>
        </div>
        <?php if ($iso_code_3 == 'DEU') { ?>
            <div class="form-group">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-push-4 col-md-push-4 col-lg-push-4">
                    <label class="radio-inline">
                        <input type="checkbox" name="deu_terms" value="1" />
                        Mit der Übermittlung der für die Abwicklung des Rechnungskaufes und einer Identitäts - und Bonitätsprüfung erforderlichen Daten an Klarna bin ich einverstanden. Meine <a href="https://online.klarna.com/consent_de.yaws" target="_blank">Einwilligung</a> kann ich jederzeit mit Wirkung für die Zukunft widerrufen.
                    </label>
                </div>
            </div>
        <?php } ?>
    </fieldset>
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="button" id="button-confirm" class="btn btn-primary" title="<?php echo $button_confirm; ?>" data-loading-text="<?php echo $button_confirm; ?>..."><?php echo $button_confirm; ?></button>
        </div>
    </div>
</form>
<!-- js -->
<script>
jQuery(function($) {
    $('#button-confirm').on('click', function() {
        $.ajax({
            url: 'index.php?route=payment/klarna_invoice/send',
            type: 'post',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (json.error) {
                    $(this).stepWarning(json.error);
                }
            }
        });
    });
});
</script>