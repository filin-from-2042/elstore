<?php require_once('/../../config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<form class="form-horizontal" name="payment">
    <fieldset>
        <legend><?php echo $text_credit_card; ?></legend>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_cc_number; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="cc_number" value="" />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_cc_start_date; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <select class="form-control" name="cc_start_date_month">
                    <?php foreach ($months as $month) { ?>
                        <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
                    <?php } ?>
                </select>
                <span class="help-block">/</span>
                <select class="form-control" name="cc_start_date_year">
                    <?php foreach ($year_valid as $year) { ?>
                        <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
                    <?php } ?>
                </select>
                <span class="help-block"><?php echo $text_start_date; ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_cc_expire_date; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <select class="form-control" name="cc_expire_date_month">
                    <?php foreach ($months as $month) { ?>
                        <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
                    <?php } ?>
                </select>
                <span class="help-block">/</span>
                <select class="form-control" name="cc_expire_date_year">
                    <?php foreach ($year_expire as $year) { ?>
                        <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_cc_cvv2; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="cc_cvv2" value="" />
            </div>
        </div>
        <div class="form-group">
            <label class="<?php echo $bootstrap->label; ?>">
                <?php echo $entry_cc_issue; ?>
            </label>
            <div class="<?php echo $bootstrap->input; ?>">
                <input type="text" class="form-control" name="cc_issue" value="" />
                <span class="help-block"><?php echo $text_issue; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                <button type="button" id="button-confirm" class="btn btn-primary" title="<?php echo $button_confirm; ?>" data-loading-text="<?php echo $button_confirm; ?>..."><?php echo $button_confirm; ?></button>
            </div>
        </div>
    </fieldset>
</form>
<!-- js -->
<script>
jQuery(function($) {
    /** Confirm */
    $('#button-confirm').click(function() {
        $.ajax({
            async: false,
            url: 'index.php?route=payment/perpetual_payments/send',
            type: 'post',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.success) {
                    location = json.success;
                } else if (json.error) {
                    $(this).stepWarning(json.error);
                }
            }
        });
    });
});
</script>