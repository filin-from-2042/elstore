<?php echo $header; ?>
<div class="container">

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div class="row">
        <div class="col-sm-12">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                </li>
                <?php } ?>
            </ul>
        </div>
        <?php if ($column_left){ ?>
        <div class="col-sm-3">
            <?php echo $column_left; ?>
        </div>
        <?php } ?>
        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <label class="control-label" for="input-search"><?php echo $text_critea; ?></label>
            <div class="row">
                <div class="col-sm-4">
                    <?php if ($search) { ?>
                    <input type="text" name="search" size="50" value="<?php echo $search; ?>" placeholder="Ключевые слова" id="input-search" class="form-control"/>
                    <?php } else { ?>
                    <input type="text" name="search" size="50" value="<?php echo $search; ?>" placeholder="Ключевые слова" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" id="input-search" class="form-control"/>
                    <?php } ?>
                    <br>
                </div>
                <div class="col-sm-3">
                    <select name="filter_category_id" class="form-control">
                        <option value="0"><?php echo $text_category; ?></option>
                        <?php foreach ($categories as $category_1) { ?>
                        <?php if ($category_1['category_id'] == $filter_category_id) { ?>
                        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                        <?php } ?>
                        <?php foreach ($category_1['children'] as $category_2) { ?>
                        <?php if ($category_2['category_id'] == $filter_category_id) { ?>
                        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                        <?php } ?>
                        <?php foreach ($category_2['children'] as $category_3) { ?>
                        <?php if ($category_3['category_id'] == $filter_category_id) { ?>
                        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </select>
                    <br>
                </div>
                <div class="col-sm-3">
                    <label class="checkbox-inline" for="sub_category">
                        <?php if ($sub_category) { ?>
                        <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="sub_category" value="1" id="sub_category" />
                        <?php } ?>
                        <?php echo $text_sub_category; ?></label>
                </div>
            </div>
            <div>
                <label class="checkbox-inline" for="description">
                    <?php if ($description) { ?>
                    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="description" value="1" id="description" />
                    <?php } ?>
                    <?php echo $entry_description; ?></label>
            </div>
            <div class="search-btn-wrap">
                <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary">
            </div>
            <?php if (isset($searched_categories) && $searched_categories) { ?>
                <h2>Категории, соответствующие критериям поиска</h2>
                <div class="searched-categories">
                    <div class="row">
                            <div class="category-list">
                                <?php if (count($searched_categories) <= 5) { ?>
                                    <?php foreach ($searched_categories as $category) { ?>
                                    <ul class="col-sm-3 box-subcat">
                                        <li><div class="name subcatname"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div></li>
                                    </ul>
                                    <?php } ?>
                                <?php } else { ?>
                                    <?php for ($i = 0; $i < count($categories);) { ?>
                                    <ul class="col-sm-3 box-subcat">
                                        <?php $j = $i + ceil(count($categories) / 4); ?>
                                        <?php for (; $i < $j; $i++) { ?>
                                        <?php if (isset($categories[$i])) { ?>
                                        <li><div class="name subcatname"><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></div></li>
                                        <?php } ?>
                                        <?php } ?>
                                    </ul>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                    </div>
                </div>
            <? } ?>
            <h2><?php echo $text_search; ?></h2>
            <?php if (isset($products) && $products) { ?>
                <div class="product-filter clearfix">
                    <div class="row">
                        <div class="col-md-2">
                            <label class="control-label" for="sort-control"><?php echo $text_sort; ?></label>
                        </div>
                        <div class="col-md-3">
                            <select onchange="location = this.value;" id="sort-control" class="form-control">
                                <?php foreach ($sorts as $sorts) { ?>
                                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="control-label" for="limit-control"><?php echo $text_limit; ?></label>
                        </div>
                        <div class="col-md-2">
                            <select onchange="location = this.value;" id="limit-control" class="form-control">
                                <?php foreach ($limits as $limits) { ?>
                                <?php if ($limits['value'] == $limit) { ?>
                                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-md-3 text-right view-type-container">
                            <a onclick="display('list');" class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Списком"><i class="fa fa-th-list"></i></a>
                            <span class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Сеткой"><i class="fa fa-th"></i></span>
                        </div>
                    </div>
                </div>
                <div class="nav-cat clearfix">
                    <div class="pagination-wrap-cat pull-left"><?php echo $pagination; ?></div>
                    <div class="pull-right compare-wrap-cat">
                        <div class="product-compare">
                            <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?><i class="fa fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="category-items">
                    <div class="row">
                        <?php foreach ($products as $product) { ?>
                        <?php include(DIR_APPLICATION .'view/theme/elektrika-tools/template/product/products_thumbnail.tpl'); ?>
                        <?php } ?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pagination-wrap-cat"><?php echo $pagination; ?></div>
                    </div>
                    <div class="col-sm-6 text-right"></div>
                </div>
                <?php if(isset($searched_manufacturers) && $searched_manufacturers) { ?>
                <h2>Производители, соответствующие критериям поиска</h2>
                <div class="searched-manufacturers">
                    <div class="row">
                        <div class="category-list">
                            <?php if (count($searched_manufacturers) <= 5) { ?>
                                <?php foreach ($searched_manufacturers as $manufacturer) { ?>
                                <ul class="col-sm-3 box-subcat">
                                    <li><div class="name subcatname"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div></li>
                                </ul>
                                <?php } ?>
                            <?php } else { ?>
                                <?php for ($i = 0; $i < count($searched_manufacturers);) { ?>
                                <ul class="col-sm-3 box-subcat">
                                    <?php $j = $i + ceil(count($searched_manufacturers) / 4); ?>
                                    <?php for (; $i < $j; $i++) { ?>
                                    <?php if (isset($searched_manufacturers[$i])) { ?>
                                    <li><div class="name subcatname"><a href="<?php echo $searched_manufacturersas[$i]['href']; ?>"><?php echo $searched_manufacturers[$i]['name']; ?></a></div></li>
                                    <?php } ?>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <? } ?>
                <?php } else { ?>
                <div class="content"><?php echo $text_empty; ?></div>
                <?php }?>

            <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
        <?php } ?>
    </div>
    <script type="text/javascript"><!--
        $('#content input[name=\'search\']').keydown(function(e) {
            if (e.keyCode == 13) {
                $('#button-search').trigger('click');
            }
        });

        $('select[name=\'filter_category_id\']').bind('change', function() {
            if (this.value == '0') {
                $('input[name=\'sub_category\']').attr('disabled', 'disabled');
                $('input[name=\'sub_category\']').removeAttr('checked');
            } else {
                $('input[name=\'sub_category\']').removeAttr('disabled');
            }
        });

        $('select[name=\'filter_category_id\']').trigger('change');

        $('#button-search').bind('click', function() {
            url = 'index.php?route=product/search';

            var search = $('#content input[name=\'search\']').val();

            if (search) {
                url += '&search=' + encodeURIComponent(search);
            }

            var filter_category_id = $('#content select[name=\'filter_category_id\']').val();

            if (filter_category_id > 0) {
                url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
            }

            var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');

            if (sub_category) {
                url += '&sub_category=true';
            }

            var filter_description = $('#content input[name=\'description\']:checked').attr('value');

            if (filter_description) {
                url += '&description=true';
            }

            location = url;
        });

        function display(view) {
            if (view == 'list') {

                $('.product-grid').each(function(index, element) {
                    var $element = $(element);
                    $element.removeClass().addClass("product-layout product-list col-xs-12");
                });

                $('.view-type-container').html('<span  class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Списком"><i class="fa fa-th-list"></i></span>'+
                        '<a onclick="display(\'grid\');" class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Сеткой"><i class="fa fa-th"></i></a>');

                initTooltips('.view-type-container a[data-toggle="tooltip"]');

                $.totalStorage('display', 'list');
            } else {

                $('.product-list').each(function(index, element) {
                    var $element = $(element);
                    $element.removeClass().addClass("product-layout product-grid col-lg-3 col-md-3 col-sm-4 col-xs-12");
                });

                $('.view-type-container').html('<a onclick="display(\'list\');" class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Списком"><i class="fa fa-th-list"></i></a>'+
                        '<span class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Сеткой"><i class="fa fa-th"></i></span>');

                initTooltips('.view-type-container a[data-toggle="tooltip"]');

                $.totalStorage('display', 'grid');
            }
        }

        jQuery(document).ready(function(){
            view = $.totalStorage('display');

            if (view) {
                display(view);
            } else {
                display('[b]grid[/b]');
            }
        });

        --></script>
</div>
<?php echo $footer; ?>