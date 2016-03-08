<?php
// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER["HTTP_HOST"].'/');
// HTTPS
define('HTTPS_SERVER', 'https://'.$_SERVER["HTTP_HOST"].'/');

$dir=getcwd();

// DIR
define('DIR', $dir .'/');
define('DIR_APPLICATION', $dir.'/catalog/');
define('DIR_SYSTEM', $dir.'/system/');
define('DIR_DATABASE', $dir.'/system/database/');
define('DIR_LANGUAGE', $dir.'/catalog/language/');
define('DIR_TEMPLATE', $dir.'/catalog/view/theme/');
define('DIR_CONFIG', $dir.'/system/config/');
define('DIR_IMAGE', $dir.'/image/');
define('DIR_CACHE', $dir.'/system/cache/');
define('DIR_DOWNLOAD', $dir.'/download/');
define('DIR_LOGS', $dir.'/system/logs/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'elektrik-1.mysql');
define('DB_USERNAME', 'elektrik-1_mysql');
define('DB_PASSWORD', '7EsOinX-');
define('DB_DATABASE', 'elektrik-1_db');

//define('DB_HOSTNAME', '192.168.1.37');
//define('DB_USERNAME', 'root');
//define('DB_PASSWORD', '');
//define('DB_DATABASE', 'elektrik-1_db');

define('DB_PREFIX', 'oc_');
?>