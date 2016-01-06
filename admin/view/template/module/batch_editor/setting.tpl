<?php echo $header; ?>
<style type="text/css">
tbody tr.hover td {
	background:#E4EEF7;
}
</style>
<div id="content">
 <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
 </div>
 <?php if ($warning) { ?>
 <div class="warning"><?php echo $warning; ?></div>
 <?php } ?>
 <div class="box">
  <div class="heading">
   <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
   <div class="buttons">
    <a class="button" onclick="$('#form_setting').submit();"><?php echo $button_save; ?></a>
    <a class="button" onclick="location = '<?php echo $cancel; ?>';"><?php echo $button_cancel; ?></a>
   </div>
  </div>
  <div class="content">
   <form id="form_setting" action="<?php echo $action; ?>" method="post">
    <div id="tab-setting" class="htabs">
     <a href="#tab-fields"><?php echo $column_fields; ?></a>
     <a href="#tab-limits"><?php echo $column_limit; ?></a>
     <a href="#tab-optional"><?php echo $column_optional; ?></a>
    </div>
    <div id="tab-fields">
    <table class="list">
     <thead>
      <tr>
       <td class="left" width="1"><?php echo $column_field_status; ?></td>
       <td class="left" width="1"><?php echo $column_field_calculate; ?></td>
       <td class="left" width="1"><?php echo $column_field_name; ?></td>
       <td class="left" width="1"><?php echo $column_field_type; ?></td>
       <td class="left"><?php echo $column_field_alias; ?></td>
       <td class="center" width="150"><?php echo $column_sort_order; ?></td>
      </tr>
     </thead>
     <?php $i = 0; ?>
     <?php foreach ($product_fields as $field) { ?>
     <tr>
      <td class="center">
       <?php if (isset ($setting['fields'][$field['name']]['status'])) { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][status]" type="checkbox" value="1" checked="checked" />
       <?php } else { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][status]" type="checkbox" value="1" />
       <?php } ?>
      </td>
      <td class="center">
       <?php if (isset ($field['calc'])) { ?>
       <?php if (isset ($setting['fields'][$field['name']]['calc'])) { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][calc]" type="checkbox" value="1" checked="checked" />
       <?php } else { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][calc]" type="checkbox" value="1" />
       <?php } ?>
       <?php } ?>
      </td>
      <td class="left"><b><?php echo $field['name']; ?></b></td>
      <td class="left">
       <?php echo $field['type']; ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][type]" type="hidden" value="<?php echo $field['type']; ?>" />
       <?php if (isset ($field['link'])) { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][link]" type="hidden" value="<?php echo $field['link']; ?>" />
       <?php } ?>
      </td>
      <td class="left">
       <?php if (isset ($field['alias'])) { ?>
       <?php echo $field['alias']; ?>
       <?php } else { ?>
       <?php foreach ($languages as $language) { ?>
       <?php if (isset ($setting['fields'][$field['name']]['alias'][$language['language_id']])) { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][alias][<?php echo $language['language_id']; ?>]" type="text" value="<?php echo $setting['fields'][$field['name']]['alias'][$language['language_id']]; ?>" />
       <?php } else { ?>
       <input name="batch_editor_setting[fields][<?php echo $field['name']; ?>][alias][<?php echo $language['language_id']; ?>]" type="text" value="" />
       <?php } ?>
       <img src="view/image/flags/<?php echo $language['image']; ?>" />&nbsp;&nbsp;
       <?php } ?>
       <?php } ?>
      </td>
      <td class="center">
       <?php if (isset ($setting['fields_sort_order'][$i])) { ?>
       <input name="batch_editor_setting[fields_sort_order][<?php echo $i; ?>]" type="text" size="5" value="<?php echo $setting['fields_sort_order'][$i]; ?>" />
       <?php } else { ?>
       <input name="batch_editor_setting[fields_sort_order][<?php echo $i; ?>]" type="text" size="5" value="" />
       <?php } ?>
      </td>
     </tr>
     <?php $i++; ?>
     <?php } ?>
    </table>
    </div>
    <div id="tab-limits">
     <table class="list" id="limits">
      <?php $limit_row = 0; ?>
      <?php foreach ($setting['limits'] as $limit) { ?>
      <tbody id="limit-<?php echo $limit_row; ?>">
       <tr>
        <td class="center" width="1"><a onclick="$('#limits #limit-<?php echo $limit_row; ?>').remove();"><img src="view/image/delete.png" /></a></td>
        <td class="left"><div><input name="batch_editor_setting[limits][]" value="<?php echo $limit; ?>" /></div></td>
       </tr>
      </tbody>
      <?php $limit_row++; ?>
      <?php } ?>
      <tfoot>
       <tr>
        <td class="center"><a onclick="addLimit();"><img src="view/image/add.png" /></a></td>
        <td></td>
       </tr>
      </tfoot>
     </table>
    </div>
    <div id="tab-optional">
     <table class="form">
      <tr>
       <td><?php echo $entry_counter; ?></td>
       <td>
        <select name="batch_editor_setting[counter]">
         <?php if (isset ($setting['counter']) && $setting['counter']) { ?>
         <option value="1" selected="selected"><?php echo $text_yes; ?></option>
         <option value="0"><?php echo $text_no; ?></option>
         <?php } else { ?>
         <option value="1"><?php echo $text_yes; ?></option>
         <option value="0" selected="selected"><?php echo $text_no; ?></option>
         <?php } ?>
        </select>
       </td>
      </tr>
     </table>
    </div>
   </form>
  </div>
 </div>
</div>
<script type="text/javascript"><!--//
var limit_row = <?php echo $limit_row; ?>

function addLimit() {
	$('#limits tfoot').before('<tbody id="limit-' + limit_row + '"><tr><td class="center"><a onclick="$(\'#limits #limit-' + limit_row + '\').remove();"><img src="view/image/delete.png" /></a></td><td class="left"><div><input name="batch_editor_setting[limits][]" value="" /></div></td></tr></tbody>');
	
	limit_row++;
}

$(document).ready(function() {
	$('#tab-setting a').tabs();
	
	$('#tab-fields tbody tr').live('mouseover', function(e) {
		$(this).addClass('hover');
	});
	
	$('#tab-fields tbody tr').live('mouseout', function(e) {
		$(this).removeClass('hover');
	});
});
//--></script>
<?php echo $footer; ?>