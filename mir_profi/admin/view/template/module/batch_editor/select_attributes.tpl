<input type="hidden" name="product_attributes[<?php echo $get['row_id']; ?>][name]" value="" />

<select name="product_attributes[<?php echo $get['row_id']; ?>][attribute_id]" onchange="selectAttribute('<?php echo $get['table']; ?>', <?php echo $get['row_id']; ?>);">
 <option value="0"><?php echo $text_none; ?></option>
 <?php foreach ($attributes as $attribute) { ?>
 <option value="<?php echo $attribute['attribute_id']; ?>"><?php echo $attribute['attribute_name']; ?></option>
 <?php } ?>
</select>