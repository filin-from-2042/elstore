<form class="form-horizontal" name="payment" action="<?php echo $action; ?>" method="post">
    <input type="hidden" name="VPSProtocol" value="2.23" />
    <input type="hidden" name="TxType" value="<?php echo $transaction; ?>" />
    <input type="hidden" name="Vendor" value="<?php echo $vendor; ?>" />
    <input type="hidden" name="Crypt" value="<?php echo $crypt; ?>" />
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="submit" id="button-confirm" class="btn btn-primary" title="<?php echo $button_confirm; ?>"><?php echo $button_confirm; ?></button>
        </div>
    </div>
</form>