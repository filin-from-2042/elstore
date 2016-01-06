<!-- CART modal -->
<a id="cart-button" data-toggle="modal" href="#cart-modal">
    <span id="cart-total"><?php echo $text_items; ?></span>
    <span class="caret"></span>
</a>
<div id="cart-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?php echo $heading_title; ?></h4>
            </div>
            <?php if ($products || $vouchers) { ?>
                <div id="cart-content" class="modal-body">
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
                    <br />
                </div>
                <div id="cart-buttons" class="modal-footer">
                    <div class="pull-left hidden-xs">
                        <a class="btn btn-info pull-left" href="<?php echo $cart; ?>" title="<?php echo $text_cart; ?>"><?php echo $text_cart; ?></a>
                        <a class="btn btn-success pull-left" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?></a>
                    </div>
                    <a class="btn btn-success btn-block visible-xs" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?></a>
                    <a class="btn btn-info btn-block visible-xs" href="<?php echo $cart; ?>" title="<?php echo $text_cart; ?>"><?php echo $text_cart; ?></a>
                    <button type="button" class="btn btn-default btn-block visible-xs" title="<?php echo $this->language->get('button_shopping'); ?>" data-dismiss="modal"><?php echo $this->language->get('button_shopping'); ?></button>
                    <button type="button" class="btn btn-default pull-right hidden-xs" title="<?php echo $this->language->get('button_shopping'); ?>" data-dismiss="modal"><?php echo $this->language->get('button_shopping'); ?></button>
                </div>
            <?php } else { ?>
                <div id="cart-content" class="modal-body">
                    <h4 class="text-muted text-center"><?php echo $text_empty; ?></h4>
                </div>
                <div id="cart-buttons" class="modal-footer">
                    <div class="pull-left hidden-xs">
                        <a class="btn btn-info pull-left" href="<?php echo $cart; ?>" title="<?php echo $text_cart; ?>" disabled><?php echo $text_cart; ?></a>
                        <a class="btn btn-success pull-left" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>" disabled><?php echo $text_checkout; ?></a>
                    </div>
                    <a class="btn btn-success btn-block visible-xs" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>" disabled ><?php echo $text_checkout; ?></a>
                    <a class="btn btn-info btn-block visible-xs" href="<?php echo $cart; ?>" title="<?php echo $text_cart; ?>" disabled ><?php echo $text_cart; ?></a>
                    <button type="button" class="btn btn-default btn-block visible-xs" title="<?php echo $this->language->get('button_shopping'); ?>" data-dismiss="modal"><?php echo $this->language->get('button_shopping'); ?></button>
                    <button type="button" class="btn btn-default pull-right hidden-xs" title="<?php echo $this->language->get('button_shopping'); ?>" data-dismiss="modal"><?php echo $this->language->get('button_shopping'); ?></button>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
<!-- js -->
<script>
jQuery(function($) {
    // MODAL FIX
    $('#cart-modal').appendTo('body');
    
    // CART UPDATE
    window.cartUpdate = function(url) {
        $.ajax({
            async: true,
            url: url,
            type: 'get',
            dataType: 'html',
            success: function(html) {
                $html = $(html);
                $('#cart-total').html($html.children('#cart-total').html());
                $('#cart-content').html($html.find('#cart-content').html());
                $('#cart-buttons').html($html.find('#cart-buttons').html());
            }
        });
    };
    
    $('#cart').on('added', function(){ cartUpdate('index.php?route=module/cart'); });
    
    // SHOW ON ADDED
    //$('#cart').on('added', function(){ $('#cart-modal').modal('show'); });
});
</script>