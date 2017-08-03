<div class="product-thumb">
    <div class="image">
        <a href="<?php echo $product['href']; ?>" class="img-wrap"><?/*?>
				<span class="stickers">
                    <span class="sale">Sale!</span>
                    <span class="new_pr">New!</span>
                </span><?*/?>
                <span class="stickers">
                    <?php if(isset($product['special']) && $product['special']){ ?><span class="sale">Акция</span><? } ?>
                    <?php if(isset($product['bestseller']) && $product['bestseller']==true){ ?><span class="bestseller">Хит продаж</span><? } ?>
                    <?php if(isset($product['quantity']) && $product['quantity']<1){ ?><span class="stock">Нет в наличии</span><? } ?>
                </span>
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['thumb']; ?>" title="<?php echo $product['thumb']; ?>" class="img-responsive" />
        </a>

    </div>
    <div class="caption">
        <div class="name name-product">
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        </div>
        <div class="cart-button clearfix">
            <div class="price price-product">
                <?php if ($product['price']) { ?>
                <span class="price-new"><?php echo $product['price']; ?></span>
                <?php }?>
                <?php if ($product['special']){ ?>
                <span class="price-old"><?php echo $product['special']; ?></span>
                <?php } ?>
            </div>
            <div class="rating">
                <?php for($i=1;$i<6;$i++){ ?>
                <?if($i<=$product['rating']){ ?>
                <span class="fa fa-stack"><i class="fa fa-star activ fa-stack-2x"></i></span>
                <? }else{ ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
            </div>
            <?php if(isset($product['description']) && !empty($product['description'])){ ?><div class="description"><?php echo $product['description']; ?></div><?php } ?>

            <button data-toggle="tooltip" title="В корзину" class="btn btn-icon btn-add" type="button" onclick="addToCart('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i></button>
            <button class="btn btn-icon wishlist" type="button" data-toggle="tooltip" title="В закладки" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
            <button class="btn btn-icon compare" type="button" data-toggle="tooltip" title="В сравнение" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>

        </div>

    </div>
    <div class="clear"></div>
</div>