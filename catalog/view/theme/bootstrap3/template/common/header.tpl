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
<link href="<?php echo THEME_CSS_BOOTSTRAP; ?>" rel="stylesheet" />
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
    <script src="https://use.fontawesome.com/354449087f.js"></script>
<!-- code -->
<?php echo $google_analytics; ?>
</head>
<body>

<div id="logo" class=" container phone-logo hidden-md hidden-sm hidden-lg ">
    <a href="/index.php?route=common/home"><img src="/image/full2.png"title="<?php echo $name; ?>" alt="<?php echo $name; ?>"    class="img-responsive"></a>
</div>
<!-- HEADER -->
<div id="head-cont">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                <div class="header-nav">
                    <div id="menu" class="container-fluid hidden-print">
                        <?php  include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/menu.tpl'); ?>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 block-menu">
                <div>
                    <div id="top-links" class="nav pull-left">
                        <ul class="list-inline">
                            <li class="first"><a href="/index.php?route=product/special"><i class="fa fa-exclamation-triangle hidden-md hidden-lg"></i><span class="hidden-sm hidden-xs">Акции</span></a></li>
                            <li><a href="/index.php?route=information/contact" title="Контакты"> <i class="fa fa-map-marker hidden-md hidden-lg"></i><span class="hidden-sm hidden-xs">Контакты</span></a></li>
                            <li><a href="/index.php?route=information/information&information_id=6" title="Доставка"> <i class="fa fa-truck hidden-md hidden-lg"></i><span class="hidden-sm hidden-xs">Доставка</span></a></li>
                            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="Закладки"><i class="fa fa-heart hidden-md hidden-lg"></i> <span class="hidden-sm hidden-xs"><?php echo $text_wishlist; ?></span></a></li>
                            <li><a href="/index.php?route=account/account"><i class="fa fa-user hidden-md hidden-lg"></i><span class="hidden-sm hidden-xs">Личный кабинет</span></a></li>
                            <li><a  class="hidden-lg hidden-md hidden-sm" href="/index.php?route=checkout/cart"><i class="fa fa-shopping-cart   hidden-md hidden-lg"></i><span class="hidden-sm hidden-xs">Корзина</span></a></li>
                        </ul>
                    </div>
                    <div id="search" class="hidden-xs">
                        <form id="searchform" name="search"  role="search" onsubmit="event.preventDefault(); location = 'index.php?route=product/search&' + $(this).serialize();">

                            <i class="fa fa-search"></i><input type="text" name="search" value="" placeholder=""><button type="submit" class="button-search"><i class="fa fa-angle-double-right"></i></button>
                            <div class="clear"></div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<header id="header">
    <div class="container hidden-print">
        <div id="logo-block" class="hidden-xs">
            <div class="container">
                <div id="logo">
                    <a href="/index.php?route=common/home"><img src="/image/full2.png"title="<?php echo $name; ?>" alt="<?php echo $name; ?>"    class="img-responsive"></a>
                </div>
                <div class="box-right hidden-xs">
                    <div class="box-cart">
                        <?php echo $cart;?>
                    </div>
                    <div class="register-top">
                            <?php if (!$logged) { ?>
                            <a class="button-register" href="/index.php?route=account/register"><i class="fa fa-user"></i>Регистрация</a>
                            <a href="/index.php?route=account/login"><i class="fa fa-lock"></i>Авторизация</a>
                            <?php } else { ?>
                            <?php echo '<div id="user-logged">' . $text_logged . '</div>'; ?>
                            <?php } ?>
                    </div>
                </div>
            </div>
        <!-- Temporary info----->
        <div id="works-on-site">
            <div class="container">
                <div class="row hidden-print">
                    На сайте ведется заполнение технической информации по товарам. Приносим извинения за предоставленные неудобства.
                </div>
            </div>
        </div>

    </div>



    </div>


</header>

<div class="container store-features hidden-xs hidden-sm">
    <div class="col-lg-3     col-md-4 ">
        <a href="/index.php?route=information/information&information_id=6" class="one-third blue">
            <i class="fa fa-truck"></i>
            <p>Бесплатная доставка<br>на заказы от 500р</p>
        </a>
    </div>

    <div class="col-lg-3 col-md-4">
        <a href="#" class="one-third">
            <i class="fa fa-money"></i>
            <p>Оплата<br>при получении</p>
        </a>

    </div>

    <div class="col-lg-3 hidden-md col-md-4">
        <a href="/index.php?route=information/information&information_id=9" class="one-third green">
            <i class="fa fa-refresh"></i>
            <p>14 дней<br>на возврат</p>

        </a></div>

    <div class="col-lg-3 col-md-4">
        <a href="#" class="one-third">
            <i class="fa fa-thumbs-o-up"></i>
            <p>Ваше удовольствие<br>гарантировано</p>



        </a>
    </div>
</div>



