<?php echo $header; ?>
<div class="container">

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div class="row">
        <div class="col-sm-12">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                </li>
                <?php } ?>
            </ul>
        </div>
        <?php if ($column_left){ ?>
        <aside class="col-sm-3">
            <?php echo $column_left; ?>
        </aside>
        <?php } ?>
        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <?php if ($success) { ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
            <?php } ?>
            <?php if ($products) { ?>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <td class="image"><?php echo $column_image; ?></td>
                        <td class="name"><?php echo $column_name; ?></td>
                        <td class="model"><?php echo $column_model; ?></td>
                        <td class="stock"><?php echo $column_stock; ?></td>
                        <td class="price"><?php echo $column_price; ?></td>
                        <td class="action"><?php echo $column_action; ?></td>
                    </tr>
                    </thead>
                    <?php foreach ($products as $product) { ?>
                    <tbody id="wishlist-row<?php echo $product['product_id']; ?>">
                    <tr>
                        <td class="text-center image"><?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                            <?php } ?></td>
                        <td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
                        <td class="text-left"><?php echo $product['model']; ?></td>
                        <td class="text-right green"><?php echo $product['stock']; ?></td>
                        <td class="text-right"><?php if ($product['price']) { ?>
                            <div class="price">
                                <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
                                <?php } ?>
                            </div>
                            <?php } ?></td>
                        <td class="text-right">
                            <button type="button" onclick="addToCart('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="" class="btn btn-icon" data-original-title="В корзину"><i class="fa fa-shopping-cart"></i></button>
                            <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="" class="btn btn-icon" data-original-title="Удалить из закладок"><i class="fa fa-times"></i></a>
                        </td>
                    </tr>
                    </tbody>
                    <?php } ?>
                </table>
            </div>
            <div class="buttons">
                <div class="text-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } else { ?>
            <div class="content"><?php echo $text_empty; ?></div>
            <div class="buttons">
                <div class="text-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>