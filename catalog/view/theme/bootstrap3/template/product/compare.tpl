<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" >
    <div class="row main-page">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?></h1>
                    <?php if ($products) { ?>
                        <!-- compare table -->
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="active">
                                        <td class="col-xs-12 col-sm-12 col-md-12 col-lg-12" colspan="<?php echo count($products) + 1; ?>"><b class="text-big"><?php echo $text_product; ?></b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><b><?php echo $text_name; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_image; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td>
                                                <?php if ($products[$product['product_id']]['thumb']) { ?>
                                                    <img class="img-responsive img-rounded" src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                                                <?php } ?>
                                            </td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_price; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td>
                                                <?php if ($products[$product['product_id']]['price']) { ?>
                                                    <?php if (!$products[$product['product_id']]['special']) { ?>
                                                        <strong class="text-danger nowrap"><?php echo $products[$product['product_id']]['price']; ?></strong>
                                                    <?php } else { ?>
                                                        <small class="text-warning text-sthrough nowrap"><?php echo $products[$product['product_id']]['price']; ?></small> <wbr /><strong class="text-danger nowrap"><?php echo $products[$product['product_id']]['special']; ?></strong>
                                                    <?php } ?>
                                                <?php } ?>
                                            </td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_model; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td><?php echo $products[$product['product_id']]['model']; ?></td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_manufacturer; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_availability; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td><?php echo $products[$product['product_id']]['availability']; ?></td>
                                        <?php } ?>
                                    </tr>
                                    <?php if ($review_status) { ?>
                                        <tr>
                                            <td><b><?php echo $text_rating; ?></b></td>
                                            <?php foreach ($products as $product) { ?>
                                                <td>
                                                    <img src="<?php echo THEME . 'image/stars-' . $products[$product['product_id']]['rating'] . '.png'; ; ?>" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /><br />
                                                    <?php echo $products[$product['product_id']]['reviews']; ?>
                                                </td>
                                            <?php } ?>
                                        </tr>
                                    <?php } ?>
                                    <tr>
                                        <td><b><?php echo $text_summary; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_weight; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td><?php echo $products[$product['product_id']]['weight']; ?></td>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <td><b><?php echo $text_dimension; ?></b></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
                                        <?php } ?>
                                    </tr>
                                </tbody>
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <thead>
                                        <tr class="active">
                                            <td colspan="<?php echo count($products) + 1; ?>"><b class="text-big"><?php echo $attribute_group['name']; ?></b></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                                            <tr>
                                                <td><b><?php echo $attribute['name']; ?></b></td>
                                                <?php foreach ($products as $product) { ?>
                                                    <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                                                        <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
                                                    <?php } else { ?>
                                                        <td></td>
                                                    <?php } ?>
                                                <?php } ?>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                <?php } ?>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td class="text-right">
                                                <button type="button" class="btn btn-primary" name="addToCart" title="<?php echo $button_cart; ?>" data-loading-text="<?php echo $button_cart; ?>..." onclick="addToCart('<?php echo $product['product_id']; ?>', 1, this);"><?php echo $button_cart; ?></button>
                                                <a class="btn btn-default" href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>"><?php echo $button_remove; ?></a>
                                            </td>
                                        <?php } ?>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    <?php } else { ?>
                        <!-- empty -->
                        <p class="lead"><?php echo $text_empty; ?></p>
                        <br />
                    <?php } ?>
                    <div class="row hidden-print">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <a class="btn btn-primary" href="<?php echo $continue; ?>" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
                        </div>
                    </div>
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