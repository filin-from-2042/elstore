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
      <?php if (isset($description) || isset($description)) { ?>
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
      <?php if(isset($text_refine) && $text_refine){ ?><h3 class="refinement-title"><?php echo $text_refine; ?></h3><? } ?>
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
            <div class="col-sm-6"></div>
            <div class="col-sm-6 text-right">
                <div class="pagination-wrap-cat"><?php echo $pagination; ?></div></div>
        </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
        <div class="content"><?php echo $text_empty; ?></div>
          <div class="buttons">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="button continue-btn"><?php echo $button_continue; ?></a></div>
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
    //--></script>
</div>
<?php echo $footer; ?>