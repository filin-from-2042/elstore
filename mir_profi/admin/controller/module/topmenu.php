<?php
class ControllerModuleTopmenu extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/topmenu');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('topmenu', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$textArray = array(
			'heading_title',
			'text_enabled',
			'text_disabled',
			'text_content_top',
			'text_content_bottom',		
			'text_column_left',
			'text_column_right',
			'text_module',
			'text_hide_empty',
			'text_total',
			'text_maxlength',

			'entry_layout',
			'entry_position',
			'entry_status',
			'entry_sort_order',
			
			'button_save',
			'button_cancel',
			'button_add_module',
			'button_remove'
		);
		foreach ($textArray as $param)	{
			$this->data[$param] = $this->language->get($param);
		}

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/topmenu', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/topmenu', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
				
		$this->data['modules'] = array();
		
		if (isset($this->request->post['topmenu_module'])) {
			$this->data['modules'] = $this->request->post['topmenu_module'];
		} elseif ($this->config->get('topmenu_module')) { 
			$this->data['modules'] = $this->config->get('topmenu_module');
		}
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->data['topmenu_hide_empty'] = $this->config->get('topmenu_hide_empty');
		$this->data['topmenu_total'] = $this->config->get('topmenu_total');
		$this->data['topmenu_maxlength'] = $this->config->get('topmenu_maxlength');

		$this->template = 'module/topmenu.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/topmenu')) {
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