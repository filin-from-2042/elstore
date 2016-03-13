<?php
function renderCategories($categories,$result='')
{
    foreach($categories as $category)
    {
        if($category['children'])
        {
            $result.= '<li class="'. (($category['active']) ? 'active' : '') . '">
                            <a><span>'.$category['name'].'</span><span class="caret"></span></a>
                            <ul>
                                '.renderCategories($category['children']).'
                            </ul>
                        </li>';
        }else{
            $result.='<li class="'. (($category['active'] )? 'active' : '') .'">
                        <a href="'.$category['href'].'">'.$category['name'].'</a>
                    </li>';
        }
     }
    return $result;
}
?>

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
            <?=renderCategories($categories)?>
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
        // sidebar
        var parentWidth = $('#sidebar #menu-collapse').width();
        $('#sidebar .dropdown-menu').css('marginLeft',parentWidth+'px');
    });
</script>
<?php } ?>