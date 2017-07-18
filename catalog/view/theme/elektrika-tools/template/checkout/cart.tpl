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
        <div class="col-sm-3">
            <?php echo $column_left; ?>
        </div>
        <?php } ?>
        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?>
                <?php if ($weight) { ?>
                &nbsp;(<?php echo $weight; ?>)
                <?php } ?>
            </h1>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="shoping_cart">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <td class="text-center"><?php echo $column_image; ?></td>
                            <td class="text-left"><?php echo $column_name; ?></td>
                            <td class="text-left"><?php echo $column_model; ?></td>
                            <td class="text-left"><?php echo $column_quantity; ?></td>
                            <td class="text-right"><?php echo $column_price; ?></td>
                            <td class="text-right"><?php echo $column_total; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($products as $product) { ?>
                        <tr>
                            <td class="text-center"><?php if ($product['thumb']) { ?>
                                <div class="image">
                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                </div>
                                <?php } ?></td>
                            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <?php if (!$product['stock']) { ?>
                                <span class="stock">***</span>
                                <?php } ?>
                                <div>
                                    <?php foreach ($product['option'] as $option) { ?>
                                    - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                                    <?php } ?>
                                </div>
                                <?php if ($product['reward']) { ?>
                                <small><?php echo $product['reward']; ?></small>
                                <?php } ?></td>
                            <td class="text-left"><?php echo $product['model']; ?></td>
                            <td class="text-left">
                                <div class="input-group btn-block count-block" style="max-width: 200px;">
                                    <div class="clearfix count-wrap">
                                    <input class="form-control cart-q" type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                                    </div>
                                    <div class="cart-controls-wrap">
                                        <button type="submit" data-toggle="tooltip" title="Обновить корзину" class="btn btn-icon" ><i class="fa fa-refresh"></i></button>
                                        <button type="button" data-toggle="tooltip" title="Удалить товар" class="btn btn-icon" onclick="location = '<?php echo $product['remove']; ?>'"><i class="fa fa-times-circle"></i></button>
                                    </div>
                                </div>
                            <td class="text-right">
                                <div class="price"><?php echo $product['price']; ?></div>
                            </td>
                            <td class="text-right">
                                <div class="price price-total"><?php echo $product['total']; ?></div>
                            </td>
                        </tr>
                        <?php } ?>
                        <?php foreach ($vouchers as $vouchers) { ?>
                        <tr>
                            <td class="image"></td>
                            <td class="name"><?php echo $vouchers['description']; ?></td>
                            <td class="model"></td>
                            <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
                                &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
                            <td class="price"><?php echo $vouchers['amount']; ?></td>
                            <td class="total"><?php echo $vouchers['amount']; ?></td>
                        </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </form>


            <div class="row">
                <div class="col-sm-4 col-sm-offset-8">
                    <table class="table table-bordered">
                        <tbody>
                        <?php foreach ($totals as $total) { ?>
                        <tr>
                            <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                            <td class="text-right"><div class="price"><?php echo $total['text']; ?></div></td>
                        </tr>
                        <?php } ?>
                        </tbody></table>
                </div>
            </div>

            <div class="buttons">
                <div class="pull-right">
                    <?php /*if ($logged){ ?>
                    <button type="button" id="button-confirm" class="btn btn-primary" data-toggle="tooltip" title="В контактных данных в заказе будут указаны данные из профиля пользователя" data-loading-text="Отправить заказ...">Отправить заказ</button>
                    <?php } else { ?>
                    <a href="<?php echo $checkout_simple; ?>" data-toggle="tooltip" title="Перейти к оформлению заказа" class="btn"><?php echo $button_checkout; ?></a>
                    <?php }*/?>
                    <a href="<?php echo $checkout_simple; ?>" data-toggle="tooltip" title="Перейти к оформлению заказа" class="btn"><?php echo $button_checkout; ?></a>
                    <a href="<?php echo $continue; ?>" data-toggle="tooltip" title="Перейти в каталог магазина" class="btn btn-primary continue-btn"><?php echo $button_shopping; ?></a>
                </div>
            </div>


            <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>
<script>
    jQuery(function($) {
        /** Confirm */
        $('#button-confirm').click(function() {
            $.ajax({
                async: false,
                url: 'index.php?route=checkout/create_order',
                type: 'get',
                context: this,
                success: function(responce) {
                    if(parseInt(responce) > 0 ) location = 'index.php?route=checkout/success'
                }
            });
        });
    });
</script>