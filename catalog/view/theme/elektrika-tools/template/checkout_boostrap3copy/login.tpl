
<div class="row">
    <div class="col-sm-6 col-xs-12">
        <div class="new-customer well">
            <div class="heading">
                <i class="fa fa-file-text-o"></i>
                <div class="extra-wrap">
                    <h2>Новый клиент</h2>
                    <strong>Регистрация</strong>
                </div>
            </div>
            <form class="form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <p class="form-control-static"><?php echo $text_register_account; ?></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                            <a class="btn btn-primary" href="index.php?route=account/register" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 ">
                            <button type="button" id="button-account-guest" class="btn btn-primary" title="<?php echo $text_guest; ?>" data-loading-text="<?php echo $text_guest; ?>..."><?php echo $text_guest; ?></button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="return-customer well">
            <div class="heading">
                <i class="fa fa-key"></i>
                <h2>Зарегистрированный клиент</h2>
                <strong>Войти в Личный Кабинет</strong>
            </div>
            <form class="form-horizontal" name="login" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <fieldset>
                    <div class="form-group">
                        <label>
                            <?php echo $entry_email; ?>
                        </label>
                        <div>
                            <input type="email" class="form-control" name="email" value="<?php echo (isset($email)?$email:''); ?>" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            <?php echo $entry_password; ?>
                        </label>
                        <div>
                            <input type="password" class="form-control" name="password" value="" pattern="^[a-zA-Z\d]{4,20}$" required />
                        </div>
                    </div>
                    <?php if (isset($redirect)) { ?>
                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                    <?php } ?>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <a class="btn btn-default" href="<?php echo $forgotten; ?>" title="<?php echo $text_forgotten; ?>"><?php echo $text_forgotten; ?></a>
                            <button type="button" id="button-login" class="btn btn-primary" title="<?php echo $button_login; ?>" data-loading-text="<?php echo $button_login; ?>..."><?php echo $button_login; ?></button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<!-- js -->
<script>
function inputSupport() {
    if (window.sessionStorage && window.sessionStorage.inputSupport) {
        var support = JSON.parse(window.sessionStorage.inputSupport);
    } else {
        var support = {
            'color': false,
            'date': false,
            'datetime': false,
            'datetime-local': false,
            'email': false,
            'month': false,
            'number': false,
            'range': false,
            'search': false,
            'tel': false,
            'time': false,
            'url': false,
            'week': false
        };

        var input = document.createElement('input');

        for (var type in support) {
            input.setAttribute('type', type);

            if (input.type === type) support[type] = true;
        }

        if (window.sessionStorage) window.sessionStorage.inputSupport = JSON.stringify(support);
    }

    return function(type) { return support[type]; };
};
jQuery(function($) {
    $.fn.inputSupport = function(type) {
        if (type) {
            if (typeof type === 'object') {
                for (var i in type) {
                    if (inputSupport(type[i]) === false) {
                        $('input[type="' + type[i] + '"]', this).each(function() {
                            $this = $(this);
                            $this.after($this.clone().attr('type', 'text')).remove();
                        });
                    }
                }
            } else {
                if (inputSupport(type) === false) {
                    $('input[type="' + type + '"]', this).each(function() {
                        $this = $(this);
                        $this.after($this.clone().attr('type', 'text')).remove();
                    });
                }
            }
        } else {
            var type = ['color', 'date', 'datetime', 'datetime-local', 'email', 'month', 'number', 'range', 'search', 'tel', 'time', 'url', 'week'];

            for (var i = 0; i < type.length; i++) {
                if (!inputSupport(type[i])) {
                    $('input[type="' + type[i] + '"]', this).each(function() {
                        $this = $(this);
                        $this.after($this.clone().attr('type', 'text')).remove();
                    });
                }
            }
        }

        return this;
    };

    /**
     * FORM DATA STORAGE JQUERY PLUGIN
     * @param {object} [settings]
     * @config {string} [prefix='']
     * @config {boolean} [check=false]
     * @returns {object}
     */
    $.fn.formStorage = function(settings) {
        if (!window.sessionStorage) return this;

        var prefix = settings && settings.prefix || '';
        var check = settings && settings.check || false;

        $(':input[name]:not([name="captcha"], :password, :button, :submit, :reset, .nostorage)', this)
                .each(function() {
                    var data = window.sessionStorage.getItem(prefix + this.name);

                    if (data !== null && data !== undefined) {
                        if (this.type === 'checkbox') {
                            this.checked = (data == 'true');
                        } else if (this.type === 'radio') {
                            this.checked = (this.value == data);
                        } else if (this.type === 'select-multiple' && this.multiple) {
                            data = JSON.parse(data);

                            for (var i = 0; i < this.length; i++) {
                                this[i].selected = ($.inArray(this[i].value, data) !== -1);
                            }
                        } else {
                            this.value = data;
                        }
                    }
                })
                .change(function() {
                    var name = prefix + this.name;

                    if (this.type === 'checkbox') {
                        if (this.name.search('\\[\\]') !== this.name.length - 2) {
                            window.sessionStorage.setItem(name, this.checked);
                        }
                    } else if (this.type === 'select-multiple' && this.multiple) {
                        window.sessionStorage.setItem(name, JSON.stringify($.map(this, function(i) { return i.selected ? i.value : null; })));
                    } else if(!check || !this.value || !this.getAttribute('required') === undefined || (!this.getAttribute('pattern') && !this.getAttribute('data-pattern')) || new RegExp(this.getAttribute('pattern') || this.getAttribute('data-pattern')).test($.trim(this.value))) {
                        window.sessionStorage.setItem(name, this.value);
                    }
                });

        return this;
    };

    // FORM INPUT SUPPORT
    $('form[name="login"]').inputSupport();
    
    // BIND FORM STORAGE
    $('form[name="login"]').formStorage({
        prefix: 'user_',
        check: true
    });
});
</script>