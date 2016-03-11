<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container-fluid">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="image/slide3.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>Специальные цены на продукцию компании <br>"TDM Electric"</h2>
                    Лампочки, розетки, автоматы и многое другое по выгодным ценам! Специальное предложение для коммерческих организаций.
                </div>
            </div>

            <div class="item ">
                <img src="image/slide1.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>Официальный дилер ТриколорТВ</h2>
                    Помощь в выборе  спутникового оборудования, регистрация, предоставление всей интересующей и актуальной информации
                    <p><a href="http://elektrika-nmk.ru/index.php?route=product/category&path=446_664" class="btn btn-danger" role="button">Обзор спутниковых приемников</a></p>
                </div>
            </div>
            <div class="item">
                <img src="image/slide2.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>Инструмент по ценам прошлого года</h2>
                    Ликвидация инструмента <br>
                    в магазине "Мир Профи". <br>
                    Успейте купить!
                    <p><a href="http://elektrika-nmk.ru/index.php?route=product/special" class="btn btn-danger" role="button">Обзор акций</a></p>
                </div>
            </div>

        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <!--- Greeting --->

    <div class="text-block">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="indent">
                        <h2><strong>Добро пожаловать</strong> в наш магазин!</h2>
                    Только у нас вы найдете электрику для дома и офиса по самым низким в Новомосковске ценам!
                    Более 10 000 наименований товаров в наличии и под заказ.
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row main-page">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?> main-center">


            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row">
                    <div class="<?php echo $bootstrap->top; ?>">
                        <?php echo $content_top; ?>
                    </div>
                </div>
            <?php } ?>
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
<!-- footer -->
<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=K3c_whlQjG-CppDG1ELZonoKzteiz4Wl&width=100%&height=359&lang=ru_RU&sourceType=constructor"></script>
<?php echo $footer; ?>
</body>
</html>