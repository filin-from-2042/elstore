<?php
// THEME
define('THEME', 'catalog/view/theme/' . $this->config->get('config_template') . '/');

// CSS
define('THEME_CSS_BOOTSTRAP', THEME . 'bootstrap-3.0.0/css/bootstrap.min.css');  // common/header.tpl
define('THEME_CSS_JQUERYUI', 'catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css');  // product/product.tpl, account/return_form.tpl
//define('THEME_CSS_COLORBOX', 'catalog/view/javascript/jquery/colorbox/colorbox.css');  // unused
define('THEME_CSS_STYLESHEET', THEME . 'stylesheet/stylesheet.css');  // common/header.tpl

// JS
define('THEME_JS_JQUERY', 'catalog/view/javascript/jquery/jquery-1.7.1.min.js');  // common/header.tpl
define('THEME_JS_BOOTSTRAP', THEME . 'bootstrap-3.0.0/js/bootstrap.min.js');  // common/header.tpl
define('THEME_JS_HTML5SHIV', THEME . 'bootstrap-3.0.0/assets/js/html5shiv.js');  // common/header.tpl
define('THEME_JS_RESPOND', THEME . 'bootstrap-3.0.0/assets/js/respond.min.js');  // common/header.tpl
define('THEME_JS_JQUERYUI', 'catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js');  // product/product.tpl, account/return_form.tpl
define('THEME_JS_JQUERYUI_TIMEPICKER', 'catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js'); // product/product.tpl
//define('THEME_JS_COOKIE', 'catalog/view/javascript/jquery/ui/external/jquery.cookie.js');  // unused
define('THEME_JS_AJAXUPLOAD', 'catalog/view/javascript/jquery/ajaxupload.js');  // product/product.tpl
//define('THEME_JS_COLORBOX', 'catalog/view/javascript/jquery/colorbox/jquery.colorbox.js');  // unused
//define('THEME_JS_TABS', 'catalog/view/javascript/jquery/tabs.js');  // unused
define('THEME_JS_PLUGINS', THEME . 'javascript/plugins.js');  // common/header.tpl
define('THEME_JS_COMMON', THEME . 'javascript/common.js');  // common/header.tpl

// BOOTSTRAP GRID
class Bootstrap {
    public $center = null;
    public $left = null;
    public $right = null;
    public $content = null;
    public $top = null;
    public $bottom = null;
    public $label = null;
    public $input = null;
    
    public function __construct($column_left = false, $column_right = false, $content_top = false, $content_bottom = false) {
        if ($column_left && $column_right) {
            $this->center = 'col-xs-12 col-sm-12 col-md-6 col-lg-6 col-md-push-3 col-lg-push-3';
            $this->left = 'col-xs-12 col-sm-6 col-md-3 col-lg-3 col-md-pull-6 col-lg-pull-6 hidden-xs hidden-sm hidden-print';
            $this->right = 'col-xs-12 col-sm-6 col-md-3 col-lg-3 hidden-xs hidden-print';
            $this->content = 'col-xs-12 col-sm-12 col-md-12 col-lg-12';
            $this->top = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->bottom = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->label = 'control-label col-xs-12 col-sm-4 col-md-4 col-lg-4';
            $this->input = 'col-xs-12 col-sm-8 col-md-8 col-lg-8';
        } elseif ($column_left) {
            $this->center = 'col-xs-12 col-sm-12 col-md-9 col-lg-9 col-md-push-3 col-lg-push-3';
            $this->left = 'col-xs-12 col-sm-12 col-md-3 col-lg-3 col-md-pull-9 col-lg-pull-9 hidden-xs hidden-sm hidden-print';
            $this->right = '';
            $this->content = 'col-xs-12 col-sm-12 col-md-12 col-lg-12';
            $this->top = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->bottom = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->label = 'control-label col-xs-12 col-sm-4 col-md-4 col-lg-4';
            $this->input = 'col-xs-12 col-sm-8 col-md-8 col-lg-8';
        } elseif ($column_right) {
            $this->center = 'col-xs-12 col-sm-12 col-md-9 col-lg-9';
            $this->left = '';
            $this->right = 'col-xs-12 col-sm-12 col-md-3 col-lg-3 hidden-xs hidden-print';
            $this->content = 'col-xs-12 col-sm-12 col-md-12 col-lg-12';
            $this->top = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->bottom = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->label = 'control-label col-xs-12 col-sm-4 col-md-4 col-lg-4';
            $this->input = 'col-xs-12 col-sm-8 col-md-8 col-lg-8';
        } else {
            $this->center = 'col-xs-12 col-sm-12 col-md-12 col-lg-12';
            $this->left = '';
            $this->right = '';
            $this->content = 'col-xs-12 col-sm-12 col-md-12 col-lg-12';
            $this->top = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->bottom = 'col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-print';
            $this->label = 'control-label col-xs-12 col-sm-4 col-md-4 col-lg-4';
            $this->input = 'col-xs-12 col-sm-8 col-md-8 col-lg-8';
        }
    }
}