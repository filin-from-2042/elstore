<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 products-container"><div class="product-thumb transition">    <div class="image">        <a href="<?php echo $product['href']; ?>" class="img-wrap">            <span class="stickers"><span class="sale">Sale!</span></span>            <img alt="<?php echo $product['name']; ?>"                 title="<?php echo $product['name']; ?>"                 class="img-responsive lazy"                 data-src="<?php echo $product['thumb']; ?>" src="<?php echo $product['thumb']; ?>">        </a>        <?if(!isset($hideQuickView) || !$hideQuickView){ ?>            <a class="quickview" rel="group" href="#quickview_1">Быстрый просмотр</a>        <?}?>    </div>    <div class="caption">        <div class="name">            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>        </div>    </div>    <div class="cart-button">        <div class="price">            <?php if ($product['price']) { ?>                <span class="price-new"><?php echo $product['price']; ?></span>            <?php }?>            <?php if ($product['special']){ ?>                <span class="price-old"><?php echo $product['special']; ?></span>            <?php } ?>        </div>        <div class="rating">            <?php for($i=1;$i<6;$i++){ ?>            <?if($i<=$product['rating']){ ?>            <span class="fa fa-stack"><i class="fa fa-star activ fa-stack-2x"></i></span>            <? }else{ ?>            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>            <?php } ?>            <?php } ?>        </div>        <button data-toggle="tooltip" title="" class="btn btn-icon btn-add" type="button" onclick="addToCart(<?php echo $product['product_id']; ?>, 1, this);" data-original-title="В корзину">            <i class="fa fa-shopping-cart"></i>        </button>        <a class="btn details" href="<?php echo $product['href']; ?>">            <span>Подробно</span><i class="fa fa-chevron-right"></i><i class="fa fa-info"></i>        </a>    </div></div></div>