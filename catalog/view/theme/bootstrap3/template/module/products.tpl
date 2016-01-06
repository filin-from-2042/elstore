<!-- PRODUCTS -->
<!-- product compare -->
<p class="hidden-print"><a class="compare-total" href="<?php echo $compare; ?>"><?php echo $text_compare; ?></a></p>
<br />
<div class="row hidden-print">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <!-- display view -->
        <ul class="nav nav-pills pull-left">
            <li id="display-list" class="active" title="<?php echo $text_display . ' ' . $text_list; ?>">
                <a><small class="glyphicon glyphicon-th-list"></small></a>
            </li>
            <li id="display-grid" title="<?php echo $text_display . ' ' . $text_grid; ?>">
                <a><small class="glyphicon glyphicon-th"></small></a>
            </li>
            <li id="display-grid-row" class="dropdown sr-only">
                <a class="dropdown-toggle" data-toggle="dropdown">
                    <span>3</span>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                    <li><a href="#1">1</a></li>
                    <li><a href="#2">2</a></li>
                    <li><a href="#3">3</a></li>
                    <li><a href="#4">4</a></li>
                </ul>
            </li>
        </ul>
        <!-- display filter -->
        <ul class="nav nav-pills pull-right">
            <!-- filter sort -->
            <li id="display-sort" class="dropdown">
                <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu" style="min-width: 100%;">
                    <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] != $sort . '-' . $order) { ?>
                            <li><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
                        <?php } else { ?>
                            <?php $selected = $sorts['text']; ?>
                        <?php } ?>
                    <?php } ?>
                </ul>
                <a class="dropdown-toggle hidden-xs" data-toggle="dropdown">
                    <span><?php echo $text_sort; ?>&nbsp;<?php echo $selected; ?></span>
                    <span class="caret"></span>
                </a>
                <a class="dropdown-toggle visible-xs" data-toggle="dropdown" title="<?php echo $text_sort; ?>&nbsp;<?php echo $selected; ?>">
                    <span class="glyphicon glyphicon-sort"></span>
                    <span class="caret"></span>
                </a>
            </li>
            <!-- filter limit -->
            <li class="dropdown">
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="min-width: 100%;">
                    <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] != $limit) { ?>
                            <li><a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
                        <?php } else { ?>
                            <?php $selected = $limits['text']; ?>
                        <?php } ?>
                    <?php } ?>
                </ul>
                <a class="dropdown-toggle hidden-xs" data-toggle="dropdown">
                    <span><?php echo $text_limit; ?>&nbsp;<?php echo $selected; ?></span>
                    <span class="caret"></span>
                </a>
                <a class="dropdown-toggle visible-xs" data-toggle="dropdown" title="<?php echo $text_limit; ?>&nbsp;<?php echo $selected; ?>">
                    <span><?php echo $selected; ?></span>
                    <span class="caret"></span>
                </a>
            </li>
        </ul>
    </div>
