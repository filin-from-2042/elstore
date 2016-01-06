<!-- Module Search Advanced -->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/search_advanced.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/poshytip/css/poshytip.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/poshytip/js/jquery.poshytip.min.js"></script>

<?php if ($setting['list_size']['min_height']) { ?>
<style type="text/css">
#search_attributes_content .attribute_contaner div.toggle {
	height:<?php echo $setting['list_size']['min_height']; ?>px;
	overflow-y:scroll;
}
</style>
<?php } ?>

<?php if ($setting['list_size']['min_width']) { ?>
<style type="text/css">
#search_attributes_content em {
	min-width:<?php echo $setting['list_size']['min_width']; ?>px;
}
#search_attributes_content div.toggle {
	min-width:<?php echo $setting['list_size']['min_width'] + 25; ?>px;
}
</style>
<?php } ?>

<?php if ($setting['image_size']['height'] > 16) { ?>
<style type="text/css">
#search_attributes_content em {
	line-height:<?php echo $setting['image_size']['height']; ?>px;
}
</style>
<?php } ?>

<?php if ($position) { ?>
<style type="text/css">
#search_attributes_content .attribute_contaner.hidden div {
	position:absolute;
}
</style>
<?php } ?>

<div class="box">
 <div class="box-heading"><?php echo $heading_title; ?></div>
 <div class="box-content">
  
  <div id="search_optional_content">
   <?php if ($input_status || $setting['category_status'] || $setting['sub_cat_status']) { ?>
   <div class="content">
    
    <?php if ($input_status) { ?>
    <?php echo $entry_search; ?>
    
    <?php if ($filter_name) { ?>
    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" style="width:152px;" />
    <?php } else { ?>
    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color:#999; width:152px;" />
    <?php } ?>
    <?php } ?>
    
    <?php if ($setting['category_status']) { ?>
    <select id="filter_category_id" name="filter_category_id" style="width:160px;">
     <option value="0"><?php echo $text_category; ?></option>
     <?php foreach ($categories as $category_1) { ?>
     <?php if ($category_1['category_id'] == $filter_category_id) { ?>
     <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
     <?php } else { ?>
     <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
     <?php } ?>
     <?php foreach ($category_1['children'] as $category_2) { ?>
     <?php if ($category_2['category_id'] == $filter_category_id) { ?>
     <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
     <?php } else { ?>
     <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
     <?php } ?>
     <?php foreach ($category_2['children'] as $category_3) { ?>
     <?php if ($category_3['category_id'] == $filter_category_id) { ?>
     <option value="<?php echo $category_3['category_id']; ?>" selected="selected">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?>
     </option>
     <?php } else { ?>
     <option value="<?php echo $category_3['category_id']; ?>">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?>
     </option>
     <?php } ?>
     <?php } ?>
     <?php } ?>
     <?php } ?>
    </select>
    <?php } ?>
    
    <?php if ($setting['sub_cat_status']) { ?>
    <?php echo $br; ?>
    <?php if ($filter_sub_category) { ?>
    <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
    <?php } ?>
    <label for="sub_category"><?php echo $text_sub_category; ?></label>
    <?php } ?>
    
    <?php if ($input_status) { ?>
    <br /><br />
    <?php if ($setting['statuses']['title']) { ?>
    <?php if ($filter_title) { ?>
    <input type="checkbox" name="filter_title" value="1" id="title" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="filter_title" value="1" id="title" />
    <?php } ?>
    <label for="title"><?php echo $text_name; ?></label>
    <?php echo $br; ?>
    <?php } ?>
    
    <?php if ($setting['statuses']['desc']) { ?>
    <?php if ($filter_description) { ?>
    <input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="filter_description" value="1" id="description" />
    <?php } ?>
    <label for="description"><?php echo $text_description; ?></label>
    <?php echo $br; ?>
    <?php } ?>
    
    <?php if ($setting['statuses']['model']) { ?>
    <?php if ($filter_model) { ?>
    <input type="checkbox" name="filter_model" value="1" id="model" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="filter_model" value="1" id="model" />
    <?php } ?>
    <label for="model"><?php echo $text_model; ?></label>
    <?php echo $br; ?>
    <?php } ?>
    
    <?php if ($setting['statuses']['sku']) { ?>
    <?php if ($filter_sku) { ?>
    <input type="checkbox" name="filter_sku" value="1" id="sku" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="filter_sku" value="1" id="sku" />
    <?php } ?>
    <label for="sku"><?php echo $text_sku; ?></label>
    <?php } ?>
    <?php } ?>
   </div>
   <?php } ?>
   
   <?php if (!$setting['category_status']) { ?>
   <input type="hidden" id="filter_category_id" name="filter_category_id" value="<?php echo $filter_category_id; ?>" />
   <?php } ?>
  </div>
   
   <form id="search_attributes_content">
    <div class="attributes">
     <?php if ($filter_status) { ?>
     <?php include ('search_advanced_attributes.tpl'); ?>
     <?php } ?>
    </div>
   </form>
   
   <table class="buttons" width="100%">
    <tr>
     <td class="left" ><a id="button-reset" class="button"><span><?php echo $button_reset; ?></span></a></td>
     <td class="right"><a id="button-filter" class="button"><span><?php echo $button_search; ?></span></a></td>
    </tr>
   </table>
 </div>
