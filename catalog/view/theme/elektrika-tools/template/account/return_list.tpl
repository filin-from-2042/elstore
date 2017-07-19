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
            <h1><?php echo $heading_title; ?></h1>
            <?php if ($returns) { ?>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <td class="text-right"><?php echo $text_return_id; ?></td>
                        <td class="text-left"><?php echo $text_status; ?></td>
                        <td class="text-left"><?php echo $text_date_added; ?></td>
                        <td class="text-right"><?php echo $text_order_id; ?></td>
                        <td class="text-left"><?php echo $text_customer; ?></td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($returns as $return) { ?>
                        <tr>
                            <td class="text-right">#<?php echo $return['return_id']; ?></td>
                            <td class="text-left"><?php echo $return['status']; ?></td>
                            <td class="text-left"><?php echo $return['date_added']; ?></td>
                            <td class="text-right"><?php echo $return['order_id']; ?></td>
                            <td class="text-left"><?php echo $return['name']; ?></td>
                            <td><a href="<?php echo $return['href']; ?>" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="<?php echo $button_view; ?>"><i class="fa fa-eye"></i></a></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
            <div class="pagination"><?php echo $pagination; ?></div>
            <?php } else { ?>
            <div class="content"><?php echo $text_empty; ?></div>
            <?php } ?>
            <div class="buttons">
                <div class="text-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>