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
            <p><?php echo $text_account_already; ?></p>
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><?php echo $error_warning; ?></div>
            <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset id="account">
                    <legend><?php echo $text_your_details; ?></legend>
                    <div class="form-group required" <?php if(isset($customer_groups) && count($customer_groups) <= 1) { ?> style="display:none;"<?php } ?>>
                        <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
                        <div class="col-sm-10">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                                <div class="radio">
                                    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                                        <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                        <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
                                        <br />
                                    <?php } else { ?>
                                        <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
                                        <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
                                        <br />
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="Имя" id="input-firstname" class="form-control">
                            <?php if ($error_firstname) { ?>
                            <span class="alert alert-danger"><?php echo $error_firstname; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="Фамилия" id="input-lastname" class="form-control">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="email" name="email" value="<?php echo $email; ?>" placeholder="E-Mail адрес" id="input-email" class="form-control">
                            <?php if ($error_email) { ?>
                            <span class="alert alert-danger"><?php echo $error_email; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                        <div class="col-sm-10">
                            <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="Телефон" id="input-telephone" class="form-control">
                            <?php if ($error_telephone) { ?>
                            <span class="alert alert-danger"><?php echo $error_telephone; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><?php echo $text_your_password; ?></legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                        <div class="col-sm-10">
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Пароль" id="input-password" class="form-control">
                            <?php if ($error_password) { ?>
                            <span class="alert alert-danger"><?php echo $error_password; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                        <div class="col-sm-10">
                            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="Подтверждение пароля" id="input-confirm" class="form-control">
                            <?php if ($error_confirm) { ?>
                            <span class="alert alert-danger"><?php echo $error_confirm; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><?php echo $text_newsletter; ?></legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
                        <div class="col-sm-10">

                            <?php if ($newsletter) { ?>
                            <label class="radio-inline">
                            <input type="radio" name="newsletter" value="1" checked="checked" />
                            <?php echo $text_yes; ?></label>
                            <label class="radio-inline">
                            <input type="radio" name="newsletter" value="0" />
                            <?php echo $text_no; ?></label>
                            <?php } else { ?>
                                <label class="radio-inline">
                            <input type="radio" name="newsletter" value="1" />
                            <?php echo $text_yes; ?></label>
                            <label class="radio-inline">
                            <input type="radio" name="newsletter" value="0" checked="checked" />
                            <?php echo $text_no; ?></label>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>

                <?php if ($text_agree) { ?>
                <div class="buttons">
                    <div class="pull-right"><?php echo $text_agree; ?>
                        <?php if ($agree) { ?>
                        <input type="checkbox" name="agree" value="1" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="agree" value="1" />
                        <?php } ?>
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                    </div>
                </div>
                <?php } else { ?>
                <div class="buttons">
                    <div class="pull-right">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                    </div>
                </div>
                <?php } ?>
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