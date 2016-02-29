<?php
/*
 * Обмен 1С 7.7 ТиС  с OpenCart.
 * 
 * eosagm@gmail.com
 * 
 * http://from64.ru
 * 
 * 
 */


// Version
define('VERSION', '1.5.5.1');

require_once ('IXR_Library.php');
//ini_set('session.use_cookies', 'Off');
//ini_set('session.use_trans_sid', 'On');

// Configuration
if (file_exists('../admin/config.php')) {
	require_once('../admin/config.php');
}

//require_once(DIR_SYSTEM . 'engine/model.php');
require_once('../system/engine/model.php');
require_once('../admin/model/catalog/product.php');


// Startup
require_once('../system/startup.php');

// Application Classes
require_once('../system/library/currency.php');
require_once('../system/library/user.php');
require_once('../system/library/weight.php');
require_once('../system/library/length.php');


// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Config
$config = new Config();
$registry->set('config', $config);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);
		
// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");
 
foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {
		$config->set($setting['key'], unserialize($setting['value']));
	}
}

// Url
$url = new Url(HTTP_SERVER, $config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER);	
$registry->set('url', $url);
		
// Log 
$log = new Log($config->get('config_error_filename'));
$registry->set('log', $log);

function error_handler($errno, $errstr, $errfile, $errline) {
	global $log, $config;
	
	switch ($errno) {
		case E_NOTICE:
		case E_USER_NOTICE:
			$error = 'Notice';
			break;
		case E_WARNING:
		case E_USER_WARNING:
			$error = 'Warning';
			break;
		case E_ERROR:
		case E_USER_ERROR:
			$error = 'Fatal Error';
			break;
		default:
			$error = 'Unknown';
			break;
	}
		
	if ($config->get('config_error_display')) {
		echo '<b>' . $error . '</b>: ' . $errstr . ' in <b>' . $errfile . '</b> on line <b>' . $errline . '</b>';
	}
	
	if ($config->get('config_error_log')) {
		$log->write('PHP ' . $error . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
	}

	return true;
}

// Error Handler
set_error_handler('error_handler');
		
// Request
$request = new Request();
$registry->set('request', $request);

// Response
$response = new Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$registry->set('response', $response); 

// Cache
$cache = new Cache();
$registry->set('cache', $cache); 

// Session
$session = new Session();
$registry->set('session', $session); 

// Language
$languages = array();

$query = $db->query("SELECT * FROM `" . DB_PREFIX . "language`"); 

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

$config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

// Language	
$language = new Language($languages[$config->get('config_admin_language')]['directory']);
$language->load($languages[$config->get('config_admin_language')]['filename']);	
$registry->set('language', $language);

// Document
$registry->set('document', new Document()); 		
		
// Currency
$registry->set('currency', new Currency($registry));		
		
// Weight
$registry->set('weight', new Weight($registry));

// Length
$registry->set('length', new Length($registry));

// User

$registry->set('user', new User($registry));



// Front Controller
//$controller = new Front($registry);

/*
// Login
$controller->addPreAction(new Action('common/home/login'));

// Permission
$controller->addPreAction(new Action('common/home/permission'));

// Router

if (isset($request->get['route'])) {
	$action = new Action($request->get['route']);
} else {
	$action = new Action('common/home');
}
*/

//-------------------------------------------------------------------------------
class ExchangeServer extends IXR_Server {

   // private $facade;
    private $controller;
    private $log;
    private $registry;

    public function __construct($registry) {

        $this->registry = $registry;
        $this->controller = new Front($registry);
        $this->log = $registry->get('log');
        
        
//---------------------//--------------------------------//------------
        
        $this->IXR_Server(array(
            'shopscript.xmlRpc' => 'this:xmlRpc'
           ,'shopscript.xmlRpcGetProduct' => 'this:xmlRpcGetProduct'
            
        ));

        
    }

    function xmlRpc($args) {
      
         //$this->log->write($this->arr_dump($args));
        $action = new Action('module/exchange/xmlRpc', $args); 
        $this->controller->dispatch($action, new Action('error/not_found'));
     
    }
    
    function xmlRpcGetProduct($args) {
  
      $this->registry->get('load')->model('tool/exchange');
      $tmp = $this->registry->get('model_tool_exchange')->getProduct();
      return $tmp;
     
    }
   
     function arr_dump($value) {

        ob_start();
        var_dump($value);
        return ob_get_clean();
    } 
    

}

$server = new ExchangeServer($registry);
//-------------------------//---------------------------//



//$server->login($args);

//------------------------------------------------------------------------------


//$args=array(0=> "param param");
//$action = new Action('module/exchange/testAction', $args);


// Dispatch
//$controller->dispatch($action, new Action('error/not_found'));

// Output
//$response->output();

?>