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

            <div class="row">
                <div class="col-sm-6">
                    <div class="well">
                        <div class="heading">
                            <i class="fa fa-file-text-o"></i>
                            <div class="extra-wrap">
                                <h2><?php echo $text_new_customer; ?></h2>
                                <strong><?php echo $text_register; ?></strong>
                            </div>
                        </div>
                        <p><?php echo $text_register_account; ?></p>
                        <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="well">
                        <div class="heading">
                            <i class="fa fa-key"></i>
                            <h2><?php echo $text_returning_customer; ?></h2>
                            <strong><?php echo $text_i_am_returning_customer; ?></strong>
                        </div>
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login-form">
                            <div class="form-group">
                                <label class="control-label" for="input-email"><?php echo $entry_email; ?></b></label>
                                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="E-Mail адрес" id="input-email" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Пароль" id="input-password" class="form-control" />
                                <br />
                                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
                            <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
                            <?php if ($redirect) { ?>
                            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                            <?php } ?>
                        </form>
                    </div>
                </div>

            </div>
            <?php echo $content_bottom; ?><script type="text/javascript"><!--
                $('#login-form input').keydown(function(e) {
                    if (e.keyCode == 13) {
                        $('#login').submit();
                    }
                });
                //--></script>
        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>