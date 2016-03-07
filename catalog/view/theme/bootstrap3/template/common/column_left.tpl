<!-- MENU -->
<?php if (isset($categories)) { ?>
<div id="sidebar" class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand visible-xs" href="<?php echo $home; ?>"><?php echo $name; ?></a>
    </div>
    <div id="menu-collapse" class="navbar-collapse collapse">
        <ul class="nav navbar-nav" role="menu">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown <?php echo $category['active'] ? 'active' : '' ?>">
                <a class="dropdown-toggle" data-toggle="dropdown">
                    <span><?php echo $category['name']; ?></span>
                    <span class="caret"></span>
                </a>
                <?php $columns = 12 / ceil(12 / $category['column']); ?>
                <ul class="dropdown-menu list-columns list-columns-xs-1 list-columns-sm-<?php echo ($columns < 2) ? '1' : '2'; ?> list-columns-md-<?php echo $columns; ?> list-columns-lg-<?php echo $columns; ?>">
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <li class="divider"></li>
                    <?php for ($i = 0; $i < count($category['children']); $i++) { ?>
                    <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </li>
            <?php } else { ?>
            <li class="<?php echo $category['active'] ? 'active' : '' ?>">
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
</div>
<!-- js -->
<script>
    jQuery(function($){
        // MENU
        if (styleSupport('ul', 'column-count', true)) {
            $(window).resize(function() {
                if ($(window).width() > 750) {
                    var width = $('#menu div.navbar').width();

                    $('#menu li.dropdown').each(function() {
                        var $this = $(this);

                        $this.children('ul.dropdown-menu').css({
                            left: - $this.position().left,
                            width: width
                        });
                    });
                } else {
                    $('#menu li.dropdown').each(function() {
                        $(this).children('ul.dropdown-menu').css({
                            left: 0,
                            width: '100%'
                        });
                    });
                }
            }).resize();
        } else {
            $('#menu ul.dropdown-menu').removeClass().addClass('dropdown-menu');
        }
    });
</script>
<?php } ?>