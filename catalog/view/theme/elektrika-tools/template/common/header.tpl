<!DOCTYPE html>
<html dir="<?php echo $direction; ?>">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>

<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700,400italic&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<link href="catalog/view/theme/elektrika-tools/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="catalog/view/theme/elektrika-tools/css/font-awesome.min.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<link rel="stylesheet" type="text/css" href="catalog/view/theme/elektrika-tools/css/style.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/elektrika-tools/css/style_tablet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/elektrika-tools/css/style_mobile.css" />

<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?=$class?>">

<!-- swipe menu -->
<div class="swipe">
    <div class="swipe-menu">
        <ul>

            <li><a href="<?php echo $account; ?>" title="My Account"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
            <?php if (!$logged) { ?>
            <li><a href="<?=$login?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a></li>
            <li><a href="<?=register?>"><i class="fa fa-user"></i><?php echo $text_register; ?></a></li>
            <?php } else { ?>
            <li><a href="<?=$logged_simple?>"><i class="fa fa-sign-out" aria-hidden="true"></i><?php echo $text_logged_simple; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total2" title="Wish List <span>0</span>"><i class="fa fa-heart"></i><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $shopping_cart; ?>" title="Shopping Cart"><i class="fa fa-shopping-cart"></i><?php echo $text_shopping_cart; ?></a></li>
        </ul>
        <ul class="foot">
            <li><a href="/index.php?route=information/information&information_id=6"><i class="fa fa-truck"></i>Доставка</a></li>
            <li><a href="<?php echo $return; ?>"><i class="fa fa-retweet" aria-hidden="true"></i><?php echo $text_return; ?></a></li>
            <li><a href="/index.php?route=information/information&information_id=5"><i class="fa fa-cogs" aria-hidden="true"></i>Условия соглашения</a></li>
            <li><a href="/index.php?route=information/information&information_id=3"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>Политика безопасности</a></li>
        </ul>
        <ul class="foot foot-1">
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-globe" aria-hidden="true"></i><?php echo $text_contact; ?></a></li>
            <li><a href="<?=$sitemap?>"><i class="fa fa-sitemap" aria-hidden="true"></i><?=$text_sitemap?></a></li>
        </ul>

        <ul class="foot foot-2">
            <li><a href="<?php echo $manufacturer; ?>"><i class="fa fa-tags" aria-hidden="true"></i><?php echo $text_manufacturer; ?></a></li>
            <li><a href="<?php echo $voucher; ?>"><i class="fa fa-gift" aria-hidden="true"></i><?php echo $text_voucher; ?></a></li>
            <li><a href="<?php echo $special; ?>"><i class="fa fa-certificate" aria-hidden="true"></i><?php echo $text_special; ?></a></li>
        </ul>
        <ul class="foot foot-3">
            <li><a href="<?php echo $order; ?>"><i class="fa fa-list-ol" aria-hidden="true"></i><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o" aria-hidden="true"></i><?php echo $text_newsletter; ?></a></li>
        </ul>
    </div>
</div>

<div id="page">
    <div class="shadow"></div>
    <div class="toprow-1">
        <a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
    </div>
    <header>
        <div class="top-panel">
            <div class="container">
                <div class="box_html top-buttons">
                    <div class="row">
                        <a href="/index.php?route=information/information&information_id=6" class="one-third blue">
                            <i class="fa fa-truck"></i>
                            <p>Бесплатная доставка<br>на заказы от 500р</p>
                        </a>
                        <a href="#" class="one-third">
                            <i class="fa fa-money"></i>
                            <p>Оплата<br>при получении</p>
                        </a>
                        <a href="/index.php?route=information/information&information_id=9" class="one-third green">
                            <i class="fa fa-refresh"></i>
                            <p>14 дней<br>на возврат</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>