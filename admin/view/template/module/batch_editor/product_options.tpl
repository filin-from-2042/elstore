<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-options-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <div id="vtab-options-form-options-list" class="vtabs">
   <?php $option_row = 0; ?>
   <?php foreach ($product_options['product_options'] as $product_option) { ?>
    <a href="#tab-option-form-options-list-<?php echo $option_row; ?>" id="option-form-options-list-<?php echo $option_row; ?>"><?php echo $product_option['name']; ?>&nbsp;
    <img src="view/image/delete.png" alt="" onclick="$('#form-options-list #vtab-options-form-options-list a:first').trigger('click'); $('#option-form-options-list-<?php echo $option_row; ?>').remove(); $('#tab-option-form-options-list-<?php echo $option_row; ?>').remove(); return false;" /></a>
    <?php $option_row++; ?>
    <?php } ?>
    <span id="option-add-form-options-list">
    <input name="option" value="" style="width:130px;" />
    &nbsp;<img src="view/image/add.png" alt="<?php echo $button_insert; ?>" title="<?php echo $button_insert; ?>" /></span>
  </div>
  <?php $option_row = 0; ?>
  <?php $option_value_row = 0; ?>
  <?php foreach ($product_options['product_options'] as $product_option) { ?>
  <div id="tab-option-form-options-list-<?php echo $option_row; ?>" class="vtabs-content">
   <input type="hidden" name="product_options[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
   <input type="hidden" name="product_options[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
   <input type="hidden" name="product_options[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
   <input type="hidden" name="product_options[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
   <table class="form">
    <tr>
     <td><?php echo $entry_required; ?></td>
     <td>
      <select name="product_options[<?php echo $option_row; ?>][required]">
       <?php if ($product_option['required']) { ?>
       <option value="1" selected="selected"><?php echo $text_yes; ?></option>
       <option value="0"><?php echo $text_no; ?></option>
       <?php } else { ?>
       <option value="1"><?php echo $text_yes; ?></option>
       <option value="0" selected="selected"><?php echo $text_no; ?></option>
       <?php } ?>
      </select>
     </td>
    </tr>
    <?php if ($product_option['type'] == 'text') { ?>
    <tr>
     <td><?php echo $entry_option_value; ?></td>
     <td><input type="text" name="product_options[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
    </tr>
    <?php } ?>
    <?php if ($product_option['type'] == 'textarea') { ?>
    <tr>
     <td><?php echo $entry_option_value; ?></td>
     <td><textarea name="product_options[<?php echo $option_row; ?>][option_value]" cols="40" rows="5"><?php echo $product_option['option_value']; ?></textarea></td>
    </tr>
    <?php } ?>
    <?php if ($product_option['type'] == 'file') { ?>
    <tr style="display: none;">
     <td><?php echo $entry_option_value; ?></td>
     <td><input type="text" name="product_options[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
    </tr>
    <?php } ?>
    <?php if ($product_option['type'] == 'date') { ?>
    <tr>
     <td><?php echo $entry_option_value; ?></td>
     <td><input type="text" name="product_options[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" /></td>
    </tr>
    <?php } ?>
    <?php if ($product_option['type'] == 'datetime') { ?>
    <tr>
     <td><?php echo $entry_option_value; ?></td>
     <td><input type="text" name="product_options[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" /></td>
    </tr>
    <?php } ?>
    <?php if ($product_option['type'] == 'time') { ?>
    <tr>
     <td><?php echo $entry_option_value; ?></td>
     <td><input type="text" name="product_options[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" /></td>
    </tr>
    <?php } ?>
   </table>
   <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
   <table id="option-value-form-options-list-<?php echo $option_row; ?>" class="list">
    <thead>
     <tr>
      <td class="left"><?php echo $entry_option_value; ?></td>
      <td class="right"><?php echo $entry_quantity; ?></td>
      <td class="left"><?php echo $entry_subtract; ?></td>
      <td class="right"><?php echo $entry_price; ?></td>
      <td class="right"><?php echo $entry_option_points; ?></td>
      <td class="right"><?php echo $entry_weight; ?></td>
      <td></td>
     </tr>
    </thead>
    <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
    <tbody id="option-value-row-form-options-list-<?php echo $option_value_row; ?>">
     <tr>
      <td class="left">
       <select name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">
        <?php if (isset($product_options['option_values'][$product_option['option_id']])) { ?>
        <?php foreach ($product_options['option_values'][$product_option['option_id']] as $option_value) { ?>
        <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
        <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
       </select>
       <input type="hidden" name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" />
      </td>
      <td class="right"><input type="text" name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" size="3" /></td>
      <td class="left">
       <select name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]">
        <?php if ($product_option_value['subtract']) { ?>
        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
        <option value="0"><?php echo $text_no; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_yes; ?></option>
        <option value="0" selected="selected"><?php echo $text_no; ?></option>
       <?php } ?>
      </select>
     </td>
     <td class="right">
      <select name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]">
       <?php if ($product_option_value['price_prefix'] == '+') { ?>
       <option value="+" selected="selected">+</option>
       <?php } else { ?>
       <option value="+">+</option>
       <?php } ?>
       <?php if ($product_option_value['price_prefix'] == '-') { ?>
       <option value="-" selected="selected">-</option>
       <?php } else { ?>
       <option value="-">-</option>
       <?php } ?>
      </select>
      <input type="text" name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" size="5" />
     </td>
     <td class="right">
      <select name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">
       <?php if ($product_option_value['points_prefix'] == '+') { ?>
       <option value="+" selected="selected">+</option>
       <?php } else { ?>
       <option value="+">+</option>
       <?php } ?>
       <?php if ($product_option_value['points_prefix'] == '-') { ?>
       <option value="-" selected="selected">-</option>
       <?php } else { ?>
       <option value="-">-</option>
       <?php } ?>
      </select>
      <input type="text" name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" />
     </td>
     <td class="right">
      <select name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">
       <?php if ($product_option_value['weight_prefix'] == '+') { ?>
       <option value="+" selected="selected">+</option>
       <?php } else { ?>
       <option value="+">+</option>
       <?php } ?>
       <?php if ($product_option_value['weight_prefix'] == '-') { ?>
       <option value="-" selected="selected">-</option>
       <?php } else { ?>
       <option value="-">-</option>
       <?php } ?>
      </select>
      <input type="text" name="product_options[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" />
     </td>
     <td class="left"><a onclick="$('#form-options-list #option-value-row-form-options-list-<?php echo $option_value_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
    </tr>
   </tbody>
   <?php $option_value_row++; ?>
   <?php } ?>
   <tfoot>
    <tr>
     <td colspan="6"></td>
     <td class="left"><a onclick="addOptionValue('form-options-list', '<?php echo $option_row; ?>');" class="button"><?php echo $button_insert; ?></a></td>
    </tr>
   </tfoot>
  </table>
  <select id="option-values-form-options-list<?php echo $option_row; ?>" style="display: none;">
   <?php if (isset ($product_options['option_values'][$product_option['option_id']])) { ?>
   <?php foreach ($product_options['option_values'][$product_option['option_id']] as $option_value) { ?>
   <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
   <?php } ?>
   <?php } ?>
  </select>
  <?php } ?>
  </div>
  <?php $option_row++; ?>
  <?php } ?>
  <div class="before" style="clear:both;"></div>
  <table class="list">
   <tr>
    <td class="center"><a class="button" onclick="editProductList('options', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
   </tr>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	optionautocomplete('form-options-list', <?php echo $option_row; ?>);
	
	$('#form-options-list #vtab-options-form-options-list a').tabs();
	$('#form-options-list .date').datepicker({dateFormat: 'yy-mm-dd'});
	$('#form-options-list .datetime').datetimepicker({dateFormat: 'yy-mm-dd', timeFormat: 'h:m'});
	$('#form-options-list .time').timepicker({timeFormat: 'h:m'});
	
	$('#dialog').dialog('option', 'title', '<?php echo $column_options; ?>');
});

var option_row = option_row + <?php echo $option_row; ?>;

var option_value_row = option_value_row + <?php echo $option_value_row; ?>;
//--></script>