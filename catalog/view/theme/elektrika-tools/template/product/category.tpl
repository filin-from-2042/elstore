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
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($thumb || $description) { ?>
        <div class="row">
          <div>
              <div class="category-info">
                <?php if ($thumb) { ?>
                <div class="image col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" class="img-thumbnail"/></div>
                <?php } ?>
                <?php if ($description) { ?>
                    <div class="col-sm-10"><?php echo $description; ?></div>
                <?php } ?>
              </div>
          </div>
       </div>
      <?php } ?>

      <?php if ($categories) { ?>
      <h3 class="refinement-title"><?php echo $text_refine; ?></h3>
      <div class="row">
          <div class="category-list">
                <ul class="box-subcat">
                  <?php foreach ($categories as $category) { ?>
                    <li class="col-sm-3">
                        <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>"></a></div>
                        <div class="name subcatname"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
                    </li>
                  <?php } ?>
                </ul>
          </div>
      </div>
      <?php } ?>

      <?php if ($products) { ?>
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
                      <span class="list-view view-type" data-toggle="tooltip" title="" data-original-title="Список"><i class="fa fa-th-list"></i></span>
                      <a onclick="display('grid');" class="grid-view view-type" data-toggle="tooltip" title="" data-original-title="Сетка"><i class="fa fa-th"></i></a>
                  </div>
              </div>
          </div>
        <div class="nav-cat clearfix">
            <div class="pagination pull-left"><?php echo $pagination; ?></div>
            <div class="pull-right">
                <div class="product-compare">
                    <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?><i class="fa fa-chevron-right"></i></a>
                </div>
            </div>
        </div>
      <div class="product-list">
        <?php foreach ($products as $product) { ?>
            <div>
              <?php if ($product['thumb']) { ?>
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
              <?php } ?>
              <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <div class="description"><?php echo $product['description']; ?></div>
              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <br />
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['rating']) { ?>
              <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
              <?php } ?>
              <div class="cart">
                <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
              </div>
              <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
              <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
            </div>
        <?php } ?>
      </div>
        <div class="row">
            <div class="col-sm-6"></div>
            <div class="col-sm-6 text-right">
                <div class="pagination"><?php echo $pagination; ?></div></div>
        </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
        <div class="content"><?php echo $text_empty; ?></div>
          <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
          </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php if ($column_right){ ?>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
    <?php } ?>
    </div>
    <script type="text/javascript"><!--
    function display(view) {
        if (view == 'list') {
            $('.product-grid').attr('class', 'product-list');

            $('.product-list > div').each(function(index, element) {
                html  = '<div class="right">';
                html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
                html += '</div>';

                html += '<div class="left">';

                var image = $(element).find('.image').html();

                if (image != null) {
                    html += '<div class="image">' + image + '</div>';
                }

                var price = $(element).find('.price').html();

                if (price != null) {
                    html += '<div class="price">' + price  + '</div>';
                }

                html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
                html += '  <div class="description">' + $(element).find('.description').html() + '</div>';

                var rating = $(element).find('.rating').html();

                if (rating != null) {
                    html += '<div class="rating">' + rating + '</div>';
                }

                html += '</div>';

                $(element).html(html);
            });

            $('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');

            $.totalStorage('display', 'list');
        } else {
            $('.product-list').attr('class', 'product-grid');

            $('.product-grid > div').each(function(index, element) {
                html = '';

                var image = $(element).find('.image').html();

                if (image != null) {
                    html += '<div class="image">' + image + '</div>';
                }

                html += '<div class="name">' + $(element).find('.name').html() + '</div>';
                html += '<div class="description">' + $(element).find('.description').html() + '</div>';

                var price = $(element).find('.price').html();

                if (price != null) {
                    html += '<div class="price">' + price  + '</div>';
                }

                var rating = $(element).find('.rating').html();

                if (rating != null) {
                    html += '<div class="rating">' + rating + '</div>';
                }

                html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

                $(element).html(html);
            });

            $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');

            $.totalStorage('display', 'grid');
        }
    }

    view = $.totalStorage('display');

    if (view) {
        display(view);
    } else {
        display('[b]grid[/b]');
    }
    //--></script>
</div>
<?php echo $footer; ?>