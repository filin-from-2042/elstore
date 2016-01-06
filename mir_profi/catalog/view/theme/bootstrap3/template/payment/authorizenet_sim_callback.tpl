<h2><?php echo $x_response_reason_text; ?></h2>
<?php if($x_response_code == '1') { ?>
    <p>Your payment was processed successfully. Here is your receipt:</p>
    <pre><?php echo $exact_ctr; ?></pre>
    <?php if(!empty($exact_issname)) { ?>
        <p>Issuer: <?php echo $exact_issname; ?><br/>Confirmation Number: <?php echo $exact_issconf; ?></p>
    <?php } ?>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <a id="button-confirm" class="btn btn-primary" href="<?php echo $confirm; ?>" title="<?php echo $button_confirm; ?>"><?php echo $button_confirm; ?></a>
        </div>
    </div>
<?php } elseif($_REQUEST['x_response_code'] == '2') { ?>
    <p>Your payment failed.  Here is your receipt.</p>
    <pre><?php echo $exact_ctr; ?></pre>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <a class="btn btn-primary" href="<?php echo $back; ?>" title="<?php echo $button_back; ?>"><?php echo $button_back; ?></a>
        </div>
    </div>
<?php } else { ?>
    <p>An error occurred while processing your payment. Please try again later.</p>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <a class="btn btn-primary" href="<?php echo $back; ?>" title="<?php echo $button_back; ?>"><?php echo $button_back; ?></a>
        </div>
    </div>
<?php } ?>
