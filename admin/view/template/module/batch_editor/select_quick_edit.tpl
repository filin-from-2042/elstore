<select class="select-<?php echo $action; ?>-<?php echo $id; ?>">
 <?php if ($action == 'manufacturer_id' || $action == 'tax_class_id' || $action == 'asticker_id') { ?>
 <option value="0"></option>
 <?php } ?>
 <?php foreach (${$action} as $data) { ?>
 <?php if ($data['name'] == $name) { ?>
 <option value="<?php echo $data[$action]; ?>" selected="selected"><?php echo $data['name']; ?></option>
 <?php } else { ?>
 <option value="<?php echo $data[$action]; ?>"><?php echo $data['name']; ?></option>
 <?php } ?>
 <?php } ?>
</select>