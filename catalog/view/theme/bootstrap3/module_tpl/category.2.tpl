<!-- CATEGORY v2 -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><?php echo $heading_title; ?></h3>
    </div>
    <ul class="module-category nav nav-pills nav-stacked" role="tree">
        <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
                <li class="category-item category-top">
                    <?php if ($category['category_id'] == $category_id && !$child_id) { ?>
                        <a class="active" href="<?php echo $category['href']; ?>"><b><?php echo $category['name']; ?></b></a>
                    <?php } else { ?>
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                    <?php } ?>
                    <a class="toggle btn btn-link" style="position: absolute; right: 0; top: 0; opacity: 0.5; filter: alpha(opacity=50);">
                        <span class="glyphicon glyphicon-plus text-muted"></span>
                    </a>
                </li>
                <?php foreach ($category['children'] as $child) { ?>
                    <li class="subcategory-item" style="display: none;">
                        <?php if ($child['category_id'] == $child_id) { ?>
                            <a class="active" href="<?php echo $child['href']; ?>">&nbsp;&nbsp;<small><b><?php echo $child['name']; ?></b></small></a>
                        <?php } else { ?>
                            <a href="<?php echo $child['href']; ?>">&nbsp;&nbsp;<small><?php echo $child['name']; ?></small></a>
                        <?php } ?>
                    </li>
                <?php } ?>
            <?php } else { ?>
                <li class="category-item">
                    <?php if ($category['category_id'] == $category_id) { ?>
                        <a class="active" href="<?php echo $category['href']; ?>"><b><?php echo $category['name']; ?></b></a>
                    <?php } else { ?>
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                    <?php } ?>
                </li>
            <?php } ?>
        <?php } ?>
    </ul>
</div>
<!-- js -->
<script>
jQuery(function($) {
    // SUBCATEGORIES
    $('ul.module-category.nav>li.category-top>a.toggle').click(function() {
        var $this = $(this);
        var $module = $(this).closest('ul.module-category');
        var $items = $this.parent('li.category-top').nextUntil('li.category-item');
        
        $('li.subcategory-item', $module).not($items).hide();
        $('li.category-top>a.toggle', $module).not(this)
            .children('span.glyphicon-minus').toggleClass('glyphicon-plus glyphicon-minus')
            .closest('li.category-top').toggleClass('text-bold');
        
        $items.toggle();
        
        $this.children('span').toggleClass('glyphicon-plus glyphicon-minus');
        $this.closest('li.category-top').toggleClass('text-bold');
    });
    
    // Init
    $('ul.module-category.nav>li.category-top:has(a.active)>a.toggle').each(function() {
        $(this).click();
    });
    
    $('ul.module-category.nav>li.subcategory-item:has(a.active)').each(function() {
        $(this).prevAll('li.category-top:first').children('a.toggle').click();
    });
});
</script>