<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    Каталог
</button>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bhoechie-tab-container">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 bhoechie-tab-menu">
                                <div class="list-group">

                                    <?php foreach($categories as $k=>$category){
                                     echo '<a href="#" class="list-group-item  '. ($k?'':'active') . '  text-center">';
                                     echo  $category['name'] . '</a>';
                                    }
                                    ?>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 bhoechie-tab">
                                <!-- flight section -->

                                <?php foreach($categories as $k=>$category){
                                echo '<div class="bhoechie-tab-content ' . ($k?'':'active') . ' ">';
                                    if (isset($category['children'])){
                                      foreach( $category['children'] as $child){
                                    echo '<div class="col-sm-12 col-md-12 col-lg-12">';

                                    echo '<a href="' . $child['href'] . '" >';
                                    echo '<h3 id="category-parent">' .$child['name'] .'</h3>';
                                    echo '<div class="col-sm-6 hidden-xs">';
                                                echo '<img class="img-responsive" src="'. $child['thumb'] .'" />';
                                    echo '</div>';

                                    echo '</a>';
                                        if (isset($child['children']) && !empty($child['children']))
                                        {
                                            echo '<div class="col-sm-6 subcategories" >';
                                            foreach($child['children'] as $grchild)
                                            {
                                                echo '<a href="' . $grchild['href'] . '" ><i class="fa fa-angle-right"></i>' .$grchild['name'] . '</a><br>';
                                                echo '<div class="clearfix"></div> ';

                                            }
                                            echo '</div> ';
                                        echo '<div class="clearfix"></div> ';
                                        }
                                        else
                                        {
                                            echo '<div  id="catdesc" class="col-sm-6 hidden-xs" >';
                                            echo '<p>';
                                            if (isset($child['desc']))echo html_entity_decode ($child['desc'])    ;
                                            echo '</p>';
                                            echo '</div> ';
                                            echo '<div class="clearfix"></div> ';
                                        }
                                    echo '</div>';
                                    }
                                    }

                                echo '</div>';
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
            e.preventDefault();
            $(this).siblings('a.active').removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
            $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
        });
    });
</script>