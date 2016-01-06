<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-stores-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table class="list">
   <tbody>
    <tr class="">
     <td class="left">
      <div class="scrollbox" style="width:100%; height:350px;">
       <?php $class = 'even'; ?>
       <div class="<?php echo $class; ?>">
        <?php if (in_array (0, $product_stores)) { ?>
        <input type="checkbox" name="product_stores[]" value="0" checked="checked" /> <?php echo $text_default; ?>
        <?php } else { ?>
        <input type="checkbox" name="product_stores[]" value="0" /> <?php echo $text_default; ?>
        <?php } ?>
       </div>
       <?php foreach ($stores as $store) { ?>
       <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
       <div class="<?php echo $class; ?>">
        <?php if (in_array ($store['store_id'], $product_stores)) { ?>
        <input type="checkbox" name="product_stores[]" value="<?php echo $store['store_id']; ?>" checked="checked" /> <?php echo $store['name']; ?>
        <?php } else { ?>
        <input type="checkbox" name="product_stores[]" value="<?php echo $store['store_id']; ?>" /> <?php echo $store['name']; ?>
        <?php } ?>
       </div>
       <?php } ?>
      </div>
     </td>
    </tr>
   </tbody>
   <tfoot>
    <tr>
     <td class="center"><a class="button" onclick="editProductList('stores', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
    </tr>
   </tfoot>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#dialog').dialog('option', 'title', '<?php echo $column_stores; ?>');
});
//--></script>