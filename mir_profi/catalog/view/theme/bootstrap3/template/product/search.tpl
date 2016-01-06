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
                    <?php if ($products) { ?>
                        <p class="lead"><?php echo $text_search; ?></p>
                        <!-- products -->
                        <?php include('/../module/products.tpl'); ?>
                        <br />
                    <?php } else { ?>
                        <!-- empty -->
                        <p class="lead"><?php echo $text_empty; ?></p>
                    <?php } ?>
                    <form name="search" class="form-horizontal well" role="search" onsubmit="event.preventDefault(); location = 'index.php?route=product/search&' + $(this).serialize();">
                        <fieldset>
                            <legend><?php echo $text_critea; ?></legend>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="search" class="form-control" name="search" placeholder="<?php echo $button_search; ?>" value="<?php echo $search ? : ''; ?>" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <select class="form-control" name="category_id">
                                        <option value="0" data-children="false"><?php echo $text_category; ?></option>
                                        <?php foreach ($categories as $category_1) { ?>
                                            <option value="<?php echo $category_1['category_id']; ?>" data-children="<?php echo (bool)$category_1['children']; ?>" <?php echo ($category_1['category_id'] == $category_id) ? 'selected' : ''; ?>><?php echo $category_1['name']; ?></option>
                                            <?php foreach ($category_1['children'] as $category_2) { ?>
                                                <option value="<?php echo $category_2['category_id']; ?>" data-children="<?php echo (bool)$category_2['children']; ?>" <?php echo ($category_2['category_id'] == $category_id) ? 'selected' : ''; ?>>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                                <?php foreach ($category_2['children'] as $category_3) { ?>
                                                    <option value="<?php echo $category_3['category_id']; ?>" <?php echo ($category_3['category_id'] == $category_id) ? 'selected' : ''; ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="sub_category" value="1" <?php echo $sub_category ? 'checked' : ''; ?> />
                                            <?php echo $text_sub_category; ?>
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="description" value="1" <?php echo $description ? 'checked' : ''; ?> />
                                            <?php echo $entry_description; ?>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                    <button type="submit" id="button-search" class="btn btn-primary" title="<?php echo $button_search; ?>"><?php echo $button_search; ?></button>
                                </div>
                            </div>
                        </fieldset>
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
jQuery(function($) {
    // SUBCATEGORIES SEARCH
    $('select[name="category_id"]', 'form[name="search"]')
        .change(function() {
            if ($('option:selected', this).data('children')) {
                $('input[name="sub_category"]', this.form).attr('disabled', false);
            } else {
                $('input[name="sub_category"]', this.form).attr({ checked: false, disabled: true });
            }
        })
        .change();
});
</script>
</body>
</html>