<!-- BANNER -->
<div id="banner<?php echo $module; ?>" style="width: 100%;">
    <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>" style="margin: 0 auto;">
                <img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
            </a>
        <?php } else { ?>
            <img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" style="margin: 0 auto;" />
        <?php } ?>
    <?php } ?>
</div>
<!-- js -->
<script>
jQuery(function($) {
    $(window).load(function() {
        $('#banner<?php echo $module; ?>').height(Math.ceil(Math.max.apply(null, $.map($('#banner<?php echo $module; ?> img'), function(i) { return $(i).height(); }))));
        
        <?php if (count($banners) > 1) { ?>
            $('#banner<?php echo $module; ?>').cycle();
        <?php } ?>
    });
});
</script>