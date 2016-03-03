<?php require_once(DIR . THEME .'/config.php'); ?>
<?php $bootstrap = new Bootstrap(); ?>
<?php if (!isset($redirect)) { ?>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr class="active">
                    <td><?php echo $column_name; ?></td>
                    <td><?php echo $column_model; ?></td>
                    <td class="text-center"><?php echo $column_quantity; ?></td>
                    <td class="text-center"><?php echo $column_price; ?></td>
                    <td class="text-center"><?php echo $column_total; ?></td>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $product) { ?>
                    <tr>
                        <td>
                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <ul class="list-unstyled">
                                <?php foreach ($product['option'] as $option) { ?>
                                    <li><small>&nbsp;-&nbsp;<?php echo $option['name']; ?>:&nbsp;<?php echo $option['value']; ?></small></li>
                                <?php } ?>
                            </ul>
                        </td>
                        <td><?php echo $product['model']; ?></td>
                        <td class="text-right"><?php echo $product['quantity']; ?></td>
                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['price']; ?></strong></td>
                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $product['total']; ?></strong></td>
                    </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                        <td><?php echo $voucher['description']; ?></td>
                        <td></td>
                        <td class="text-right">1</td>
                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $voucher['amount']; ?></strong></td>
                        <td class="text-right nowrap"><strong class="text-danger"><?php echo $voucher['amount']; ?></strong></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <table class="pull-right">
                <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                        <td class="text-right nowrap"><strong class="text-danger">&nbsp;<?php echo $total['text']; ?></strong></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    </div>
    <br>
    <p><?php echo $payment; ?></p>
<?php } else { ?>
    <script>
        location = '<?php echo $redirect; ?>';
    </script>
<?php } ?>