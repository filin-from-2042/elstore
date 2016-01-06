<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include('/../module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container">
    <div class="row">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <?php include('/../module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?></h1>
                    <?php if ($products) { ?>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr class="active">
                                        <td class="hidden-xs"><?php echo $column_image; ?></td>
                                        <td><?php echo $column_name; ?></td>
                                        <td><?php echo $column_model; ?></td>
                                        <td class="text-center"><?php echo $column_stock; ?></td>
                                        <td class="text-center"><?php echo $column_price; ?></td>
                                        <td class="text-center"><?php echo $column_action; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($products as $product) { ?>
                                        <tr>
                                            <td class="hidden-xs">
                                                <?php if ($product['thumb']) { ?>
                                                    <a href="<?php echo $product['href']; ?>">
                                                        <img class="img-responsive img-rounded" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                                                    </a>
                                                <?php } ?>
                                            </td>
                                            <td><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
                                            <td><?php echo $product['model']; ?></td>
                                            <td class="text-right"><?php echo $product['stock']; ?></td>
                                            <td class="text-right">
                                                <?php if ($product['price']) { ?>
                                                    <?php if (!$product['special']) { ?>
                                                        <strong class="text-danger"><?php echo $product['price']; ?></strong>
                                                    <?php } else { ?>
                                                        <small class="text-warning text-sthrough"><?php echo $product['price']; ?></small> <wbr /><strong class="text-danger"><?php echo $product['special']; ?></strong>
                                                    <?php } ?>
                                                <?php } ?>
                                            </td>
                                            <td class="text-right nowrap">
                                                <button type="button" class="btn btn-primary" name="addToCart" data-loading-text="<?php echo $button_cart; ?>..." title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, this);"><?php echo $button_cart; ?></button>
                                                <a class="btn btn-default" href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>"><span class="glyphicon glyphicon-remove"></span></a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    <?php } else { ?>
                        <p class="lead"><?php echo $text_empty; ?></p>
                        <br />
                    <?php } ?>
                    <a class="btn btn-primary pull-right" href="<?php echo $continue; ?>" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
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