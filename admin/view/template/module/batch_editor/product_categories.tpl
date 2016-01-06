<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-categories-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table class="form">
   <?php if (isset ($main_category)) { ?>
   <tr>
    <td><?php echo $column_main_category; ?></td>
    <td>
     <select name="product_categories[0]">
      <option value="0"><?php echo $text_none; ?></option>
      <?php foreach ($categories as $category) { ?>
      <?php if ($main_category == $category['category_id']) { ?>
      <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
      <?php } ?>
      <?php } ?>
     </select>
    </td>
   </tr>
   <?php } ?>
   <tr>
    <td><?php echo $column_categories; ?></td>
    <td>
     <div class="scrollbox" style="width:99%; height:400px;">
      <?php $class = 'odd'; ?>
      <?php $i = 1; ?>
      <?php foreach ($categories as $category) { ?>
      <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
      <div class="<?php echo $class; ?>">
       <?php if (in_array ($category['category_id'], $product_categories)) { ?>
       <input type="checkbox" name="product_categories[<?php echo $i; ?>]" value="<?php echo $category['category_id']; ?>" checked="checked" /> <?php echo $category['name']; ?>
       <?php } else { ?>
       <input type="checkbox" name="product_categories[<?php echo $i; ?>]" value="<?php echo $category['category_id']; ?>" /> <?php echo $category['name']; ?>
       <?php } ?>
      </div>
      <?php $i++; ?>
      <?php } ?>
     </div>
    </td>
   </tr>
  </table>
  <table class="list">
   <tr>
    <td class="center"><a class="button" onclick="editProductList('categories', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
   </tr>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#dialog').dialog('option', 'title', '<?php echo $column_categories; ?>');
});
//--></script>