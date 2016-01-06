<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-specials-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table id="special_list" class="list">
   <thead>
    <tr>
     <td class="left" width="1%" ></td>
     <td class="left" width="19%"><?php echo $column_customer_group; ?></td>
     <td class="left" width="20%"><?php echo $column_priority; ?></td>
     <td class="left" width="20%"><?php echo $column_discount; ?></td>
     <td class="left" width="20%"><?php echo $column_date_start; ?></td>
     <td class="left" width="20%"><?php echo $column_date_end; ?></td>
    </tr>
   </thead>
   <?php $special_row = 0; ?>
   <?php if ($product_specials) { ?>
   <?php foreach ($product_specials as $product_special) { ?>
   <tbody id="special-row<?php echo $special_row; ?>">
    <tr class="filter">
     <td class="center"><a onclick="$('#special_list #special-row<?php echo $special_row; ?>').remove();"><img alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" src="view/image/delete.png"/></a></td>
     <td class="left">
      <select name="product_specials[<?php echo $special_row; ?>][customer_group_id]">
       <?php foreach ($customer_groups as $customer_group) { ?>
       <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
       <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
       <?php } else { ?>
       <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
       <?php } ?>
       <?php } ?>
      </select>
     </td>
     <td class="left"><input type="text" name="product_specials[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
     <td class="left"><input type="text" name="product_specials[<?php echo $special_row; ?>][special]" value="<?php echo $product_special['price']; ?>" /></td>
     <td class="left"><input type="text" name="product_specials[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" /></td>
     <td class="left"><input type="text" name="product_specials[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" /></td>
    </tr>
   </tbody>
   <?php $special_row++; ?>
   <?php } ?>
   <?php } else { ?>
   <tbody class="no_results">
    <tr>
     <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
    </tr>
   </tbody>
   <?php } ?>
   <tfoot>
    <tr>
     <td class="left"><a onclick="addSpecial('special_list');"><img alt="<?php echo $button_insert; ?>" title="<?php echo $button_insert; ?>" src="view/image/add.png"/></a></td>
     <td class="center" colspan="5"><a class="button" onclick="editProductList('specials', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
    </tr>
   </tfoot>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#special_list tbody .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	$('#dialog').dialog('option', 'title', '<?php echo $column_specials; ?>');
});

var special_row = special_row + <?php echo $special_row; ?>;
//--></script>