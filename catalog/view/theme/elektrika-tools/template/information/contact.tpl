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
            <h1><?php echo $heading_title; ?></h1>
            <h2><?php echo $text_location; ?></h2>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6"><strong><?php echo $store; ?></strong><br>
                            <address><?php echo $address; ?></address>
                        </div>
                        <div class="col-sm-6">

                            <?php if ($telephone) { ?>
                            <strong><?php echo $text_telephone; ?></strong><br />
                            <?php echo $telephone; ?><br />
                            <br />
                            <?php } ?>
                            <?php if ($fax) { ?>
                            <strong><?php echo $text_fax; ?></strong><br />
                            <?php echo $fax; ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset>
                    <h2><?php echo $text_contact; ?></h2>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control">
                            <?php if ($error_name) { ?>
                            <span class="alert alert-danger"><?php echo $error_name; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control">
                            <?php if ($error_email) { ?>
                            <span class="alert alert-danger"><?php echo $error_email; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                        <div class="col-sm-10">
                            <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <span class="alert alert-danger"><?php echo $error_enquiry; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="captcha" id="input-captcha" class="form-control" value="<?php echo $captcha; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 pull-right">
                            <img src="index.php?route=information/contact/captcha" alt="">
                            <?php if ($error_captcha) { ?>
                            <span class="alert alert-danger"><?php echo $error_captcha; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons">
                    <div class="pull-right">
                        <input class="btn btn-primary" type="submit" value="<?php echo $button_continue; ?>">
                    </div>
                </div>
            </form>
            <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>