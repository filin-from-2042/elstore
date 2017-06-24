<div class="navbar navbar-default hidden-print" role="navigation">
    <div class="container hidden-print">
        <div class="navbar-header">
            <div id="search" class="hidden-lg hidden-md hidden-sm">
                <form id="searchform" name="search" role="search" onsubmit="event.preventDefault(); location = 'index.php?route=product/search&amp;' + $(this).serialize();">

                    <i class="fa fa-search"></i><input type="text" name="search" value="" placeholder=""><button type="submit" class="button-search"><i class="fa fa-angle-double-right"></i></button>
                    <div class="clear"></div>

                </form>

            </div>
            <button type="button"  class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">

                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse">

            <ul class="nav navbar-nav">
                <li class="">
                    <a href="#"  id="dropdownMenu11" class="dropdown-toggle" data-toggle="dropdown">Каталог <i class="fa fa-bars"></i></a>
                    <ul class="dropdown-menu multi-level" aria-labelledby="dropdownMenu1">
                        <?php if (isset($categories))?>
                        <?php foreach($categories as $category){
                            if (isset ($category['children'])){
                            echo '<li class="dropdown-submenu">';
                        echo '<a href="' .$category['href']. '"';
                        if (!$category['children']) {echo '>'.$category['name'].'</a></li>'; continue;}
                        else echo 'class="dropdown-toggle "  data-toggle="dropdown">'.$category['name'].'</a>';

                        echo '<ul class="dropdown-menu second-level">';

                            foreach ($category['children'] as $child)
                            {
                            echo '<li class="second-level-item hidden-xs"><a href="'.$child['href'].'">'.$child['name'].'</a></li>';
                            // third level children
                            if (isset($child['children'])) foreach ($child['children'] as $grandchild)
                            {
                            echo '<li class="col-lg-4 col-md-4 col-sm-12 col-xs-12 hidden-xs hidden-sm">';
                                if (isset($grandchild['thumb'])) echo '<img class="img-responsive" src="'. $grandchild['thumb'].'" /> ';
                                echo '<a class="submenu-link" href="'.$grandchild['href'].'">'.$grandchild['name'].'</a>';
                                echo '</li>';
                            }

                            }
                            echo '</ul></li>';
                }
                else {
                echo '<li><a href="'.$category['href'].'">';
                        echo $category['name'] . '</a></li>';
                }

                }?>

            </ul>
            </li>


            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
