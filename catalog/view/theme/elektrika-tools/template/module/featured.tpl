<!-- FEATURED -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="recs-title"><strong>Рекомендуемые</strong> товары</h3>
    </div>
    <div class="panel-body">
        <div id="products" class="row">
            <?php foreach ($products as $product) {   ?>
                <?php include(DIR_APPLICATION .'view/theme/elektrika-tools/template/module/products_thumbnail.tpl'); ?>
            <?php } ?>
        </div>
    </div>
</div>