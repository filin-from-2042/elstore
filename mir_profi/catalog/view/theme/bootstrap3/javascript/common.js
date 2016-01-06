jQuery(function($) {
    /** IE 10 VIEWPORT FIX */
    if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
        var msViewportStyle = document.createElement("style");
        msViewportStyle.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}"));
        document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
    }
    
    /** BODY INPUT SUPPORT */
    $('body').inputSupport();
    
    /** AJAX SETUP */
    $.ajaxSetup({
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
    
    /** BIND INPUT HAS ERROR */
    $('form div.form-group:has(span.text-warning)').state('error');
    
    $('form').on('click change', 'div.form-group.has-error :input, div.form-group.has-warning :input, div.input-group.has-error :input, div.input-group.has-warning :input', function() {
        $(this).parents('div.form-group, div.input-group, fieldset, form').state(false);
    });
    
    /** BIND INPUT QUANTITY CHECK */
    $('input[name^="quantity"]').blur(function() {
        var val = parseInt(this.value);

        if (this.min && (isNaN(val) || val < this.min)) {
            this.value = this.min;
        } else if (isNaN(val)) {
            this.value = 1;
        } else if (this.max && val > this.max) {
            this.value = this.max;
        }
    });
    
    /** BIND LOGOUT STORAGE CLEAR */
    if (window.sessionStorage) {
        $('a[href$="route=account/logout"]').click(function(){
            sessionStorage.clear();
        });
    }
    
    /**
     * ADD TO CART
     * @param {string} product_id
     * @param {number} [quantity=1]
     * @param {string} [button] AddToCart button css selector.
     */
    window.addToCart = function(product_id, quantity, button) {
        $.ajax({
            async: false,
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (quantity || 1),
            dataType: 'json',
            beforeSend: function() {
                if (button) $(button).filter('.btn').button('loading');
            },
            complete: function() {
                if (button) $(button).filter('.btn').button('reset');
            },
            success: function(json) {
                if (json.redirect) {
                    location = json.redirect;
                } else if (json.success) {
                    $('#cart').triggerHandler('added');
                    $('#notification').html(oc.notification('success', json.success)).scrollBody();
                }
            }
        });
    };
    
    /**
     * ADD TO COMPARE
     * @param {string} product_id
     */
    window.addToCompare = function(product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                if (json.success) {
                    $('.compare-total').html(json['total']);
                    $('#notification').html(oc.notification('success', json.success)).scrollBody();
                }
            }
        });
    };
    
    /**
     * ADD TO WISHLIST
     * @param {string} product_id
     */
    window.addToWishList = function(product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                if(json.success) {
                    $('.wishlist-total').html(json['total']);
                    $('#notification').html(oc.notification('success', json.success)).scrollBody();
                }
            }
        });
    };
    
    /**
     * REMOVE FROM CART
     * @param {string} product_id
     */
    window.removeFromCart = function(product_id) {
        var route = '';
        var urlHalves = String(document.location).toLowerCase().split('?');
        
        if (urlHalves[1]) {
            var urlVars = urlHalves[1].split('&');
            
            for (var i = 0; i <= urlVars.length; i++) {
                if (urlVars[i]) {
                    var urlVarPair = urlVars[i].split('=');
                    route = (urlVarPair[0] && urlVarPair[0] === 'route') ? urlVarPair[1] : '';
                }
            }
        }

        if (route === 'checkout/cart' || route === 'checkout/checkout') {
            location = 'index.php?route=checkout/cart&remove=' + product_id;
        } else {
            cartUpdate('index.php?route=module/cart&remove=' + product_id);
        }
    };
    
    /**
     * GET COUNTRY
     * @param {object} data
     * @config {string} url
     * @config {string} zone_id
     * @config {string} [textSelect=' --- Please Select --- ']
     * @config {string} [textNone=' --- None --- ']
     */
    window.getCountry = function(data) {
        $.ajax({
            url: data.url + '&country_id=' + this.value,
            dataType: 'json',
            context: this,
            beforeSend: function() {
                $(this).state('disabled');
            },		
            complete: function() {
                $(this).state(false);
            },			
            success: function(json) {
                if (typeof json.zone === 'object' && json.zone.length) {
                    var html = '<option value="">' + (data.textSelect || ' --- Please Select --- ') + '</option>';
                    
                    for (i = 0; i < json.zone.length; i++) {
                        html += '<option value="' + json.zone[i]['zone_id'] + '"' + ((json.zone[i]['zone_id'] == data.zone_id) ? 'selected' : '') + '>' + json.zone[i]['name'] + '</option>';
                    }
                    
                    $(this.form.elements['zone_id'])
                        .html(html)
                        .closest('div.form-group').state(false);
                } else {
                    var html = '<option value="0" selected></option>';
                    
                    $(this.form.elements['zone_id'])
                        .html(html)
                        .closest('div.form-group').state('none');
                }
                
                if (json.postcode_required == true) {
                    $('div.form-group:has(input[name="postcode"])>label.control-label>b.text-danger', this.form).state(false);
                } else {
                    $('div.form-group:has(input[name="postcode"])>label.control-label>b.text-danger', this.form).state('none');
                }
            }
        });
    };
    
    /**
     * GET CUSTOMER GROUP
     * @param {object} data Customer groups array.
     */
    window.getCustomerGroup = function(data) {
        if (this.value !== undefined && data[this.value]) {
            var $form = $(this.form);
            
            if (data[this.value]['company_id_display'] == '1' && data[this.value]['company_id_required'] == '1') {
                $form.find('div.form-group:has(input[name="company_id"])').state(false);
                
                $form.find('div.form-group:has(input[name="company_id"])')
                    .find('label.control-label>b.text-danger').state(false).end()
                    .find('input[name="company_id"]').attr('required', true);
            } else if (data[this.value]['company_id_display'] == '1' && data[this.value]['company_id_required'] != '1') {
                $form.find('div.form-group:has(input[name="company_id"])').state(false);
                
                $form.find('div.form-group:has(input[name="company_id"])')
                    .find('label.control-label>b.text-danger').state('none').end()
                    .find('input[name="company_id"]').attr('required', false);
            } else if (data[this.value]['company_id_display'] != '1') {
                $form.find('div.form-group:has(input[name="company_id"])').state('none');
                
                $form.find('div.form-group:has(input[name="company_id"])')
                    .find('label.control-label>b.text-danger').state('none').end()
                    .find('input[name="company_id"]').attr('required', false);
            }
            
            if (data[this.value]['tax_id_display'] == '1' && data[this.value]['tax_id_required'] == '1') {
                $form.find('div.form-group:has(input[name="tax_id"])').state(false);
                
                $form.find('div.form-group:has(input[name="tax_id"])')
                    .find('label.control-label>b.text-danger').state(false).end()
                    .find('input[name="tax_id"]').attr('required', true);
            } else if (data[this.value]['tax_id_display'] == '1' && data[this.value]['tax_id_required'] != '1') {
                $form.find('div.form-group:has(input[name="tax_id"])').state(false);
                
                $form.find('div.form-group:has(input[name="tax_id"])')
                    .find('label.control-label>b.text-danger').state('none').end()
                    .find('input[name="tax_id"]').attr('required', false);
                
            } else if (data[this.value]['tax_id_display'] != '1') {
                $form.find('div.form-group:has(input[name="tax_id"])').state('none');
                
                $form.find('div.form-group:has(input[name="tax_id"])')
                    .find('label.control-label>b.text-danger').state('none').end()
                    .find('input[name="tax_id"]').attr('required', false);
            }
        }
    };
    
    /**
     * GET GEO IP
     * @param {string} [form='form'] Form css selector.
     * @returns {object}
     */
    window.getGeoIp = function(form) {
        if (!form) form = 'form';
        
        $('input[name="city"], input[name="postcode"], select[name="country_id"], select[name="zone_id"]', form).state('disabled');
        
        if (window.sessionStorage && window.sessionStorage.GeoIp) {
            var GeoIp = JSON.parse(window.sessionStorage.GeoIp);
            var detector = $.Deferred(function() { GeoIp.detected ? this.resolve() : this.reject() });
        } else {
            var GeoIp = { };
            var detector = $.Deferred();
        }
        
        detector.done(function() {
            GeoIp.country_id = $('select[name="country_id"] option[data-iso2="' + GeoIp.iso2 + '"]', form).val();
            
            $('select[name="country_id"]', form).val(GeoIp.country_id).change().state(false);
            
            $(document).ajaxComplete(function(event, xhr, settings) {
                if (settings.url.indexOf('/country&country_id=' + GeoIp.country_id) != -1) {
                    $('select[name="zone_id"]', form)
                        .val($('select[name="zone_id"] option:contains("' + GeoIp.zone_name + '")', form).val())
                        .state(false);
                } else {
                    $('select[name="zone_id"]', form).state(false);
                }
            });
            
            $('input[name="city"]', form).val(GeoIp.city).state(false);
            $('input[name="postcode"]', form).val(GeoIp.postcode).state(false);
        });
        
        detector.fail(function(msg) {
            $('input[name="city"], input[name="postcode"], select[name="country_id"], select[name="zone_id"]', form).state(false);
            
            if (msg) console.warn(msg);
        });
        
        detector.progress(function(state) {
            GeoIp.detected = state;
            
            if (window.sessionStorage) window.sessionStorage.GeoIp = JSON.stringify(GeoIp);
        });
        
        if (GeoIp.detected === undefined) {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                        var geocoder = new google.maps.Geocoder();
                        
                        geocoder.geocode({ latLng: latlng }, function(results, status) {
                            if (status == google.maps.GeocoderStatus.OK && results[0] && results[0].address_components) {
                                var res = { };
                                
                                for (i = 0; i < results[0].address_components.length; i++) {
                                    if (results[0].address_components[i].types && results[0].address_components[i].short_name) {
                                        res[results[0].address_components[i].types[0]] = results[0].address_components[i];
                                    }
                                }
                                
                                GeoIp.iso2 = res.country.short_name;
                                GeoIp.zone_name = res.administrative_area_level_1.long_name;
                                GeoIp.city = res.locality.short_name;
                                GeoIp.postcode = res.postal_code.short_name;
                                
                                detector.notify(true).resolve();
                            } else {
                                detector.notify(false).reject('geocoder failed due to: ' + status);
                            }
                        });
                    },
                    function(err) {
                        detector.notify(false).reject(err);
                    },
                    {
                        enableHighAccuracy: false,
                        maximumAge: 1800000
                    }
                );
            } else {
                detector.notify(false).reject('Geolocation not supported');
            }
        }
        
        return this;
    };

    /** GET TERMS */
    window.getTerms = function(e) {
        e.preventDefault();
        
        oc.modal.html({
            html: '<p>...</p>'
        }).show();
        
        var url = 'index.php?route=information/information/info&information_id=' + e.data.information_id;
        
        $.get(url, function(html) {
            oc.modal.html({
                title: $(html).filter('h1').html(),
                html: html
            });
        }, 'html');
    };
});