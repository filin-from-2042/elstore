<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>

<div id="main" class="container">
<div class="row info-blocks">
    <div class="col-sm-8      col-lg-8">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 site-carousel">
            <div id="carousel-example-generic" class="carousel slide hidden-print" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <!--
                                        <div class="item active">
                                            <img src="image/slide4.jpg" alt="...">
                                            <div class="carousel-caption">
                                                <h2>Тепло и уют Вашего дома<br></h2>
                                                <p><a href="http://elektrika-nmk.ru/index.php?route=product/category&path=427_479">Теплотехника</a> в ассортименте. Утепляйтесь!</p>
                                            </div>
                                        </div>


                    -->
                    <div class="item active">
                        <img src="image/slide111.jpg" class="img-responsive" alt="...">
                        <div class="carousel-caption">
                            <h2 class="hidden-xs">Красиво, практично,а главное - дешево!</h2>
                            <p>Открыт специализированный отдел с красивыми <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=441_893">люстрами, бра</a> по привлекательным ценам!</p>
                            <p><a href="http://elektrika-nmk.ru/index.php?route=information/information&information_id=8">Подробнее</a></p>
                        </div>
                    </div>



                    <div class="item ">
                        <img src="image/ecola.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2 class="hidden-xs">Настоящая экономия!<br></h2>
                            <p>Расширение ассортимента и снижение цен на продукцию фирмы <a href="http://elektrika-nmk.ru/index.php?route=product/manufacturer/info&manufacturer_id=42">  Ecola </a></p>
                        </div>
                    </div>

                    <div class="item ">
                        <img src="image/slide5.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2 class="hidden-xs">Элегантность и практичность<br></h2>
                            <p>Электроустановочные изделия фирмы<a href="http://elektrika-nmk.ru/index.php?route=product/category&path=430_501">  Werkel </a></p>
                        </div>
                    </div>

                    <!--
                   <div class="item">
                       <img src="image/slide6.jpg" alt="...">
                       <div class="carousel-caption">
                           <h2>Экономия в мелочах<br></h2>
                           <p>Светодиодные лампы с цоколем <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=434_767">Е27</a>,
                               <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=434_842">Е14</a>, <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=434_843">Gx5.3</a></p>
                       </div>
                   </div>  -->

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
        </div>
    </div>

    <div class="col-sm-4 col-lg-4 side-item">
        <div class="">
            <img class="img-responsive" src="image/slides1.jpg" alt="...">
            <div class="">
                <h2>Мотоблок Агат<br></h2>
                <p>Надежный мотоблок <a href="http://elektrika-nmk.ru/index.php?route=product/product&product_id=15437"> АГАТ ХМ 6,5 с двигателем Hammerman </a> по супер-цене!</p>
            </div>
        </div>
    </div>

    <div class="col-sm-4  col-lg-4 side-item">
        <div class="">
            <img  class="img-responsive" src="image/zakaz.jpg" alt="...">
            <div class="">
                <h2>При заказе с сайта - скидка 5%!<br></h2>
            </div>
        </div>
    </div>
</div>



    <?php if (true) { ?>
    <div class="container main-menu">

        <?php } ?>



        <!--- Greeting --->

        <!---    <div class="text-block">
              <div class="container">
                  <div class="row">
                      <div class="col-xs-12">
                          <div class="indent">
                              <h2><strong>Добро пожаловать</strong> в наш магазин!</h2>
                          Только у нас вы найдете электрику для дома и офиса по самым низким ценам в Новомосковске!<br>
                          Более 10 000 наименований товаров в наличии и под заказ.
                          </div>
                      </div>
                  </div>
              </div>
          </div>
           --->


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

        <!-- right -->
        <?php if ($column_right) { ?>
            <div id="right" class="<?php echo $bootstrap->right; ?>"><?php echo $column_right; ?></div>
        <?php } ?>
    </div>
</div>
<!-- footer -->
<div id="map-container">
    <script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=K3c_whlQjG-CppDG1ELZonoKzteiz4Wl&width=100%&height=359&lang=ru_RU&sourceType=constructor"></script>
</div>
<?php echo $footer; ?>
</body>
</html>