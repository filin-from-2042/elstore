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
                    <p class="lead"><?php echo $text_description; ?></p>
                    <form class="form-horizontal" name="tracking">
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $text_code; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <textarea class="form-control" rows="5"><?php echo $code; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $text_generator; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="text" class="form-control" name="product" value="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <?php echo $text_link; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <textarea class="form-control" name="link" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
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
<!-- js -->
<script>
jQuery(function($){
    // BIND PRODUCT AUTOCOMPLETE
    $('input[name="product"]', 'form[name="tracking"]').autocomplete({
        delay: 500,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {		
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.link
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('input[name="product"]').val(ui.item.label);
            $('textarea[name="link"]').val(ui.item.value);
            
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
    
    // BIND FORM STORAGE
    $('form[name="tracking"]').formStorage({
        prefix: 'tracking_',
        check: true
    });
});
</script>
</body>
</html>