</div>
<br />
<!-- products -->
<div id="products" class="row">
    <?php foreach ($products as $product) {   ?>

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="product-item media page-header">
                <!-- thumb -->
                <?php if ($product['thumb']) { ?>
                    <a  href="<?php echo $product['href']; ?>">
                        <img class="media-object img-responsive img-rounded" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    </a>
                <?php } ?>
                <!-- rating -->
                <?php if ($product['rating']) { ?>
                    <img class="media-object pull-right" src="<?php echo THEME . 'image/stars-' . $product['rating'] . '.png'; ?>" alt="<?php echo $product['reviews']; ?>" title="<?php echo $product['reviews']; ?>" />
                <?php } ?>
                <div class="caption">
                    <!-- name -->
                    <h4 class="media-heading"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <!-- description -->
                    <p class="product-description"><?php echo $product['description']; ?></p>
                    <!-- price -->
                    <?php if ($product['price']) { ?>
                        <ul class="list-unstyled text-center">
                            <li>
                                 <wbr />
                                <?php if (!$product['special']) { ?>
                                    <strong class="text-danger nowrap product-price"><?php echo $product['price']; ?></strong>
                                <?php } else { ?>
                                    <small class="text-warning text-sthrough nowrap"><?php echo $product['price']; ?></small> <wbr /><strong class="text-danger nowrap"><?php echo $product['special']; ?></strong>
                                <?php } ?>
                            </li>
                            <?php if ($product['tax']) { ?>
                                <li class="text-muted nowrap"><?php echo $text_tax; ?> <wbr /><?php echo $product['tax']; ?></li>
                            <?php } ?>
                        </ul>
                        
                    <?php } ?>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <a class="btn btn-link" name="addToWishList" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
                            <a class="btn btn-link" name="addToCompare" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
                            <button type="button" class="btn btn-primary pull-right" name="addToCart" title="<?php echo $button_cart; ?>" data-loading-text="<?php echo $button_cart; ?>..." onclick="addToCart('<?php echo $product['product_id']; ?>', 1, this);"  /><?php echo $button_cart; ?></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</div>
<!-- pagination -->
<div class="row hidden-print">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
        <?php echo $pagination; ?>
    </div>
</div>
<!-- js -->
<script>
jQuery(function($){
    // PRODUCTS VIEW
    var display = window.sessionStorage && window.sessionStorage['products_display'] || 'grid';
    var grid = window.sessionStorage && window.sessionStorage['products_grid'] || 3;
    var $products = $('#products div.product-item');
    
    // Display
    $('#display-list, #display-grid').click(function() {
        display = this.id.replace('display-', '');
        
        if (display === 'list') {
            $products.removeClass('thumbnail').addClass('page-header').height('auto');
            $products.parent('div').removeClass().addClass('col-xs-12 col-sm-12 col-md-12 col-lg-12');
            
            $('#display-grid').removeClass('active');
            $(this).addClass('active');
            $('#display-grid-row').state('none');
        } else if (display === 'grid') {
            var col = parseInt(12 / grid);
            
            $products.removeClass('page-header').addClass('thumbnail').height('auto');
            $('#products>div').removeClass().addClass('col-xs-' + col + ' col-sm-' + col + ' col-md-' + col + ' col-lg-' + col);
            
            if (grid > 1) {
                $products.height(Math.ceil(Math.max.apply(null, $.map($('#products div.product-item'), function(i) { return $(i).height(); }))));
            }
            
            $('#display-list').removeClass('active');
            $(this).addClass('active');
            $('#display-grid-row').state(false);
        }
        
        if (window.sessionStorage) window.sessionStorage['products_display'] = display;
    });
    
    // Grid
    $('#display-grid-row>ul.dropdown-menu a').click(function(e) {
        e.preventDefault();
        
        grid = this.hash.replace('#', '');
        var col = parseInt(12 / grid);
        
        $products.height('auto');
        $('#products>div').removeClass().addClass('col-xs-' + col + ' col-sm-' + col + ' col-md-' + col + ' col-lg-' + col);
        
        if (grid > 1) {
            $products.height(Math.ceil(Math.max.apply(null, $.map($('#products div.product-item'), function(i) { return $(i).height(); }))));
        }
        
        $('#display-grid-row span').text(grid);
        
        if (window.sessionStorage) window.sessionStorage['products_grid'] = grid;
    });
    
    // Init
    if (display === 'grid') {
        $(window).load(function() {
            $('#display-grid').click();
        });
    }
    $('#display-grid-row span').text(grid);
    
    // Resize height
    var resizeTimer = null;
    
    $(window).resize(function() {
        clearTimeout(resizeTimer);
        
        if (display === 'grid' && grid > 1) {
            resizeTimer = setTimeout(function() {
                $products.height('auto');
                $products.height(Math.ceil(Math.max.apply(null, $.map($('#products div.product-item'), function(i) { return $(i).height(); }))));
                
                clearTimeout(resizeTimer);
            }, 300);
        } else {
            $products.height('auto');
        }
    });
});
</script>