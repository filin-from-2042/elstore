<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main">
    <div class="row main-page">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>




            <!-- content -->
            <div id="content" class="row">
               <div class="<?php echo $bootstrap->content; ?>" role="main">

                    <h1><?php echo $heading_title; ?></h1>

                   <?php if ($categories) { ?>
                        <div class="row hidden-print">
                            <?php foreach ($categories as $category) { ?>
                                <div class="subcategory col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <a class="cat_thumbnail" href="<?php echo $category['href']; ?>" style="text-decoration: none;">
                                        <div class="caption text-center">
                                            <span><?php echo $category['name']; ?></span>
                                        </div>
                                    </a>
                                </div>
                            <?php } ?>
                        </div>
                        <br />
                    <?php } ?>
                    <?php if ($products) { ?>
                        <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/products.tpl'); ?>
                    <?php } ?>
                    <?php if (!$categories && !$products) { ?>
                        <p class="lead"><?php echo $text_empty; ?></p>
                        <br />
                        <a class="btn btn-primary pull-right" href="<?php echo $continue; ?>" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
                    <?php } ?>
                </div>
            </div>
            <br />
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