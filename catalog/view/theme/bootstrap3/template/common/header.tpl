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
                        <!-- logo -->
                        <a class="pull-left" href="<?php echo $home; ?>" role="banner">
                            <img id="logo" class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                        </a>

                        <?php } ?>
                    </div>
                    <div class="elements-wrap">
                            <div class="shop-menu-wrapper">
                                <div class="shop-nav">
                                    <ul id="shopnav" class="shop-menu">
                                        <li><a href="#">Compare</a></li>
                                        <li><a href="/">Wishlist</a></li>
                                        <li><a href="/">Delivery</a></li>
                                        <li><a href="/">Help</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!--<div class="socials-wrapper">
                                <ul class="social">
                                    <li><a href="https://www.facebook.com/" title="facebook"><i class="icon-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/" title="twitter"><i class="icon-twitter"></i></a>
                                </ul>
                            </div>-->
                            <div class="search-wrapper">
                                <!-- BEGIN SEARCH FORM -->
                                <div class="search-form search-form__h clearfix">
                                    <form id="search" name="search" class="navbar-form pull-right" role="search" onsubmit="event.preventDefault(); location = 'index.php?route=product/search&' + $(this).serialize();">

                                            <input type="search" class="form-control" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search ? : ''; ?>" style="min-width: 100px;" required />
                                            <!--<div class="input-group-btn">
                                                <button type="submit" class="btn btn-default" title="<?php echo $text_search; ?>"><span class="glyphicon glyphicon-search"></span></button>
                                            </div>-->
                                            <input type="submit" value="" id="search-form_is" class="btn btn-primary">

                                    </form>
                                </div>
                            </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="header-nav">
                    <div id="menu" class="container-fluid hidden-print">
                        <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/menu.tpl'); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
