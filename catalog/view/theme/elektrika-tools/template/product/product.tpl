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
                    <?php if(isset($breadcrumb['href'])){ ?>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php }else{ ?>
                        <span ><?php echo $breadcrumb['text']; ?></span>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul>
        </div>
        <?php if ($column_left){ ?>
        <div class="col-sm-3">
            <?php echo $column_left; ?>
        </div>
        <?php } ?>
        <div id="content" class="<?=$class?> product_page"><?php echo $content_top; ?>
            <div class="row product-content-columns">
                <div class="col-sm-5 col-lg-7 product_page-left">

                    <?php if (isset($thumb_zoom) || isset($images)) { ?>
                    <div id="default_gallery" class="product-gallery">
                        <?php if (isset($images) && $images) { ?>
                        <div class="image-thumb">
                            <ul id="image-additional">
                                <?php foreach ($images as $image) { ?>
                                <li>
                                    <a href="#" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
                                        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                    </a>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                        <?}?>
                        <?php if (isset($thumb_zoom) &&  $thumb_zoom) { ?>
                        <div class="image">
                            <img id="gallery_zoom" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $thumb_zoom; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>"/>
                        </div>
                        <?}?>
                    </div>
                    <script>
                        jQuery(document).ready(function(){
                            $("#gallery_zoom").elevateZoom({gallery: 'image-additional'});
                            $("#gallery_zoom").bind("click", function(e) {
                                var ez = $('#gallery_zoom').data('elevateZoom');
                                $.fancybox(ez.getGalleryList());
                                return false;
                            });
                            $('#image-additional').bxSlider({
                                mode: 'vertical',
                                pager: false,
                                controls: true,
                                slideMargin: 13,
                                minSlides: 6,
                                maxSlides: 6,
                                slideWidth: 88,
                                nextText: '<i class="fa fa-chevron-down"></i>',
                                prevText: '<i class="fa fa-chevron-up"></i>',
                                infiniteLoop: false,
                                adaptiveHeight: true,
                                moveSlides: 1
                            });
                            $('#gallery').bxSlider({
                                pager: false,
                                controls: true,
                                minSlides: 1,
                                maxSlides: 1,
                                infiniteLoop: false,
                                moveSlides: 1,
                                nextText: '<i class="fa fa-chevron-right"></i>',
                                prevText: '<i class="fa fa-chevron-left"></i>'
                            });
                        });
                    </script>
                    <?}?>

                    <?php if ($images) { ?>
                    <div id="full_gallery">
                        <ul id="gallery">
                            <?php foreach ($images as $image) { ?>
                            <li>
                                <a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-something="something-<?php echo $heading_title; ?>"  data-another-thing="anotherthing-<?php echo $heading_title; ?>" data-zoom-image=""<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
                                <img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <script type="text/javascript">
                        jQuery(document).ready(function(){
                            var myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
                        });
                    </script>
                    <?}?>
                </div>
                <div class="col-sm-7 col-lg-5 product_page-right">
                    <div class="general_info product-info">
                        <h1><?php echo $heading_title; ?></h1>
                        <div class="rating-section product-rating-status">
                            <div class="rating">
                                <?php for($i=1;$i<6;$i++){ ?>
                                    <?if($i<=$rating){ ?>
                                    <span class="fa fa-stack"><i class="fa fa-star activ fa-stack-1x"></i></span>
                                    <? }else{ ?>
                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                                    <?php } ?>
                                <?php } ?>
                                <a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $reviews; ?></a> / <a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $text_write; ?></a>
                            </div>
                            <div class="price-section">
                                <span class="price-new"><?php echo $price; ?></span>
                                <span class="price-old"><?php echo $special; ?></span>
                                <?php if ($points) { ?>
                                <div class="reward-block"><?php echo $text_points; ?> <?php echo $points; ?></div>
                                <?php } ?>
                            </div>
                            <ul class="list-unstyled product-section">
                                <?php if ($manufacturer) { ?>
                                <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                                <?php } ?>
                                <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
                                <?php if ($reward) { ?>
                                <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
                                <?php } ?>
                                <li><?php echo $text_stock; ?> <span><?php echo $stock; ?></span></li>
                            </ul>
                        </div>
                    </div><?
                    /***********OPTIONS***************/
                    ?>
                    <div id="product">
                        <?php if ($options) { ?>
                        <div class="product-options form-horizontal">
                            <h3><?php echo $text_option; ?></h3>
                            <?php foreach ($options as $option) { ?>
                                <div class="form-group <?php if ($option['required']) { ?>required<?php } ?>">
                                    <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                    <div class="col-sm-8">
                                        <?php if ($option['type'] == 'select') { ?>
                                            <select name="option[<?php echo $option['product_option_id']; ?>]" class="form-control" id="input-option<?php echo $option['product_option_id']; ?>">
                                                <option value=""><?php echo $text_select; ?></option>
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </option>
                                                <?php } ?>
                                            </select>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                            <div id="input-option<?php echo $option['product_option_id']; ?>" class="radios input-group">
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" />
                                                <label class="control-label" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label>
                                                <br />
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'checkbox') { ?>
                                            <div id="input-option<?php echo $option['product_option_id']; ?>" class="input-group checkboxes">
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <input class="form-control" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                <label class="control-label" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label>
                                                <br />
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'image') { ?>
                                            <div class="option-image" id="input-option<?php echo $option['product_option_id']; ?>">
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                    <div class="row">
                                                        <div class="col-sm-2"><input  type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></div>
                                                        <div class="col-sm-6"><label class="control-label" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></div>
                                                        <div class="col-sm-4"><label class="control-label" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                            </label></div>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <input id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'textarea') { ?>
                                            <textarea id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'file') { ?>
                                            <input class="form-control button file" type="button" value="<?php echo $button_upload; ?>" id="input-option<?php echo $option['product_option_id']; ?>">
                                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'date') { ?>
                                            <input id="input-option<?php echo $option['product_option_id']; ?>" class="form-control date" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"/>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'datetime') { ?>
                                            <input id="input-option<?php echo $option['product_option_id']; ?>" class="form-control datetime" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"/>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'time') { ?>
                                            <input id="input-option<?php echo $option['product_option_id']; ?>" class="form-control time"  type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                        <?php } ?>

                        <div class="form-group form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4" for="input-quantity"><?php echo $text_qty; ?></label>
                                <div class="col-sm-2">
                                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control">
                                </div>
                            </div>
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>">
                            <button type="button" id="button-cart" data-loading-text="Загрузка..." class="btn btn-add"><i class="fa fa-shopping-cart"></i><span><?php echo $button_cart; ?></span></button>
                        </div>
                        <ul class="product-buttons">
                            <li><button class="btn btn-default" onclick="addToWishList('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i> <span class="hidden-sm"><?php echo $button_wishlist; ?></span></button></li>
                            <li><button type="button" class="btn btn-default" onclick="addToCompare('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i> <span class="hidden-sm"><?php echo $button_compare; ?></span></button></li>
                        </ul>
                        <div class="share product-share">
                            <div class="addthis_toolbox addthis_default_style addthis_16x16_style hidden-print"></div>
                            <script>
                                jQuery(function($){
                                    window.addthis_config = { 'data_track_addressbar': true };

                                    $.getScript('//s7.addthis.com/js/300/addthis_widget.js', function() {
                                        var addthis = '';
                                        addthis += '<a class="addthis_button_twitter"></a>';
                                        addthis += '<a class="addthis_button_facebook"></a>';
                                        addthis += '<a class="addthis_button_google_plusone_share"></a>';
                                        addthis += '<a class="addthis_button_vk"></a>';
                                        addthis += '<a class="addthis_button_odnoklassniki_ru"></a>';
                                        addthis += '<a class="addthis_button_mymailru"></a>';
                                        addthis += '<a class="addthis_button_moikrug"></a>';
                                        addthis += '<a class="addthis_button_email"></a>';
                                        addthis += '<a class="addthis_button_print"></a>';
                                        addthis += '<a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style"></a>';

                                        $('.addthis_toolbox').html(addthis);
                                    });
                                });
                            </script>
                        </div>
                        <?php if ($minimum > 1) { ?>
                            <div class="alert alert-info count-minimum"><i class="fa fa-info-circle"></i><?php echo $text_minimum; ?></div>
                        <?php } ?>
                        <?php if ($tags) { ?>
                        <div class="tags"><b><?php echo $text_tags; ?></b>
                            <?php for ($i = 0; $i < count($tags); $i++) { ?>
                            <?php if ($i < (count($tags) - 1)) { ?>
                            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                            <?php } else { ?>
                            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                            <?php } ?>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div class="product-desc product-section">
                <h3 class="product-section_title"><?php echo $tab_description; ?></h3>
                <?php echo $description; ?>
            </div>
            <?php if ($attribute_groups) { ?>
                <div id="tab-specification" class="product-spec product-section">
                    <h3 class="product-section_title"><?php echo $tab_attribute; ?></h3>
                    <table class="table table-bordered">
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                        <thead>
                        <tr>
                            <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                            <td><?php echo $attribute['name']; ?></td>
                            <td><?php echo $attribute['text']; ?></td>
                        </tr>
                        <?php } ?>
                        </tbody>
                        <?php } ?>
                    </table>
                </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div id="tab-review" class="tab-content">
                <h3 class="product-section_title"><?php echo $reviews_title; ?></a></h3>
                <form class="form-horizontal">
                    <div id="review"></div>
                    <div class="review-form-title">
                        <h3 class="product-section_title close-tab" id="reviews_form_title"><?php echo $text_write; ?></h3>
                    </div>
                    <div class="product-review-form" id="reviews_form">

                        <div class="form-group required">
                            <label class="control-label col-sm-3" for="input-name"><?php echo $entry_name; ?></label>
                            <div class="col-sm-9">
                                <input type="text" name="name" value="" id="input-name" class="form-control" placeholder="Имя">
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="control-label col-sm-3" for="input-review"><?php echo $entry_review; ?></label>
                            <div class="col-sm-9">
                                <textarea name="text" rows="5" id="input-review" class="form-control" placeholder="Текст отзыва"></textarea>
                                <div class="help-block"><?php echo $text_note; ?></div>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="control-label col-sm-3"><?php echo $entry_rating; ?></label>
                            <div class="col-sm-9">
                                &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                <input type="radio" name="rating" value="1">
                                &nbsp;
                                <input type="radio" name="rating" value="2">
                                &nbsp;
                                <input type="radio" name="rating" value="3">
                                &nbsp;
                                <input type="radio" name="rating" value="4">
                                &nbsp;
                                <input type="radio" name="rating" value="5">
                                &nbsp;<?php echo $entry_good; ?></div>
                        </div>

                        <div class="form-group required">
                            <label class="control-label col-sm-3" for="input-captcha"><?php echo $entry_captcha; ?></label>
                            <div class="col-sm-9">
                                <input type="text" name="captcha" value="" id="input-captcha" class="form-control"  placeholder="Код с изображения">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <img src="index.php?route=product/product/captcha" alt="" id="captcha">
                                <div class="pull-right">
                                    <button type="button" id="button-review" data-loading-text="Загрузка..." class="btn btn-primary"><?php echo $button_continue; ?></button>
                                </div>
                            </div>

                        </div>

                    </div>
                </form>
            </div>
            <?php if ($products) { ?>
                <div class="related-products product-section">
                    <h3 class="product-section_title">Сопутствующие товары</h3>
                    <ul class="related-slider">
                        <?php foreach ($products as $product) { ?>
                            <li>
                                <?php include(DIR_APPLICATION .'view/theme/elektrika-tools/template/product/products_thumbnail_separated.tpl'); ?>
                            </li>
                        <?php } ?>
                    </ul>
                </div>
            <?php } ?>

            <script type="text/javascript"><!--

            jQuery(document).ready(function(){
                jQuery('#reviews_form_title').addClass('close-tab');
                jQuery('#reviews_form_title').on("click", function(){
                    if (jQuery(this).hasClass('close-tab')) { jQuery(this).removeClass('close').parents('#tab-review').find('#reviews_form').slideToggle(); }
                    else {
                        jQuery(this).addClass('close-tab').parents('#tab-review').find('#reviews_form').slideToggle();
                    }
                });

                $('#review').delegate('.pagination a', 'click', function() {
                    $('#review').fadeOut('slow');

                    $('#review').load(this.href);

                    $('#review').fadeIn('slow');

                    return false;
                });

                $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

                $('#button-review').on('click', function() {
                    $.ajax({
                        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                        type: 'post',
                        dataType: 'json',
                        data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
                        beforeSend: function() {
                            $('#button-review').button('loading');
                        },
                        complete: function() {
                            $('#button-review').button('reset');
                            $('#captcha').attr('src', 'index.php?route=product/product/captcha#'+new Date().getTime());
                            $('input[name=\'captcha\']').val('');
                        },
                        success: function(json) {
                            $('.alert-success, .alert-danger').remove();

                            if (json['error']) {
                                $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                            }

                            if (json['success']) {
                                $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                                $('input[name=\'name\']').val('');
                                $('textarea[name=\'text\']').val('');
                                $('input[name=\'rating\']:checked').prop('checked', false);
                                $('input[name=\'captcha\']').val('');
                            }
                        }
                    });
                });
                $('.form-control.button.file').on('click', function() {
                    var node = this;

                    $('#form-upload').remove();

                    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

                    $('#form-upload input[name=\'file\']').trigger('click');

                    $('#form-upload input[name=\'file\']').on('change', function() {
                        $.ajax({
                            url: 'index.php?route=tool/upload',
                            type: 'post',
                            dataType: 'json',
                            data: new FormData($(this).parent()[0]),
                            cache: false,
                            contentType: false,
                            processData: false,
                            beforeSend: function() {
                                $(node).button('loading');
                            },
                            complete: function() {
                                $(node).button('reset');
                            },
                            success: function(json) {
                                $('.text-danger').remove();

                                if (json['error']) {
                                    $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                                }

                                if (json['success']) {
                                    alert(json['success']);

                                    $(node).parent().find('input').attr('value', json['code']);
                                }
                            },
                            error: function(xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    });
                });

                $('#button-cart').on('click', function() {
                    $.ajax({
                        url: 'index.php?route=checkout/cart/add',
                        type: 'post',
                        data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                        dataType: 'json',
                        beforeSend: function() {
                            $('#button-cart').button('loading');
                        },
                        complete: function() {
                            $('#button-cart').button('reset');
                        },
                        success: function(json) {
                            $('.alert, .text-danger').remove();
                            $('.form-group').removeClass('has-error');

                            if (json['error']) {
                                if (json['error']['option']) {
                                    for (i in json['error']['option']) {
                                        var element = $('#input-option' + i.replace('_', '-'));

                                        if (element.parent().hasClass('input-group')) {
                                            element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                        } else {
                                            element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                        }
                                    }
                                }

                                if (json['error']['recurring']) {
                                    $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                                }

                                // Highlight any found errors
                                $('.text-danger').parent().addClass('has-error');
                            }

                            if (json['success']) {
                                showNotification(json['success']);
                                $('#cart-total').html(json['total']);
                            }
                        }
                    });
                });

                $('#input-quantity').on("keypress", function(e) {
                    e = e || event;
                    if (e.ctrlKey || e.altKey || e.metaKey) return;
                    var chr = getChar(e);
                    if (chr == null) return;
                    if (chr < '0' || chr > '9') {
                        return false;
                    }
                });

                $('.related-slider').bxSlider({
                    pager: false,
                    controls: true,
                    slideMargin: 30,
                    minSlides: 1,
                    maxSlides: 5,
                    slideWidth: 223,
                    infiniteLoop: true,
                    moveSlides: 1,
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    prevText: '<i class="fa fa-chevron-left"></i>'
                });
            });
            //--></script>
        <?php } ?>
        <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>