<div class="row">
    <div class="col-sm-6">
      <h2><?php echo $text_new_customer; ?></h2>
      <p><?php echo $text_checkout; ?></p>
      <div class="radio">
          <label for="register">
            <?php if ($account == 'register') { ?>
            <input type="radio" name="account" value="register" id="register" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="account" value="register" id="register" />
            <?php } ?>
            <?php echo $text_register; ?>
          </label>
      </div>
      <?php if ($guest_checkout) { ?>
        <div class="radio">
          <label for="guest">
            <?php if ($account == 'guest') { ?>
            <input type="radio" name="account" value="guest" id="guest" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="account" value="guest" id="guest" />

            <?php } ?>
            <?php echo $text_guest; ?>
          </label>
        </div>
      <?php } ?>
      <p><?php echo $text_register_account; ?></p>
      <input type="button" value="<?php echo $button_continue; ?>" id="button-account" class="btn btn-primary" />
      <br />
      <br />
    </div>
    <div id="login" class="col-sm-6">
      <h2><?php echo $text_returning_customer; ?></h2>
      <p><?php echo $text_i_am_returning_customer; ?></p>
        <div class="form-group">
          <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
          <input type="text" name="email" value="" class="form-control" id="input-email" placeholder="E-Mail"/>
        </div>
        <div class="form-group">
          <label class="control-label" for="input-password"><?php echo $entry_password; ?></label><br />
          <input type="password" name="password" value=""  class="form-control" id="input-password" placeholder="Пароль"/>
            <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
       </div>
      <input type="button" value="<?php echo $button_login; ?>" id="button-login" class="btn btn-primary"/>
    </div>
</div>