</div>
<script type="text/javascript"><!--
function toggle_filter(id) {
	$('#search_attributes_content .attribute_contaner.hidden div').hide('fast');
	
	if ($('#search_attributes_content .attribute_contaner.hidden div#' + id).css('display') == 'none') {
		$('#search_attributes_content .attribute_contaner.hidden div#' + id).fadeIn('low');
	} else {
		$('#search_attributes_content .attribute_contaner.hidden div#' + id).fadeOut('low');
	}
}

$(document).ready(function() {
	$('#search_optional_content input[name=\'filter_name\']').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#button-filter').trigger('click');
		}
	});
	
	$('#button-filter').bind('click', function() {
		url = 'index.php?route=product/search_advanced';
		
		var filter_name = $('#search_optional_content input[name=\'filter_name\']').attr('value');
		if (filter_name) { url += '&filter_name=' + encodeURIComponent(filter_name); }
		
		var filter_category_id = $('#search_optional_content select[name=\'filter_category_id\']').attr('value');
		if (filter_category_id) { url += '&filter_category_id=' + filter_category_id; }
		
		var filter_category_id = $('#search_optional_content input[name=\'filter_category_id\']').attr('value');
		if (filter_category_id) { url += '&filter_category_id=' + filter_category_id; }
		
		var filter_title = $('#search_optional_content input[name=\'filter_title\']:checked').attr('value');
		if (filter_title) { url += '&filter_title=' + filter_title; }
		
		var filter_description = $('#search_optional_content input[name=\'filter_description\']:checked').attr('value');
		if (filter_description) { url += '&filter_description=' + filter_description; }
		
		var filter_model = $('#search_optional_content input[name=\'filter_model\']:checked').attr('value');
		if (filter_model) { url += '&filter_model=' + filter_model; }
		
		var filter_sku = $('#search_optional_content input[name=\'filter_sku\']:checked').attr('value');
		if (filter_sku) { url += '&filter_sku=' + filter_sku; }
		
		if (filter_name && !filter_title && !filter_description && !filter_model && !filter_sku) {
			url += '&filter_title=1';
		}
		
		var filter_sub_category = $('#search_optional_content input[name=\'filter_sub_category\']:checked').attr('value');
		if (filter_sub_category) { url += '&filter_sub_category=' + filter_sub_category; }
		
		var filter_attributes = $('#search_attributes_content').serialize();
		if (filter_attributes) { url += '&' + filter_attributes; }
		
		location = url;
	});
	
	$('#search_optional_content #filter_category_id').bind('change', function() {
		$.ajax({
			url: 'index.php?route=module/search_advanced/getFilter&ajax=true',
			type: 'get',
			dataType: 'html',
			data: 'filter_category_id=' + $(this).attr('value'),
			beforeSend: function() {
				$('#search_attributes_content .attributes').hide(500);
			},
			success: function(data) {
				if (data) {
					$('#search_attributes_content .attributes').html(data).show(500);
				}
			}
		});
	});
	
	$('#button-reset').bind('click', function() {
		$('#search_attributes_content input:checked').attr('checked', false);
		
		var filter_name = $('#search_optional_content input[name=\'filter_name\']');
		if (filter_name) { filter_name.attr('value', ''); }
		
		var filter_title = $('#search_optional_content input[name=\'filter_title\']');
		if (filter_title) { filter_title.attr('checked', false); }
		
		var filter_description  = $('#search_optional_content input[name=\'filter_description\']');
		if (filter_description) { filter_description.attr('checked', false); }
		
		var filter_model = $('#search_optional_content input[name=\'filter_model\']');
		if (filter_model) { filter_model.attr('checked', false); }
		
		var filter_sku = $('#search_optional_content input[name=\'filter_sku\']');
		if (filter_sku) { filter_sku.attr('checked', false); }
		
		var filter_sub_category = $('#search_optional_content input[name=\'filter_sub_category\']');
		if (filter_sub_category) { filter_sub_category.attr('checked', false); }
		
		for (i = 0; i < sliders.length; i++) {
			$('#search_attributes_content ' + sliders[i][0]).slider('option' , {'values': [$(sliders[i][0]).slider('option', 'min'), $(sliders[i][0]).slider('option', 'max')]});
			$('#search_attributes_content input[name="' + sliders[i][1] + '"]').attr('value', $(sliders[i][0]).slider('option', 'min'));
			$('#search_attributes_content input[name="' + sliders[i][2] + '"]').attr('value', $(sliders[i][0]).slider('option', 'max'));
		}
		
		$('#search_attributes_content #slider_price').slider('option' , {'values': [$('#slider_price').slider('option', 'min'), $('#slider_price').slider('option', 'max')]});
		$('#search_attributes_content input[name="fp[min]"]').attr('value', $('#slider_price').slider('option', 'min'));
		$('#search_attributes_content input[name="fp[max]"]').attr('value', $('#slider_price').slider('option', 'max'));
	});
});
--></script>