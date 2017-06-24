<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main">
    <div class="row main-page">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?> container">
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <div class="container">
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            </div>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->

                    <div class="row product-heading">
                        <!-- product images -->
                        <?php if ($thumb || $images) { ?>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <?php if ($thumb) { ?>
                                    <a class="slide" data-img-src="<?php echo $popup; ?>" data-img-title="<?php echo $heading_title; ?>">
                                        <img id="mimage" class="img-responsive " src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                    </a>
                                <?php } ?>

                            </div>
                        <?php } ?>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                            <div class="row hidden-print product-share">
                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                    <?php if ($review_status) { ?>
                                    <div class="share-it">
                                        <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/add_this.tpl'); ?>
                                    </div>
                                    <?php } ?>
                                </div>

                                <!-- review -->
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-print">
                                    <ul class="list-unstyled product-reviews">
                                        <li><img src="<?php echo THEME . 'image/stars-' . $rating . '.png'; ?>" alt="<?php echo $reviews; ?>" title="<?php echo $reviews; ?>" /></li>
                                        <?php if ($review_status) { ?>
                                        <li class="hidden-print"><a onclick="$('#product-tabs a[href=\'#tab-review\']').tab('show'); $('#reviews').scrollBody();"><?php echo $reviews; ?></a></li>
                                        <li class="hidden-print"><a href="#modal-review" data-toggle="modal"><?php echo $text_write; ?></a></li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <h1 id="product-heading"><?php echo $heading_title; ?></h1>



                            <!-- product info -->
                            <ul class="list-unstyled" style="position: relative">


                                <li class="text-big "><span class="text-info">Просмотров:</span><?php echo $viewed; ?></li>
                                <?php if ($manufacturer) { ?>
                                    <li class="text-big"><span class="text-info"><?php echo $text_manufacturer; ?></span> <wbr /><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                                <?php } ?>
                                    <li class="text-big"><span class="text-info"><?php echo $text_model; ?></span> <wbr /><?php echo $model; ?></li>
                                <?php if ($reward) { ?>
                                    <li class="text-big"><span class="text-info"><?php echo $text_reward; ?></span> <wbr /><?php echo $reward; ?></li>
                                <?php } ?>
                                    <li class="text-big"><span class="text-info"><?php echo $text_stock; ?></span> <wbr /><?php echo $stock . ' ' . $measure; ?></li>

                            </ul>

                            <div class="row snglproduct-controls">


                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print form-buy">

                                        <!-- add to cart -->
                                        <form class="form-horizontal" name="product">
                                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                                            <div class="form-group">


                                                <?php if ($price) { ?>
                                                <span class="text-big nowrap">
                                                    <?php if ($price) { ?>
                                                    <strong class="text-danger nowrap snglproduct-price"><?php echo $price; ?></strong>
                                                    <?php }?>


                                                    <?php if ($special){ ?>
                                                    <p>
                                                        <small class="text-warning text-sthrough nowrap snglold_price "><?php echo $special; ?></small> <wbr />
                                                        <?php } ?>
                                                    </p>
                                                </span>

                                                <?php if ($discounts) { ?>
                                                <div>
                                                    <ul class="list-unstyled">
                                                        <?php foreach ($discounts as $discount) { ?>
                                                        <li><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></li>
                                                        <?php } ?>
                                                    </ul>
                                                </div>
                                                <?php } ?>
                                                <?php } ?>

                                                <span class="product-quantity">
                                                   <input type="number" class="form-control" name="quantity" value="<?php echo $minimum; ?>" min="<?php echo $minimum ?>" style="width: 85px;" pattern="^\d+$" required />
                                                </span>
                                                <span class="product-buy">
                                                    <button type="button" id="button-cart" class="btn btn-primary pull-right" name="addToCart" title="<?php echo $button_cart; ?>" data-loading-text="<?php echo $button_cart; ?>..."><?php echo $button_cart; ?></button>
                                                </span>

                                            </div>
                                            <?php if ($minimum > 1) { ?>
                                            <small class="help-block col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4"><?php echo $text_minimum; ?></small>
                                            <?php } ?>
                                        </form>

                                    </div>


                                </div>
                    </div>
                    </div>

                    <?php if ($images) { ?>
                    <div class="product-images row">
                        <?php foreach ($images as $image) { ?>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <a class="slide" data-img-src="<?php echo $image['popup']; ?>" data-img-title="<?php echo $heading_title; ?>">
                                <img class="img-responsive img-rounded" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                            </a>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="clear"></div>

                    <?php } ?>

                    <h3>Описание</h3>
                    <div class="well well-sm">
                        <!-- tab description -->
                            <?php if($description) echo $description; else echo '<h4>Описания пока что нет!</h4>'; ?>
                    </div>
                    <h3>Отзывы от товаре</h3>
                    <div class="well well-sm">
                        <!-- tab review -->
                        <?php if ($review_status) { ?>
                            <div id="reviews"></div>
                            <div class="row hidden-print">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left">
                                    <button class="btn btn-default btn-lg" data-target="#modal-review" data-toggle="modal"><?php echo $text_write; ?></button>
                                </div>
                            </div>
                        <?php } ?>
                    </div>



                        <!-- tab related products -->
                        <?php if ($products) { ?>
                        <h3 class="hidden-print">Сопутствующие товары</h3>
                        <div class="row hidden-print well-lg">
                                <!-- products thumbnail -->
                                <?php $bt3 = 'col-xs-6 col-sm-4 col-md-3 col-lg-3'; ?>
                                <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/products_thumbnail.tpl'); ?>
                        </div>
                        <?php } ?>

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
<!-- modal review -->
<?php if ($review_status) { ?>
    <div id="modal-review" class="modal fade hidden-print" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><?php echo $text_write; ?></h4>
                </div>
                <div class="modal-body">
                    <form id="review" name="review" class="form-horizontal">
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_name; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <input type="text" class="form-control" name="name" value="" pattern="^.{3,25}$" required="required" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_review; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <textarea class="form-control" name="text" rows="8" data-pattern="^.{25,1000}$" required spellcheck></textarea>
                                <small class="help-block"><?php echo $text_note; ?></small>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_rating; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <label class="radio-inline"><input type="radio" name="rating" value="1" required />1</label>
                                <label class="radio-inline"><input type="radio" name="rating" value="2" required />2</label>
                                <label class="radio-inline"><input type="radio" name="rating" value="3" required />3</label>
                                <label class="radio-inline"><input type="radio" name="rating" value="4" required />4</label>
                                <label class="radio-inline"><input type="radio" name="rating" value="5" required />5</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="<?php echo $bootstrap->label; ?>">
                                <b class="text-danger">*</b>
                                <?php echo $entry_captcha; ?>
                            </label>
                            <div class="<?php echo $bootstrap->input; ?>">
                                <div class="captcha-group input-group">
                                    <div class="input-group-btn">
                                        <img src="index.php?route=product/product/captcha" alt="captcha" />
                                        <button type="button" class="btn btn-default" name="reCaptcha" style="margin-left: -3px;"><span class="glyphicon glyphicon-refresh"></span></button>
                                    </div>
                                    <input type="text" class="form-control" name="captcha" value="" style="min-width: 75px;" pattern="^.{6}$" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group sr-only">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-sm-offset-4 col-md-offset-4 col-lg-offset-4"></div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="button-review" class="btn btn-primary" form="review" data-loading-text="<?php echo $text_wait; ?>"><?php echo $button_continue; ?></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $this->language->get('button_back'); ?></button>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
<!-- js -->
<script src="<?php echo THEME_JS_JQUERYUI; ?>"></script>
<script src="<?php echo THEME_JS_JQUERYUI_TIMEPICKER; ?>"></script>
<script src="<?php echo THEME_JS_AJAXUPLOAD; ?>"></script>
<script>
jQuery(function() {
    //JQUERYUI BUTTON CONFLICT
    $.fn.button = btButton;

    // ADD TO CART
    $('button[name="addToCart"]', 'form[name="product"]').click(function() {
        if (!$('div.form-group.has-error', 'form[name="product_options"]').length) {
            $.ajax({
                async: false,
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', 'form[name="product"], form[name="product_options"]'),
                dataType: 'json',
                context: this,
                beforeSend: function() {
                    $(this).button('loading');
                    $('.text-warning[role="status"], .text-danger[role="status"]', 'form[name="product_options"]').remove();
                },
                complete: function() {
                    $(this).button('reset');
                },
                success: function(json) {
                    if (json.success) {
                        $('#notification').html(notification('success', json.success));

                        $('#cart').triggerHandler('added');

                        $('body').scrollBody();
                    } else if (json.error && json.error.option) {
                        for (i in json.error.option) {
                            $('#option-' + i).state('error')
                                .children('div')
                                    .find('span.text-success').remove().end()
                                    .append(notice('warning', json.error.option[i]));
                        }

                        $('div.has-error:first', 'form[name="product_options"]').scrollBody();
                    }
                }
            });
        } else {
            $('div.has-error:first', 'form[name="product_options"]').scrollBody();
        }
    });

    // FILE UPLOADER
    $('button.button-file', 'form[name="product_options"]').each(function() {
        var button = '#' + this.id;

        new AjaxUpload(button, {
            action: 'index.php?route=product/product/upload',
            name: 'file',
            autoSubmit: true,
            responseType: 'json',
            onSubmit: function(file, extension) {
                $(button)
                    .button('loading')
                    .closest('div.form-group').state(false)
                    .find('input[type="hidden"]').val('')
                    .siblings('[role="status"]').remove();
            },
            onComplete: function(file, json) {
                if (json.success) {
                    $(button).siblings('input[type="hidden"]').val(json.file)
                        .parent('div').append(notice('success', json.success));
                }
                else if (json.error) {
                    $(button)
                        .closest('div.form-group').state('error')
                        .children('div').append(notice('warning', json.error));
                }

                $(button).button('reset');
            }
        });
    });

    // ADD REVIEW
    $('#button-review').click(function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name="name"]', '#review').val()) + '&text=' + encodeURIComponent($('textarea[name="text"]', '#review').val()) + '&rating=' + encodeURIComponent($('input[name="rating"]:checked', '#review').val() || '') + '&captcha=' + encodeURIComponent($('input[name="captcha"]', '#review').val()),
            context: this,
            beforeSend: function() {
                $(this).button('loading');
                $('#review')
                    .find('div.form-group:last').state('none')
                    .children('div').empty();
            },
            complete: function() {
                $(this).button('reset');
            },
            success: function(data) {
                var $form = $('#review');

                if(data.success) {
                    $('#modal-review').modal('hide');

                    $form
                        .find('input[type="text"], textarea').val('').end()
                        .find('input[type="radio"]').prop('checked', false);

                    if (window.sessionStorage) {
                        window.sessionStorage.removeItem('review_<?php echo $product_id; ?>_name');
                        window.sessionStorage.removeItem('review_<?php echo $product_id; ?>_text');
                        window.sessionStorage.removeItem('review_<?php echo $product_id; ?>_rating');
                    }
                }
                else if(data.error) {
                    $form
                        .find('div.form-group:last').state(false)
                        .children('div').html('<p class="form-control-static">' + notice('warning', data.error) + '</p>');

                    $form.find('button[name="reCaptcha"]').click();
                }
            }
        });
    });

    // LOAD REVIEWS
    $('#reviews').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    // REVIW PAGINATION
    $('#reviews .pagination a').on('click', function(e) {
        e.preventDefault();
        $('#reviews').fadeOut('slow').load(this.href).fadeIn('slow');
    });

    // BIND INPUT CAPTCHA
    $('button[name="reCaptcha"]', 'form[name="review"]').click(function() {
        $(this).closest('div.captcha-group')
            .state(false)
            .find('img').attr('src', 'index.php?route=product/product/captcha/' + new Date().getTime()).end()
            .find('input[name="captcha"]').val('');
    });

    // BIND DATE & TIME FORMAT
    $('head').append('<link rel="stylesheet" href="<?php echo THEME_CSS_JQUERYUI; ?>" />');

    $('input.date', 'form[name="product_options"]').datepicker({dateFormat: 'yy-mm-dd'});
    $('input.datetime', 'form[name="product_options"]').datetimepicker({ dateFormat: 'yy-mm-dd', timeFormat: 'h:m' });
    $('input.time', 'form[name="product_options"]').timepicker({timeFormat: 'h:m'});

    // IMAGES SLIDES
    $('a.slide').click(function() {
        var images = $('a.slide');

        modal
            .html({
                title: $(this).data('img-title'),
                html: slides({
                    images: images.map(function() {
                        var $this = $(this);
                        return { alt: $this.data('img-title'), src: $this.data('img-src') };
                    }),
                    item: images.index(this)
                })
            })
            .show();
    });

    // TABS STATE
    if (window.sessionStorage) {
        $('#product-tabs a').click(function(){
            window.sessionStorage.setItem('tab_product_<?php echo $product_id; ?>', this.hash);
        });

        if (window.sessionStorage['tab_product_<?php echo $product_id; ?>']) {
            $('#product-tabs a[href="' + window.sessionStorage['tab_product_<?php echo $product_id; ?>'] + '"]').tab('show');
        }
    }

    // BIND FORM STORAGE
    $('form[name="product_options"], form[name="product"]').formStorage({
        prefix: 'product_<?php echo $product_id; ?>_',
        check: true
    });

    $('form[name="review"]').formStorage({
        prefix: 'review_<?php echo $product_id; ?>_',
        check: true
    });
});
</script>
</body>
</html>