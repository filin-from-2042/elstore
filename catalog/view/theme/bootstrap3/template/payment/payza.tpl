<form class="form-horizontal" name="payment" action="<?php echo $action; ?>" method="post">
    <input type="hidden" name="ap_merchant" value="<?php echo $ap_merchant; ?>" />
    <input type="hidden" name="ap_amount" value="<?php echo $ap_amount; ?>" />
    <input type="hidden" name="ap_currency" value="<?php echo $ap_currency; ?>" />
    <input type="hidden" name="ap_purchasetype" value="<?php echo $ap_purchasetype; ?>" />
    <input type="hidden" name="ap_itemname" value="<?php echo $ap_itemname; ?>" />
    <input type="hidden" name="ap_itemcode" value="<?php echo $ap_itemcode; ?>" />
    <input type="hidden" name="ap_returnurl" value="<?php echo $ap_returnurl; ?>" />
    <input type="hidden" name="ap_cancelurl" value="<?php echo $ap_cancelurl; ?>" />
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <button type="submit" id="button-confirm" class="btn btn-primary" title="<?php echo $button_confirm; ?>"><?php echo $button_confirm; ?></button>
        </div>
    </div>
</form>