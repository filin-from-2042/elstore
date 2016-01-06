<!-- SLIDESHOW nivoslider -->
<div class="slideshow">
    <div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: 100%; margin-bottom: 20px;">
        <?php foreach ($banners as $banner) { ?>
            <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>">
                    <img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
                </a>
            <?php } else { ?>
                <img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" style="margin: 0 auto;" />
            <?php } ?>
        <?php } ?>
    </div>
</div>
<!-- js -->
<script>
jQuery(function($){
    $('#slideshow<?php echo $module; ?>').nivoSlider();
});
</script>