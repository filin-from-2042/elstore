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
                    <div class="row urvanka">
                        <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <img class="img-responsive" src="/image/urvanka.jpg" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 store-desc">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h3>"Электрика" на Урванском рынке ("Светофор")</h3>
                                    <address>Тульская область, <br />  г. Новомосковск, ул. Мира, д.34б <br /> тел. 8-(48762) 4-06-07, 8-953-954-20-63 <br />Email: <a href="mailto:tricolor-nsk@mail.ru">tricolor-nsk@mail.ru</a></address>
                                    <h4>Часы работы:</h4>
                                    <p id="work-hours">Понедельник- выходной;<br>Вторник-воскресенье: 9-16.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row profi">
                        <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <img class="img-responsive" src="/image/profi.jpg" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 store-desc">
                            <h3>"Мир Профи"</h3>
                            <address>Тульская область, <br /> г. Новомосковск,ул. Садовского д.38 <br />тел.  8-(48762) 6-37-64, 8-953-194-25-31 <br /> Email: <a href="mailto:tricolor-nsk@mail.ru">tricolor-nsk@mail.ru</a></address>
                            <h4>Часы работы:</h4>
                            <p id="work-hours">Понедельник-Пятница: 10-19; <br>Суббота: 10-17; <br /> воскресенье - выходной.</p>
                        </div>
                    </div>
                    <div class="row osn">
                        <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <img class="img-responsive" src="/image/osn.jpg" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 store-desc">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h3>"Электрика"</h3>
                                    <address>Тульская область, <br /> г. Новомосковск, ул. Садовского д.34 <br />тел.  8-(48762) 6-37-64, 8-953-954-20-16<br />Email: <a href="mailto:tricolor-nsk@mail.ru">tricolor-nsk@mail.ru</a><br></address>
                                    <h4>Часы работы:</h4>
                                    <p id="work-hours">Понедельник-Пятница: 10-19; <br>Суббота-Воскресенье: 10-17.</p>
                                </div>
                            </div>
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
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" placeholder="Имя">
                            <?php if ($error_name) { ?>
                            <span class="alert alert-danger"><?php echo $error_name; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" placeholder="Email">
                            <?php if ($error_email) { ?>
                            <span class="alert alert-danger"><?php echo $error_email; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                        <div class="col-sm-10">
                            <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control" placeholder="Текст вопроса"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <span class="alert alert-danger"><?php echo $error_enquiry; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="captcha" id="input-captcha" class="form-control" value="<?php echo $captcha; ?>" placeholder="Код с изображения">
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