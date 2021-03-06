<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container">
    <div class="row">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1>Наши магазины</h1>
                    <!-- pics with stores-->
                    <div class="stores-photos">
                        <div class="row urvanka">
                            <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                <img class="img-responsive" src="/image/urvanka.jpg" />
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 store-desc">

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h3>
                                            "Электрика" на Урванском рынке ("Светофор")
                                        </h3>
                                        <p>
                                            Тульская область, <br />  г. Новомосковск, ул. Мира, д.34б <br /> тел. 8-(48762) 4-06-07, 8-953-954-20-63 <br />
                                            Email: tricolor-nsk@mail.ru

                                        </p>

                                        <h3>Часы работы:</h3>
                                        <p id="work-hours">
                                            понедельник- выходной;<br>
                                            вторник-воскресенье: 9-16.

                                        </p>
                                    </div>
                                </div>

                                <div class="row hidden-sm hidden-xs hidden-print">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <img class="img-responsive" src="/image/urv2.jpg" />
                                    </div>
                                </div>

                            </div>


                        </div>


                        <div class="row profi">
                            <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                <img class="img-responsive" src="/image/profi.jpg" />
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 store-desc">

                                <h3>
                                    "Мир Профи"
                                </h3>
                                <p>
                                    Тульская область, <br /> г. Новомосковск,ул. Садовского д.38 <br />тел.  8-(48762) 6-37-64, 8-953-194-25-31 <br />
                                    Email: tricolor-nsk@mail.ru
                                </p>

                                <h3>Часы работы:</h3>
                                <p id="work-hours">
                                    понедельник-пятница: 10-19; <br>
                                    суббота: 10-17; <br /> воскресенье - выходной.

                                </p>
                            </div>
                        </div>


                        <div class="row osn">
                            <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                <img class="img-responsive" src="/image/osn.jpg" />
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 store-desc">

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h3>
                                            "Электрика"
                                        </h3>
                                        <p>
                                            Тульская область, <br /> г. Новомосковск, ул. Садовского д.34 <br />тел.  8-(48762) 6-37-64, 8-953-954-20-16<br />
                                            Email: tricolor-nsk@mail.ru
                                            <br>
                                        </p>
                                        <h3>Часы работы:</h3>
                                        <p id="work-hours">
                                            понедельник-пятница: 10-19; <br>
                                            суббота-воскресенье: 10-17.

                                        </p>
                                    </div>
                                </div>

                                <div class="row hidden-sm hidden-xs hidden-print">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <img class="img-responsive" src="/image/osn2.jpg" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- heading title -->
                    <form class="form-horizontal" name="contact" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

                        <fieldset class="hidden-print">
                            <legend><?php echo $text_contact; ?></legend>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_name; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="text" class="form-control" name="name" value="<?php echo $name; ?>" />
                                    <?php if ($error_name) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_name; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_email; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <input type="email" class="form-control" name="email" value="<?php echo $email; ?>" />
                                    <?php if ($error_email) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_email; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="<?php echo $bootstrap->label; ?>">
                                    <?php echo $entry_enquiry; ?>
                                </label>
                                <div class="<?php echo $bootstrap->input; ?>">
                                    <textarea name="enquiry" class="form-control" rows="10" spellcheck><?php echo $enquiry; ?></textarea>
                                    <?php if ($error_enquiry) { ?>
                                        <span class="text-warning" role="status"><?php echo $error_enquiry; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-group hidden-print">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $entry_captcha; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <div class="captcha-group input-group">
                                    <div class="input-group-btn">
                                        <img src="index.php?route=information/contact/captcha" alt="captcha" />
                                        <button type="button" class="btn btn-default" name="reCaptcha" style="margin-left: -3px;"><span class="glyphicon glyphicon-refresh"></span></button>
                                    </div>
                                    <input type="text" class="form-control" name="captcha" value="<?php echo $captcha; ?>" style="min-width: 75px;" />
                                </div>
                                <?php if ($error_captcha) { ?>
                                    <span class="text-warning" role="status"><?php echo $error_captcha; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group hidden-print">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <button type="submit" class="btn btn-primary" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <br />
            <!-- bottom -->
            <?php if ($content_bottom) { ?>
                <div id="bottom" class="row"><div class="<?php echo $bootstrap->bottom; ?>"><?php echo $content_bottom; ?></div></div>
            <?php } ?>
        </div>
        <!-- left -->
        <?php if ($column_left) { ?>
            <div id="left" class="<?php echo $bootstrap->left; ?>"><?php echo $column_left; ?></div>
        <?php } ?>
        <!-- right -->
        <?php if ($column_right) { ?>
            <div id="right" class="<?php echo $bootstrap->right; ?>"><?php echo $column_right; ?></div>
        <?php } ?>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=K3c_whlQjG-CppDG1ELZonoKzteiz4Wl&width=100%&height=359&lang=ru_RU&sourceType=constructor"></script>

<!-- footer -->
<?php echo $footer; ?>
<script>
jQuery(function($) {
    // BIND INPUT CAPTCHA
    $('button[name="reCaptcha"]', 'form[name="contact"]').click(function() {
        $(this).closest('div.captcha-group')
            .state(false)
            .find('img').attr('src', 'index.php?route=information/contact/captcha/' + new Date().getTime()).end()
            .find('input[name="captcha"]').val('');
    });
    
    // BIND FORM STORAGE
    $('form[name="contact"]').formStorage({
        prefix: 'user_',
        check: true
    });
});
</script>
</body>
</html>