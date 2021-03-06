<!DOCTYPE html>
<html dir="<?php echo $direction; ?>">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-site-verification" content="pmsA6PyslOCvR9iRHUTSyQL6595STjjA76BSMS31uE0" />
<meta name="yandex-verification" content="9099e8a1a3bd44e3" />
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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

<link rel="stylesheet" type="text/css" href="catalog/view/theme/elektrika-tools/css/style-minified.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/elektrika-tools/css/style_tablet-minified.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/elektrika-tools/css/style_mobile-minified.css" />

<script src="catalog/view/theme/elektrika-tools/js/common-minified.js"></script>
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

<!-- Modal -->
<div class="modal fade bhoechie-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bhoechie-tab-container">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-5 bhoechie-tab-menu">
                                <div class="list-group"><?=$category_1_list?></div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-7 bhoechie-tab">
                                <?php foreach($categories as $k=>$category)
                                {
                                    echo '<div class="bhoechie-tab-content ' . ($k?'':'active') . ' ">';
                                    if (isset($category['children']))
                                    {
                                        foreach( $category['children'] as $child)
                                        {
                                            if (isset($child['children'])  && !empty($child['children']))
                                            echo '<div class="col-sm-12 col-md-12 col-lg-12 subcategory_big"><div class="clearfix"></div>';
                                            else echo '<div class="col-sm-12 col-md-6 col-lg-6 subcategory_small">';

                                            echo '<a href="' . $child['href'] . '" >';
                                                echo '<h3 id="category-parent">' .$child['name'] .'</h3>';
                                                if (isset($child['children'])  && !empty($child['children']))
                                                echo '<div class="col-sm-6 hidden-xs">';
                                                else   echo '<div class="col-sm-12 hidden-xs">';
                                                    echo '<img class="img-responsive" src="'. $child['thumb'] .'" />';
                                                    echo '</div>';

                                                echo '</a>';
                                            if (isset($child['children']) && !empty($child['children']))
                                            {
                                            echo '<div class="col-sm-6 subcategories" >';
                                                echo '<ul>';
                                                foreach($child['children'] as $grchild)
                                                {
                                                echo '<li><a href="' . $grchild['href'] . '" ><i class="fa fa-angle-right"></i>' .$grchild['name'] . '</a></li>';
                                                }
                                                echo '</ul>';
                                            echo '</div> ';
                                            echo '<div class="clearfix"></div> ';
                                            }
                                            echo '</div>';
                                        }
                                    }
                                    echo '</div>';
                                }
                                ?>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>
