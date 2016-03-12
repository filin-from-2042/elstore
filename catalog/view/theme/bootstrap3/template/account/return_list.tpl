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
                    <?php if ($returns) { ?>
                        <?php foreach ($returns as $return) { ?>
                            <hr />
                            <b><?php echo $text_return_id; ?></b> <wbr />#<?php echo $return['return_id']; ?><br />
                            <b><?php echo $text_status; ?></b> <wbr /><?php echo $return['status']; ?><br />
                            <b><?php echo $text_date_added; ?></b> <wbr /><?php echo $return['date_added']; ?><br />
                            <b><?php echo $text_order_id; ?></b> <wbr /><?php echo $return['order_id']; ?><br />
                            <b><?php echo $text_customer; ?></b> <wbr /><?php echo $return['name']; ?><br />
                            <a class="btn btn-info hidden-xs" href="<?php echo $return['href']; ?>" title="<?php echo $button_view; ?>">
                                <?php echo $button_view; ?>
                            </a>
                            <a class="btn btn-info visible-xs" href="<?php echo $return['href']; ?>" title="<?php echo $button_view; ?>">
                                <span class="glyphicon glyphicon-info-sign"></span>
                            </a>
                        <?php } ?>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <?php echo $pagination; ?>
                            </div>
                        </div>
                    <?php } else { ?>
                        <!-- empty -->
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