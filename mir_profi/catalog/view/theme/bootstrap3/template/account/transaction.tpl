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
                    <?php if ($transactions) { ?>
                        <p class="lead"><?php echo $text_total; ?><strong class="text-danger"> <?php echo $total; ?></strong>.</p>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr class="active">
                                        <td><?php echo $column_date_added; ?></td>
                                        <td><?php echo $column_description; ?></td>
                                        <td class="text-center"><?php echo $column_amount; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($transactions  as $transaction) { ?>
                                        <tr>
                                            <td><?php echo $transaction['date_added']; ?></td>
                                            <td><?php echo $transaction['description']; ?></td>
                                            <td class="text-right nowrap"><strong class="text-danger"><?php echo $transaction['amount']; ?></strong></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <?php echo $pagination; ?>
                            </div>
                        </div>
                    <?php } else { ?>
                        <p class="lead"><?php echo $text_empty; ?></p>
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