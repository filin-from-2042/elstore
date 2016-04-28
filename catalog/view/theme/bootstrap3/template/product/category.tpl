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
        <?php if (isset($products) && $products) { ?>
            <div class="<?php echo $bootstrap->center; ?>">
         <?php }
         else echo '<div class="col-lg-12 single-column">'; ?>
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>



            <!-- content -->
            <div id="content" class="row">
               <div class="<?php echo $bootstrap->content; ?>" role="main">

                    <h1 class="catalog-title"><?php echo $heading_title; ?></h1>

                   <div class="row page-categories hidden-print">
                       <?php if (isset($categories) && $categories) { ?>
                           <?php foreach ($categories as $category) { ?>
                           <div class="subcategory  col-xs-12 col-sm-4 col-md-3 col-lg-3">
                               <div class="hovereffect">
                                   <a class="cat_thumbnail" href="<?php echo $category['href']; ?>" style="text-decoration: none;">
                                       <div class="subcategory-image"><img src="<?php echo $category['thumb']; ?>"></div>
                                       <div class="caption text-left">
                                           <span><?php echo $category['name']; ?></span>
                                       </div>
                                       <?php if ($category['meta_description']) { ?>
                                           <div class="overlay">
                                               <span class="info"><?php echo $category['meta_description']; ?></span>
                                           </div>
                                       <?php }?>
                                   </a>
                               </div>

                           </div>
                           <?php } ?>


                        <?php } ?>
                   </div>
                   <?php if (isset($products) && $products) { ?>
                        <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/products.tpl'); ?>
                    <?php } ?>
                    <?php if (isset($categories) && !$categories && isset($products) && !$products) { ?>
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
        <?php if (isset($products) && $products) { ?>
            <?php if ($column_left) { ?>
                <div id="left" class="<?php echo $bootstrap->left; ?>"><?php echo $column_left; ?></div>
                <?php } ?>
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