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

class ControllerModuleExchange extends Controller {

    private $error = array(); 
    
    public function index() {

        file_put_contents ( "debug.txt" ,$_POST , FILE_APPEND );


        $this->load->language('module/exchange');
    $this->document->setTitle($this->language->get('heading_title'));
    
   
    
    $this->data['heading_title'] = $this->language->get('heading_title');
    $this->data['button_cancel'] = $this->language->get('button_cancel');
    $this->data['button_save'] = $this->language->get('button_save');
    $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
    $this->data['button_delete'] = $this->language->get('button_delete');
    $this->data['text_delete'] = $this->language->get('text_delete');
    $this->data['text_delete2'] = $this->language->get('text_delete2');
    $this->data['text_delete3'] = $this->language->get('text_delete3');
    $this->data['text_delete4'] = $this->language->get('text_delete4');
    $this->data['button_action'] = $this->language->get('button_action');
    $this->data['exchange_delete_check'] = $this->language->get('button_action');
    $this->data['exchange_priority_text'] = $this->language->get('exchange_priority_text');
    
    if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		}else {
			$this->data['error_warning'] = '';
		}
                
     $this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'		=> $this->language->get('text_home'),
			'href'		=> $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator'	=> false
		);

		$this->data['breadcrumbs'][] = array(
			'text'		=> $this->language->get('text_module'),
			'href'		=> $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator'	=> ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/exchange', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
  
    $this->data['action'] = $this->url->link('module/exchange', 'token=' . $this->session->data['token'], 'SSL');            
                

             $this->load->model('setting/setting');
             
             
             if (isset($this->request->post['exchange_status'])) {
			$this->data['exchange_status'] = $this->request->post['exchange_status'];
		}
		else {
			$this->data['exchange_status'] = $this->config->get('exchange_status');
                       
		
                                        
                        
                        
                }
                 
              
             if (isset($this->request->post['exchange_priority'] )) {
			$this->data['exchange_priority'] = $this->request->post['exchange_priority'];
             
		}
		else {
                    $this->data['exchange_priority'] = "";
                    if (!isset($this->request->post['exchange_status'])) {
			$this->data['exchange_priority'] = $this->config->get('exchange_priority');  
                    }
                      
		}
                
                
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('exchange', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			//$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

          if (isset($this->request->post['exchange_status'])) {

		if (isset($this->request->post['exchange_delete_check'])){
                      if ($this->request->post['exchange_status']=='1'){
                          $this->log->write("delete");
                          $this->load->model('tool/exchange');
                          $this->model_tool_exchange->deleteProd();
                      }
                      if ($this->request->post['exchange_status']=='0'){
                          $this->log->write("deleteAll");
                          $this->load->model('tool/exchange');
                          $this->model_tool_exchange->deleteAll();
                      }
                      if ($this->request->post['exchange_status']=='2'){
                          $this->log->write("clearProduct");
                          $this->load->model('tool/exchange');
                          $this->model_tool_exchange->clearProduct();
                      }
                      if ($this->request->post['exchange_status']=='3'){
                          $this->log->write("DeleteDouble");


                          $this->load->model('tool/exchange');
                          $this->model_tool_exchange->deleteDouble();
                          //$this->model_tool_exchange->addProduct('addProduct', '00005504', 'article', 'Медальон', '2', 'шт', '100', 0, 0, $lang = '2');
                      }


		}
          }
        //$this->redirect($this->url->link('module/exchange', 'token=' . $this->session->data['token'], 'SSL'));
 //---------------------------//-----------------------------------------------------   
/*
   $this->load->model('tool/exchange');
   
       $lang = $this->model_tool_exchange->getLanguageId($this->config->get('config_language'));
       $this->model_tool_exchange->addProduct("0", "00004174", "Тетрадь изменено ааа", "100", "59", "0", "00006154", $lang);
 
 */
//---------------------------//----------------------------------------//---------------
    
                
                
                
                
        
     $this->template = 'module/exchange.tpl';
		$this->children = array(
			'common/header',
			'common/footer'	
		);   
     $this->response->setOutput($this->render(), $this->config->get('config_compression'));   
    }

    public function settings(){
 
    }


    function install() {




        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "1c_cat` (
                        `id` INT( 10 ) NOT NULL AUTO_INCREMENT ,
                        `1c_kod_group` VARCHAR( 20 ) NOT NULL ,
                        `1c_name` VARCHAR( 150 ) NOT NULL ,
                        `1c_kod_group_rod` VARCHAR( 20 ) NOT NULL ,
                        `oc_cat_id` INT( 11 ) NOT NULL ,
                        PRIMARY KEY ( `id` ),
                        KEY (`1c_kod_group`),
                        KEY (`1c_kod_group_rod`),
                        KEY (`oc_cat_id`)
                        ) ENGINE = MYISAM DEFAULT CHARSET=utf8");

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "1c_product` (
                        `id` INT( 10 ) NOT NULL AUTO_INCREMENT ,
                        `1c_kod_prod` VARCHAR( 20 ) NOT NULL ,
                        `1c_kod_prod_rod` VARCHAR( 20 ) NOT NULL ,
                        `1c_name` VARCHAR( 150 ) NOT NULL ,
                        `1c_ostatok` VARCHAR( 10 ) NOT NULL ,
                        `1c_cena` VARCHAR( 10 ) NOT NULL ,
                        `oc_prod_id` INT( 11 ) NOT NULL ,
                        PRIMARY KEY ( `id` ),
                        KEY (`1c_kod_prod`),
                        KEY (`1c_kod_prod_rod`),
                        KEY (`oc_prod_id`)
                        ) ENGINE = MYISAM DEFAULT CHARSET=utf8");
    }

    function xmlRpc($login, $password, $action, $kod_1c, $article_1c, $name_1c, $ostatok_1c, $edizm_1c, $cost_1c, $is_group_1c, $kod_own_1c, $is_deleted=false) {


        //------------


        if (!$this->registry->get('user')->isLogged()) {
          //  $this->log->write("незалогинены,логинимся");

            $this->registry->get('user')->login($login, $password);
                    if(!$this->registry->get('user')->isLogged()){
                         $this->log->write("неверный логин или пароль, выходим");
                         exit;
                        }
            $this->log->write("успешно залогинились");
        } else {
            $this->log->write("уже залогинены");
           
        }
        $this->load->model('tool/exchange');
        $lang = $this->model_tool_exchange->getLanguageId($this->config->get('config_language'));


        switch ($action){
            case 'addCategory':
                if ($is_group_1c){
                    $this->load->model('tool/exchange');
                    $this->model_tool_exchange->addCategory($action, $kod_1c, $name_1c, $ostatok_1c, $cost_1c, $is_group_1c, $kod_own_1c, $lang, $is_deleted);
                }
                break;
            case 'addProduct':
                //file_put_contents ( "debug.txt" ,$kod_1c. ' ' . $name_1c . ' ' .$ostatok_1c . ' '  , FILE_APPEND );
                //if (!$is_group_1c){
                    $this->load->model('tool/exchange');
                    $this->model_tool_exchange->addProduct($action, $kod_1c, $article_1c, $name_1c, $ostatok_1c, $edizm_1c, $cost_1c, $is_group_1c, $kod_own_1c, $lang,$is_deleted);
               // }
                break;
            case 'getProduct':
                if (!$is_group_1c){
                    $this->load->model('tool/exchange');
                    $this->model_tool_exchange->getProduct($action, $kod_1c, $name_1c, $ostatok_1c, $cost_1c, $is_group_1c, $kod_own_1c,$is_deleted);
                }
                break;
            case 'refreshProduct':
                
                    $this->load->model('tool/exchange');
                    $this->model_tool_exchange->refreshProduct($kod_1c, $name_1c, $ostatok_1c, $cost_1c,$is_deleted);
                
                break;
            case 'deleteDouble':
                
                    $this->load->model('tool/exchange');
                    $this->model_tool_exchange->deleteDouble();
                
                break;
            case 'Price':
                
                    $this->load->model('tool/pricexls');
                
                if (class_exists('ModelToolPricexls')) {
                    $this->model_tool_pricexls->getExcelFile();
                }
                
                break;
            
        }
        
        
        
        
        
        
        
 
 
    }

    /*
      function dump($value = '') {
      $fp = fopen("xmlrpc.log", 'a');
      fwrite($fp, $_SERVER['REMOTE_ADDR'] . " " . " " . $value . "\r\n");
      fclose($fp);
      }
     */

    function arr_dump($value) {

        ob_start();
        var_dump($value);
        return ob_get_clean();
    }
    
    protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/account')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

}

?>