<!-- swipe menu -->
<div class="swipe">
    <div class="swipe-menu">
        <ul>

            <li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
            <?php if (!$logged) { ?>
            <li><a href="<?=$login?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a></li>
            <li><a href="<?=$register?>"><i class="fa fa-user"></i><?php echo $text_register; ?></a></li>
            <?php } else { ?>
            <li><a href="<?=$logged_simple?>"><i class="fa fa-sign-out" aria-hidden="true"></i><?php echo $text_logged_simple; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total2" title="Wish List <span>0</span>"><i class="fa fa-heart"></i><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $shopping_cart; ?>" title="Shopping Cart"><i class="fa fa-shopping-cart"></i><?php echo $text_shopping_cart; ?></a></li>
        </ul>
        <ul class="foot">
            <li><a href="<?=$shipping?>"><i class="fa fa-truck"></i>Доставка</a></li>
            <?php /* ?><li><a href="<?php echo $return; ?>"><i class="fa fa-retweet" aria-hidden="true"></i><?php echo $text_return; ?></a></li><?php */ ?>
            <li><a href="<?=$terms?>"><i class="fa fa-cogs" aria-hidden="true"></i>Условия соглашения</a></li>
            <li><a href="<?=$security?>"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>Политика безопасности</a></li>
        </ul>
        <ul class="foot foot-1">
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-globe" aria-hidden="true"></i><?php echo $text_contact; ?></a></li>
            <li><a href="<?=$sitemap?>"><i class="fa fa-sitemap" aria-hidden="true"></i><?=$text_sitemap?></a></li>
        </ul>

        <ul class="foot foot-2">
            <li><a href="<?php echo $manufacturer; ?>"><i class="fa fa-tags" aria-hidden="true"></i><?php echo $text_manufacturer; ?></a></li>
            <li><a href="<?php echo $special; ?>"><i class="fa fa-certificate" aria-hidden="true"></i><?php echo $text_special; ?></a></li>
        </ul>
        <ul class="foot foot-3">
            <li><a href="<?php echo $order; ?>"><i class="fa fa-list-ol" aria-hidden="true"></i><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o" aria-hidden="true"></i><?php echo $text_newsletter; ?></a></li>
        </ul>
    </div>
</div>

<div id="page">
    <div class="toprow-1">
        <a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
    </div>
    <header>
        <div class="top-panel">
            <div class="container">
                <div class="box_html top-buttons">
                    <div class="row">
                        <a href="<?=$shipping?>" class="one-third blue">
                            <i class="fa fa-truck"></i>
                            <p>Отправка<br>по всей России</p>
                        </a>
                        <a href="<?=$terms?>" class="one-third">
                            <i class="fa fa-money"></i>
                            <p>Оплата<br>при получении</p>
                        </a>
                        <a href="<?=$terms?>#return" class="one-third green">
                            <i class="fa fa-refresh"></i>
                            <p>14 дней<br>на возврат</p>
                        </a>

                        <a class="pull-right" id="discount">
                            Скидка 5% при заказе с сайта<br>
                            Цены указаны без учета скидки
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="logo-block">
            <div class="container">
                <?php if ($logo) { ?>
                <div id="logo">
                    <?php if ($home == $og_url) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                    <?php } ?>
                </div>
                <?php } ?>

                <div class="box-right">
                    <div class="contacts">
                        <span class="phone"><i class="fa fa-mobile" aria-hidden="true"></i>8-953-954-20-16</span>
                        <span class="phone"><i class="fa fa-phone" aria-hidden="true"></i>8-(48762) 6-37-64</span>
                    </div>
                    <div class="box-cart">
                        <?=$cart?>
                    </div>
                    <div class="register-top hidden-xs">
                        <?php if (!$logged) { ?>
                            <?php echo $text_welcome; ?>
                        <?php } else { ?>
                            <?php echo $text_logged; ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div id="tm_menu" class="col-md-3 sf-with-ul sf-arrows">
                    <ul class="menu">
                        <li><a class="button-category" data-toggle="modal" data-target="#myModal">Каталог<i class="fa fa-bars"></i></a></li>
                    </ul>
                </div>
                <div class="col-sm-12 col-md-9 block-menu">
                    <div class="clearfix">
                        <div id="top-links" class="nav pull-left hidden-xs ">
                            <ul class="list-inline">
                                <li class="first">
                                    <a href="<?php echo $home; ?>">
                                        <i class="fa fa-home hidden-md hidden-lg"></i>
                                        <span class="hidden-sm"><?php echo $text_home; ?></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?php echo $wishlist; ?>" id="wishlist-total">
                                        <i class="fa fa-heart hidden-md hidden-lg"></i>
                                        <span class="hidden-sm"><?php echo $text_wishlist; ?></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?php echo $account; ?>">
                                        <i class="fa fa-user hidden-md hidden-lg"></i>
                                        <span class="hidden-sm"><?php echo $text_account; ?></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
                                        <i class="fa fa-shopping-cart hidden-md hidden-lg"></i>
                                        <span class="hidden-sm"><?php echo $text_shopping_cart; ?></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?php echo $checkout_simple; ?>" title="<?php echo $text_checkout; ?>">
                                        <i class="fa fa-share hidden-md hidden-lg"></i>
                                        <span class="hidden-sm"><?php echo $text_checkout; ?></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div id="search">
                            <i class="fa fa-search"></i>
                            <input type="text" name="search" value="" placeholder="Поиск по каталогу">
                            <button type="button" class="button-search"><i class="fa fa-angle-double-right"></i></button>
                            <div class="clear"></div>
                            <div class="tips-list"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="notification"></div>
    <div id="back-top">
        <a href="#top" class="round-animated-btn">
            <span class="wrap">
                <span class="content"></span>
            </span>
        </a>
    </div>