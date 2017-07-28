<!-- SPECIAL -->
<div class="panel panel-default special goods-block">
    <div class="panel-heading">
        <h3 class="specials-title"><?php echo $heading_title; ?>
            <a class="pull-right view-all" href="<?php echo $viewAll;?>">Смотреть все</a>
        </h3>

    </div>
    <div class="panel-body">
        <div id="products" class="row">
            <?php foreach ($products as $product) {   ?>
                <?php include(DIR_APPLICATION .'view/theme/elektrika-tools/template/module/products_thumbnail.tpl'); ?>
            <?php } ?>
        </div>
    </div>
</div>