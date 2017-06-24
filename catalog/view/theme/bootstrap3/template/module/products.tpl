<!-- PRODUCTS -->
<div class="row hidden-print">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <!-- display view -->
        <!--<ul class="nav nav-pills pull-left">
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
        </ul>-->
        <!-- display filter -->
       <div class="container">
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
</div>
<br />
<!-- products -->
<div id="products" class="container">
    <?php foreach ($products as $product) {   ?>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 products-container">

        <div class="product-item thumbnail">
            <?php if (isset($product['quantity']) && $product['quantity']=='0') {
                ?>
            <div class="no-quantity">
                <div>
                    Нет в наличии
                </div>
            </div>

            <?php } ?>
            <div class="product-code"><?php echo $product['code']; ?></div>
            <div class="bookmark"><a class="btn btn-link wishlist" name="addToWishList" title="<?php echo $this->language->get('button_wishlist'); ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');" /><div class="glyphicon glyphicon-heart"></div> </a></div>

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <a class="center" href="<?php echo $product['href']; ?>">
                        <img class="img-responsive center" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    </a>
                    <?php if ($product['rating']) { ?>
                    <img class="pull-right" src="<?php echo HTTP_SERVER . 'catalog/view/theme/' . $this->config->get('config_template') . '/image/stars-' . $product['rating'] . '.png'; ?>" alt="<?php echo $product['reviews']; ?>" title="<?php echo $product['reviews']; ?>" />
                    <?php } ?>
                </div>
            </div>
            <hr>
            <div class="caption">
                <h4><a class="media-heading" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <div class="prices">
                    <?php if ($product['price']) { ?>
                    <strong class="text-danger nowrap product-price"><?php echo $product['price']; ?></strong>
                    <?php }?>


                    <?php if ($product['special']){ ?>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 old_price">
                        <small class="text-warning text-sthrough nowrap  "><?php echo $product['special']; ?></small> <wbr />
                    </div>
                    <?php } ?>


                </div>
                <div class="clear"></div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 button-cart ">
                    <button type="button" class="add2cart" name="addToCart" onclick="addToCart(<?php echo $product['product_id']; ?>, 1, this);" />В корзину <div class="glyphicon glyphicon-shopping-cart"></div></button>
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