<form class="form-horizontal" name="payment" action="<?php echo $action; ?>" method="post">
    <input type="hidden" name="operation_xml" value="<?php echo $xml; ?>">
    <input type="hidden" name="signature" value="<?php echo $signature; ?>">
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="submit" id="button-confirm" class="btn btn-primary" title="<?php echo $button_confirm; ?>"><?php echo $button_confirm; ?></button>
        </div>
    </div>
</form>