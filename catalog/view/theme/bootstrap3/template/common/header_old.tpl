<?php require_once(DIR_APPLICATION .'view/theme/bootstrap3/config.php');?>

<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<!-- meta -->
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<!-- links -->
<?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- css -->
<link href="<?php echo THEME_CSS_BOOTSTRAP; ?>" rel="stylesheet" media="screen" />
<link href="<?php echo THEME_CSS_STYLESHEET; ?>" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!-- scripts -->
<script src="<?php echo THEME_JS_JQUERY; ?>"></script>
<script src="<?php echo THEME_JS_BOOTSTRAP; ?>"></script>
<script>
    // BOOTSTRAP NOCONFLICT
    var btButton = $.fn.button.noConflict();
    $.fn.button = btButton;
</script>
<script src="<?php echo THEME_JS_PLUGINS; ?>"></script>
<script src="<?php echo THEME_JS_COMMON; ?>"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="<?php echo THEME_JS_HTML5SHIV; ?>"></script>
    <script src="<?php echo THEME_JS_RESPOND; ?>"></script>
<![endif]-->
<?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>"></script>
<?php } ?>
<!-- stores -->
<?php if ($stores) { ?>
    <script>
        jQuery(function($) {
            <?php foreach ($stores as $store) { ?>
                $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
            <?php } ?>
        });
    </script>
<?php } ?>
<!-- code -->
<?php echo $google_analytics; ?>
<?php
//!!! supermenu
//echo $supermenu_settings;
?>
</head>
<body>
<!-- HEADER -->
<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-12 col-sm-12">
                <div class="header-wrap">
                    <div class="logo-wrap">
                        <?php if ($logo) { ?>
                            <?php if ($home == $og_url) { ?>
                            <img id="logo" class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                            <?php } else { ?>
                            <a href="<?php echo $home; ?>"><img id="logo" class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="elements-wrap">
                            <div class="shop-menu-wrapper">
                                <div class="shop-nav">
                                    <ul id="shopnav" class="shop-menu">
                                        <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
                                        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                                        <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                                        <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="search-wrapper">
                                <!-- BEGIN SEARCH FORM -->
                                <div class="search-form search-form__h clearfix">
                                    <form id="search" name="search" class="navbar-form pull-right" role="search" onsubmit="event.preventDefault(); location = 'index.php?route=product/search&' + $(this).serialize();">

                                            <input type="search" class="form-control" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search ? : ''; ?>" style="min-width: 100px;" required />
                                            <input type="submit" value="" id="search-form_is" class="btn btn-primary">

                                    </form>
                                </div>
                            </div>
                            <div id="welcome">
                                <?php if (!$logged) { ?>
                                <?php echo $text_welcome; ?>
                                <?php } else { ?>
                                <?php echo $text_logged; ?>
                                <?php } ?>
                            </div>
                            <?php echo $language; ?>
                            <?php echo $currency; ?>
                            <div class="cart-wrap">
                                <?php echo $cart; ?>
                            </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-nav">
        <div id="menu" class="container-fluid hidden-print">
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/menu.tpl'); ?>
        </div>
    </div>

    <!-- Temporary info----->
    <div id="works-on-site">
        <div class="container">
            <div class="row">
                На сайте ведется заполнение технической информации по товарам. Приносим извинения за предоставленные неудобства.
            </div>
        </div>
    </div>
</header>

<?php if (true) { ?>
        <div class="container main-menu">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 site-menu">

            <?php
        function renderCategories($categories,$result='')
        {
            foreach($categories as $category)
            {
                if(isset($category['children']))
                {
                    $result.= '<li class="'. (isset($category['active']) ? 'active' : '') . '">
            <span><span>'.$category['name'].'</span><span class="arrow">&nbsp;&#9654;</span></span>
            <ul>
                '.renderCategories($category['children']).'
            </ul>
            </li>';
            }else{
            $result.='<li class="'. ((isset($category['active']) )? 'active' : '') .'">
                <a href="'.$category['href'].'">'.$category['name'].'</a>
            </li>';
            }
            }
            return $result;
            }
            ?>

            <!-- MENU -->
            <?php if (isset($categories)) { ?>
            <div id="sidebar" class="navbar navbar-inverse">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-collapse2">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand visible-xs" href="<?php echo $home; ?>"><?php echo $name; ?></a>
                </div>
                <div id="menu-collapse2" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" role="menu">
                        <?=renderCategories($categories)?>
                    </ul>
                </div>
            </div>
            <!-- js -->
            <script>
                jQuery(function($){
                    // MENU
                    if (styleSupport('ul', 'column-count', true)) {
                        $(window).resize(function() {
                            if ($(window).width() > 750) {
                                var width = $('#menu div.navbar').width();

                                $('#menu li.dropdown').each(function() {
                                    var $this = $(this);

                                    $this.children('ul.dropdown-menu').css({
                                        left: - $this.position().left,
                                        width: width
                                    });
                                });
                            } else {
                                $('#menu li.dropdown').each(function() {
                                    $(this).children('ul.dropdown-menu').css({
                                        left: 0,
                                        width: '100%'
                                    });
                                });
                            }
                        }).resize();
                    } else {
                        $('#menu ul.dropdown-menu').removeClass().addClass('dropdown-menu');
                    }
                    // sidebar
                    var parentWidth = $('#sidebar #menu-collapse').width();
                    $('#sidebar .dropdown-menu').css('marginLeft',parentWidth+'px');
                });
            </script>
            <?php } ?>

        </div>

        <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12 site-carousel">
            <div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="image/slide4.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2>Тепло и уют Вашего дома<br></h2>
                            <p class="hidden-sm hidden-xs"><a href="http://elektrika-nmk.ru/index.php?route=product/category&path=427_479">Теплотехника</a> в ассортименте. Утепляйтесь!</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="image/slide5.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2>Элегантность и практичность<br></h2>
                            <p class="hidden-sm hidden-xs">Электроустановочные изделия фирмы<a href="http://elektrika-nmk.ru/index.php?route=product/category&path=430_501">  Werkel </a></p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="image/slide6.jpg" alt="...">
                        <div class="carousel-caption">
                            <h2>Экономия в мелочах<br></h2>
                            <p class="hidden-sm hidden-xs">Светодиодные лампы с цоколем <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=434_767">Е27</a>,
                                <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=434_842">Е14</a>, <a href="http://elektrika-nmk.ru/index.php?route=product/category&path=434_843">Gx5.3</a></p>
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
        </div>
    </div>
<?php } ?>
