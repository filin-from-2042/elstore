
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
