<!-- products -->
<div id="products" class="row">
    <?php foreach ($products as $product) {   ?>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">

        <div class="product-item thumbnail">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 product-image">
                    <a class="center" href="<?php echo $product['href']; ?>">
                        <img class="img-responsive center" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    </a>
                    <?php if ($product['rating']) { ?>
                    <img class="pull-right" src="<?php echo HTTP_SERVER . 'catalog/view/theme/' . $this->config->get('config_template') . '/image/stars-' . $product['rating'] . '.png'; ?>" alt="<?php echo $product['reviews']; ?>" title="<?php echo $product['reviews']; ?>" />
                    <?php } ?>
                </div>

                <div class="caption col-xs-12 col-sm-12 col-md-7 col-lg-7">
                    <h4><a class="media-heading" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>


                    <?php if ($product['price']) { ?>
                    <strong class="text-danger nowrap product-price"><?php echo $product['price']; ?></strong>
                    <?php }?>


                    <?php if ($product['special']){ ?>
                    <p>
                        <small class="text-warning text-sthrough nowrap old_price "><?php echo $product['special']; ?></small> <wbr />
                        <?php } ?>
                    </p>

                </div>
            </div>

            <div class="row product-controls" style="margin: 0 -5px 0 -5px">

                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 button-wishlist">
                    <a class="btn btn-link wishlist" name="addToWishList" title="<?php echo $this->language->get('button_wishlist'); ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');" /><div class="glyphicon glyphicon-heart"></div> </a>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 button-compare ">
                    <a class="btn btn-link compare" name="addToCompare" title="<?php echo $this->language->get('button_compare'); ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');" /><div class="glyphicon glyphicon-list"></div> </a>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 ">
                    <button type="button" class="add2cart" name="addToCart" onclick="addToCart(<?php echo $product['product_id']; ?>, 1, this);" /><div class="glyphicon glyphicon-shopping-cart"></div></button>
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