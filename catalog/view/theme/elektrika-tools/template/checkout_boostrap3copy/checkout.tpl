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
            <div id="checkout-steps" class="panel-group">
                <?php if (!$logged) { ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Шаг 1: способ оформления заказа</h4>
                    </div>
                    <div id="checkout" class="panel-collapse collapse">
                        <div class="checkout-content panel-body"></div>
                    </div>
                </div>
                <?php }?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <span>Шаг 2: Контактные данные</span>
                            <a class="step-back btn btn-xs btn-default accordion-toggle pull-right" href="#payment-address" title="<?php echo $text_modify; ?>" data-toggle="collapse" data-parent="#checkout-steps" disabled><?php echo $text_modify; ?></a>
                        </h4>
                    </div>
                    <div id="payment-address" class="panel-collapse collapse">
                        <div class="checkout-content panel-body"></div>
                    </div>
                </div>
                <?php if ($shipping_required) { ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <span><?php echo $text_checkout_shipping_address; ?></span>
                            <a class="step-back btn btn-xs btn-default accordion-toggle pull-right" href="#shipping-address" title="<?php echo $text_modify; ?>" data-toggle="collapse" data-parent="#checkout-steps" disabled><?php echo $text_modify; ?></a>
                        </h4>
                    </div>
                    <div id="shipping-address" class="panel-collapse collapse">
                        <div class="checkout-content panel-body"></div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <span><?php echo $text_checkout_shipping_method; ?></span>
                            <a class="step-back btn btn-xs btn-default accordion-toggle pull-right" href="#shipping-method" title="<?php echo $text_modify; ?>" data-toggle="collapse" data-parent="#checkout-steps" disabled><?php echo $text_modify; ?></a>
                        </h4>
                    </div>
                    <div id="shipping-method" class="panel-collapse collapse">
                        <div class="checkout-content panel-body"></div>
                    </div>
                </div>
                <?php } ?>
                <div class="panel panel-default " style="display: none">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <span><?php echo $text_checkout_payment_method; ?></span>
                            <a class="step-back btn btn-xs btn-default accordion-toggle pull-right" href="#payment-method" title="<?php echo $text_modify; ?>" data-toggle="collapse" data-parent="#checkout-steps" disabled><?php echo $text_modify; ?></a>
                        </h4>
                    </div>
                    <div id="payment-method" class="panel-collapse collapse">
                        <div class="checkout-content panel-body"></div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <span><?php echo $text_checkout_confirm; ?></span>
                        </h4>
                    </div>
                    <div id="confirm" class="panel-collapse collapse">
                        <div class="checkout-content panel-body"></div>
                    </div>
                </div>
            </div>



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
    // STEP SWITCH
    $.fn.stepSwitch = function() {
        var $this = $(this);

        $this.closest('div.panel-group').find('div.panel-collapse.in').collapse('hide');
        $this.closest('div.panel-collapse').collapse('show');
        return this;
    };

    // STEP HTML
    $.fn.stepHtml = function(html) {
        $(this).children('div.checkout-content').html(html);

        return this;
    };

    // STEP TITLE
    $.fn.stepTitle = function(title) {
        $(this).siblings('div.panel-heading').find('h4.panel-title>span').html(title);

        return this;
    };

    // STEP LINKS
    var steps = [];

    $.fn.stepLinks = function() {
        $('div.panel-heading a.step-back').state('disabled')

        if (steps.length) {
            for (var i = 0; i < steps.length; i++) {
                $(steps[i]).siblings('div.panel-heading').find('a.step-back').state(false);
            }
        }

        steps.push('#' + this[0].id);

        return this;
    };

    notification = function(type, msg) {
        return $('<div class="row"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><div class="alert alert-dismissable alert-' + (type || 'info') + '" role="alert"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + (msg || '<strong class="glyphicon glyphicon-exclamation-sign"></strong>') + '</div></div></div>').find('a').addClass('alert-link').end();
    };

    // STEP WARNING
    $.fn.stepWarning = function(msg) {
        $(this).closest('div.checkout-content').prepend(notification('danger', msg)).scrollBody();

        return this;
    }

    /**
     * SCROLL BODY JQUERY PLUGIN
     * @param {string|number} [duration="slow"] slow|fast|ms.
     * @returns {object}
     */
    $.fn.scrollBody = function(duration) {
        var scrollTop = Math.max($('html, body').scrollTop(), $('body').scrollTop());
        var top = $(this).offset().top;

        if (top < scrollTop || top > scrollTop + $(window).height()) {
            $('html, body').animate({ scrollTop: top }, (duration || 'slow'));
        }

        return this;
    };

    /**
     * FORM INPUT STATE JQUERY PLUGIN
     * @param {string|boolean} [state] success|warning|error|none|disabled|false.
     * @returns {object}
     */
    $.fn.state = function(state) {
        var $this = $(this);

        $this.removeClass('sr-only has-success has-warning has-error').attr('disabled', false);

        if (state === 'none') {
            $this.addClass('sr-only');
        } else if(state === 'success' || state === 'warning' || state === 'error') {
            $this.addClass('has-' + state);
        } else if(state === 'disabled') {
            $this.attr('disabled', true);
        }

        return this;
    };

    // BIND SCROLL TO STEP
    $('#checkout-steps').on('shown.bs.collapse', function(e) {
        $(e.target.parentNode).scrollBody('fast');
    });

    // BIND STEP BACK
    $('#checkout-steps a.step-back').click(function(e) {
        e.preventDefault();

        var index = $.inArray(this.hash, steps);

        if (index !== -1) steps.length = index;

        $(this.hash).stepLinks().stepSwitch();
    });

    // BIND INPUT HAS ERROR
    $('#checkout-steps div.checkout-content').on('click', 'div.form-group.has-error :input, div.form-group.has-warning :input', function() {
        $(this).closest('div.form-group').state(false);
    });

    /** AJAX SETUP */
    $.ajaxSetup({
        type: 'post',
        beforeSend: function() {
            if ($(this).hasClass('btn')) {
                $(this)
                        .button('loading')
                        .closest('div.checkout-content')
                        .find('div.row:has([role="alert"]), [role="status"]').remove().end()
                        .find('').remove();
            }
        }
    });

    $('body')
            .ajaxStop(function() {
                $('#checkout-steps div.checkout-content .btn[data-loading-text]').button('reset');
            })
            .ajaxError(function() {
                $('#checkout-steps div.checkout-content .btn[data-loading-text]').button('reset');
            });

    /** CHECKOUT STEPS **/

    /** load */
    <?php if (!$logged) { ?>
        $.ajax({
            async: true,
            url: 'index.php?route=checkout/login',
            dataType: 'html',
            success: function(html) {
                $('#checkout')
                        .stepHtml(html)
                        .stepSwitch()
                        .stepLinks();
            }
        });
    <?php } else { ?>
        $.ajax({
            async: true,
            url: 'index.php?route=checkout/payment_address',
            dataType: 'html',
            success: function(html) {
                $('#payment-address')
                        .stepHtml(html)
                        .stepSwitch()
                        .stepLinks();
            }
        });
    <?php } ?>

    /**
     * Step 1
     * #checkout
     * login.tpl #button-login
     */
    $('#checkout').on('click', '#button-login', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/login/validate',
            data: $('input[name="email"], input[name="password"]', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (json.error) {
                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                        $(this).button('reset');
                    }
                }
            }
        });
    });

    /**
     * Step 1
     * #checkout
     * login.tpl #button-account-register
     */
    $('#checkout').on('click', '#button-account-register', function() {
        $('#payment-address').stepTitle('<?php echo $text_checkout_account; ?>');

        $.ajax({
            async: false,
            url: 'index.php?route=checkout/register',
            dataType: 'html',
            context: this,
            success: function(html) {
                $('#payment-address')
                        .stepHtml(html)
                        .stepLinks()
                        .stepSwitch();
            }
        });
    });

    /**
     * Step 1
     * #checkout
     * login.tpl #button-account-guest
     */
    $('#checkout').on('click', '#button-account-guest', function() {
        $('#payment-address').stepTitle('<?php echo $text_checkout_payment_address; ?>');

        $.ajax({
            async: false,
            url: 'index.php?route=checkout/guest',
            dataType: 'html',
            context: this,
            success: function(html) {
                $('#payment-address')
                        .stepHtml(html)
                        .stepLinks()
                        .stepSwitch();
            }
        });
    });

    /**
     * Step 2
     * #payment-address
     * register.tpl #button-register
     */
    $('#payment-address').on('click', '#button-register', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/register/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                <?php if ($shipping_required) { ?>
                        if ($('input[name="shipping_address"]:checked', this.form).val()) {
                            $.ajax({
                                async: false,
                                url: 'index.php?route=checkout/shipping_method',
                                dataType: 'html',
                                success: function(html) {
                                    steps.push('#shipping-address');

                                    $('#shipping-method')
                                            .stepHtml(html)
                                            .stepLinks()
                                            .stepSwitch();

                                    $.ajax({
                                        async: true,
                                        url: 'index.php?route=checkout/shipping_address',
                                        dataType: 'html',
                                        success: function(html) {
                                            $('#shipping-address').stepHtml(html);
                                        }
                                    });
                                }
                            });
                        } else {
                            $.ajax({
                                async: false,
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                    $('#shipping-address')
                                            .stepHtml(html)
                                            .stepLinks()
                                            .stepSwitch();
                                }
                            });
                        }
                    <?php } else { ?>
                        $.ajax({
                            async: false,
                            url: 'index.php?route=checkout/payment_method',
                            dataType: 'html',
                            success: function(html) {
                                $('#payment-method')
                                        .stepHtml(html)
                                        .stepLinks()
                                        .stepSwitch();
                            }
                        });
                    <?php } ?>

                    $.ajax({
                        async: true,
                        url: 'index.php?route=checkout/payment_address',
                        dataType: 'html',
                        success: function(html) {
                            $('#payment-address')
                                    .stepHtml(html)
                                    .stepTitle('<?php echo $text_checkout_payment_address; ?>');
                        }
                    });
                } else if (json.error) {
                    if (json.error['firstname']) $('input[name="firstname"]', '#payment-address').after(notice('warning', json.error['firstname'])).closest('div.form-group').state('error');
                    if (json.error['lastname']) $('input[name="lastname"]', '#payment-address').after(notice('warning', json.error['lastname'])).closest('div.form-group').state('error');
                    if (json.error['email']) $('input[name="email"]', '#payment-address').after(notice('warning', json.error['email'])).closest('div.form-group').state('error');
                    if (json.error['telephone']) $('input[name="telephone"]', '#payment-address').after(notice('warning', json.error['telephone'])).closest('div.form-group').state('error');
                    if (json.error['company_id']) $('input[name="company_id"]', '#payment-address').after(notice('warning', json.error['company_id'])).closest('div.form-group').state('error');
                    if (json.error['tax_id']) $('input[name="tax_id"]', '#payment-address').after(notice('warning', json.error['tax_id'])).closest('div.form-group').state('error');
                    if (json.error['address_1']) $('input[name="address_1"]', '#payment-address').after(notice('warning', json.error['address_1'])).closest('div.form-group').state('error');
                    if (json.error['city']) $('input[name="city"]', '#payment-address').after(notice('warning', json.error['city'])).closest('div.form-group').state('error');
                    if (json.error['postcode']) $('input[name="postcode"]', '#payment-address').after(notice('warning', json.error['postcode'])).closest('div.form-group').state('error');
                    if (json.error['country']) $('select[name="country_id"]', '#payment-address').after(notice('warning', json.error['country'])).closest('div.form-group').state('error');
                    if (json.error['zone']) $('select[name="zone_id"]', '#payment-address').after(notice('warning', json.error['zone'])).closest('div.form-group').state('error');
                    if (json.error['password']) $('input[name="password"]', '#payment-address').after(notice('warning', json.error['password'])).closest('div.form-group').state('error');
                    if (json.error['confirm']) $('input[name="confirm"]', '#payment-address').after(notice('warning', json.error['confirm'])).closest('div.form-group').state('error');

                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    } else {
                        $('div.form-group.has-error:first', this.form).scrollBody();
                    }
                }
            }
        });
    });

    /**
     * Step 2
     * #payment-address
     * payment_address.tpl #button-payment-address
     */
    $('#payment-address').on('click', '#button-payment-address', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/payment_address/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                <?php if ($shipping_required) { ?>
                        $.ajax({
                            async: false,
                            url: 'index.php?route=checkout/shipping_address',
                            dataType: 'html',
                            success: function(html) {
                                $('#shipping-address')
                                        .stepHtml(html)
                                        .stepLinks()
                                        .stepSwitch();
                            }
                        });
                    <?php } else { ?>
                        $.ajax({
                            async: false,
                            url: 'index.php?route=checkout/payment_method',
                            dataType: 'html',
                            success: function(html) {
                                $('#payment-method')
                                        .stepHtml(html)
                                        .stepLinks()
                                        .stepSwitch();
                            }
                        });
                    <?php } ?>

                    $.ajax({
                        async: true,
                        url: 'index.php?route=checkout/payment_address',
                        dataType: 'html',
                        success: function(html) {
                            $('#payment-address').stepHtml(html);
                        }
                    });
                } else if (json.error) {
                    if (json.error['firstname']) $('input[name="firstname"]', '#payment-address').after(notice('warning', json.error['firstname'])).closest('div.form-group').state('error');
                    if (json.error['lastname']) $('input[name="lastname"]', '#payment-address').after(notice('warning', json.error['lastname'])).closest('div.form-group').state('error');
                    if (json.error['telephone']) $('input[name="telephone"]', '#payment-address').after(notice('warning', json.error['telephone'])).closest('div.form-group').state('error');
                    if (json.error['company_id']) $('input[name="company_id"]', '#payment-address').after(notice('warning', json.error['company_id'])).closest('div.form-group').state('error');
                    if (json.error['tax_id']) $('input[name="tax_id"]', '#payment-address').after(notice('warning', json.error['tax_id'])).closest('div.form-group').state('error');
                    if (json.error['address_1']) $('input[name="address_1"]', '#payment-address').after(notice('warning', json.error['address_1'])).closest('div.form-group').state('error');
                    if (json.error['city']) $('input[name="city"]', '#payment-address').after(notice('warning', json.error['city'])).closest('div.form-group').state('error');
                    if (json.error['postcode']) $('input[name="postcode"]', '#payment-address').after(notice('warning', json.error['postcode'])).closest('div.form-group').state('error');
                    if (json.error['country']) $('select[name="country_id"]', '#payment-address').after(notice('warning', json.error['country'])).closest('div.form-group').state('error');
                    if (json.error['zone']) $('select[name="zone_id"]', '#payment-address').after(notice('warning', json.error['zone'])).closest('div.form-group').state('error');

                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    } else {
                        $('div.form-group.has-error:first', this.form).scrollBody();
                    }
                }
            }
        });
    });

    /**
     * Step 2
     * #payment-address
     * guest.tpl #button-guest
     */
    $('#payment-address').on('click', '#button-guest', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/guest/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                <?php if ($shipping_required) { ?>
                        if ($('input[name="shipping_address"]:checked', this.form).val()) {
                            $.ajax({
                                async: false,
                                url: 'index.php?route=checkout/shipping_method',
                                dataType: 'html',
                                success: function(html) {
                                    steps.push('#shipping-address');

                                    $('#shipping-method')
                                            .stepHtml(html)
                                            .stepLinks()
                                            .stepSwitch();

                                    $.ajax({
                                        async: true,
                                        url: 'index.php?route=checkout/guest_shipping',
                                        dataType: 'html',
                                        success: function(html) {
                                            $('#shipping-address').stepHtml(html);
                                        }
                                    });
                                }
                            });
                        } else {
                            $.ajax({
                                async: false,
                                url: 'index.php?route=checkout/guest_shipping',
                                dataType: 'html',
                                success: function(html) {
                                    $('#shipping-address')
                                            .stepHtml(html)
                                            .stepLinks()
                                            .stepSwitch();
                                }
                            });
                        }
                    <?php } else { ?>
                        $.ajax({
                            async: false,
                            url: 'index.php?route=checkout/payment_method',
                            dataType: 'html',
                            success: function(html) {
                                $('#payment-method')
                                        .stepHtml(html)
                                        .stepLinks()
                                        .stepSwitch();
                            }
                        });
                    <?php } ?>
                } else if (json.error) {
                    //notification('danger', msg)
                    if (json.error['firstname']) $('input[name="firstname"]', '#payment-address').after(notification('danger', json.error['firstname'])).closest('div.form-group').state('error');
                    if (json.error['lastname']) $('input[name="lastname"]', '#payment-address').after(notification('danger', json.error['lastname'])).closest('div.form-group').state('error');
                    if (json.error['email']) $('input[name="email"]', '#payment-address').after(notification('danger', json.error['email'])).closest('div.form-group').state('error');
                    if (json.error['telephone']) $('input[name="telephone"]', '#payment-address').after(notification('danger', json.error['telephone'])).closest('div.form-group').state('error');
                    if (json.error['company_id']) $('input[name="company_id"]', '#payment-address').after(notification('danger', json.error['company_id'])).closest('div.form-group').state('error');
                    if (json.error['tax_id']) $('input[name="tax_id"]', '#payment-address').after(notification('danger', json.error['tax_id'])).closest('div.form-group').state('error');
                    if (json.error['address_1']) $('input[name="address_1"]', '#payment-address').after(notification('danger', json.error['address_1'])).closest('div.form-group').state('error');
                    if (json.error['city']) $('input[name="city"]', '#payment-address').after(notification('danger', json.error['city'])).closest('div.form-group').state('error');
                    if (json.error['postcode']) $('input[name="postcode"]', '#payment-address').after(notification('danger', json.error['postcode'])).closest('div.form-group').state('error');
                    if (json.error['country']) $('select[name="country_id"]', '#payment-address').after(notification('danger', json.error['country'])).closest('div.form-group').state('error');
                    if (json.error['zone']) $('select[name="zone_id"]', '#payment-address').after(notification('danger', json.error['zone'])).closest('div.form-group').state('error');

                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    } else {
                        $('div.form-group.has-error:first', this.form).scrollBody();
                    }

                    $(this).button('reset');
                }
            }
        });
    });

    /**
     * Step 3
     * #shipping-address
     * shipping_address.tpl #button-shipping-address
     */
    $('#shipping-address').on('click', '#button-shipping-address', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/shipping_address/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                    $.ajax({
                        async: false,
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
                            $('#shipping-method')
                                    .stepHtml(html)
                                    .stepLinks()
                                    .stepSwitch();

                            $.ajax({
                                async: true,
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                    $('#shipping-address').stepHtml(html);
                                }
                            });
                        }
                    });

                    $.ajax({
                        url: 'index.php?route=checkout/payment_address',
                        dataType: 'html',
                        success: function(html) {
                            $('#payment-address').stepHtml(html);
                        }
                    });
                } else if (json.error) {
                    if (json.error['firstname']) $('input[name="firstname"]', '#shipping-address').after(notice('warning', json.error['firstname'])).closest('div.form-group').state('error');
                    if (json.error['lastname']) $('input[name="lastname"]', '#shipping-address').after(notice('warning', json.error['lastname'])).closest('div.form-group').state('error');
                    if (json.error['email']) $('input[name="email"]', '#shipping-address').after(notice('warning', json.error['email'])).closest('div.form-group').state('error');
                    if (json.error['telephone']) $('input[name="telephone"]', '#shipping-address').after(notice('warning', json.error['telephone'])).closest('div.form-group').state('error');
                    if (json.error['address_1']) $('input[name="address_1"]', '#shipping-address').after(notice('warning', json.error['address_1'])).closest('div.form-group').state('error');
                    if (json.error['city']) $('input[name="city"]', '#shipping-address').after(notice('warning', json.error['city'])).closest('div.form-group').state('error');
                    if (json.error['postcode']) $('input[name="postcode"]', '#shipping-address').after(notice('warning', json.error['postcode'])).closest('div.form-group').state('error');
                    if (json.error['country']) $('select[name="country_id"]', '#shipping-address').after(notice('warning', json.error['country'])).closest('div.form-group').state('error');
                    if (json.error['zone']) $('select[name="zone_id"]', '#shipping-address').after(notice('warning', json.error['zone'])).closest('div.form-group').state('error');

                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    } else {
                        $('div.form-group.has-error:first', this.form).scrollBody();
                    }
                }
            }
        });
    });

    /**
     * Step 3
     * #shipping-address
     * guest_shipping.tpl #button-guest-shipping
     */
    $('#shipping-address').on('click', '#button-guest-shipping', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/guest_shipping/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                    $.ajax({
                        async: false,
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
                            $('#shipping-method')
                                    .stepHtml(html)
                                    .stepLinks()
                                    .stepSwitch();
                        }
                    });
                } else if (json.error) {
                    if (json.error['firstname']) $('input[name="firstname"]', '#shipping-address').after(notice('warning', json.error['firstname'])).closest('div.form-group').state('error');
                    if (json.error['lastname']) $('input[name="lastname"]', '#shipping-address').after(notice('warning', json.error['lastname'])).closest('div.form-group').state('error');
                    if (json.error['address_1']) $('input[name="address_1"]', '#shipping-address').after(notice('warning', json.error['address_1'])).closest('div.form-group').state('error');
                    if (json.error['city']) $('input[name="city"]', '#shipping-address').after(notice('warning', json.error['city'])).closest('div.form-group').state('error');
                    if (json.error['postcode']) $('input[name="postcode"]', '#shipping-address').after(notice('warning', json.error['postcode'])).closest('div.form-group').state('error');
                    if (json.error['country']) $('select[name="country_id"]', '#shipping-address').after(notice('warning', json.error['country'])).closest('div.form-group').state('error');
                    if (json.error['zone']) $('select[name="zone_id"]', '#shipping-address').after(notice('warning', json.error['zone'])).closest('div.form-group').state('error');

                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    } else {
                        $('div.form-group.has-error:first', this.form).scrollBody();
                    }
                }
            }
        });
    });

    /**
     * Step 4
     * #shipping-method
     * shipping_method.tpl #button-shipping-method
     */
    $('#shipping-method').on('click', '#button-shipping-method', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/shipping_method/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                    $.ajax({
                        async: false,
                        url: 'index.php?route=checkout/payment_method',
                        dataType: 'html',
                        success: function(html) {
                            $('#payment-method')
                                    .stepHtml(html)
                                    .stepLinks()
                                    .stepSwitch();
                        }
                    });
                } else if (json.error) {
                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    }
                }
            }
        });
    });

    /**
     * Step 5
     * #payment-method
     * payment_method.tpl #button-payment-method
     */
    $('#payment-method').on('click', '#button-payment-method', function() {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/payment_method/validate',
            data: $(':input:not(:checkbox:not(:checked), :radio:not(:checked), :button, :submit)', this.form),
            dataType: 'json',
            context: this,
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (!json.error) {
                    $.ajax({
                        async: false,
                        url: 'index.php?route=checkout/confirm',
                        dataType: 'html',
                        success: function(html) {
                            $('#confirm')
                                    .stepHtml(html)
                                    .stepLinks()
                                    .stepSwitch();
                        }
                    });
                } else if (json.error) {
                    if (json.error.warning) {
                        $(this).stepWarning(json.error.warning);
                    }
                }
            }
        });
    });
});
</script>