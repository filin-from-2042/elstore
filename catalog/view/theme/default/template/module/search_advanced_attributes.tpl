   <!-- Module Search Advanced -->
   <?php if ($filter['attributes'] || $filter['manufacturers'] || $filter['prices']) { ?>
   <div class="content">
    <?php if ($text_filter) { ?>
    <h3><?php echo $text_filter; ?></h3>
    <?php } ?>
    
    <?php if ($filter['prices']) { ?>
    <div style="clear:both;"></div>
    <?php if ($filter['prices']['img']) { ?>
    <img align="absmiddle" src="<?php echo $filter['prices']['img']; ?>" alt="<?php echo $filter['prices']['img']; ?>" title="<?php echo $filter['prices']['img']; ?>" />
    <?php } ?>
    <em>
     <?php echo $text_price_1; ?>
     <?php if ($filter['prices']['hint']) { ?>
     &nbsp;<span class="required hint" title="<?php echo $filter['prices']['hint']; ?>">(?)</span>
     <?php } ?>
    </em>&nbsp;&nbsp;&nbsp;
    <input name="fp[min]" style="text-align:right; border:none;" type="text" size="7" />&mdash;<input name="fp[max]" style="text-align:left; border:none;" type="text" size="7" />
    <div id="slider_price" ></div><br />
	<script type="text/javascript">
	$("#slider_price").slider({
		range: true,
		min:  <?php echo $filter['prices']['min']; ?>,
		max:  <?php echo $filter['prices']['max']; ?>,
		step: <?php echo $filter['prices']['step']; ?>,
		values: [<?php echo $filter['prices']['min_cur']; ?>, <?php echo $filter['prices']['max_cur']; ?>],
		slide: function( event, ui ) {
			$("input[name='fp[min]']").val(ui.values[0]);
			$("input[name='fp[max]']").val(ui.values[1]);
		}
	});
	$("input[name='fp[min]']").val($("#slider_price").slider("values", 0));
	$("input[name='fp[max]']").val($("#slider_price").slider("values", 1));
	</script>
    <div style="clear:both;"></div>
    <?php } ?>
    
    <?php if ($filter['manufacturers']) { ?>
    <?php if ($setting['manufacturers']['status'] == 2) { ?>
    <div class="attribute_contaner hidden">
    <?php } else { ?>
    <div class="attribute_contaner show">
    <?php } ?>
     <em onclick="toggle_filter('fm_0')">
      
      <?php if ($filter['manufacturers']['img']) { ?>
      <img align="absmiddle" src="<?php echo $filter['manufacturers']['img']; ?>" alt="<?php echo $text_manufacturers; ?>" title="<?php echo $text_manufacturers; ?>" />
      <?php } ?>
      <?php echo $text_manufacturers; ?>
      <?php if ($filter['manufacturers']['hint']) { ?>
      &nbsp;<span class="required hint" title="<?php echo $filter['manufacturers']['hint']; ?>">(?)</span>
      <?php } ?>
      
     </em>
     <div id="fm_0" class="toggle">
      <?php foreach ($filter['manufacturers']['values'] as $manufacturer) { ?>
      <span>
      <?php if ($manufacturer['checked']) { ?>
      <input name="fm[]" type="<?php echo $filter['manufacturers']['type']; ?>" value="<?php echo $manufacturer['id']; ?>" checked="checked" />
      <?php } else { ?>
      <input name="fm[]" type="<?php echo $filter['manufacturers']['type']; ?>" value="<?php echo $manufacturer['id']; ?>" />
      <?php } ?>
      <?php echo $manufacturer['name']; ?>
      </span>
      <?php } ?>
     </div>
    </div>
    <?php } ?>
    
    <?php if ($filter['stocks']) { ?>
    <?php if ($setting['stock']['status'] == 2) { ?>
    <div class="attribute_contaner hidden">
    <?php } else { ?>
    <div class="attribute_contaner show">
    <?php } ?>
     <em onclick="toggle_filter('fs_0')">
      
      <?php if ($filter['stocks']['img']) { ?>
      <img align="absmiddle" src="<?php echo $filter['stocks']['img']; ?>" alt="<?php echo $text_stock; ?>" title="<?php echo $text_stock; ?>" />
      <?php } ?>
      <?php echo $text_stock; ?>
      <?php if ($filter['stocks']['hint']) { ?>
      &nbsp;<span class="required hint" title="<?php echo $filter['stocks']['hint']; ?>">(?)</span>
      <?php } ?>
      
     </em>
     <div id="fs_0" class="toggle">
      <?php foreach ($filter['stocks']['values'] as $stock) { ?>
      <span>
      <?php if ($stock['checked']) { ?>
      <input name="fs[]" type="<?php echo $filter['stocks']['type']; ?>" value="<?php echo $stock['id']; ?>" checked="checked" />
      <?php } else { ?>
      <input name="fs[]" type="<?php echo $filter['stocks']['type']; ?>" value="<?php echo $stock['id']; ?>" />
      <?php } ?>
      <?php echo $stock['name']; ?>
      </span>
      <?php } ?>
     </div>
    </div>
    <?php } ?>
    
    <?php if ($filter['attributes']) { ?>
    <script type="text/javascript">
	var sliders = [];
    </script>
    <?php $i = 0; ?>
    <?php foreach ($filter['attributes'] as $attribute) { ?>
    <b><?php echo $attribute['name']; ?></b>
    <?php foreach ($attribute['text'] as $attribute_1) { ?>
    <?php if ($attribute_1['type'] == 'checkbox' || $attribute_1['type'] == 'radio') { ?>
    <?php if ($attribute_1['status'] == 2) { ?>
    <div class="attribute_contaner hidden">
    <?php } else { ?>
    <div class="attribute_contaner show">
    <?php } ?>
     <em onclick="toggle_filter('fa_<?php echo $i; ?>')">
      <?php if ($attribute_1['img']) { ?>
      <img align="absmiddle" src="<?php echo $attribute_1['img']; ?>" alt="<?php echo $attribute_1['name']; ?>" title="<?php echo $attribute_1['name']; ?>" />
      <?php } ?>
      <?php echo $attribute_1['name']; ?>
      <?php if ($attribute_1['hint']) { ?>
      &nbsp;<span class="required hint" title="<?php echo $attribute_1['hint']; ?>">(?)</span>
      <?php } ?>
     </em>
     <div id="fa_<?php echo $i; ?>" class="toggle">
      <?php foreach ($attribute_1['text'] as $attribute_2) { ?>
      <span>
      <?php if ($attribute_2['checked']) { ?>
      <input name="fa[<?php echo $attribute_1['id']; ?>][]" type="<?php echo $attribute_1['type']; ?>" value="<?php echo $attribute_2['value']; ?>" checked="checked" />
      <?php } else { ?>
      <input name="fa[<?php echo $attribute_1['id']; ?>][]" type="<?php echo $attribute_1['type']; ?>" value="<?php echo $attribute_2['value']; ?>" />
      <?php } ?>
      <?php echo $attribute_2['value']; ?>
      </span>
      <?php } ?>
     </div>
    </div>
    <?php $i++; ?>
    
    <?php } else if ($attribute_1['type'] == 'slider') { ?>
    <div style="clear:both;"></div>
    <?php if ($attribute_1['img']) { ?>
    <img align="absmiddle" src="<?php echo $attribute_1['img']; ?>" alt="<?php echo $attribute_1['name']; ?>" title="<?php echo $attribute_1['name']; ?>" />
    <?php } ?>
    <em>
     <?php echo $attribute_1['name']; ?>
     <?php if ($attribute_1['hint']) { ?>
     &nbsp;<span class="required hint" title="<?php echo $attribute_1['hint']; ?>">(?)</span>
     <?php } ?>
    </em>&nbsp;&nbsp;&nbsp;
    <input name="fa[<?php echo $attribute_1['id']; ?>][min]" style="text-align:right; border:none;" type="text" size="7" />&mdash;<input name="fa[<?php echo $attribute_1['id']; ?>][max]" style="text-align:left; border:none;" type="text" size="7" />
    <div id="slider_<?php echo $attribute_1['id']; ?>" ></div><br />
	<script type="text/javascript">
	sliders[sliders.length] = ["#slider_<?php echo $attribute_1['id']; ?>", "fa[<?php echo $attribute_1['id']; ?>][min]", "fa[<?php echo $attribute_1['id']; ?>][max]"];
	$("#slider_<?php echo $attribute_1['id']; ?>").slider({
		range: true,
		min:  <?php echo $attribute_1['text']['min' ]; ?>,
		max:  <?php echo $attribute_1['text']['max' ]; ?>,
		step: <?php echo $attribute_1['text']['step']; ?>,
		values: [<?php echo $attribute_1['text']['min_cur']; ?>, <?php echo $attribute_1['text']['max_cur']; ?>],
		slide: function( event, ui ) {
			$("input[name='fa[<?php echo $attribute_1['id']; ?>][min]']").val(ui.values[0]);
			$("input[name='fa[<?php echo $attribute_1['id']; ?>][max]']").val(ui.values[1]);
		}
	});
	$("input[name='fa[<?php echo $attribute_1['id']; ?>][min]']").val($("#slider_<?php echo $attribute_1['id']; ?>").slider("values", 0));
	$("input[name='fa[<?php echo $attribute_1['id']; ?>][max]']").val($("#slider_<?php echo $attribute_1['id']; ?>").slider("values", 1));
	</script>
    <?php } ?>
    <?php } ?>
    <div style="clear:both;"></div>
    <?php } ?>
    <?php } ?>
   </div>
   <script type="text/javascript">
   $(document).ready(function(){
	   $("#search_attributes_content .hint").poshytip({
		   className: 'tooltip',
		   showTimeout: 1,
		   alignTo: 'target',
		   alignX: 'center',
		   offsetY: 5,
		   allowTipHover: false,
		   fade: true,
		   slide: false
	   });
   });
   </script>
   <?php } ?>