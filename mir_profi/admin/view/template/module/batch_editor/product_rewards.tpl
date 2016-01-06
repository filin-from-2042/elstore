<div class="content">
 <form id="form-rewards-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table class="list">
   <thead>
    <tr>
     <td class="left"><?php echo $column_customer_group; ?></td>
     <td class="left"><?php echo $column_points; ?></td>
    </tr>
   </thead>
   <?php foreach ($customer_groups as $customer_group) { ?>
   <tbody>
    <tr>
     <td class="left"><?php echo $customer_group['name']; ?></td>
     <td class="left"><input type="text" name="product_rewards[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset ($product_rewards[$customer_group['customer_group_id']]) ? $product_rewards[$customer_group['customer_group_id']]['points'] : ''; ?>" /></td>
    </tr>
   </tbody>
   <?php } ?>
   <tfoot>
    <tr>
     <td class="center" colspan="2"><a class="button" onclick="editProductList('rewards', 'upd');"><?php echo $button_save; ?></a></td>
    </tr>
   </tfoot>
  </table>
 </form>
</div>