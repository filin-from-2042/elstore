<!-- FEATURED -->
<div class="panel panel-default featured goods-block">
    <div class="panel-heading">
        <h3 class="recs-title"><?php echo $heading_title; ?></h3>
    </div>
    <div class="panel-body">
        <div id="products" class="row">
            <?php foreach ($products as $product) {   ?>
                <?php include(DIR_APPLICATION .'view/theme/elektrika-tools/template/module/products_thumbnail.tpl'); ?>
            <?php } ?>
        </div>
    </div>
</div>