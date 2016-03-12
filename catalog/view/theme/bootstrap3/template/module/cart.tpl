<!-- CART dropdown -->
<div id="cart">
    <a id="cart-button" class="dropdown-toggle" data-toggle="dropdown">
        <span id="cart-total"><?php echo $text_items; ?></span>
        <span class="caret"></span>
    </a>
    <div id="cart-content" class="dropdown-menu">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h4 class="text-muted"><?php echo $heading_title; ?></h4>
        </div>
        <hr />
        <?php if ($products || $vouchers) { ?>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <?php foreach ($products as $product) { ?>
                            <tr>
                                <td class="hidden-xs">
                                    <?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                    <?php } ?>
                                </td>
                                <td>
                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    <?php if ($product['option']) { ?>
                                        <ul class="list-unstyled text-muted">
                                            <?php foreach ($product['option'] as $option) { ?>
                                                <li><small>&nbsp;-&nbsp;<?php echo $option['name']; ?>: <?php echo $option['value']; ?></small></li>
                                            <?php } ?>
                                        </ul>
                                    <?php } ?>
                                </td>
                                <td class="text-right">x&nbsp;<?php echo $product['quantity']; ?></td>
                                <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['total']; ?></strong></td>
                                <td class="text-right">
                                    <a class="text-muted" title="<?php echo $button_remove; ?>" onclick="removeFromCart('<?php echo $product['key']; ?>');">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </a>
                                </td>
                            </tr>
                        <?php } ?>
                        <?php foreach ($vouchers as $voucher) { ?>
                            <tr>
                                <td class="hidden-xs"></td>
                                <td><?php echo $voucher['description']; ?></td>
                                <td class="text-right">x&nbsp;1</td>
                                <td class="text-right nowrap"><strong class="text-danger"><?php echo $voucher['amount']; ?></strong></td>
                                <td class="text-right">
                                    <a class="text-muted" title="<?php echo $button_remove; ?>" onclick="removeFromCart('<?php echo $voucher['key']; ?>');">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </a>
                                </td>
                            </tr>
                        <?php } ?>
                    </table>
                </div>
                <table class="pull-right">
                    <?php foreach ($totals as $total) { ?>
                        <tr>
                            <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                            <td class="text-right nowrap"><strong class="text-danger">&nbsp;<?php echo $total['text']; ?></strong></td>
                        </tr>
                    <?php } ?>
                </table>
                <br clear="all" />
            </div>
            <hr />
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom: 5px;">
                <a class="btn btn-block btn-sm btn-info" href="<?php echo $cart; ?>" title="<?php echo $text_cart; ?>" ><?php echo $text_cart; ?></a>
                <a class="btn btn-block btn-sm btn-success" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>" ><?php echo $text_checkout; ?></a>
            </div>
        <?php } else { ?>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 nowrap">
                <h4 class="text-muted text-center"><?php echo $text_empty; ?></h4>
            </div>
            <hr />
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom: 5px;">
                <a class="btn btn-block btn-sm btn-info" href="<?php echo $cart; ?>" title="<?php echo $text_cart; ?>" disabled ><?php echo $text_cart; ?></a>
                <a class="btn btn-block btn-sm btn-success" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>" disabled ><?php echo $text_checkout; ?></a>
            </div>
        <?php } ?>
    </div>
</div>
<!-- js -->
<script>
jQuery(function($) {

    // CART UPDATE
    window.cartUpdate = function(url) {
        $.ajax({
            async: true,
            url: url,
            type: 'get',
            dataType: 'html',
            success: function(html) {
                $html = $(html);
                $('#cart-total').html($html.find('#cart-total').html());
                $('#cart-content').html($html.find('#cart-content').html());
            }
        });
    };

    $('#cart').on('added', function() { cartUpdate('index.php?route=module/cart'); });
});
</script>