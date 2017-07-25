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
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><?php echo $error_warning; ?></div>
            <?php } ?>

            <h1><?php echo $heading_title; ?></h1>
            <h2><?php echo $text_address_book; ?></h2>

            <?php foreach ($addresses as $result) { ?>
            <div class="content">
                <table class="table table-bordered table-hover">
                    <tr>
                        <td class="text-left"><?php echo $result['address']; ?></td>
                        <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-info"><?php echo $button_delete; ?></a></td>
                    </tr>
                </table>
            </div>
            <?php } ?>
            <div class="buttons clearfix">
                <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                <div class="pull-right"><a href="<?php echo $insert; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
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