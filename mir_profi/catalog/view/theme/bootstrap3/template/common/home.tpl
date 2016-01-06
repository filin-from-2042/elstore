<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include('/../module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container-fluid">
    <div class="row main-page">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?> main-center">

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
                        <img src="image/slide1.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2>Заголовок</h2>
                            Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptat.
                            <p><a href="#" class="btn btn-danger" role="button">Button</a></p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/slide2.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2>Заголовок</h2>
                            Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptat.
                            <p><a href="#" class="btn btn-danger" role="button">Button</a></p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/slide3.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2>Заголовок</h2>
                            Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptat.
                            <p><a href="#" class="btn btn-danger" role="button">Button</a></p>
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
                                <h2><strong>Welcome</strong> to our store!</h2>
                                Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptat.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Thumbs for main categories-->

            <div class="main-categories">
                <div class="col-sm-4 col-md-4 category-container">
                    <div class="thumbnail">
                        <img src="image/lampochka.jpg" alt="...">
                        <div class="caption">
                            <h3>Электрика</h3>
                            <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod </p>
                            <p><a href="#" class="btn btn-danger" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4 category-container">
                    <div class="thumbnail">
                        <img src="image/slide21.jpg" alt="...">
                        <div class="caption">
                            <h3>Инструмент</h3>
                            <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod </p>
                            <p><a href="#" class="btn btn-danger" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4 category-container">
                    <div class="thumbnail">
                        <img src="image/slide22.jpg" alt="...">
                        <div class="caption">
                            <h3>Сантехника</h3>
                            <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod </p>
                            <p><a href="#" class="btn btn-danger" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
            </div>




            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
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
<?php echo $footer; ?>
</body>
</html>