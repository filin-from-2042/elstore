<style type="text/css">
.image_manager {
	position:absolute;
	z-index:999;
}
.image_manager table {
	min-width:inherit !important;
	width: auto !important;
	border:2px solid #CCC;
}
.image_manager table td {
	border:none;
	vertical-align:middle;
}
.image_manager table td input, .image_manager table td select {
	width:150px !important;
	margin:0px !important;
}
</style>
<div class="image_manager">
 <table class="ui-corner-all" cellpadding="0" cellspacing="0">
  <tr>
   <td class="left"><input id="image_manager_keyword" /></td>
   <td class="left">
    <select id="image_manager_dir">
     <?php foreach ($dirs as $dir) { ?>
     <option value="<?php echo $dir; ?>"><?php echo $dir; ?></option>
     <?php } ?>
    </select>
   </td>
   <td class="left"><a style="text-decoration:none; font-weight:bold; font-size:14px;" onclick="$('#product .image_manager').remove();">X</a></td>
  </tr>
 </table>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#image_manager_keyword').focus();
	
	$('#image_manager_keyword').bind('keypress', function(e) {
		if (e.keyCode == 13) {
			return false;
		}
	});
	
	$('#image_manager_keyword').catcomplete({
		delay: 0,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=module/batch_editor/getImageManager&token=' + token + '&dir=' + $('#image_manager_dir').val() + '&keyword=' + encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: '<img style="margin-top:4px;" src="' + item.img + '" />',
							label: item.file,
							value: item.file
						}
					}));
				}
			});
		},
		select: function(event, ui) {
			<?php if ($list) { ?>
			$.post('index.php?route=module/batch_editor/imageResize&token=' + token, 'image=' + $('#image_manager_dir').val() + ui.item.value, function(data) {
					$('#form-images-list #product_thumbs<?php echo $id; ?>').attr('src', data);
					$('#form-images-list #product_images<?php echo $id; ?>').attr('value', $('#image_manager_dir').val() + ui.item.value);
					$('#product .image_manager').remove();
			});
			<?php } else { ?>
			$.ajax({
				type: 'POST',
				dataType: 'json',
				url: 'index.php?route=module/batch_editor/quickEditProduct&token=' + token,
				data: 'product_id=' + <?php echo $id; ?> + '&value=' + $('#image_manager_dir').val() + ui.item.value + '&field=image',
				success: function(data) {
					if (data['warning']) {
						creatMessage(data);
					} else {
						$('#product #image_remove-<?php echo $id; ?>').replaceWith('');
						$('#product #thumb-<?php echo $id; ?>').attr('src', data['value']).before('<div class="image_remove" id="image_remove-<?php echo $id; ?>' + '" title="<?php echo $button_remove; ?>"></div>');
						$('#product .image_manager').remove();
					}
				}
			});
			<?php } ?>
			
			return false;
		}
	});
});
//--></script>