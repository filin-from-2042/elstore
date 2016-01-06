<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-attributes-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table id="attribute_list" class="list">
   <thead>
    <tr>
     <td class="center" width="3%"></td>
     <td class="left" width="20%"><?php echo $column_attribute_group; ?></td>
     <td class="left" width="20%"><?php echo $column_attribute_name; ?></td>
     <td class="left" width="57%"><?php echo $column_attribute_value; ?></td>
    </tr>
   </thead>
   <?php $attribute_row = 0; ?>
   <?php if ($product_attributes) { ?>
   <?php foreach ($product_attributes as $attribute) { ?>
   <tbody id="attribute-row<?php echo $attribute_row; ?>">
    <tr class="filter">
     <td class="center"><a onclick="$('#attribute_list #attribute-row<?php echo $attribute_row; ?>').remove();" href="javascript:return false;"><img src="view/image/delete.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
     <td class="left">
      <select name="product_attribute_group[<?php echo $attribute_row; ?>]" onchange="loadAttribute('attribute_list', <?php echo $attribute_row; ?>);">
       <option value="0"><?php echo $text_none; ?></option>
       <?php foreach ($attributes as $attribute_1) { ?>
       <?php if (isset ($attribute_1['attributes'][$attribute['attribute_id']])) { ?>
       <option value="<?php echo $attribute_1['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_1['attribute_group_name']; ?></option>
       <?php } else { ?>
       <option value="<?php echo $attribute_1['attribute_group_id']; ?>"><?php echo $attribute_1['attribute_group_name']; ?></option>
       <?php } ?>
       <?php } ?>
      </select>
     </td>
     <td class="left attribute_container<?php echo $attribute_row; ?>">
      <input type="hidden" name="product_attributes[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $attribute['attribute_id']; ?>" />
      <input type="text" name="product_attributes[<?php echo $attribute_row; ?>][name]" value="<?php echo $attribute['name']; ?>" />
     </td>
     <td class="left">
      <?php foreach ($languages as $language) { ?>
      <input name="product_attributes[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" value="<?php echo isset($attribute['product_attribute_description'][$language['language_id']]) ? $attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?>" />
      <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
      &nbsp;&nbsp;&nbsp;
      <?php } ?>
     </td>
    </tr>
   </tbody>
   <?php $attribute_row++; ?>
   <?php } ?>
   <?php } else { ?>
   <tbody class="no_results">
    <tr>
     <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
    </tr>
   </tbody>
   <?php } ?>
   <tfoot>
    <tr>
     <td class="center"><a onclick="addAttribute('attribute_list')"><img src="view/image/add.png" alt="<?php echo $button_insert; ?>" title="<?php echo $button_insert; ?>" /></a></td>
     <td class="center" colspan="3"><a class="button" onclick="editProductList('attributes', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
    </tr>
   </tfoot>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#attribute_list tbody').each(function(index, element) {
		attributeautocomplete('attribute_list', index);
	});
	
	$('#dialog').dialog('option', 'title', '<?php echo $column_attributes; ?>');
});

var attribute_row = attribute_row + <?php echo $attribute_row; ?>;
//--></script>