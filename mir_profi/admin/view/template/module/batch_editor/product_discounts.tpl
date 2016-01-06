<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-discounts-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table id="discount_list" class="list">
   <thead>
    <tr>
     <td class="left" width="1%" ></td>
     <td class="left" width="19%"><?php echo $column_customer_group; ?></td>
     <td class="left" width="10%"><?php echo $column_quantity; ?></td>
     <td class="left" width="10%"><?php echo $column_priority; ?></td>
     <td class="left" width="20%"><?php echo $column_discount; ?></td>
     <td class="left" width="20%"><?php echo $column_date_start; ?></td>
     <td class="left" width="20%"><?php echo $column_date_end; ?></td>
    </tr>
   </thead>
   <?php $discount_row = 0; ?>
   <?php if ($product_discounts) { ?>
   <?php foreach ($product_discounts as $product_discount) { ?>
   <tbody id="discount-row<?php echo $discount_row; ?>">
    <tr class="filter">
     <td class="center"><a onclick="$('#discount_list #discount-row<?php echo $discount_row; ?>').remove();"><img alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" src="view/image/delete.png"/></a></td>
     <td class="left">
      <select name="product_discounts[<?php echo $discount_row; ?>][customer_group_id]">
       <?php foreach ($customer_groups as $customer_group) { ?>
       <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
       <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
       <?php } else { ?>
       <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
       <?php } ?>
       <?php } ?>
      </select>
     </td>
     <td class="left"><input type="text" name="product_discounts[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>
     <td class="left"><input type="text" name="product_discounts[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>
     <td class="left"><input type="text" name="product_discounts[<?php echo $discount_row; ?>][discount]" value="<?php echo $product_discount['price']; ?>" /></td>
     <td class="left"><input type="text" name="product_discounts[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" /></td>
     <td class="left"><input type="text" name="product_discounts[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" /></td>
    </tr>
   </tbody>
   <?php $discount_row++; ?>
   <?php } ?>
   <?php } else { ?>
   <tbody class="no_results">
    <tr>
     <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
    </tr>
   </tbody>
   <?php } ?>
   <tfoot>
    <tr>
     <td class="left"><a onclick="addDiscount('discount_list');"><img alt="<?php echo $button_insert; ?>" title="<?php echo $button_insert; ?>" src="view/image/add.png"/></a></td>
     <td class="center" colspan="6"><a class="button" onclick="editProductList('discounts', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
    </tr>
   </tfoot>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#discount_list tbody .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	$('#dialog').dialog('option', 'title', '<?php echo $column_discounts; ?>');
});

var discount_row = discount_row + <?php echo $discount_row; ?>
//--></script>