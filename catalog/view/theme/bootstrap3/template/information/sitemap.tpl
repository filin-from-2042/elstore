<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container">
    <div class="row">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- top -->
            <?php if ($content_top) { ?>
                <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <h1><?php echo $heading_title; ?></h1>
                    <ul class="list-unstyled">
                        <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                        <li>
                            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                            <ul class="list-unstyled">
                                <li>&nbsp;&nbsp;<a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                                <li>&nbsp;&nbsp;<a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                                <li>&nbsp;&nbsp;<a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                                <li>&nbsp;&nbsp;<a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
                                <li>&nbsp;&nbsp;<a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                            </ul>
                        </li>
                        <li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
                        <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                        <li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
                        <li>
                            <?php echo $text_information; ?>
                            <ul class="list-unstyled">
                                <?php foreach ($informations as $information) { ?>
                                    <li>&nbsp;&nbsp;<a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                                <?php } ?>
                                <li>&nbsp;&nbsp;<a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                            </ul>
                        </li>
                    </ul>
                    <br />
                    <ul class="list-unstyled">
                        <?php foreach ($categories as $category_1) { ?>
                            <li>
                                <a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
                                <?php if ($category_1['children']) { ?>
                                    <ul class="list-unstyled">
                                        <?php foreach ($category_1['children'] as $category_2) { ?>
                                            <li>&nbsp;&nbsp;<a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                                            <?php if ($category_2['children']) { ?>
                                                <ul class="list-unstyled">
                                                <?php foreach ($category_2['children'] as $category_3) { ?>
                                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                                                <?php } ?>
                                                </ul>
                                            <?php } ?>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                <?php } ?>
                            </li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
            <br />
            <!-- bottom -->
            <?php if ($content_bottom) { ?>
                <div id="bottom" class="row"><div class="<?php echo $bootstrap->bottom; ?>"><?php echo $content_bottom; ?></div></div>
            <?php } ?>
        </div>
        <!-- left -->
        <?php if ($column_left) { ?>
            <div id="left" class="<?php echo $bootstrap->left; ?>"><?php echo $column_left; ?></div>
        <?php } ?>
        <!-- right -->
        <?php if ($column_right) { ?>
            <div id="right" class="<?php echo $bootstrap->right; ?>"><?php echo $column_right; ?></div>
        <?php } ?>
    </div>
</div>
<!-- footer -->
<?php echo $footer; ?>
</body>
</html>