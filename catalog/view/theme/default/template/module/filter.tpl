<?php if ($options) { ?>

<div class="box filter">
  <div class="box-heading sprite-icons-v"><?php echo $heading_title; ?></div>
  <div class="box-content" id="product-filter">
    <form action="">
      <?php if ($selecteds) { ?>
      <?php # Selected options ?>
      <div id="selecteds">
        <?php foreach ($selecteds as $option) { ?>
        <div class="filter-option">
          <span><?php echo $option['name']; ?>:</span>
          <?php foreach ($option['values'] as $value) { ?>
          <a rel="nofollow" href="<?php echo $value['href']; ?>" class="cancel-small"><?php echo $value['name']; ?></a>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if (count($selecteds) > 1 || count($selecteds[0]['values']) > 1) { ?>
        <a rel="nofollow" href="<?php echo $link; ?>" class="cancel-large"><?php echo $text_cancel_all; ?></a>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if ($show_price) { ?>
      <?php # Price filtering ?>
      <div class="filter-option" id="filter-price">
        <div class="option-name">
          <?php echo $text_price; ?>&nbsp;<?php echo $this->currency->getSymbolLeft(); ?>&nbsp;<span id="p-from"><?php echo ($min_price_get ? $min_price_get : $min_price); ?></span>&nbsp;&mdash;&nbsp;<span id="p-to"><?php echo ($max_price_get ? $max_price_get : $max_price); ?></span>&nbsp;<?php echo $this->currency->getSymbolRight(); ?>
          <?php if (($filter_position == 'content_top' || $filter_position == 'content_bottom') && !$show_button) { ?>
          <br /><br /><a rel="nofollow" href="#" class="button" id="filter-button"><span><?php echo $button_select; ?></span></a>
          <?php } ?>
        </div>
        <div id="price-handlers" class="option-values">
          <div id="scale"></div>
          <?php if ($diagram) { ?>
          <div id="diagram">
            <div id="field">
              <?php foreach ($diagram as $key => $item) { ?>
              <div style="height:<?php echo $item['height']; ?>;width:<?php echo $item['width']; ?>;left:<?php echo $item['width']*$key; ?>px;"></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
        </div>
        <?php if (($filter_position == 'column_left' || $filter_position == 'column_right') && !$show_button) { ?>
        <div id="price-button"><a rel="nofollow" href="#" class="button" id="filter-button"><span><?php echo $button_select; ?></span></a></div>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if ($hide_options) { ?>
      <div class="filter-buttons"><a href="#" id="show-hide-options" class="button"><span><?php echo $button_show; ?></span></a></div>
      <?php $id = 'other-options-hide'; ?>
      <?php } else { ?>
      <?php $id = 'other-options'; ?>
      <?php } ?>

      <div id="<?php echo $id; ?>">
        <?php foreach ($options as $option) { ?>
        <div class="filter-option">
          <div class="option-name">
            <?php echo $option['name']; ?>

            <?php if ($option['description']) { ?>
            <a href="#" onclick="return false;"></a>
            <span class="description"><?php echo $option['description']; ?></span>
            <?php } ?>
          </div>
          <?php if ($option['values']) { ?>
          <div class="option-values">
            <?php if ($option['type'] == 'select') { ?>
            <?php # Select type start ?>
            <label>
              <select name="option[<?php echo $option['option_id']; ?>]"<?php echo ($option['selected'] ? ' class="selected"' : ''); ?>>
                <?php foreach ($option['values'] as $value) { ?>
                <?php if ($value['selected']) { ?>
                <option value="<?php echo $value['params']; ?>" id="v-<?php echo $option['option_id'] . $value['value_id']; ?>" selected="selected"><?php echo $value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $value['params']; ?>" id="v-<?php echo $option['option_id'] . $value['value_id']; ?>" disabled="disabled"><?php echo $value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </label>
            <?php # Select type end ?>
            <?php } elseif ($option['type'] == 'radio') { ?>
            <?php # Radio type start ?>
            <?php foreach ($option['values'] as $value) { ?>
            <?php if ($value['selected']) { ?>
            <label id="v-<?php echo $option['option_id'] . $value['value_id']; ?>" class="selected"><input type="radio" name="option[<?php echo $option['option_id']; ?>]" value="<?php echo $value['params']; ?>" checked="checked" /><?php echo $value['name']; ?><?php if ($show_counter) { ?><small></small><?php } ?></label>
            <?php } else { ?>
            <label id="v-<?php echo $option['option_id'] . $value['value_id']; ?>" class="disabled"><input type="radio" name="option[<?php echo $option['option_id']; ?>]" value="<?php echo $value['params']; ?>" disabled="disabled" /><?php echo $value['name']; ?><?php if ($show_counter) { ?><small></small><?php } ?></label>
            <?php } ?>
            <?php } ?>
            <?php # Radio type end ?>
            <?php } elseif ($option['type'] == 'checkbox' || $option['type'] == 'group') { # if is checkbox ?>
            <?php # Checkbox type start ?>
            <?php foreach ($option['values'] as $value) { ?>
            <?php if ($value['selected']) { ?>
            <label id="v-<?php echo $option['option_id'] . $value['value_id']; ?>" class="selected"><input type="checkbox" name="option[<?php echo $option['option_id']; ?>]" value="<?php echo $value['params']; ?>" checked="checked" /><?php echo $value['name']; ?><?php if ($show_counter) { ?><small></small><?php } ?></label>
            <?php } else { ?>
            <label id="v-<?php echo $option['option_id'] . $value['value_id']; ?>" class="disabled"><input type="checkbox" name="option[<?php echo $option['option_id']; ?>]" value="<?php echo $value['params']; ?>" disabled="disabled" /><?php echo $value['name']; ?><?php if ($show_counter) { ?><small></small><?php } ?></label>
            <?php } ?>
            <?php } ?>
            <?php # Checkbox type end ?>
            <?php } # End type switcher ?>
          </div>
          <?php } # End "if values" ?>
        </div>
      <?php } # End "foreach $options" ?>
      </div>

      <?php if ($show_button) { ?>
      <div class="filter-buttons" id="button-bottom"><a href="#" class="button" id="filter-button"><span><?php echo $button_select; ?></span></a></div>
      <?php } ?>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var filter = {
  tag: {
    vals  : '#v-',   // ID value tag
    count : 'small'  // Product counter tag
  },
  slide: {
    width        : 160, // Scale width (px)
    widthRem     : 14,  // Slider handler width (px)
    leftHandler  : 'catalog/view/theme/default/image/filter/slide-handler-left.png',  // Right handler image
    rightHandler : 'catalog/view/theme/default/image/filter/slide-handler-right.png', // Left handler image
    leftLimit    : <?php echo $min_price; ?>, // Start limit
  	leftValue    : <?php echo ($min_price_get ? $min_price_get : $min_price); ?>, // Left value
  	rightLimit   : <?php echo $max_price; ?>, // End limit
  	rightValue   : <?php echo ($max_price_get ? $max_price_get : $max_price); ?>  // Right value
  },
  url: {
    link   : '<?php echo $link; ?>'
  },
  php: {
    showButton   : <?php echo $show_button; ?>,
    scrollButton : <?php echo $scroll_button; ?>,
    showPrice    : <?php echo $show_price; ?>,
    showCounter  : <?php echo $show_counter; ?>,
    total        : <?php echo $total; ?>,
    path         : '<?php echo $path; ?>',
    params       : '<?php echo $params; ?>',
    price        : '<?php echo $price; ?>'
  },
  text: {
    show   : '<?php echo $button_show; ?>',
    hide   : '<?php echo $button_hide; ?>',
    select : '<?php echo $button_select; ?>',
    load   : '<?php echo $text_load; ?>'
  }
}
//--></script>
<?php if ($show_price) { ?>
<script type="text/javascript" src="catalog/view/javascript/filter/trackbar.js"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/filter/filter.js"></script>
<?php } ?>