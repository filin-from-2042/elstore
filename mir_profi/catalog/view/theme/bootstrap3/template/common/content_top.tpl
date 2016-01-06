<?php if ($modules) { ?>
    <div class="row">
        <?php foreach ($modules as $module) { ?>
            <div class="module col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <?php echo $module; ?>
            </div>
        <?php } ?>
    </div>
<?php } ?>