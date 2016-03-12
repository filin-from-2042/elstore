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
                    <h2><?php echo $text_return_detail; ?></h2>
                    <b><?php echo $text_return_id; ?></b> <wbr />#<?php echo $return_id; ?><br />
                    <b><?php echo $text_date_added; ?></b> <wbr /><?php echo $date_added; ?><br />
                    <b><?php echo $text_order_id; ?></b> <wbr />#<?php echo $order_id; ?><br />
                    <b><?php echo $text_date_ordered; ?></b> <wbr /><?php echo $date_ordered; ?><br />
                    <h2><?php echo $text_product; ?></h2>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr class="active">
                                    <td><?php echo $column_product; ?></td>
                                    <td><?php echo $column_model; ?></td>
                                    <td class="text-center"><?php echo $column_quantity; ?></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?php echo $product; ?></td>
                                    <td><?php echo $model; ?></td>
                                    <td class="text-right"><?php echo $quantity; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br />
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr class="active">
                                    <td><?php echo $column_reason; ?></td>
                                    <td><?php echo $column_opened; ?></td>
                                    <td><?php echo $column_action; ?></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?php echo $reason; ?></td>
                                    <td><?php echo $opened; ?></td>
                                    <td><?php echo $action; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <?php if ($comment) { ?>
                        <h2><?php echo $text_comment; ?></h2>
                        <p><?php echo $comment; ?></p>
                    <?php } ?>
                    <?php if ($histories) { ?>
                        <h2><?php echo $text_history; ?></h2>
                        <div class="table-responsive">
                            <table class="list">
                                <thead>
                                    <tr class="active">
                                        <td><?php echo $column_date_added; ?></td>
                                        <td><?php echo $column_status; ?></td>
                                        <td><?php echo $column_comment; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($histories as $history) { ?>
                                        <tr>
                                            <td><?php echo $history['date_added']; ?></td>
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