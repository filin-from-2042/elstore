<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
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
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?></h1>
                    <h2><?php echo $text_order_detail; ?></h2>
                    <?php if ($invoice_no) { ?>
                        <b><?php echo $text_invoice_no; ?></b> <wbr /><?php echo $invoice_no; ?><br />
                    <?php } ?>
                    <b><?php echo $text_order_id; ?></b> <wbr />#<?php echo $order_id; ?><br />
                    <b><?php echo $text_date_added; ?></b> <wbr /><?php echo $date_added; ?><br />
                    <?php if ($payment_method) { ?>
                        <b><?php echo $text_payment_method; ?></b> <wbr /><?php echo $payment_method; ?><br />
                    <?php } ?>
                    <?php if ($shipping_method) { ?>
                        <b><?php echo $text_shipping_method; ?></b> <wbr /><?php echo $shipping_method; ?><br />
                    <?php } ?>
                    <h2><?php echo $text_payment_address; ?></h2>
                    <p><?php echo $payment_address; ?></p>
                    <?php if ($shipping_address) { ?>
                        <h2><?php echo $text_shipping_address; ?></h2>
                        <p><?php echo $shipping_address; ?></p>
                    <?php } ?>
                    <br />
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr class="active">
                                    <td><?php echo $column_name; ?></td>
                                    <td><?php echo $column_model; ?></td>
                                    <td class="text-center"><?php echo $column_quantity; ?></td>
                                    <td class="text-center"><?php echo $column_price; ?></td>
                                    <td class="text-center"><?php echo $column_total; ?></td>
                                    <?php if ($products) { ?>
                                        <td></td>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($products as $product) { ?>
                                    <tr>
                                        <td>
                                            <?php echo $product['name']; ?>
                                            <ul class="list-unstyled text-muted">
                                                <?php foreach ($product['option'] as $option) { ?>
                                                    <li>&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small></li>
                                                <?php } ?>
                                            </ul>
                                        </td>
                                        <td><?php echo $product['model']; ?></td>
                                        <td class="text-right"><?php echo $product['quantity']; ?></td>
                                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['price']; ?></strong></td>
                                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['total']; ?></strong></td>
                                        <td class="text-right">
                                            <a class="btn btn-default" href="<?php echo $product['return']; ?>" title="<?php echo $button_return; ?>">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </a>
                                        </td>
                                    </tr>
                                <?php } ?>
                                <?php foreach ($vouchers as $voucher) { ?>
                                    <tr>
                                        <td><?php echo $voucher['description']; ?></td>
                                        <td></td>
                                        <td class="text-right">1</td>
                                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $voucher['amount']; ?></strong></td>
                                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $voucher['amount']; ?></strong></td>
                                        <?php if ($products) { ?>
                                            <td></td>
                                        <?php } ?>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <table class="pull-right">
                                <?php foreach ($totals as $total) { ?>
                                    <tr>
                                        <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                                        <td class="text-right nowrap">&nbsp;<strong class="text-danger"><?php echo $total['text']; ?></strong></td>
                                    </tr>
                                <?php } ?>
                            </table>
                        </div>
                    </div>
                    <?php if ($comment) { ?>
                        <br />
                        <h2><?php echo $text_comment; ?></h2>
                        <p><?php echo $comment; ?></p>
                    <?php } ?>
                    <?php if ($histories) { ?>
                        <br />
                        <hr />
                        <h2><?php echo $text_history; ?></h2>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td class="active"><?php echo $column_date_added; ?></td>
                                        <td class="active"><?php echo $column_status; ?></td>
                                        <td class="active"><?php echo $column_comment; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($histories as $history) { ?>
                                        <tr>
                                            <td class="nowrap"><?php echo $history['date_added']; ?></td>
                                            <td><?php echo $history['status']; ?></td>
                                            <td><?php echo $history['comment']; ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    <?php } ?>
                    <br />
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