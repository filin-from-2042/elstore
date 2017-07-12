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
                    <?php if(isset($breadcrumb['href'])){ ?>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php }else{ ?>
                    <span ><?php echo $breadcrumb['text']; ?></span>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul>
        </div>
        <?php if ($column_left){ ?>
        <div class="col-sm-3">
            <?php echo $column_left; ?>
        </div>
        <?php } ?>

        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <?php if ($categories) { ?>
                <p>
                    <b><?php echo $text_index; ?></b>
                    <?php foreach ($categories as $category) { ?>
                    &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
                    <?php } ?>
                </p>
                <?php foreach ($categories as $category) { ?>
                    <div class="manufacturer-list">
                        <div class="manufacturer-heading"><span id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></span></div>
                        <div class="manufacturer-content">
                            <?php if ($category['manufacturer']) { ?>
                                <div class="row">
                                    <?php for ($i = 0; $i < count($category['manufacturer']);$i++) { ?>
                                        <?php if (isset($category['manufacturer'][$i])) { ?>
                                            <div class="col-sm-3"><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><i class="fa fa-angle-right"></i><?php echo $category['manufacturer'][$i]['name']; ?></a></div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            <?php } else { ?>
            <div class="content"><?php echo $text_empty; ?></div>
            <div class="buttons">
                <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>

          <?php echo $content_bottom; ?></div>

        <?php if ($column_right){ ?>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
        <?php } ?>
</div>
<?php echo $footer; ?>