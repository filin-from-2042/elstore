<?php
// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER["HTTP_HOST"].'/admin/');
define('HTTP_CATALOG', 'http://'.$_SERVER["HTTP_HOST"].'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$_SERVER["HTTP_HOST"].'/admin/');
define('HTTPS_CATALOG', 'http://'.$_SERVER["HTTP_HOST"].'/');
$rootDir = $_SERVER["DOCUMENT_ROOT"];

// DIR
define('DIR_APPLICATION', $rootDir.'/admin/');
define('DIR_SYSTEM', $rootDir.'/system/');
define('DIR_DATABASE', $rootDir.'/system/database/');
define('DIR_LANGUAGE', $rootDir.'/admin/language/');
define('DIR_TEMPLATE', $rootDir.'/admin/view/template/');
define('DIR_CONFIG', $rootDir.'/system/config/');
define('DIR_IMAGE', $rootDir.'/image/');
define('DIR_CACHE', $rootDir.'/system/cache/');
define('DIR_DOWNLOAD', $rootDir.'/download/');
define('DIR_LOGS', $rootDir.'/system/logs/');
define('DIR_CATALOG', $rootDir.'/catalog/');

// DB
define('DB_DRIVER', 'mysql');

//define('DB_HOSTNAME', 'elektrik-1.mysql');
//define('DB_USERNAME', 'elektrik-1_mysql');
//define('DB_PASSWORD', '7EsOinX-');
//define('DB_DATABASE', 'elektrik-1_db');

define('DB_HOSTNAME', '192.168.0.106');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'elektrik-1_db');

define('DB_PREFIX', 'oc_');
?>