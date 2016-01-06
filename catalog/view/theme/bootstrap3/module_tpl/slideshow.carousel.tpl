<!-- SLIDESHOW carousel -->
<div id="slideshow<?php echo $module; ?>" class="carousel slide" data-interval="5000" style="margin-bottom: 20px;">
    <div class="carousel-inner">
        <?php for ($i = 0; $i < count($banners); $i++) { ?>
            <div class="item <?php echo $i ? '' : 'active'; ?>">
                <img class="img-responsive" src="<?php echo $banners[$i]['image']; ?>" alt="<?php echo $banners[$i]['title']; ?>" style="margin: 0 auto;">
            </div>
        <?php } ?>
    </div>
    <?php if (count($banners) > 1) { ?>
        <ol class="carousel-indicators">
            <?php for ($i = 0; $i < count($banners); $i++) { ?>
                <li data-target="#slideshow<?php echo $module; ?>" data-slide-to="<?php echo $i ?>" class="<?php echo $i ? '' : 'active'; ?>"></li>
            <?php } ?>
        </ol>
        <a class="left carousel-control" href="#slideshow<?php echo $module; ?>" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#slideshow<?php echo $module; ?>" data-slide="next">
            <span class="icon-next"></span>
        </a>
    <?php } ?>
</div>
<!-- js -->
<script>
jQuery(function($) {
    <?php if (count($banners) > 1) { ?>
        $('#slideshow<?php echo $module; ?>').carousel('cycle');
    <?php } ?>
});
</script>