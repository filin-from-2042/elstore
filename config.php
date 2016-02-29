<?php
// HTTP
define('HTTP_SERVER', 'http://elstore/');

// HTTPS
define('HTTPS_SERVER', 'http://elstore/');
$dir=getcwd();
// DIR
define('DIR_APPLICATION', $dir.'\catalog/');
define('DIR_SYSTEM', $dir.'\system/');
define('DIR_DATABASE', $dir.'\system/database/');
define('DIR_LANGUAGE', $dir.'\catalog/language/');
define('DIR_TEMPLATE', $dir.'\catalog/view/theme/');
define('DIR_CONFIG', $dir.'\system/config/');
define('DIR_IMAGE', $dir.'\image/');
define('DIR_CACHE', $dir.'\system/cache/');
define('DIR_DOWNLOAD', $dir.'\download/');
define('DIR_LOGS', $dir.'\system/logs/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', '192.168.1.37');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'elstore');
define('DB_PREFIX', 'oc_');
?>