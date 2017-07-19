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
            <?if($downloads) { ?>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <td class="text-right"><?php echo $text_order; ?></td>
                        <td class="text-left"><?php echo $text_size; ?></td>
                        <td class="text-left"><?php echo $text_name; ?></td>
                        <td class="text-left"><?php echo $text_date_added; ?></td>
                        <td class="text-right"><?php echo $text_remaining; ?></td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($downloads as $download) { ?>
                        <td class="text-right"><?php echo $download['order_id']; ?></td>
                        <td class="text-left"><?php echo $download['size']; ?></td>
                        <td class="text-left"><?php echo $download['name']; ?></td>
                        <td class="text-left"><?php echo $download['date_added']; ?></td>
                        <td class="text-right"><?php echo $download['remaining']; ?></td>
                        <td>
                            <?php if ($download['remaining'] > 0) { ?>
                            <a href="<?php echo $download['href']; ?>" class="btn btn-icon"  title="" data-toggle="tooltip" data-original-title="<?php echo $button_download; ?>"><i class="fa fa-download" aria-hidden="true"></i></a>
                            <?php } ?>
                        </td>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
            <?php } ?>
            <div class="pagination"><?php echo $pagination; ?></div>
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