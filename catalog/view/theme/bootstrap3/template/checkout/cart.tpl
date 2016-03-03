<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR . THEME .'template/module/notification.tpl'); ?>
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
            <?php include(DIR . THEME .'template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?><?php if ($weight) { ?>&nbsp;<small>(<?php echo $weight; ?>)</small><?php } ?></h1>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr class="active">
                                        <td class="hidden-xs"><?php echo $column_image; ?></td>
                                        <td><?php echo $column_name; ?></td>
                                        <td><?php echo $column_model; ?></td>
                                        <td><?php echo $column_quantity; ?></td>
                                        <td></td>
                                        <td class="text-center"><?php echo $column_price; ?></td>
                                        <td class="text-center"><?php echo $column_total; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($products as $product) { ?>
                                        <tr>
                                            <td class="hidden-xs">
                                                <?php if ($product['thumb']) { ?>
                                                    <a href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                                <?php } ?>
                                            </td>
                                            <td>
                                                <?php if ($product['stock']) { ?>
                                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                                <?php } else { ?>
                                                    <a class="text-danger" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?>&nbsp;<b>***</b></a>
                                                <?php } ?>
                                                <ul class="list-unstyled text-muted">
                                                    <?php foreach ($product['option'] as $option) { ?>
                                                        <li>-&nbsp;<small><?php echo $option['name']; ?>:&nbsp;<?php echo $option['value']; ?></small></li>
                                                    <?php } ?>
                                                </ul>
                                                <?php if ($product['reward']) { ?>
                                                    <small class="text-muted"><?php echo $product['reward']; ?></small>
                                                <?php } ?>
                                            </td>
                                            <td><?php echo $product['model']; ?></td>
                                            <td>
                                                <input type="number" class="form-control" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" min="1" style="width: 85px;" />
                                            </td>
                                            <td class="nowrap">
                                                <button type="submit" class="btn btn-default" title="<?php echo $button_update; ?>">
                                                    <span class="glyphicon glyphicon-refresh"></span>
                                                </button>
                                                <a class="btn btn-default" href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </a>
                                            </td>
                                            <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['price']; ?></strong></td>
                                            <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['total']; ?><strong></td>
                                            
                                        </tr>
                                    <?php } ?>
                                    <?php foreach ($vouchers as $vouchers) { ?>
                                        <tr>
                                            <td></td>
                                            <td><?php echo $vouchers['description']; ?></td>
                                            <td></td>
                                            <td>
                                                <input type="number" class="form-control" name="" value="1" style="width: 85px;" min="1" max="1" disabled />
                                            </td>
                                            <td>
                                                <a class="btn btn-default" href="<?php echo $vouchers['remove']; ?>" title="<?php echo $button_remove; ?>">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </a>
                                            </td>
                                            <td class="text-right nowrap"><strong class="text-danger"><?php echo $vouchers['amount']; ?></strong></td>
                                            <td class="text-right nowrap"><strong class="text-danger"><?php echo $vouchers['amount']; ?></strong></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </form>
                    <hr />
                    <br />
                    <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
                        <h2><?php echo $text_next; ?></h2>
                        <p class="lead"><?php echo $text_next_choice; ?></p>
                        <ul class="nav nav-tabs hidden-print">
                            <?php if ($shipping_status) { ?>
                                <li class="<?php echo (!$next || $next == 'shipping') ? 'active' : ''; ?>">
                                    <a href="#tab-shipping" title="<?php echo $text_shipping_estimate; ?>" data-toggle="tab"><?php echo $text_shipping_estimate; ?></a>
                                </li>
                            <?php } ?>
                            <?php if ($coupon_status) { ?>
                                <li class="<?php echo ((!$next && !$shipping_status) || $next == 'coupon') ? 'active' : ''; ?>">
                                    <a href="#tab-coupon" title="<?php echo $text_use_coupon; ?>" data-toggle="tab"><?php echo $text_use_coupon; ?></a>
                                </li>
                            <?php } ?>
                            <?php if ($voucher_status) { ?>
                                <li class="<?php echo ((!$next && !$shipping_status && !$coupon_status) || $next == 'voucher') ? 'active' : ''; ?>">
                                    <a href="#tab-voucher" title="<?php echo $text_use_voucher; ?>" data-toggle="tab"><?php echo $text_use_voucher; ?></a>
                                </li>
                            <?php } ?>
                            <?php if ($reward_status) { ?>
                                <li class="<?php echo ((!$next && !$shipping_status && !$coupon_status && !$voucher_status) || $next == 'reward') ? 'active' : ''; ?>">
                                    <a href="#tab-reward" title="<?php echo $text_use_reward; ?>" data-toggle="tab"><?php echo $text_use_reward; ?></a>
                                </li>
                            <?php } ?>
                        </ul>
                        <div class="tab-content">
                            <?php if ($shipping_status) { ?>
                                <div id="tab-shipping" class="tab-pane <?php echo (!$next || $next == 'shipping') ? 'active' : ''; ?>">
                                    <form class="cart-module form-horizontal" name="shipping">
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-push-4 col-md-push-4 col-lg-push-4">
                                                <p class="form-control-static"><b><?php echo $text_shipping_detail; ?></b></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="<?php echo $bootstrap->label; ?>">
                                                <b class="text-danger">*</b>
                                                <?php echo $entry_country; ?>
                                            </label>
                                            <div class="<?php echo $bootstrap->input; ?>">
                                                <select class="form-control" name="country_id" pattern="^\d+$" required>
                                                    <option value=""><?php echo $text_select; ?></option>
                                                    <?php foreach ($countries as $country) { ?>
                                                        <option value="<?php echo $country['country_id']; ?>" data-iso2="<?php echo $country['iso_code_2']; ?>" <?php echo ($country['country_id'] == $country_id) ? 'selected' : ''; ?>><?php echo $country['name']; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="<?php echo $bootstrap->label; ?>">
                                                <b class="text-danger">*</b>
                                                <?php echo $entry_zone; ?>
                                            </label>
                                            <div class="<?php echo $bootstrap->input; ?>">
                                                <select class="form-control" name="zone_id" pattern="^\d+$" required></select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="<?php echo $bootstrap->label; ?>">
                                                <b class="text-danger">*</b>
                                                <?php echo $entry_postcode; ?>
                                            </label>
                                            <div class="<?php echo $bootstrap->input; ?>">
                                                <input type="text" class="form-control" name="postcode" value="<?php echo $postcode; ?>" pattern="^.{2,10}$" required />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                                <button type="button" class="btn btn-info" title="<?php echo $button_quote; ?>" data-loading-text="<?php echo $button_quote; ?>..."><?php echo $button_quote; ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            <?php } ?>
                            <?php if ($coupon_status) { ?>
                                <div id="tab-coupon" class="tab-pane <?php echo ((!$next && !$shipping_status) || $next == 'coupon') ? 'active' : ''; ?>">
                                    <form class="cart-module form-horizontal" name="coupon" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="<?php echo $bootstrap->label; ?>">
                                                <?php echo $entry_coupon; ?>
                                            </label>
                                            <div class="<?php echo $bootstrap->input; ?>">
                                                <input type="text" class="form-control" name="coupon" value="<?php echo $coupon; ?>" required />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                                <input type="submit" class="btn btn-info" value="<?php echo $button_coupon; ?>" />
                                            </div>
                                        </div>
                                        <input type="hidden" name="next" value="coupon" />
                                    </form>
                                </div>
                            <?php } ?>
                            <?php if ($voucher_status) { ?>
                                <div id="tab-voucher" class="tab-pane <?php echo ((!$next && !$shipping_status && !$coupon_status) || $next == 'voucher') ? 'active' : ''; ?>">
                                    <form class="cart-module form-horizontal" name="voucher" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="<?php echo $bootstrap->label; ?>">
                                                <?php echo $entry_voucher; ?>
                                            </label>
                                            <div class="<?php echo $bootstrap->input; ?>">
                                                <input type="text" class="form-control" name="voucher" value="<?php echo $voucher; ?>" required />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                                <button type="submit" class="btn btn-info" title="<?php echo $button_voucher; ?>"><?php echo $button_voucher; ?></button>
                                            </div>
                                        </div>
                                        <input type="hidden" name="next" value="voucher" />
                                    </form>
                                </div>
                            <?php } ?>
                            <?php if ($reward_status) { ?>
                                <div id="tab-reward" class="tab-pane <?php echo ((!$next && !$shipping_status && !$coupon_status && !$voucher_status) || $next == 'reward') ? 'active' : ''; ?>">
                                    <form class="cart-module form-horizontal" name="reward" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="<?php echo $bootstrap->label; ?>">
                                                <?php echo $entry_reward; ?>
                                            </label>
                                            <div class="<?php echo $bootstrap->input; ?>">
                                                <input type="text" class="form-control" name="reward" value="<?php echo $reward; ?>" required />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                                <button type="submit" class="btn btn-info" title="<?php echo $button_reward; ?>"><?php echo $button_reward; ?></button>
                                            </div>
                                        </div>
                                        <input type="hidden" name="next" value="reward" />
                                    </form>
                                </div>
                            <?php } ?>
                        </div>
                        <hr />
                        <br />
                    <?php } ?>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <table class="pull-right">
                                <?php foreach ($totals as $total) { ?>
                                    <tr>
                                        <td class="text-right"><strong class="text-big"><?php echo $total['title']; ?>:&nbsp;</strong></td>
                                        <td class="text-right nowrap"><strong class="text-big text-danger"><?php echo $total['text']; ?></strong></td>
                                    </tr>
                                <?php } ?>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div class="pull-right">
                        <a class="btn btn-success" href="<?php echo $checkout; ?>" title="<?php echo $button_checkout; ?>"><?php echo $button_checkout; ?></a>
                        <a class="btn btn-primary" href="<?php echo $continue; ?>" title="<?php echo $button_shopping; ?>"><?php echo $button_shopping; ?></a>
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
<!-- modal -->
<div id="shipping-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <form class="modal-content form-horizontal" name="shipping-form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?php echo $text_shipping_method; ?></h4>
            </div>
            <div class="modal-body container"></div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="<?php echo $button_shipping; ?>" />
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $this->language->get('button_continue'); ?></button>
            </div>
        </form>
    </div>
</div>
<!-- js -->
<script>
jQuery(function($){
    // GET COUNTRY
    $('select[name="country_id"]', 'form[name="shipping"]').change(function() {
        getCountry.call(this, {
            url: 'index.php?route=checkout/cart/country',
            zone_id: '<?php echo $zone_id; ?>',
            textSelect: '<?php echo $text_select; ?>',
            textNone: '<?php echo $text_none; ?>'
        });
    });
    
    // SHIPPING
    $('form[name="shipping"] button').click(function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/quote',
            type: 'post',
            data: $('form[name="shipping"]').serialize(),
            dataType: 'json',
            context: this,
            beforeSend: function() {
                $(this).button('loading');
                $('[role="status"]', 'form[name="shipping"]').remove();
            },
            complete: function() {
                $(this).button('reset');
            },		
            success: function(json) {
                if (json.shipping_method) {
                    html = '';
                    
                    for (i in json.shipping_method) {
                        html += '<fieldset>';
                        html += '<legend>' + json.shipping_method[i].title + '</legend>';
                        html += '<div class="form-group">';
                        html += '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">';
                    
                        if (!json.shipping_method[i].error) {
                            for (j in json.shipping_method[i].quote) {
                                html += '<div class="radio">'
                                html += '<label>';
                                html += '<input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" ' + ((json.shipping_method[i].quote[j].code == '<?php echo $shipping_method; ?>') ? 'checked' : '') + ' required />';
                                html += json.shipping_method[i].quote[j].title;
                                html += '<b class="text-danger pull-right">' + json.shipping_method[i].quote[j].text + '</b>';
                                html += '</label>';
                                html += '</div>';
                            }
                        } else {
                            html += '<p class="form-control-static text-warning" role="status">' + json.shipping_method[i].error + '</p>';
                        }
                        
                        html += '</div>';
                        html += '</div>';
                        html += '</fieldset>';
                    }
                    
                    html += '<input type="hidden" name="next" value="shipping" />';
                    
                    $('form[name="shipping-form"] div.modal-body').html(html);
                    
                    $('#shipping-modal').modal('show');
                } else if (json.error) {
                    if (json.error.warning) $('#notification').html(notification('warning', json.error.warning));
                    if (json.error['country']) $('select[name="country_id"]').after(notice('warning', json.error['country']));
                    if (json.error['zone']) $('select[name="zone_id"]').after(notice('warning', json.error['zone']));
                    if (json.error['postcode']) $('input[name="postcode"]').after(notice('warning', json.error['postcode']));
                }
            }
        });
    });
    
    // TRIGGER INPUTS
    $('select[name="country_id"]', 'form[name="shipping"]').change();
});
</script>
</body>
</html>