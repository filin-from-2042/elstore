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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset>
                    <legend><?php echo $text_password; ?></legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                        <div class="col-sm-10">
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Введите новый пароль" id="input-password" class="form-control">
                            <?php if ($error_password) { ?>
                            <span class="alert alert-danger"><?php echo $error_password; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                        <div class="col-sm-10">
                            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="Повторите новый пароль" id="input-confirm" class="form-control">
                            <?php if ($error_confirm) { ?>
                            <span class="alert alert-danger"><?php echo $error_confirm; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons clearfix">
                    <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                    <div class="pull-right">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary">
                    </div>
                </div>
            </form>


        </div>
        <?php if ($column_right){ ?>
        <aside class="col-sm-3">
            <?php echo $column_right; ?>
        </aside>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>