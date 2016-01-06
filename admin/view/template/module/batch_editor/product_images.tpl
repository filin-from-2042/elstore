<div class="content">
 <form id="form-images-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <table class="list" id="images_list">
   <thead>
    <tr>
     <td class="center" width="1"></td>
     <td class="center" width="1"><?php echo $column_images; ?></td>
     <td class="center"></td>
     <td class="center"><?php echo $column_sort_order; ?></td>
    </tr>
   </thead>
   <?php $image_row = 0; ?>
   <?php foreach ($product_images as $product_image) { ?>
   <tbody id="image-row<?php echo $image_row; ?>">
    <tr>
     <td class="center"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();"><img src="view/image/delete.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
     <td class="center"><div class="image"><a onclick="image_upload('images_list', 'product_images<?php echo $image_row; ?>', 'product_thumbs<?php echo $image_row; ?>');"><img id="product_thumbs<?php echo $image_row; ?>" src="<?php echo $product_image['thumb']; ?>" alt="" /></a></div><br /><a id="image_manager_list-<?php echo $image_row; ?>" onclick="getImageManager('image_manager_list', <?php echo $image_row; ?>, 1)"><?php echo $text_path; ?></a></td>
     <td class="center"><a onclick="$('#product_thumbs<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#product_images<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></td>
     <td class="center"><input name="product_images[<?php echo $image_row; ?>][sort_order]" type="text" value="<?php echo $product_image['sort_order']; ?>" size="2" /><input id="product_images<?php echo $image_row; ?>" name="product_images[<?php echo $image_row; ?>][image]" type="hidden" value="<?php echo $product_image['image']; ?>" /></td>
    </tr>
   </tbody>
   <?php $image_row++; ?>
   <?php } ?>
   <tfoot>
    <tr>
     <td class="center"><a onclick="addImage('images_list');"><img src="view/image/add.png" alt="<?php echo $button_insert; ?>" title="<?php echo $button_insert; ?>" /></a></td>
     <td class="center" colspan="4"><a class="button" onclick="editProductList('images', 'upd');"><?php echo $button_save; ?></a></td>
    </tr>
   </tfoot>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#dialog').dialog('option', 'title', '<?php echo $column_images; ?>');
});

var image_row = image_row + <?php echo $image_row; ?>;
//--></script>