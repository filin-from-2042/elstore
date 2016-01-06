<div class="content">
 <table class="form">
  <tr>
   <td width="1%"><img src="<?php echo $product_image; ?>" /></td>
   <td width="99%"><h3><?php echo $product_name; ?></h3></td>
  </tr>
 </table>
 <form id="form-descriptions-list">
  <input type="hidden" name="selected[]" value="<?php echo $product_id; ?>" />
  <div id="languages" class="htabs">
   <?php foreach ($languages as $language) { ?>
   <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
   <?php } ?>
  </div>
  <?php foreach ($languages as $language) { ?>
  <div id="language<?php echo $language['language_id']; ?>">
   <table class="form">
    <tr>
     <td width="17%"><?php echo $entry_name; ?> <span class="required">*</span></td>
     <td width="83%">
      <input type="text" name="product_descriptions[<?php echo $language['language_id']; ?>][name]" maxlength="255" size="120" value="<?php echo isset($product_descriptions[$language['language_id']]) ? $product_descriptions[$language['language_id']]['name'] : ''; ?>" />
      <?php if (isset($error_name[$language['language_id']])) { ?>
      <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
      <?php } ?>
     </td>
    </tr>
    <?php if (isset ($product_descriptions[$language['language_id']]['seo_h1'])) { ?>
    <tr>
     <td><?php echo $entry_seo_h1; ?></td>
     <td><input type="text" name="product_descriptions[<?php echo $language['language_id']; ?>][seo_h1]" maxlength="255" size="120" value="<?php echo isset($product_descriptions[$language['language_id']]) ? $product_descriptions[$language['language_id']]['seo_h1'] : ''; ?>" /></td>
    </tr>
    <?php } ?>
    <?php if (isset ($product_descriptions[$language['language_id']]['seo_title'])) { ?>
    <tr>
     <td><?php echo $entry_seo_title; ?></td>
     <td><input type="text" name="product_descriptions[<?php echo $language['language_id']; ?>][seo_title]" maxlength="255" size="120" value="<?php echo isset($product_descriptions[$language['language_id']]) ? $product_descriptions[$language['language_id']]['seo_title'] : ''; ?>" /></td>
    </tr>
    <?php } ?>
    <tr>
     <td><?php echo $entry_meta_keyword; ?></td>
     <td><input type="text" name="product_descriptions[<?php echo $language['language_id']; ?>][meta_keyword]" maxlength="255" size="120" value="<?php echo isset($product_descriptions[$language['language_id']]) ? $product_descriptions[$language['language_id']]['meta_keyword'] : ''; ?>" /></td>
    </tr>
    <tr>
     <td><?php echo $entry_meta_description; ?></td>
     <td><textarea name="product_descriptions[<?php echo $language['language_id']; ?>][meta_description]" cols="117" rows="2"><?php echo isset($product_descriptions[$language['language_id']]) ? $product_descriptions[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
    </tr>
    <tr>
     <td><?php echo $entry_description; ?></td>
     <td>
      <textarea id="description<?php echo $language['language_id']; ?>" name="product_descriptions[<?php echo $language['language_id']; ?>][description]" style="display: none;"></textarea>
      <textarea id="description_edit<?php echo $language['language_id']; ?>"><?php echo isset($product_descriptions[$language['language_id']]) ? $product_descriptions[$language['language_id']]['description'] : ''; ?></textarea>
     </td>
    </tr>
    <tr>
     <td><?php echo $entry_tag; ?></td>
     <td><input type="text" name="product_tags[<?php echo $language['language_id']; ?>]" value="<?php echo isset($product_tags[$language['language_id']]) ? $product_tags[$language['language_id']] : ''; ?>" size="120" /></td>
    </tr>
   </table>
  </div>
  <?php } ?>
  <table class="list">
   <tr>
    <td class="center"><a class="button" onclick="editProductList('descriptions', 'upd');"><?php echo $button_save; ?></a> <a class="button" onclick="$('#dialog').dialog('close');">X</a></td>
   </tr>
  </table>
 </form>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#form-descriptions-list #languages a').tabs();
	$('body').after('<div id="description_overlay" class="ui-widget ui-widget-overlay"></div>');
	
	addCKEDITOR();
	
	$('#dialog').dialog({
		beforeClose: function() {
			delCKEDITOR();
			
			$('#product .input-name-<?php echo $product_id; ?>').html($('input[name="product_descriptions[<?php echo $language_id; ?>][name]"]').val());
			$('#description_overlay').remove();
		}
	}).dialog('option', 'title', '<?php echo $column_descriptions; ?>').dialog('option', 'modal', false);
});
//--></script>