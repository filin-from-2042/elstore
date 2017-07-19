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
            <?php echo $text_description; ?>
            <?php if ($error_warning) { ?>
            <div class="warning"><?php echo $error_warning; ?></div>
            <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset>
                    <legend><?php echo $text_order; ?></legend>
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
                            <?php if ($error_lastname) { ?>
                            <span class="alert alert-danger"><?php echo $error_lastname; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="E-Mail" id="input-email" class="form-control">
                            <?php if ($error_email) { ?>
                            <span class="alert alert-danger"><?php echo $error_email; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="Телефон" id="input-telephone" class="form-control">
                            <?php if ($error_telephone) { ?>
                            <span class="alert alert-danger"><?php echo $error_telephone; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="order_id" value="<?php echo $order_id; ?>" placeholder="Номер заказа" id="input-order-id" class="form-control">
                            <?php if ($error_order_id) { ?>
                            <span class="alert alert-danger"><?php echo $error_order_id; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-date-ordered"><?php echo $entry_date_ordered; ?></label>
                        <div class="col-sm-3">
                            <div class="input-group date"><input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" placeholder="Дата заказа" data-date-format="YYYY-MM-DD" id="input-date-ordered" class="form-control"><span class="input-group-btn">
                <?php /* ?><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button><?php */ ?>
                </span></div>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><?php echo $text_product; ?></legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="product" value="<?php echo $product; ?>" placeholder="Название товара" id="input-product" class="form-control">
                            <?php if ($error_product) { ?>
                            <span class="alert alert-danger"><?php echo $error_product; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="model" value="<?php echo $model; ?>" placeholder="Код товара" id="input-model" class="form-control">
                            <?php if ($error_model) { ?>
                            <span class="alert alert-danger"><?php echo $error_model; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="Количество" id="input-quantity" class="form-control">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"><?php echo $entry_reason; ?></label>
                        <div class="col-sm-10">
                            <?php foreach ($return_reasons as $return_reason) { ?>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>"  <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?> checked="checked" <?php } ?> >
                                    <?php echo $return_reason['name']; ?></label>
                            <?php  } ?>
                                <?php if ($error_reason) { ?>
                                <span class="alert alert-danger"><?php echo $error_reason; ?></span>
                                <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"><?php echo $entry_opened; ?></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="opened" value="1" <?php if ($opened) { ?> checked="checked" <?php } ?> >
                                <?php echo $text_yes; ?></label>
                            <label class="radio-inline">
                                <input type="radio" name="opened" value="0" <?php if (!$opened) { ?> checked="checked" <?php } ?> >
                                <?php echo $text_no; ?></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_fault_detail; ?></label>
                        <div class="col-sm-10">
                            <textarea name="comment" rows="10" placeholder="Комментарий" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="captcha" value="<?php echo $captcha; ?>" placeholder="Введите код с изображения" id="input-captcha" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 pull-right">
                            <img src="index.php?route=account/return/captcha" alt="">
                            <?php if ($error_captcha) { ?>
                            <span class="error"><?php echo $error_captcha; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>

                <?php if ($text_agree) { ?>
                <div class="buttons clearfix">
                    <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
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
                <div class="buttons clearfix">
                    <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
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