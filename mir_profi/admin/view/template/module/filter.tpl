<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <?php if ($installed) { ?>
        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
        <a onclick="$('#form').attr('action','<?php echo $action; ?>&return=1').submit();" class="button"><?php echo $button_apply; ?></a>
        <?php } ?>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <?php if (!$installed) { ?>
      <div id="install"><p><?php echo $text_create; ?><br /><a onclick="location = '<?php echo $create; ?>';" class="button"><?php echo $button_create; ?></a></div>
      <?php } ?>
      <div id="tabs" class="htabs">
        <a href="#tab-general"><?php echo $tab_general; ?></a>
        <a href="#tab-option"><?php echo $tab_option; ?></a>
        <a href="#tab-price-filtering"><?php echo $tab_price_filtering; ?></a>
        <a href="#tab-other"><?php echo $tab_other; ?></a>
        <a href="#tab-copy"><?php echo $tab_copy; ?></a>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <input type="hidden" name="filter_module[0][position]" value="<?php echo $position; ?>" />
        <div id="tab-general">
          <table id="settings" class="form">
            <tr><td><?php echo $entry_status; ?></td><td><label<?php echo ($status ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][status]" value="1" <?php echo ($status ? 'checked="checked" ' : ''); ?>/></td><td><div class="notice"><?php echo $notice_status; ?></div></td></tr>
            <tr>
              <td><?php echo $entry_position; ?></td>
              <td>
                <div id="position">
                  <?php foreach ($positions as $item) { ?>
                  <a class="<?php echo $item . ($position == $item ? ' selected' : ''); ?>" rel="<?php echo $item; ?>" title="<?php echo ${'text_' . $item}; ?>"><?php echo ${'text_' . $item}; ?></a>
                  <?php } ?>
                </div>
              </td>
              <td><div class="notice"><?php echo $notice_position; ?></div></td>
            </tr>
            <tr><td><?php echo $entry_sort_order; ?></td><td><input type="text" name="filter_module[0][sort_order]" value="<?php echo $sort_order; ?>" size="2" /></td><td><div class="notice"><?php echo $notice_sort_order; ?></div></td></tr>
          </table>
        </div>
        <div id="tab-option">
          <table id="settings" class="form">
            <tr><td><?php echo $entry_show_selected; ?></td><td><label<?php echo ($show_selected ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][show_selected]" value="1" <?php echo ($show_selected ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_show_selected; ?></div></td></tr>
            <tr><td><?php echo $entry_show_button; ?></td><td><label<?php echo ($show_button ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][show_button]" value="1" <?php echo ($show_button ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_show_button; ?></div></td></tr>
            <tr><td><?php echo $entry_show_price; ?></td><td><label<?php echo ($show_price ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][show_price]" value="1" <?php echo ($show_price ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_show_price; ?></div></td></tr>
            <tr><td><?php echo $entry_show_counter; ?></td><td><label<?php echo ($show_counter ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][show_counter]" value="1" <?php echo ($show_counter ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_show_counter; ?></div></td></tr>
            <tr>
              <td><?php echo $entry_manufacturer; ?></td>
              <td>
                <label<?php echo ($manufacturer ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][manufacturer]" value="1" <?php echo ($manufacturer ? 'checked="checked" ' : ''); ?>/></label>
                <div style="<?php echo ($manufacturer ? 'display:block;' : 'display:none;'); ?>">
                  <?php echo $entry_manufacturer_type; ?>
                  <select name="filter_module[0][manufacturer_type]">
                    <?php foreach ($types as $item) { ?>
                    <option value="<?php echo $item; ?>" <?php echo ($manufacturer_type == $item ? 'selected="selected" ' : ''); ?>><?php echo ucfirst($item); ?></option>
                    <?php } ?>
                  </select>
                </div>
              </td>
              <td><div class="notice"><?php echo $notice_manufacturer; ?></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_status; ?></td>
              <td>
                <label<?php echo ($stock_status ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][stock_status]" value="1" <?php echo ($stock_status ? 'checked="checked" ' : ''); ?>/></label>
                <div style="<?php echo ($stock_status ? 'display:block;' : 'display:none;'); ?>">
                  <?php echo $entry_stock_status_type; ?>
                  <select name="filter_module[0][stock_status_type]">
                    <?php foreach ($types as $item) { ?>
                    <option value="<?php echo $item; ?>" <?php echo ($stock_status_type == $item ? 'selected="selected" ' : ''); ?>><?php echo ucfirst($item); ?></option>
                    <?php } ?>
                  </select>
                </div>
              </td>
              <td><div class="notice"><?php echo $notice_stock_status; ?></div></td>
            </tr>
          </table>
        </div>
        <div id="tab-price-filtering">
          <table id="settings" class="form">
            <tr><td><?php echo $entry_show_diagram; ?></td><td><label<?php echo ($show_diagram ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][show_diagram]" value="1" <?php echo ($show_diagram ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_show_diagram; ?></div></td></tr>
            <tr><td><?php echo $entry_consider_discount; ?></td><td><label<?php echo ($consider_discount ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][consider_discount]" value="1" <?php echo ($consider_discount ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_consider_discount; ?></div></td></tr>
            <tr><td><?php echo $entry_consider_special; ?></td><td><label<?php echo ($consider_special ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][consider_special]" value="1" <?php echo ($consider_special ? 'checked="checked" ' : ''); ?>/></label></td><td><div class="notice"><?php echo $notice_consider_special; ?></div></td></tr>
          </table>
        </div>
        <div id="tab-other">
          <table id="settings" class="form">
            <tr>
              <td><?php echo $entry_pco_show_type; ?></td>
              <td>
                <select name="filter_module[0][pco_show_type]">
                  <?php if ($pco_show_type == 'inline') { ?>
                  <option value="inline" selected="selected"><?php echo $text_inline; ?></option>
                  <option value="list"><?php echo $text_list; ?></option>
                  <?php } else { ?>
                  <option value="inline"><?php echo $text_inline; ?></option>
                  <option value="list" selected="selected"><?php echo $text_list; ?></option>
                  <?php } ?>
                </select>
              </td>
              <td><div class="notice"><?php echo $notice_pco_show_type; ?></div></td>
            </tr>
            <tr><td><?php echo $entry_pco_show_limit; ?></td><td><input type="text" name="filter_module[0][pco_show_limit]" value="<?php echo $pco_show_limit; ?>" size="4" /></td><td><div class="notice"><?php echo $notice_pco_show_limit; ?></div></td></tr>
            <tr>
              <td><?php echo $entry_hide_options; ?></td>
              <td>
                <label<?php echo ($hide_options ? ' class="checked"' : ''); ?>><input type="checkbox" name="filter_module[0][hide_options]" value="1" <?php echo ($hide_options ? 'checked="checked" ' : ''); ?>/></label>
                <div style="<?php echo ($hide_options ? 'display:block;' : 'display:none;'); ?>">
                  <?php echo $entry_hide_options_limit; ?>
                  <input type="text" name="filter_module[0][hide_options_limit]" value="<?php echo $hide_options_limit; ?>" size="4" />
                </div>
              </td>
              <td><div class="notice"><?php echo $notice_hide_options; ?></div></td>
            </tr>
          </table>
        </div>
        <div id="tab-copy">
          <table id="settings" class="form">
            <tr>
              <td>Магазины</td>
              <td colspan="2">
                <div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <input type="checkbox" name="option_store[]" value="0" /> <?php echo $text_default; ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <input type="checkbox" name="option_store[]" value="<?php echo $store['store_id']; ?>" /> <?php echo $store['name']; ?>
                  </div>
                  <?php } ?>
                </div>
              </td>
            </tr>
            <tr>
              <td>Тип</td>
              <td colspan="2">
                <select name="type">
                  <?php foreach ($types as $item) { ?>
                  <option value="<?php echo $item; ?>"><?php echo ucfirst($item); ?></option>
                  <?php } ?>
                </select>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td colspan="2">
                <a id="copy-attributes" class="button"><span>Скопировать</span></a>
              </td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  $('input[type=\'checkbox\']').change(function(){
    var label = $(this).parent('label');
    label.next('div').fadeToggle(250);
    label.toggleClass('checked');
  });

  $('input[name=\'filter_module[0][show_price]\']').change(function(){
    if (!$(this).prop('checked')) {
      $('a[href=\'#tab-price-filtering\']').addClass('disabled').animate({opacity: 0.3}, {duration: 300, queue: false});
      $('#tab-price-filtering input').prop('disabled', true);
    } else {
      $('#tabs .disabled').removeClass('disabled').animate({opacity: 1}, {duration: 300, queue: false});
      $('#tab-price-filtering input').prop('disabled', false);
    }
  });

  <?php if (!$installed) { ?>
  setTimeout(function(){ $('#install').animate({opacity: 1}, 2000); }, 1000);
  <?php } else { ?>
  $('#position a').click(function(){
    var el = $(this), position = el.attr('rel');
    $('input[name=\'filter_module[0][position]\']').val(position);
    $('#position a').removeClass('selected');
    el.addClass('selected');
  });
  <?php } ?>

  $('#copy-attributes').live('click', function(){
    var el = $(this), data = ['type=' + encodeURIComponent($('select[name=\'type\']').val())], verified = true;

    $('input[name=\'option_store[]\']:checked').each(function(){
      data.push('option_store[]=' + $(this).val());
    });

    el.prop('id', false).find('span').text('Выполняется...');

    $.post('index.php?route=module/filter/copyAttributes&token=<?php echo $token; ?>', data.join('&'), function(json){
      if (json['message']) {
        $('span', el).text(json['message']);
      }

      setTimeout(function(){ $('span', el).text('Скопировать'); el.prop('id', 'copy-attributes'); }, 3000);
    }, 'json');
  });
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#import-export-tabs a').tabs();
//--></script>
<?php echo $footer; ?>