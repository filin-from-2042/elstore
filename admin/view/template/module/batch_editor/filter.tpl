<table class="list">
 <thead>
  <tr>
   <td class="left" colspan="3"><?php echo $column_keyword; ?></td>
   <td class="left" colspan="4"></td>
  </tr>
 </thead>
 <tbody>
  <tr class="filter">
   <td class="left" colspan="3">
    <form id="filter_keyword">
     <input name="filter_keyword" type="text" value="" style="width:98%;" /><br />
     <input name="filter_search_in[exact_entry]" type="checkbox" value="1" /> <b><?php echo $text_exact_entry; ?></b>
     <input name="filter_search_in[name]" type="checkbox" value="1" /> <?php echo $text_in_name; ?>
     <input name="filter_search_in[description]" type="checkbox" value="1" /> <?php echo $text_in_description; ?>
     <input name="filter_search_in[model]" type="checkbox" value="1" /> <?php echo $text_in_model; ?>
     <input name="filter_search_in[sku]" type="checkbox" value="1" /> <?php echo $text_in_sku; ?>
     <input name="filter_search_in[upc]" type="checkbox" value="1" /> <?php echo $text_in_upc; ?>
     <input name="filter_search_in[location]" type="checkbox" value="1" /> <?php echo $text_in_location; ?>
    </form>
   </td>
   <td class="left">
    <form class="dd_menu" id="filter_category">
     <div class="dd_menu_title" onclick="toggle('filter_category');"><?php echo $column_categories; ?> <b style="color:red;">(0)</b></div>
     <div class="dd_menu_container">
      <p><input type="checkbox" name="filter[fc_not]" value="1" /><?php echo $text_no; ?></p>
      <?php $class = 'even'; ?>
      <?php foreach ($categories as $category) { ?>
      <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
      <div class="<?php echo $class; ?>"><input type="checkbox" name="fc[]" value="<?php echo $category['category_id']; ?>" /> <?php echo $category['name']; ?></div>
      <?php } ?>
     </div>
    </form>
   </td>
   <td class="left">
    <form class="dd_menu" id="filter_attribute">
     <div class="dd_menu_title" onclick="toggle('filter_attribute');"><?php echo $column_attributes; ?> <b style="color:red;">(0)</b></div>
     <div class="dd_menu_container">
      <p><input type="checkbox" name="filter[fa_not]" value="1" /><?php echo $text_no; ?></p>
      <?php foreach ($attributes as $attribute) { ?>
      <b><?php echo $attribute['attribute_group_name']; ?></b><br />
      <?php $class = 'even'; ?>
      <?php foreach ($attribute['attributes'] as $attribute) { ?>
      <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
      <div class="<?php echo $class; ?>">&nbsp;&nbsp;&nbsp;<input name="fa[]" type="checkbox" value="<?php echo $attribute['attribute_id']; ?>" /> <?php echo $attribute['attribute_name']; ?></div>
      <?php } ?>
      <?php } ?>
     </div>
    </form>
   </td>
   <td class="left">
    <form class="dd_menu" id="filter_manufacturer">
     <div class="dd_menu_title" onclick="toggle('filter_manufacturer');"><?php echo $column_manufacturer_id; ?> <b style="color:red;">(0)</b></div>
     <div class="dd_menu_container">
      <p><input type="checkbox" name="filter[fm_not]" value="1" /> <?php echo $text_no; ?></p>
      <?php $class = 'odd'; ?>
      <div class="<?php echo $class; ?>"><input type="checkbox" name="fm[]" value="0" /> <?php echo $text_none; ?></div>
      <?php foreach ($manufacturer_id as $manufacturer) { ?>
      <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
      <div class="<?php echo $class; ?>"><input type="checkbox" name="fm[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" /> <?php echo $manufacturer['name']; ?></div>
      <?php } ?>
     </div>
    </form>
   </td>
  </tr>
 </tbody>
 <thead>
   <tr>
    <td class="center"></td>
    <td class="center"></td>
    <td class="center"></td>
    <td class="center"></td>
    <td class="center"><?php echo $column_subtract; ?></td>
    <td class="center"><?php echo $column_shipping; ?></td>
   </tr>
  </thead>
  <tbody>
   <tr class="filter">
    <td class="left">
     <form class="dd_menu" id="filter_stock_status">
      <div class="dd_menu_title" onclick="toggle('filter_stock_status');"><?php echo $column_stock_status_id; ?> <b style="color:red;">(0)</b></div>
      <div class="dd_menu_container">
       <p><input type="checkbox" name="filter[fss_not]" value="1" /> <?php echo $text_no; ?></p>
       <?php $class = 'even'; ?>
       <?php foreach ($stock_status_id as $stock_status) { ?>
       <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
       <div class="<?php echo $class; ?>"><input type="checkbox" name="fss[]" value="<?php echo $stock_status['stock_status_id']; ?>" /> <?php echo $stock_status['name']; ?></div>
       <?php } ?>
      </div>
     </form>
    </td>
    <td class="left">
     <form class="dd_menu" id="filter_tax_class">
      <div class="dd_menu_title" onclick="toggle('filter_tax_class');"><?php echo $column_tax_class_id; ?> <b style="color:red;">(0)</b></div>
      <div class="dd_menu_container">
       <p><input type="checkbox" name="filter[ftc_not]" value="1" /> <?php echo $text_no; ?></p>
       <?php $class = 'odd'; ?>
       <div class="<?php echo $class; ?>"><input type="checkbox" name="ftc[]" value="0" /> <?php echo $text_none; ?></div>
       <?php foreach ($tax_class_id as $tax_class) { ?>
       <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
       <div class="<?php echo $class; ?>"><input type="checkbox" name="ftc[]" value="<?php echo $tax_class['tax_class_id']; ?>" /> <?php echo $tax_class['name']; ?></div>
       <?php } ?>
      </div>
     </form>
    </td>
    <td class="left">
     <form class="dd_menu" id="filter_weight_class">
      <div class="dd_menu_title" onclick="toggle('filter_weight_class');"><?php echo $column_weight_class_id; ?> <b style="color:red;">(0)</b></div>
      <div class="dd_menu_container">
       <p><input type="checkbox" name="filter[fwc_not]" value="1" /> <?php echo $text_no; ?></p>
       <?php $class = 'even'; ?>
       <?php foreach ($weight_class_id as $weight_class) { ?>
       <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
       <div class="<?php echo $class; ?>"><input type="checkbox" name="fwc[]" value="<?php echo $weight_class['weight_class_id']; ?>" /> <?php echo $weight_class['name']; ?></div>
       <?php } ?>
      </div>
     </form>
    </td>
    <td class="left">
     <form class="dd_menu" id="filter_length_class">
      <div class="dd_menu_title" onclick="toggle('filter_length_class');"><?php echo $column_length_class_id; ?> <b style="color:red;">(0)</b></div>
      <div class="dd_menu_container">
       <p><input type="checkbox" name="filter[flc_not]" value="1" /> <?php echo $text_no; ?></p>
       <?php $class = 'even'; ?>
       <?php foreach ($length_class_id as $length_class) { ?>
       <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
       <div class="<?php echo $class; ?>"><input type="checkbox" name="flc[]" value="<?php echo $length_class['length_class_id']; ?>" /> <?php echo $length_class['name']; ?></div>
       <?php } ?>
      </div>
     </form>
    </td>
    <td class="center">
     <select name="filter_subtract">
      <option value="*"></option>
      <option value="1"><?php echo $text_yes; ?></option>
      <option value="0"><?php echo $text_no; ?></option>
     </select>
    </td>
    <td class="center">
     <select name="filter_shipping">
      <option value="*"></option>
      <option value="1"><?php echo $text_yes; ?></option>
      <option value="0"><?php echo $text_no; ?></option>
     </select>
    </td>
   </tr>
 </tbody>
 <thead>
  <tr>
   <td class="center"><?php echo $column_price; ?></td>
   <td class="center"><?php echo $column_sort_order; ?></td>
   <td class="center"><?php echo $column_quantity; ?></td>
   <td class="center"><?php echo $column_minimum; ?></td>
   <td class="center"><?php echo $column_points; ?></td>
   <td class="center"><?php echo $column_weight; ?></td>
  </tr>
 </thead>
 <tbody>
  <tr class="filter">
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_price[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_price[max]" value="" size="3" />
   </td>
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_sort_order[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_sort_order[max]" value="" size="3" />
   </td>
   <td class="center"><?php echo $text_min;?><input type="text" name="filter_quantity[min]" value="" size="3" /> - <?php echo $text_max;?><input type="text" name="filter_quantity[max]" value="" size="3" /></td>
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_minimum[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_minimum[max]" value="" size="3" />
   </td>
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_points[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_points[max]" value="" size="3" />
   </td>
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_weight[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_weight[max]" value="" size="3" />
   </td>
  </tr>
 </tbody>
 <thead>
  <tr>
   <td class="center"><?php echo $column_length; ?></td>
   <td class="center"><?php echo $column_width; ?></td>
   <td class="center"><?php echo $column_height; ?></td>
   <td class="center"><?php echo $column_status; ?></td>
   <td class="center"></td>
   <td class="center"><?php echo $column_limit; ?></td>
  </tr>
 </thead>
 <tbody>
  <tr class="filter">
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_length[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_length[max]" value="" size="3" />
   </td>
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_width[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_width[max]" value="" size="3" />
   </td>
   <td class="center">
    <?php echo $text_min;?><input type="text" name="filter_height[min]" value="" size="3" />
    -
    <?php echo $text_max;?><input type="text" name="filter_height[max]" value="" size="3" />
   </td>
   <td class="center">
    <select name="filter_status">
     <option value="*"></option>
     <option value="1"><?php echo $text_enabled; ?></option>
     <option value="0"><?php echo $text_disabled; ?></option>
    </select>
   </td>
   <td class="left">
    <form class="dd_menu" id="filter_column">
     <div class="dd_menu_title" onclick="toggle('filter_column');"><?php echo $column_columns; ?> <b>(0)</b></div>
     <div class="dd_menu_container">
      <?php $i = 0; ?>
      <?php $class = 'even'; ?>
      <?php foreach ($setting['fields'] as $name => $data) { ?>
      <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
      <div class="<?php echo $class; ?>">
      <?php if (isset ($data['status'])) { ?>
      <input type="checkbox" name="filter_fields[]" value="<?php echo $name; ?>" checked="checked" />
      <?php $i++; ?>
      <?php } else { ?>
      <input type="checkbox" name="filter_fields[]" value="<?php echo $name; ?>" />
      <?php } ?>
      <?php echo $data['alias']; ?>
     </div>
      <?php } ?>
     </div>
    </form>
   </td>
   <td class="center">
    <select name="limit" onchange="getProducts('&page=1');">
     <?php foreach ($setting['limits'] as $limit) { ?>
     <option value="<?php echo $limit; ?>"><?php echo $limit; ?></option>
     <?php } ?>
    </select>
   </td>
  </tr>
  <tr class="filter">
   <td class="center" colspan="6"><a class="button" onclick="resetForm();"><?php echo $button_reset; ?></a> <a id="button-filter" onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
  </tr>
 </tbody>
</table>
<script type="text/javascript"><!--//
$(document).ready(function() {
	$('#tab-filter input').keypress(function(e) {
		if (e.keyCode == 13) {
			$('#button-filter').trigger('click');
			return false;
		}
	});
});

function filter() {
	getProducts('');
	
	$('#tab-filter .dd_menu .dd_menu_container').hide('low');
	$('#tab-filter .dd_menu .dd_menu_title').removeClass('dd_menu_shadow');
}

function resetForm() {
	$('#tab-filter input[type=text]').attr('value', '');
	$('#tab-filter select option:selected').attr('selected', false);
	$('#tab-filter .dd_menu .dd_menu_container').hide('low');
	$('#tab-filter .dd_menu .dd_menu_title').removeClass('dd_menu_shadow');
	
	$('#tab-filter .dd_menu .dd_menu_title b:not(#tab-filter #filter_column .dd_menu_title b)').replaceWith('<b style="color:red;">(0)</b>');
	$('#tab-filter input[type=checkbox]:checked:not(#tab-filter #filter_column input)').attr('checked', false);
}
//--></script>
<script type="text/javascript"><!--//
var count = <?php echo $i; ?>;
if (count > 0) {
	html = '<b style="color:green;">(' + count + ')</b>';
} else {
	html = '<b style="color:red;">(' + count + ')</b>';
}

$('#tab-filter #filter_column .dd_menu_title b').replaceWith(html);
//--></script>