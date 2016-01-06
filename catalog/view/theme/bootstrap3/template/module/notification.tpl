<!-- NOTIFICATION -->
<?php if (!empty($success)) { notification('success', $success); } ?>
<?php if (!empty($attention)) { notification('warning', $attention); } ?>
<?php if (!empty($error_warning)) { notification('danger', $error_warning); } ?>

<?php function notification($type, $message) { ?>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="alert alert-<?php echo $type; ?> alert-dismissable" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <?php echo $message; ?>
            </div>
        </div>
    </div>
<?php } ?>