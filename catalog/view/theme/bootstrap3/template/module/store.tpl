<!-- STORE -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><?php echo $heading_title; ?></h3>
    </div>
    <div class="panel-body">
        <p class="lead"><?php echo $text_store; ?></p>
        <?php foreach ($stores as $store) { ?>
            <?php if ($store['store_id'] == $store_id) { ?>
                <p><a href="<?php echo $store['url']; ?>"><b><?php echo $store['name']; ?></b></a></p>
            <?php } else { ?>
                <p><a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a></p>
            <?php } ?>
        <?php } ?>
    </div>
</div>