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
                    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $entry_newsletter; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                    <label class="radio-inline">
                                        <input type="radio" name="newsletter" value="1" <?php echo $newsletter ? 'checked' : ''; ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="newsletter" value="0" <?php echo !$newsletter ? 'checked' : ''; ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <a class="btn btn-default" href="<?php echo $back; ?>" title="<?php echo $button_back; ?>"><?php echo $button_back; ?></a>
                                <button type="submit" class="btn btn-primary" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></button>
                            </div>
                        </div>
                    </form>
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