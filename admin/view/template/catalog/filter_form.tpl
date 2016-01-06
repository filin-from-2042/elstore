<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/filter.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <form id="form" action="<?php echo $action; ?>" method="post" style="overflow: hidden;">
        <div id="option">
          <table class="form">
            <tr>
              <td><?php echo $entry_name; ?></td>
              <td>
                <?php foreach ($languages as $language) { ?>
                <input type="text" name="category_option_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo (isset($name[$language['language_id']]) ? $name[$language['language_id']]['name'] : ''); ?>" size="50" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                <?php } ?>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_postfix; ?></td>
              <td>
                <?php foreach ($languages as $language) { ?>
                <input type="text" name="category_option_description[<?php echo $language['language_id']; ?>][postfix]" value="<?php echo (isset($name[$language['language_id']]) ? $name[$language['language_id']]['postfix'] : ''); ?>" size="10" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                <?php } ?>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_description; ?></td>
              <td>
                <?php foreach ($languages as $language) { ?>
                <textarea name="category_option_description[<?php echo $language['language_id']; ?>][description]" rows="3" cols="50" style="resize: none;"><?php echo (isset($name[$language['language_id']]) ? $name[$language['language_id']]['description'] : ''); ?></textarea>&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                <?php } ?>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_category; ?></td>
              <td>
                Search: <input type="text" name="search" value="" style="width: 301px;" />
                <div class="scrollbox" id="categories">
                  <?php foreach ($categories as $category) { ?>
                  <label class="level-<?php echo $category['level']; ?>"><?php echo str_repeat('<i>&mdash;</i>', $category['level']); ?><input type="checkbox" name="category_id[]" value="<?php echo $category['category_id']; ?>"<?php echo (in_array($category['category_id'], $option_categories) ? ' checked="checked"' : ''); ?> /><?php echo $category['name']; ?></label>
                  <?php } ?>
                </div>
                <div class="select-all"><label><input onclick="$('#categories input').prop('checked', this.checked);" type="checkbox" value="" /> Выбрать все</label></div>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_store; ?></td>
              <td>
                <div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $option_store)) { ?>
                    <input type="checkbox" name="option_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="option_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $option_store)) { ?>
                    <input type="checkbox" name="option_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="option_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_type; ?></td>
              <td>
                <select name="type" onchange="this.value == 'group' ? $('#group').show() : $('#group').hide();">
                  <?php foreach ($types as $key => $value) { ?>
                  <?php if ($type == $key) { ?>
                  <option value="<?php echo $key; ?>" selected="selected"><?php echo $value; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <span id="group" <?php echo ($type != 'group' ? 'style="display:none;"' : ''); ?>>&nbsp;<?php echo $entry_group_count; ?>&nbsp;<input type="text" name="group_count" size="3" value="<?php echo ($group_count ? $group_count : 2); ?>" /></span>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td>
                <select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </td>
            </tr>
          </table>
        </div>
        <div id="values">
          <div class="header">
            <a onclick="filter.addValue();" class="button"><?php echo $text_add_value; ?></a>
            <?php if (count($languages) > 1) { ?>
            <label><input type="checkbox" name="multilanguage" value="1" /> мультиязычне значения</label>
            <?php } ?>
          </div>
          <ul id="sortable">
            <?php $option_value_row = 0; ?>
            <?php if ($option_values) { ?>
            <?php foreach ($option_values as $value) { ?>
            <li>
              <input type="hidden" class="order" name="option_value[update][<?php echo $value['value_id']; ?>][sort_order]" value="<?php echo $option_value_row; ?>" />
              <a class="delete" onclick="filter.deleteValue($(this));">Delete</a>
              <div class="handler"></div>
              <div class="fields">
                <?php foreach ($languages as $language) { ?>
                <label><input type="text" name="option_value[update][<?php echo $value['value_id']; ?>][language][<?php echo $language['language_id']; ?>][name]" value="<?php echo (isset($value['language'][$language['language_id']]) ? $value['language'][$language['language_id']]['name'] : ''); ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></label>
                <?php } ?>
              </div>
            </li>
            <?php $option_value_row++; ?>
            <?php } ?>
            <?php } ?>
          </ul>
          <div class="bottom"><a onclick="filter.addValue();" class="button"><?php echo $text_add_value; ?></a></div>
        </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--

var option_value_row = <?php echo $option_value_row; ?>, height = <?php echo (count($languages) > 1 ? 26*count($languages) : 30); ?>;

var filter = {
  update: function() {
    $('#sortable .order').each(function(i) {
      $(this).val(i);
    });
  },
  deleteValue: function(value) {
    value.parent('li').animate({'height':0}, 200, 'linear', function(){ $(this).remove(); filter.update(); });
  },
  addValue: function() {
    var option_value_sort = $('#sortable li').length;

    html  = '<li style="height:0;" class="append">';
    html += '  <input type="hidden" class="order" name="option_value[insert][' + option_value_row + '][sort_order]" value="' + option_value_sort + '" />';
  	html += '  <a class="delete" onclick="filter.deleteValue($(this));">Delete</a>';
    html += '  <div class="handler"></div>';
    html += '  <div class="fields">';
  	<?php foreach ($languages as $language) { ?>
    html += '     <label><input type="text" class="text" name="option_value[insert][' + option_value_row + '][language][<?php echo $language['language_id']; ?>][name]" value="<?php echo $text_value; ?> ' + option_value_sort + '" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></label>';
    <?php } ?>
    html += '  </div>';
    html += '</li>';

  	$('#sortable').append(html).find('li.append:first').removeClass('append').animate({'height': height}, 200, 'linear');

    filter.update();

  	option_value_row++;
  }
}

$('#sortable').sortable({
  placeholder: 'empty',
  handle: '.handler',
  start: function (event, ui) { ui.item.addClass('start'); $('.empty').height(height); },
  stop: function (event, ui) { ui.item.removeClass('start'); },
  update: function(event, ui) { filter.update(); }
});

// Search category

$.expr[':'].icontains = function(a, i, m) { return $(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0; };

$('input[name=\'search\']').keyup(function(){
  $('#categories label').removeAttr('style');
  $('#categories').scrollTop(0);

  if (this.value) {
    var find = $('#categories label:icontains(\'' + this.value + '\')');

    if (find.length) {
      find.css('color', 'red');

      $('#categories').scrollTop(find.offset().top-$('#categories').offset().top-$('#categories').outerHeight()/2+$('#categories label:first').outerHeight()/2);
    }
  }
});

<?php if (count($languages) > 1) { ?>
$('input[name^=\'option_value\']').live('keyup', function(){
  if ($('input[name=\'multilanguage\']').prop('checked')) {
    $(this).parents('.fields').find('input').val(this.value);
  }
});
<?php } ?>
//--></script>
<?php echo $footer; ?>