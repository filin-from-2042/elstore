<?php $col = $informations ? 3 : 4; ?>
<div id="footer" class="container hidden-print">
    <div class="row">
        <?php if ($informations) { ?>
            <div class="col-xs-<?php echo $col; ?> col-sm-<?php echo $col; ?> col-md-<?php echo $col; ?> col-lg-<?php echo $col; ?>">
                <h4><?php echo $text_information; ?></h4>
                <ul class="list-unstyled">
                    <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        <?php } ?>
        <div class="col-xs-<?php echo $col; ?> col-sm-<?php echo $col; ?> col-md-<?php echo $col; ?> col-lg-<?php echo $col; ?>">
            <h4><?php echo $text_service; ?></h4>
            <ul class="list-unstyled">
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
        </div>
        <div class="col-xs-<?php echo $col; ?> col-sm-<?php echo $col; ?> col-md-<?php echo $col; ?> col-lg-<?php echo $col; ?>">
            <h4><?php echo $text_extra; ?></h4>
            <ul class="list-unstyled">
                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
        </div>
        <div class="col-xs-<?php echo $col; ?> col-sm-<?php echo $col; ?> col-md-<?php echo $col; ?> col-lg-<?php echo $col; ?>">
            <h4><?php echo $text_account; ?></h4>
            <ul class="list-unstyled">
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- powered -->
<div id="powered" class="container hidden-print">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <p class="text-muted pull-left"><br /><small><a href="http://getbootstrap.com/" target="_blank">Bootstrap 3</a>&nbsp;theme</small></p>
            <p class="text-muted pull-right"><small><?php echo $powered; ?></small></p>
        </div>
    </div>
</div>
<!-- modal -->
<?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/modal.tpl'); ?>