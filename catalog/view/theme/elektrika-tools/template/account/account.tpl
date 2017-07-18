<?php echo $header; ?>
<div class="container">

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div class="row">
        <div class="col-sm-12">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                </li>
                <?php } ?>
            </ul>
        </div>
        <?php if ($column_left){ ?>
        <aside class="col-sm-3">
            <?php echo $column_left; ?>
        </aside>
        <?php } ?>
        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>
            <?php if ($success) { ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
            <?php } ?>
            <h2><?php echo $text_my_account; ?></h2>
            <div class="content">
                <ul class="list-unstyled">
                    <li><a href="<?php echo $edit; ?>"><i class="fa fa-angle-right"></i><?php echo $text_edit; ?></a></li>
                    <li><a href="<?php echo $password; ?>"><i class="fa fa-angle-right"></i><?php echo $text_password; ?></a></li>
                    <li><a href="<?php echo $address; ?>"><i class="fa fa-angle-right"></i><?php echo $text_address; ?></a></li>
                    <li><a href="<?php echo $wishlist; ?>"><i class="fa fa-angle-right"></i><?php echo $text_wishlist; ?></a></li>
                </ul>
            </div>
            <h2><?php echo $text_my_orders; ?></h2>
            <div class="content">
                <ul class="list-unstyled">
                    <li><a href="<?php echo $order; ?>"><i class="fa fa-angle-right"></i><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $download; ?>"><i class="fa fa-angle-right"></i><?php echo $text_download; ?></a></li>
                    <?php if ($reward) { ?>
                    <li><a href="<?php echo $reward; ?>"><i class="fa fa-angle-right"></i><?php echo $text_reward; ?></a></li>
                    <?php } ?>
                    <li><a href="<?php echo $return; ?>"><i class="fa fa-angle-right"></i><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $transaction; ?>"><i class="fa fa-angle-right"></i><?php echo $text_transaction; ?></a></li>
                </ul>
            </div>
            <h2><?php echo $text_my_newsletter; ?></h2>
            <div class="content">
                <ul class="list-unstyled">
                    <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-angle-right"></i><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>

        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>