<?php
function renderCategories($categories,$result='')
{
    foreach($categories as $category)
    {
        if($category['children'])
        {
            $result.= '<li class="'. (($category['active']) ? 'active' : '') . '">
                            <span><span>'.$category['name'].'</span><span class="arrow">&nbsp;&#9654;</span></span>
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




old 2


<div id="column-left" class="row">

    <div class="panel-heading" id="menu-heading">
        <h3 class="specials-title"><strong>Меню</strong> </h3>
    </div>

    <div class="col-lg-12">
        <!-- heading title -->
        <?php $counter = 0; ?>
        <ul class="tree">
            <?php foreach ($categories as $key=>$category_1) { ?>
            <li>
                <?php if ($category_1['children']) { ?>
                <input type="checkbox"  id="c<?php echo $key;?>k<?php echo $counter;?>" />
                <label class="tree_label" for="c<?php echo $key;?>k<?php echo $counter;?>">
                    <?php echo $category_1['name']; ?>
                </label>
                <?php } else { ?>
                <span class="tree_label"><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a></span>
                <?php } ?>
                <?php if ($category_1['children']) { ?>
                <ul>
                    <?php foreach ($category_1['children'] as $key2=>$category_2) { ?>
                    <li>
                        <?php if ($category_2['children']) { ?>
                        <input type="checkbox"  id="c<?php echo $key;?>p<?php echo $key2;?>k<?php echo $counter;?>" />
                        <label class="tree_label" for="c<?php echo $key;?>p<?php echo $key2;?>k<?php echo $counter;?>">
                            <?php echo $category_2['name']; ?>
                        </label>
                        <?php } else { ?>
                        <span class="tree_label"><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></span>
                        <? }?>
                        <?php if ($category_2['children']) { ?>
                        <ul>
                            <?php foreach ($category_2['children'] as $category_3) { ?>
                            <li><span class="tree_label"><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></span></li>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                    </li>
                    <?php } ?>
                </ul>
                <?php } ?>
            </li>
            <?php $counter++;
                            } ?>
        </ul>
    </div>
</div>







<div class="col-lg-12">

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Collapsible Group Item #1
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingTwo">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Collapsible Group Item #2
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingThree">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    Collapsible Group Item #3
                </a>
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
</div>


<?php $counter = 0;?>
<ul class="list-unstyled">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <?php foreach ($categories as $key=>$category_1) { ?>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading<?php echo $key?>">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $key?>" aria-expanded="true" aria-controls="collapse<?php echo $key?>">
                        <?php echo $category_1['name']?>
                    </a>
                </h4>
            </div>
            <div id="collapse<?php echo $key?>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<?php echo $key?>">
                <div class="panel-body">

                    <?php if ($category_1['children']) { ?>
                    <ul>
                        <?php foreach ($category_1['children'] as $key2=>$category_2) { ?>
                        <li>
                            <?php if ($category_2['children']) { ?>
                            <label   for="c<?php echo $key;?>p<?php echo $key2;?>k<?php echo $counter;?>">
                                <?php echo $category_2['name']; ?>
                            </label>
                            <?php } else { ?>
                            <span  ><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></span>
                            <? }?>
                            <?php if ($category_2['children']) { ?>
                            <ul>
                                <?php foreach ($category_2['children'] as $category_3) { ?>
                                <li><span  ><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></span></li>
                                <?php } ?>
                            </ul>
                            <?php } ?>
                        </li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </div>
            </div>
        </div>
        <li>
            <?php if ($category_1['children']) { ?>
            <label for="c<?php echo $key;?>k<?php echo $counter;?>">
                <?php echo $category_1['name']; ?>
            </label>
            <?php } else { ?>
            <span  ><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a></span>
            <?php } ?>
            <?php if ($category_1['children']) { ?>
            <ul>
                <?php foreach ($category_1['children'] as $key2=>$category_2) { ?>
                <li>
                    <?php if ($category_2['children']) { ?>
                    <label   for="c<?php echo $key;?>p<?php echo $key2;?>k<?php echo $counter;?>">
                        <?php echo $category_2['name']; ?>
                    </label>
                    <?php } else { ?>
                    <span  ><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></span>
                    <? }?>
                    <?php if ($category_2['children']) { ?>
                    <ul>
                        <?php foreach ($category_2['children'] as $category_3) { ?>
                        <li><span  ><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></span></li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <?php $counter++;
                        } ?>
</ul>
</div>
