<!-- PRODUCTS THUMBNAIL --><div class="row">    <?php foreach ($products as $product) { ?>        <div class="<?php echo !empty($bt3) ? $bt3 : 'col-xs-12 col-sm-12 col-md-12 col-lg-12'; ?>">            <div class="product-item thumbnail">                <div class="row">                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">                            <a class="center" href="<?php echo $product['href']; ?>">                                <img class="img-rounded img-responsive" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />                            </a>                             <?php if ($product['rating']) { ?>                            <img class="pull-right" src="<?php echo HTTP_SERVER . 'catalog/view/theme/' . $this->config->get('config_template') . '/image/stars-' . $product['rating'] . '.png'; ?>" alt="<?php echo $product['reviews']; ?>" title="<?php echo $product['reviews']; ?>" />                        <?php } ?>                    </div>                </div>                <div class="caption">                    <h4><a class="media-heading" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>                    <?php if ($product['price']) { ?>                        <p>                            <?php if (!$product['special']) { ?>                                <strong class="text-danger nowrap product-price pull-right"><?php echo $product['price']; ?></strong>                            <?php } else { ?>                                <small class="text-warning text-sthrough nowrap "><?php echo $product['price']; ?></small> <wbr /><strong class="text-danger nowrap"><?php echo $product['special']; ?></strong>                            <?php } ?>                        </p>                    <?php } ?>                    <div class="row">                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 controls">                            <div class="col-xs-4">                                <a class="btn btn-link wishlist" name="addToWishList" title="<?php echo $this->language->get('button_wishlist'); ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');" /><div class="glyphicon glyphicon-heart"></div> </a>                            </div>                            <div class="col-xs-4">                                <a class="btn btn-link compare" name="addToCompare" title="<?php echo $this->language->get('button_compare'); ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');" /><div class="glyphicon glyphicon-list"></div> </a>                           </div>                            <div class="col-xs-4">                                <button type="button addtocart" class="btn btn-primary pull-right" name="addToCart" onclick="addToCart(<?php echo $product['product_id']; ?>, 1, this);" /><div class="glyphicon glyphicon-shopping-cart"></div> </button>                            </div>                        </div>                    </div>                </div>            </div>        </div>    <?php } ?></div>