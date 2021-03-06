<!-- header -->
<?php echo $header; ?>

<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main">
    <?php if (!isset($_GET['path'])) $bRootDir = true; else $bRootDir = false;?>
    <div class="row main-page <?php if ($bRootDir) echo 'rootdir';?>">


        <!-- center -->
        <?php if (isset($products) && $products) { ?>
            <div class="<?php echo $bootstrap->center; ?>">
         <?php }
         else echo '<div class="col-lg-12 single-column">'; ?>
            <!-- breadcrumbs -->
                <div class="container">
                    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
                </div>

            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>



            <!-- content -->
            <div id="content" class="row">

               <div class="<?php echo $bootstrap->content; ?>" id="prods" role="main">
                   <div class="container">
                        <h1 class="catalog-title"><?php echo $heading_title; ?></h1>

                       <?php if (isset($description) && $description) { ?>
                       <div>
                           <div class="category-info">
                               <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                   <div class="panel panel-default">
                                       <div class="panel-heading" role="tab" id="headingOne">
                                           <h4 class="panel-title">
                                               <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"  aria-controls="collapseOne">
                                                   Описание категории
                                               </a>
                                           </h4>
                                       </div>
                                       <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                           <div class="panel-body">
                                               <?php echo $description; ?>
                                           </div>
                                       </div>
                                   </div>

                               </div>

                           </div>
                       </div>
                   <?php }?>
                   </div>


                 <?php if (isset($categories) && $categories) { ?>
                   <div class="container page-categories hidden-print">
                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <?php foreach ($categories as $category) { ?>
                           <div class="subcategory  col-xs-6 col-sm-4 col-md-3 col-lg-3">

                               <div class="hovereffect">
                                   <a class="cat_thumbnail" href="<?php echo $category['href']; ?>" style="text-decoration: none;">
                                       <div class="subcategory-image">
                                           <div class="text-left category-caption">
                                               <span><?php echo $category['name']; ?></span>
                                           </div>
                                           <img src="<?php echo $category['thumb']; ?>">
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
                       </div>

                   </div>
                   <?php } ?>
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