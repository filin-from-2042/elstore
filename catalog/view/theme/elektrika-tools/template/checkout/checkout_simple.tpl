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
                            <div class="form-group">
                                <label class="control-label" for="input-payment-email">Комментарий</label>
                                <textarea name="comment" rows="8" class="form-control" id="input-payment-comment"></textarea>
                                <div class="alert alert-info-sub" role="alert">Оставьте комментарий или наименование вашей организации и мы вышлем Вам счет</div>
                            </div>
                        </fildset>
                        <? if($total) { ?>
                        <div class="cartTotal">
                            <legend>Итого</legend>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td class="text-center">Товар</td>
                                        <td class="text-left">Количество</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($products as $product) { ?>
                                    <tr>
                                        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
                                        <td class="text-left"><?php echo $product['quantity']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="total pull-right">
                                <span class="text">Сумма заказа: </span><span class="value" id="total_price_id"><?=$total['text']?></span>
                            </div>
                        </div>
                        <? } ?>
                    </div>
                    <div class="col-sm-6">
                        <div class="shipping-methods">
                            <legend>Доставка</legend>
                            <!-- Nav tabs -->
                            <ul class="nav nav-pills" role="tablist">
                                <li role="presentation" class="active"><a href="#pickup" aria-controls="pickup" role="tab" data-toggle="tab" class="transition-slow"><img class="pickup-black" src="/catalog/view/theme/elektrika-tools/image/pickup-black.png"><img class="pickup-white" src="/catalog/view/theme/elektrika-tools/image/pickup-white.png"><span class="text-delivery">Самовывоз</span></a></li>
                                <li role="presentation"><a href="#dellin" aria-controls="dellin" role="tab" data-toggle="tab" class="transition-slow"><img src="/catalog/view/theme/elektrika-tools/image/dellin-logo.svg"><span class="text-delivery">Деловые линии</span></a></li>
                                <li role="presentation" class="rus-post"><a href="#ruspost" aria-controls="ruspost" role="tab" data-toggle="tab" class="transition-slow"><img src="/catalog/view/theme/elektrika-tools/image/ruspost-logo.png"><span class="text-delivery">Почта России</span></a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="pickup">
                                    <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%3A2aecac75b358a6d10ac59051e500a2345a3538f1563e36dd85f799fdc16535f9&amp;source=constructor" width="100%" height="390" frameborder="0"></iframe>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="dellin">
                                    <iframe
                                            src="https://widgets.dellin.ru/calculator/?group11=disabled&derival_point=7101700100000000000000000&derival_to_door=off&arrival_to_door=on&disabled_calculation=off&insurance=0&package=1"
                                            width="332"
                                            height="390"
                                            scrolling="no"
                                            frameborder="0">
                                    </iframe>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="ruspost">
                                    <div class="row">
                                        <div class="form-group col-sm-9">
                                            <label for="name-from">Город</label>
                                            <input value="Новомосковск" disabled type="text" id="name-from" name="name-from" class="form-control">
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <label for="from">Индекс<span class="required text-danger">*</span></label>
                                            <input type="text" id="index-from" name="index-from" value="301650" disabled class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-9">
                                            <label for="to_name">Город</label>
                                            <div class="form-group to-group">
                                                <input type="text" id="name-to" name="name-to" class="form-control">
                                                <div class="tips-list"></div>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <label for="to_index">Индекс<span class="required text-danger">*</span></label>
                                            <input type="text" id="index-to" name="index-to" class="form-control">
                                        </div>
                                    </div><?/*
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <label for="declared-value">Объявленная стоимость</label>
                                            <input type="text" id="declared-value" name="declared-value" class="form-control">
                                        </div>
                                    </div>*/?>
                                    <div class="well cost"></div>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-default" id="calc-pship">Рассчитать</button>
                                        </div>
                                    </div>
                                    <div>*Стоимость доставки ориентировочная. Точную стоимость можно уточнить в отделении транспортной компании</div>
                                    <div>Наш магазин использует технологию <a href="http://www.postcalc.ru">http://www.postcalc.ru</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="alert alert-info" role="alert">После отправки с Вами сразу же свяжется наш специалист по указанному телефонному номеру для уточнения деталей заказа</div>
                <div class="buttons">
                    <div class="right">
                        <input type="submit" class="btn btn-primary" value="Отправить заказ" id="button-create-order" />
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
    function selectCityTooltip(name, postcode)
    {
        var tipsList = $('#ruspost .tips-list');
        tipsList.removeClass('filled');
        tipsList.empty();
        $('#name-to').val(name);
        $('#index-to').val(postcode);
    }
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
                data:'telephone='+$('#input-payment-telephone').val()+"&email="+$('#input-payment-email').val()+"&comment="+$('#input-payment-comment').val(),
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
        $(document).mouseup(function (e) {
            var $tipsContainer = $('#ruspost .tips-list');
            $tipsContainer.is(e.target) || 0 !== $tipsContainer.has(e.target).length || $tipsContainer.removeClass('filled');
        });
        // поисковой запрос при вводе в строку поиска
        jQuery('#ruspost input[name=\'name-to\']').on('input',function(e){
            var stext = $(this).val();
            var tipsContainer = $('#ruspost .tips-list');
            tipsContainer.empty();
            if(stext.length < 2) return;
            $.ajax({
                url: 'index.php?route=checkout/checkout_simple/getCities',
                type: 'POST',
                data: {city_search_name:stext},
                success: function(data) {
                    if(data)
                    {
                        data = JSON.parse(data);
                        for(var city in data)
                        {
                            tipsContainer.append('<div class="tip" data-pindex="'+data[city].post_code+'"><div class="city-name">'+data[city].city_name+'</div><div class="region-name">'+data[city].region_name+'</div></div>');
                        }
                        tipsContainer.addClass('filled');
                    }
                }
            });
        });

        // обработка нажатия стрелок вверх,вниз и ввод в поле поиска
        $('#ruspost input[name=\'name-to\']').on('keydown', function(e) {
            var tipsList = $('#ruspost .tips-list');
            var active = tipsList.find('div.tip.active');
            // up
            if (e.keyCode == 38) {
                var nextActive;
                if(active.length > 0)
                {
                    active.removeClass('active');
                    nextActive = active.prev('div.tip');
                }else return;

                if(nextActive.length > 0)
                {
                    nextActive.addClass('active');

                    var currListScrollTop = tipsList.scrollTop();
                    var listHeight = tipsList.height();
                    var actElementOffset = nextActive.position().top;

                    if( actElementOffset < 0 )
                    {
                        tipsList.scrollTop(currListScrollTop + actElementOffset);
                    }
                }
            }
            // down
            if (e.keyCode == 40) {
                var nextActive;
                if(active.length > 0)
                {
                    if(active.is(tipsList.find('div.tip:last'))) return;
                    active.removeClass('active');
                    nextActive = active.next('div.tip')
                }else{
                    nextActive = tipsList.find('div.tip:first')
                }
                if(nextActive.length > 0)
                {
                    nextActive.addClass('active');
                }else{
                    nextActive.next().addClass('active');
                }

                var currListScrollTop = tipsList.scrollTop();
                var listHeight = tipsList.height();
                var actElementOffset = nextActive.position().top;

                if( listHeight <= actElementOffset)
                {
                    var diff = actElementOffset -  listHeight
                    tipsList.scrollTop(diff + currListScrollTop  + nextActive.height());
                }
            }
            // enter
            if (e.keyCode == 13) {
                e.preventDefault();
                if(active.length>0){
                    selectCityTooltip(active.find('.city-name').text(),active.attr('data-pindex'));
                }
            }
        });
        $('body').on('click','#ruspost .tips-list .tip',function(e){
            var $active = $(this);
            selectCityTooltip($active.find('.city-name').text(),$active.attr('data-pindex'));
        });
        $('#ruspost #calc-pship').on('click',function(e){
            e.preventDefault();
            var $calcBtn = $('#ruspost #calc-pship');
            var declaredValue = Number.parseInt($('#ruspost #declared-value').val()) || 0;
            var indexFrom = $('#ruspost #index-from').val();
            var $indexTo = $('#ruspost #index-to');
            var indexTo = $indexTo.val();
            if(!indexTo || Number.parseInt(indexTo) < 101000){
                $indexTo.closest('.form-group').addClass('has-error');
                return;
            }
            $indexTo.closest('.form-group').removeClass('has-error');
            $.ajax({
                url: 'http://api.postcalc.ru',
                type: 'POST',
                dataType: 'jsonp',
                data: {
                    st:'elektrika-nmk.ru',
                    ml:'iosif.dobrynin@yandex.ru',
                    f:indexFrom,
                    t:indexTo,
                    w:500,
                    v:declaredValue,
                    o:'json'
                },
                beforeSend:function(){
                    $calcBtn.prepend('<i class="fa fa-spinner fa-spin"></i>');
                },
                success: function(data) {
                    try{
                        $('#ruspost .cost').html('Стоимость <strong class="price-color">'+data.Отправления.ПростаяБандероль.Доставка+' Рублей</strong>, Срок <strong class="price-color">'+data.Отправления.ПростаяБандероль.СрокДоставки+' Дней</strong>').fadeIn();
                    }finally{
                        $calcBtn.find('.fa-spinner').remove();
                    }
                }
            });
        });

    });
</script>
