<?php require_once('/../../config.php'); ?>

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
<?php echo $supermenu_settings; ?>
</head>
<body>
<!-- toolbar -->
<div id="toolbar" class="navbar navbar-default hidden-print" role="toolbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#toolbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo $home; ?>"><?php echo $name; ?></a>
        </div>
        <div id="toolbar-collapse" class="navbar-collapse collapse">
            <!-- language -->
            <?php if ($language) { ?>
                <ul class="nav navbar-nav">
                    <li id="language" class="dropdown"><?php echo $language; ?></li>
                </ul>
            <?php } ?>
            <!-- currency -->
            <?php if ($currency) { ?>
                <ul class="nav navbar-nav">
                    <li id="currency" class="dropdown"><?php echo $currency; ?></li>
                </ul>
            <?php } ?>
            <!-- cart -->
            <ul class="nav navbar-nav">
                <li id="cart" class="dropdown"><?php echo $cart; ?></li>
            </ul>
            <!-- login/logout -->
            <ul class="nav navbar-nav navbar-right">
                <li><p class="navbar-text">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $logged ? $text_logged : $text_welcome; ?></p></li>
            </ul>
            <!-- search -->
            <form id="search" name="search" class="navbar-form" role="search" onsubmit="event.preventDefault(); location = 'index.php?route=product/search&' + $(this).serialize();">
                <div class="input-group">
                    <input type="search" class="form-control" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search ? : ''; ?>" style="min-width: 100px;" required />
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default" title="<?php echo $text_search; ?>"><span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- header -->
<div id="header" class="container">
    <div class="page-header">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <?php if ($logo) { ?>
                    <!-- logo -->
                    <a class="pull-left" href="<?php echo $home; ?>" role="banner">
                        <img id="logo" class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                    </a>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<!-- links -->
<div id="links" class="container hidden-print">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-pills pull-right hidden-xs" role="navigation">
                <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
                <li><a class="wishlist-total" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            </ul>
            <ul class="nav nav-pills nav-stacked text-center visible-xs" role="navigation">
                <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
                <li><a class="wishlist-total" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            </ul>
        </div>
    </div>
</div>
<br />
<!-- menu -->
<div id="menu" class="container-fluid hidden-print">
    <?php include('/../module/menu.tpl'); ?>
</div>