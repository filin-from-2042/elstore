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
        <div class="col-sm-3">
            <?php echo $column_left; ?>
        </div>
        <?php } ?>
        <div id="content" class="<?=$class?>"><?php echo $content_top; ?>

          <h1><?php echo $heading_title; ?></h1>
            <form action="index.php?r=checkout/checkout_simple/create_order">
                <div class="row">
                    <div class="col-sm-6">
                        <fildset>
                            <legend>Контактная информация</legend>
                            <div class="form-group">
                                <label class="control-label" for="input-payment-telephone">Телефон<span class="required text-danger">*</span></label>
                                <input type="text" name="telephone" value="<?=$telephone?>" class="form-control" id="input-payment-telephone" placeholder="Контактный телефон"  />
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-payment-email">E-mail<span class="required text-danger">*</span></label>
                                <input type="text" name="email" value="<?=$email?>" class="form-control" id="input-payment-email" placeholder="E-mail"  />
                            </div>
                        </fildset>
                        <div class="buttons">
                            <div class="right">
                                <input type="submit" class="btn btn-primary" value="Отправить заказ" id="button-create-order" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
          <?php echo $content_bottom; ?>
        </div>
        <?php if ($column_right){ ?>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>
<script>
    jQuery(function($) {

        function orderNotification (type, msg) {
            return $('<div class="row alert-container"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><div class="alert alert-dismissable alert-' + (type || 'info') + '" role="alert"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + (msg || '<strong class="glyphicon glyphicon-exclamation-sign"></strong>') + '</div></div></div>').find('a').addClass('alert-link').end();
        };

        /** Confirm */
        $('#button-create-order').click(function(e) {
            e.preventDefault();
            $.ajax({
                async: false,
                url: 'index.php?route=checkout/checkout_simple/create_order',
                data:'telephone='+$('#input-payment-telephone').val()+"&email="+$('#input-payment-email').val(),
                type: 'post',
                context: this,
                beforeSend:function(){ $('.alert-container').remove()},
                success: function(responce) {
                    var json = JSON.parse(responce);
                    if (json['error']) {
                            if (json.error['telephone']) $('#input-payment-telephone').after(orderNotification('danger', json.error['telephone']));
                            if (json.error['email']) $('#input-payment-email').after(orderNotification('danger', json.error['email']));
                    }else if(json['success_url']){ location = json['success_url']};
                }
            });
        });
    });
</script>
