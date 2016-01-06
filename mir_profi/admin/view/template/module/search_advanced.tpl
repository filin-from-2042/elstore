<?php echo $header; ?>
<style type="text/css">
.enabled {
	background: #EAF7D9 !important;
}
.disabled {
	background: #FFD1D1 !important;
}
</style>
<div id="content">
 <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
 </div>
 <?php if ($error_warning) { ?>
 <div class="warning"><?php echo $error_warning; ?></div>
 <?php } ?>
 <div class="box">
  <div class="heading">
   <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
   <div class="buttons">
    <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
    <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
   </div>
  </div>
  <div class="content">
   <form id="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div id="tabs" class="htabs">
     <a href="#tab-general"><?php echo $tab_general; ?></a>
     <a href="#tab-attributes"><?php echo $tab_attributes; ?></a>
    </div>
    <div id="tab-general">
     <table class="list">
      <!---->
      <tr>
       <td class="left" width="35%">
        <?php echo $entry_cache; ?>
        <span class="help"><?php echo $note_clear_cache; ?></span>
       </td>
       <td class="left">
        <select name="search_advanced_setting[cache]">
         <?php if ($setting['cache']) { ?>
         <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
         <option value="0"><?php echo $text_disabled; ?></option>
         <?php } else { ?>
         <option value="1"><?php echo $text_enabled; ?></option>
         <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
         <?php } ?>
        </select>
        <a class="button" onclick="clear_cache();"><?php echo $button_clear_cache; ?></a> 
       </td>
      </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_module_title; ?></td>
      <td class="left">
       <?php foreach ($languages as $language) { ?>
       <?php if (isset ($setting['title'][$language['language_id']])) { ?>
       <input type="text" name="search_advanced_setting[title][<?php echo $language['language_id']; ?>]" value="<?php echo $setting['title'][$language['language_id']]; ?>" size="70" />
       <?php } else { ?>
       <input type="text" name="search_advanced_setting[title][<?php echo $language['language_id']; ?>]" value="" size="70" />
       <?php } ?>
       <img src="view/image/flags/<?php echo $language['image']; ?>" /><br />
       <?php } ?>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_module_text; ?></td>
      <td class="left">
       <?php foreach ($languages as $language) { ?>
       <?php if (isset ($setting['text'][$language['language_id']])) { ?>
       <input type="text" name="search_advanced_setting[text][<?php echo $language['language_id']; ?>]" value="<?php echo $setting['text'][$language['language_id']]; ?>" size="70" />
       <?php } else { ?>
       <input type="text" name="search_advanced_setting[text][<?php echo $language['language_id']; ?>]" value="" size="70" />
       <?php } ?>
       <img src="view/image/flags/<?php echo $language['image']; ?>" /><br />
       <?php } ?>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_list_size; ?><span class="help"><?php echo $note_list_height; ?></span></td>
      <td class="left"><input type="text" name="search_advanced_setting[list_size][min_width]"  value="<?php echo $setting['list_size']['min_width']; ?>" size="3" /> x <input type="text" name="search_advanced_setting[list_size][min_height]" value="<?php echo $setting['list_size']['min_height']; ?>"  size="3" /></td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_image_size; ?></td>
      <td class="left"><input type="text" name="search_advanced_setting[image_size][width]"  value="<?php echo $setting['image_size']['width']; ?>"  size="3" /> x <input type="text" name="search_advanced_setting[image_size][height]" value="<?php echo $setting['image_size']['height']; ?>" size="3" /></td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_category_status; ?></td>
      <td class="left">
       <select name="search_advanced_setting[category_status]">
        <?php if ($setting['category_status']) { ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php } ?>
       </select>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_sub_cat_status; ?></td>
      <td class="left">
       <select name="search_advanced_setting[sub_cat_status]">
        <?php if ($setting['sub_cat_status']) { ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php } ?>
       </select>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_form_categories; ?></td>
      <td class="left">
       <div class="scrollbox">
        <?php $class = 'odd'; ?>
        <?php foreach ($categories as $category) { ?>
        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
        <div class="<?php echo $class; ?>">
         <?php if (isset ($setting['form_categories']) && in_array ($category['category_id'], $setting['form_categories'])) { ?>
         <input type="checkbox" name="search_advanced_setting[form_categories][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
         <?php echo $category['name']; ?>
         <?php } else { ?>
         <input type="checkbox" name="search_advanced_setting[form_categories][]" value="<?php echo $category['category_id']; ?>" />
         <?php echo $category['name']; ?>
         <?php } ?>
        </div>
        <?php } ?>
       </div>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_name_status; ?></td>
      <td class="left">
       <select name="search_advanced_setting[statuses][title]">
        <?php if ($setting['statuses']['title']) { ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php } ?>
       </select>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_desc_status; ?></td>
      <td class="left">
       <select name="search_advanced_setting[statuses][desc]">
        <?php if ($setting['statuses']['desc']) { ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php } ?>
       </select>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_model_status; ?></td>
      <td class="left">
       <select name="search_advanced_setting[statuses][model]">
        <?php if ($setting['statuses']['model']) { ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php } ?>
       </select>
      </td>
     </tr>
     <!---->
     <tr>
      <td class="left"><?php echo $entry_sku_status; ?></td>
      <td class="left">
       <select name="search_advanced_setting[statuses][sku]">
        <?php if ($setting['statuses']['sku']) { ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php } else { ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php } ?>
       </select>
      </td>
     </tr>
     <!---->
    </table>
    <table id="module" class="list">
     <thead>
      <tr>
       <td class="left"><?php echo $entry_layout; ?></td>
       <td class="left"><?php echo $entry_position; ?></td>
       <td class="left"><?php echo $entry_status; ?></td>
       <td class="right"><?php echo $entry_sort_order; ?></td>
       <td></td>
      </tr>
     </thead>
     <?php $module_row = 0; ?>
     <?php foreach ($modules as $module) { ?>
     <tbody id="module-row<?php echo $module_row; ?>">
      <tr>
       <td class="left">
        <select name="search_advanced_module[<?php echo $module_row; ?>][layout_id]">
         <?php foreach ($layouts as $layout) { ?>
         <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
         <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
         <?php } else { ?>
         <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
         <?php } ?>
         <?php } ?>
        </select>
       </td>
       <td class="left">
        <select name="search_advanced_module[<?php echo $module_row; ?>][position]">
         <?php if ($module['position'] == 'content_top') { ?>
         <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
         <?php } else { ?>
         <option value="content_top"><?php echo $text_content_top; ?></option>
         <?php } ?>
         <?php if ($module['position'] == 'content_bottom') { ?>
         <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
         <?php } else { ?>
         <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
         <?php } ?>
         <?php if ($module['position'] == 'column_left') { ?>
         <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
         <?php } else { ?>
         <option value="column_left"><?php echo $text_column_left; ?></option>
         <?php } ?>
         <?php if ($module['position'] == 'column_right') { ?>
         <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
         <?php } else { ?>
         <option value="column_right"><?php echo $text_column_right; ?></option>
         <?php } ?>
        </select>
       </td>
       <td class="left">
        <select name="search_advanced_module[<?php echo $module_row; ?>][status]">
         <?php if ($module['status']) { ?>
         <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
         <option value="0"><?php echo $text_disabled; ?></option>
         <?php } else { ?>
         <option value="1"><?php echo $text_enabled; ?></option>
         <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
         <?php } ?>
        </select>
       </td>
       <td class="right"><input type="text" name="search_advanced_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
       <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
      </tr>
     </tbody>
     <?php $module_row++; ?>
     <?php } ?>
     <tfoot>
      <tr>
       <td colspan="4"></td>
       <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
      </tr>
     </tfoot>
    </table>
   </div>
   <!---->
   <div id="tab-attributes">
    <p><span class="required">*</span> <em><?php echo $note_separator; ?></em></p>
    <p><span class="required">*</span> <em><?php echo $note_slider; ?></em></p>
    <table class="list">
     <thead>
      <tr>
       <td class="left" width="5%" ><?php echo $column_image; ?></td>
       <td class="left" width="23%"><?php echo $column_name; ?></td>
       <td class="left" width="25%"><?php echo $column_hint; ?></td>
       <td class="left" width="10%"><?php echo $column_status; ?></td>
       <td class="left" width="10%"><?php echo $column_type; ?></td>
       <td class="left" width="27%"><?php echo $column_optional; ?></td>
      </tr>
     </thead>
     <!-- PRICE START -->
     <tr>
      <td class="center">
       <a onclick="image_upload('image_price', 'thumb_price');">
        <?php if (isset ($setting['price']['img']) && $setting['price']['img']) { ?>
        <img id="thumb_price" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="../image/<?php echo $setting['price']['img']; ?>" />
        <?php } else { ?>
        <img id="thumb_price" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="<?php echo $no_image; ?>" />
        <?php } ?>
       </a>
       <br />
       <a onclick="imgClear('price');"><?php echo $text_clear; ?></a>
       <?php if (isset ($setting['price']['img'])) { ?>
       <input type="hidden" id="image_price" name="search_advanced_setting[price][img]" value="<?php echo $setting['price']['img']; ?>" />
       <?php } else { ?>
       <input type="hidden" id="image_price" name="search_advanced_setting[price][img]" value="" />
       <?php } ?>
      </td>
      <td class="left"><?php echo $text_price; ?></td>
      <td class="left">
       <?php foreach ($languages as $language) { ?>
       <?php if (isset ($setting['price']['hint'][$language['language_id']])) { ?>
       <textarea name="search_advanced_setting[price][hint][<?php echo $language['language_id']; ?>]" cols="40" rows="1"><?php echo $setting['price']['hint'][$language['language_id']]; ?></textarea>
       <?php } else { ?>
       <textarea name="search_advanced_setting[price][hint][<?php echo $language['language_id']; ?>]" cols="40" rows="1"></textarea>
       <?php } ?>
       <img src="view/image/flags/<?php echo $language['image']; ?>" /><br />
       <?php } ?>
      </td>
      <?php $class = (isset ($setting['price']['status']) && $setting['price']['status']) ? 'enabled' : 'disabled'; ?>
      <td class="left <?php echo $class; ?>">
       <select name="search_advanced_setting[price][status]">
        <?php if (isset ($setting['price']['status']) && $setting['price']['status']) { ?>
        <option value="0"><?php echo $text_disabled; ?></option>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <?php } else { ?>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <option value="1"><?php echo $text_enabled; ?></option>
        <?php } ?>
       </select>
      </td>
      <td class="left"></td>
      <td class="left">
      <?php echo $text_step; ?>
      <?php if (isset ($setting['price']['step'])) { ?>
      <input type="text" name="search_advanced_setting[price][step]" value="<?php echo $setting['price']['step']; ?>" size="3" />
      <?php } else { ?>
      <input type="text" name="search_advanced_setting[price][step]" value="" size="3" />
      <?php } ?>
      </td>
     </tr>
     <!-- PRICE END -->
     
     <!-- STOCK START -->
     <tr>
      <td class="center">
       <a onclick="image_upload('image_stock', 'thumb_stock');">
        <?php if ($setting['stock']['img']) { ?>
        <img id="thumb_stock" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="../image/<?php echo $setting['stock']['img']; ?>" />
        <?php } else { ?>
        <img id="thumb_stock" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="<?php echo $no_image; ?>" />
        <?php } ?>
       </a>
       <br />
       <a onclick="imgClear('stock');"><?php echo $text_clear; ?></a>
       <input type="hidden" id="image_stock" name="search_advanced_setting[stock][img]" value="<?php echo $setting['stock']['img']; ?>" />
      </td>
      <td class="left"><?php echo $text_stock; ?></td>
      <td class="left">
       <?php foreach ($languages as $language) { ?>
       <?php if (isset ($setting['stock']['hint'][$language['language_id']])) { ?>
       <textarea name="search_advanced_setting[stock][hint][<?php echo $language['language_id']; ?>]" rows="1" cols="40"><?php echo $setting['stock']['hint'][$language['language_id']]; ?></textarea>
       <?php } else { ?>
       <textarea name="search_advanced_setting[stock][hint][<?php echo $language['language_id']; ?>]" rows="1" cols="40"></textarea>
       <?php } ?>
       <img src="view/image/flags/<?php echo $language['image']; ?>" /><br />
       <?php } ?>
      </td>
      <?php if ($setting['stock']['status']) { ?>
      <?php $class = 'enabled'; ?>
      <?php } else { ?>
      <?php $class = 'disabled'; ?>
      <?php } ?>
      <td class="left <?php echo $class; ?>">
       <select name="search_advanced_setting[stock][status]">
        <?php foreach ($statuses as $status) { ?>
        <?php if ($setting['stock']['status'] == $status['id']) { ?>
        <option value="<?php echo $status['id']; ?>" selected="selected"><?php echo $status['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $status['id']; ?>"><?php echo $status['name']; ?></option>
        <?php } ?>
        <?php } ?>
       </select>
      </td>
      <td class="left">
       <select name="search_advanced_setting[stock][type]">
        <?php foreach ($types as $type) { ?>
        <?php if ($type['id'] != 3) { ?>
        <?php if ($setting['stock']['type'] == $type['id']) { ?>
        <option value="<?php echo $type['id']; ?>" selected="selected"><?php echo $type['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $type['id']; ?>"><?php echo $type['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
       </select>
      </td>
      <td class="left">
       <span class="span_slider_stock"></span>
      </td>
     </tr>
     <!-- STOCK END -->
     
     <!-- MANUFACTURERS START -->
     <tr>
      <td class="center">
       <a onclick="image_upload('image_manufacturers', 'thumb_manufacturers');">
        <?php if ($setting['manufacturers']['img']) { ?>
        <img id="thumb_manufacturers" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="../image/<?php echo $setting['manufacturers']['img']; ?>" />
        <?php } else { ?>
        <img id="thumb_manufacturers" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="<?php echo $no_image; ?>" />
        <?php } ?>
       </a>
       <br />
       <a onclick="imgClear('manufacturers');"><?php echo $text_clear; ?></a>
       <input type="hidden" id="image_manufacturers" name="search_advanced_setting[manufacturers][img]" value="<?php echo $setting['manufacturers']['img']; ?>" />
      </td>
      <td class="left"><?php echo $text_manufacturers; ?></td>
      <td class="left">
       <?php foreach ($languages as $language) { ?>
       <?php if (isset ($setting['manufacturers']['hint'][$language['language_id']])) { ?>
       <textarea name="search_advanced_setting[manufacturers][hint][<?php echo $language['language_id']; ?>]" rows="1" cols="40"><?php echo $setting['manufacturers']['hint'][$language['language_id']]; ?></textarea>
       <?php } else { ?>
       <textarea name="search_advanced_setting[manufacturers][hint][<?php echo $language['language_id']; ?>]" rows="1" cols="40"></textarea>
       <?php } ?>
       <img src="view/image/flags/<?php echo $language['image']; ?>" /><br />
       <?php } ?>
      </td>
      <?php if ($setting['manufacturers']['status']) { ?>
      <?php $class = 'enabled'; ?>
      <?php } else { ?>
      <?php $class = 'disabled'; ?>
      <?php } ?>
      <td class="left <?php echo $class; ?>">
       <select name="search_advanced_setting[manufacturers][status]">
        <?php foreach ($statuses as $status) { ?>
        <?php if ($setting['manufacturers']['status'] == $status['id']) { ?>
        <option value="<?php echo $status['id']; ?>" selected="selected"><?php echo $status['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $status['id']; ?>"><?php echo $status['name']; ?></option>
        <?php } ?>
        <?php } ?>
       </select>
      </td>
      <td class="left">
       <select name="search_advanced_setting[manufacturers][type]">
        <?php foreach ($types as $type) { ?>
        <?php if ($type['id'] != 3) { ?>
        <?php if ($setting['manufacturers']['type'] == $type['id']) { ?>
        <option value="<?php echo $type['id']; ?>" selected="selected"><?php echo $type['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $type['id']; ?>"><?php echo $type['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
       </select>
      </td>
      <td class="left"><span class="span_slider_manufacturers"></span>
      </td>
     </tr>
     <!-- MANUFACTURERS END -->
    </table>
     
     <!-- ATTRIBUTES START -->
     <table id="attribute" class="list">
      <thead>
       <tr>
        <td class="left" width="5%" ><?php echo $column_image; ?></td>
        <td class="left" width="23%"><?php echo $column_name; ?></td>
        <td class="left" width="25%"><?php echo $column_hint; ?></td>
        <td class="left" width="10%"><?php echo $column_status; ?></td>
        <td class="left" width="10%"><?php echo $column_type; ?></td>
        <td class="left" width="27%"><?php echo $column_optional; ?></td>
       </tr>
      </thead>
      <?php foreach ($attributes as $attribute) { ?>
      <thead>
       <tr class="filter">
        <td class="left" colspan="6"><?php echo $attribute['attribute_group_name']; ?></td>
       </tr>
      </thead>
      <?php foreach ($attribute['attributes'] as $attribute) { ?>
      <tbody>
       <tr>
        <td class="center" height="40">
         <a onclick="image_upload('image_<?php echo $attribute['attribute_id']; ?>', 'thumb_<?php echo $attribute['attribute_id']; ?>');">
          <?php if (isset ($setting['attributes'][$attribute['attribute_id']]['img']) && $setting['attributes'][$attribute['attribute_id']]['img']) { ?>
          <img id="thumb_<?php echo $attribute['attribute_id']; ?>" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="../image/<?php echo $setting['attributes'][$attribute['attribute_id']]['img']; ?>" />
          <?php } else { ?>
          <img id="thumb_<?php echo $attribute['attribute_id']; ?>" width="<?php echo $image_size['width']; ?>" height="<?php echo $image_size['height']; ?>" src="<?php echo $no_image; ?>" />
          <?php } ?>
         </a><br /><a onclick="imgClear('<?php echo $attribute['attribute_id']; ?>');"><?php echo $text_clear; ?></a><input type="hidden" id="image_<?php echo $attribute['attribute_id']; ?>" name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][img]" value="<?php echo (isset ($setting['attributes'][$attribute['attribute_id']]['img'])) ? $setting['attributes'][$attribute['attribute_id']]['img'] : ''; ?>" />
        </td>
        <td class="left"><?php echo $attribute['attribute_name']; ?></td>
        <td class="left">
         <?php foreach ($languages as $language) { ?>
         <?php if (isset ($setting['attributes'][$attribute['attribute_id']]['hint'][$language['language_id']])) { ?>
         <textarea name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][hint][<?php echo $language['language_id']; ?>]" rows="1" cols="40"><?php echo $setting['attributes'][$attribute['attribute_id']]['hint'][$language['language_id']]; ?></textarea>
         <?php } else { ?>
         <textarea name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][hint][<?php echo $language['language_id']; ?>]" rows="1" cols="40"></textarea>
         <?php } ?>
         <img src="view/image/flags/<?php echo $language['image']; ?>" /><br />
         <?php } ?>
        </td>
        <?php if (isset ($setting['attributes'][$attribute['attribute_id']]['status']) && $setting['attributes'][$attribute['attribute_id']]['status']) { ?>
        <?php $class = 'enabled'; ?>
        <?php } else { ?>
        <?php $class = 'disabled'; ?>
        <?php } ?>
        <td class="left <?php echo $class; ?>">
         <select name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][status]">
          <?php foreach ($statuses as $status) { ?>
          <?php if (isset ($setting['attributes'][$attribute['attribute_id']]['status']) && $setting['attributes'][$attribute['attribute_id']]['status'] == $status['id']) { ?>
          <option value="<?php echo $status['id']; ?>" selected="selected"><?php echo $status['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $status['id']; ?>"><?php echo $status['name']; ?></option>
          <?php } ?>
          <?php } ?>
         </select>
        </td>
        <td class="left">
         <select name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][type]" onchange="addSlider(<?php echo $attribute['attribute_id']; ?>, this.value);">
          <?php foreach ($types as $type) { ?>
          <?php if (isset ($setting['attributes'][$attribute['attribute_id']]['type']) && $setting['attributes'][$attribute['attribute_id']]['type'] == $type['id']) { ?>
          <option value="<?php echo $type['id']; ?>" selected="selected"><?php echo $type['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $type['id']; ?>"><?php echo $type['name']; ?></option>
          <?php } ?>
          <?php } ?>
         </select>
        </td>
        <td class="left">
         <span class="span_slider_<?php echo $attribute['attribute_id']; ?>">
         <?php if (isset ($setting['attributes'][$attribute['attribute_id']]['type']) && $setting['attributes'][$attribute['attribute_id']]['type'] == 3) { ?>
         <?php echo $text_min; ?><input type="text" name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][min]" value="<?php echo $setting['attributes'][$attribute['attribute_id']]['min']; ?>" size="5" />
         <?php echo $text_max; ?><input type="text" name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][max]" value="<?php echo $setting['attributes'][$attribute['attribute_id']]['max']; ?>" size="5" />
         <?php echo $text_step; ?><input type="text" name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][step]" value="<?php echo $setting['attributes'][$attribute['attribute_id']]['step']; ?>" size="5" />
         <?php } else { ?>
         <?php echo $text_sep; ?><input type="text" name="search_advanced_setting[attributes][<?php echo $attribute['attribute_id']; ?>][sep]" value="<?php echo (isset ($setting['attributes'][$attribute['attribute_id']]['sep'])) ? $setting['attributes'][$attribute['attribute_id']]['sep'] : ''; ?>" size="5" />
         <?php } ?>
         </span>
        </td>
       </tr>
      </tbody>
      <?php } ?>
      <?php } ?>
     </table>
     <!-- ATTRIBUTES END -->
    </div>
   </form>
  </div>
 </div>
</div>
<script type="text/javascript"><!--
function clear_cache() {
	$.ajax({
		url: 'index.php?route=module/search_advanced/clearCache&token=<?php echo $token; ?>',
		dataType: 'json',
		success: function(json) {
			if (json['message']) {
				alert (json['message']);
			}
		}
	});
}

function addSlider(id, value) {
	var span = $('.span_slider_' + id);
	
	if(value == 3) {
		html  = '<?php echo $text_min;  ?><input type="text" name="search_advanced_setting[attributes][' + id + '][min]"  size="5" value="<?php echo $default_min;  ?>" /> ';
		html += '<?php echo $text_max;  ?><input type="text" name="search_advanced_setting[attributes][' + id + '][max]"  size="5" value="<?php echo $default_max;  ?>" /> ';
		html += '<?php echo $text_step; ?><input type="text" name="search_advanced_setting[attributes][' + id + '][step]" size="5" value="<?php echo $default_step; ?>" /> ';
	} else {
		html = '<?php echo $text_sep; ?><input type="text" name="search_advanced_setting[attributes][' + id + '][sep]" size="5" value="" /> ';
	}
	
	span.html(html);
}

var module_row = <?php echo $module_row; ?>;

function addModule() {
	html = '<tbody id="module-row' + module_row + '">';
	html += '<tr>';
	html += '<td class="left"><select name="search_advanced_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '<option value="<?php echo $layout["layout_id"]; ?>"><?php echo $layout["name"]; ?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="left"><select name="search_advanced_module[' + module_row + '][position]">';
	html += '<option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '<option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '<option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '<option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '</select></td>';
	html += '<td class="left"><select name="search_advanced_module[' + module_row + '][status]">';
	html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '<option value="0"><?php echo $text_disabled; ?></option>';
	html += '</select></td>';
	html += '<td class="right"><input type="text" name="search_advanced_module['+module_row+'][sort_order]" value="" size="3" /></td>';
	html += '<td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += ' </tr>';
	html += '</tbody>';
	$('#module tfoot').before(html);
	module_row++;
}

$('#tabs a').tabs();

function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img width="<?php echo $image_size["width"]; ?>" height="<?php echo $image_size["height"]; ?>" src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: true
	});
};

function imgClear (id) {
	$('#thumb_' + id).attr('src', '<?php echo $no_image; ?>');
	$('#image_' + id).attr('value', '');
}
//--></script>
<?php echo $footer; ?>