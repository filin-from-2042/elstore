<?php
// чистка кэша
define('DIR_CACHE', 'system/cache/');

$startParam = $_GET['start'];
$files = glob(DIR_CACHE . 'cache.*');

if ($files && $startParam=='Y') {
    foreach ($files as $file) {
        if (file_exists($file)) {
            unlink($file);
        }
    }
}
