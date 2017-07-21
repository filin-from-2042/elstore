<div class="box info">
  <div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
  <div class="box-content">
    <ul>
      <?php if (!$logged) { ?>
      <li><a href="<?php echo $login; ?>"><i class="fa fa-angle-right"></i><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>"><i class="fa fa-angle-right"></i><?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $account; ?>"><i class="fa fa-angle-right"></i><?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $edit; ?>"><i class="fa fa-angle-right"></i><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><i class="fa fa-angle-right"></i><?php echo $text_password; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $address; ?>"><i class="fa fa-angle-right"></i><?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><i class="fa fa-angle-right"></i><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $order; ?>"><i class="fa fa-angle-right"></i><?php echo $text_order; ?></a></li>
      <?php /*?><li><a href="<?php echo $download; ?>"><i class="fa fa-angle-right"></i><?php echo $text_download; ?></a></li><?php*/?>
      <li><a href="<?php echo $return; ?>"><i class="fa fa-angle-right"></i><?php echo $text_return; ?></a></li>
        <?php /* ?><li><a href="<?php echo $transaction; ?>"><i class="fa fa-angle-right"></i><?php echo $text_transaction; ?></a></li><?php*/?>
      <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-angle-right"></i><?php echo $text_newsletter; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $logout; ?>"><i class="fa fa-angle-right"></i><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
