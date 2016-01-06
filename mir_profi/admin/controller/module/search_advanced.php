<?php
class ControllerModuleSearchAdvanced extends Controller {
	private $error = array ();
	
	public function index() {
		$this->load->language('module/search_advanced');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		
		$this->data['default_min' ] = 0;
		$this->data['default_max' ] = 100;
		$this->data['default_step'] = 10;
		
		$this->data['image_size'] = array (
			'width'  => 30,
			'height' => 30
		);
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$data = (isset ($this->request->post['search_advanced_setting']['attributes'])) ? $this->request->post['search_advanced_setting']['attributes'] : array ();
			
			foreach ($data as $key => $attributes) {
				$data[$key]['status'] = (int) $data[$key]['status'];
				
				if ($attributes['type'] == 3) {
					$data[$key]['step'] = (!isset ($attributes['step']) || empty ($attributes['step'])) ? $this->data['default_step'] : (float) $attributes['step'];
					$data[$key]['min' ] = (!isset ($attributes['min' ]) || empty ($attributes['min' ])) ? $this->data['default_min' ] : (float) $attributes['min' ];
					$data[$key]['max' ] = (!isset ($attributes['min' ]) || empty ($attributes['max' ])) ? $this->data['default_max' ] : (float) $attributes['max' ];
					
					if ($data[$key]['min'] > $data[$key]['max']) {
						$data[$key]['min'] = $data[$key]['max'];
					}
					
					if ($data[$key]['max'] < $data[$key]['min']) {
						$data[$key]['max'] = $data[$key]['min'];
					}
					
					if ($data[$key]['step'] > $data[$key]['max']) {
						$data[$key]['step'] = $data[$key]['max'] - $data[$key]['min'];
					}
				}
			}
			
			$this->request->post['search_advanced_setting']['attributes'] = $data;
			
			$this->request->post['search_advanced_setting']['list_size']['min_width' ] = abs ((float) $this->request->post['search_advanced_setting']['list_size']['min_width' ]);
			$this->request->post['search_advanced_setting']['list_size']['min_height'] = abs ((float) $this->request->post['search_advanced_setting']['list_size']['min_height']);
			
			$this->request->post['search_advanced_setting']['image_size']['width' ] = abs ((float) $this->request->post['search_advanced_setting']['image_size']['width' ]);
			$this->request->post['search_advanced_setting']['image_size']['height'] = abs ((float) $this->request->post['search_advanced_setting']['image_size']['height']);
			
			if ($this->request->post['search_advanced_setting']['image_size']['width'] == 0 || $this->request->post['search_advanced_setting']['image_size']['height'] == 0) {
				$this->request->post['search_advanced_setting']['image_size']['width'] = $this->request->post['search_advanced_setting']['image_size']['height'] = 20;
			}
			
			$this->request->post['search_advanced_setting']['price']['step'] = abs ((float) $this->request->post['search_advanced_setting']['price']['step']);
			
			if ($this->request->post['search_advanced_setting']['price']['step'] == 0) {
				$this->request->post['search_advanced_setting']['price']['step'] = 20;
			}
			
			$this->model_setting_setting->editSetting('search_advanced', $this->request->post);
			
			$this->cache->delete('product');
			$this->cache->delete('search_advanced');
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_checkbox'] = $this->language->get('text_checkbox');
		$this->data['text_radio'   ] = $this->language->get('text_radio');
		$this->data['text_slider'  ] = $this->language->get('text_slider');
		$this->data['text_hint'    ] = $this->language->get('text_hint');
		$this->data['text_sep'     ] = $this->language->get('text_sep');
		$this->data['text_step'    ] = $this->language->get('text_step');
		$this->data['text_min'     ] = $this->language->get('text_min');
		$this->data['text_max'     ] = $this->language->get('text_max');
		$this->data['text_tax'     ] = $this->language->get('text_tax');
		
		$this->data['text_price'        ] = $this->language->get('text_price');
		$this->data['text_stock'        ] = $this->language->get('text_stock');
		$this->data['text_manufacturers'] = $this->language->get('text_manufacturers');
		
		$this->data['text_enabled'      ] = $this->language->get('text_enabled');
		$this->data['text_disabled'     ] = $this->language->get('text_disabled');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_clear'        ] = $this->language->get('text_clear');
		$this->data['text_none'         ] = $this->language->get('text_none');
		
		$this->data['text_content_top'   ] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'   ] = $this->language->get('text_column_left');
		$this->data['text_column_right'  ] = $this->language->get('text_column_right');
		
		$this->data['tab_general'   ] = $this->language->get('tab_general');
		$this->data['tab_attributes'] = $this->language->get('tab_attributes');
		
		$this->data['column_image'   ] = $this->language->get('column_image');
		$this->data['column_name'    ] = $this->language->get('column_name');
		$this->data['column_hint'    ] = $this->language->get('column_hint');
		$this->data['column_status'  ] = $this->language->get('column_status');
		$this->data['column_type'    ] = $this->language->get('column_type');
		$this->data['column_optional'] = $this->language->get('column_optional');
		
		$this->data['entry_module_title'   ] = $this->language->get('entry_module_title');
		$this->data['entry_module_text'    ] = $this->language->get('entry_module_text');
		$this->data['entry_cache'          ] = $this->language->get('entry_cache');
		$this->data['entry_form_categories'] = $this->language->get('entry_form_categories');
		
		$this->data['entry_category_status'] = $this->language->get('entry_category_status');
		$this->data['entry_name_status'    ] = $this->language->get('entry_name_status');
		$this->data['entry_desc_status'    ] = $this->language->get('entry_desc_status');
		$this->data['entry_model_status'   ] = $this->language->get('entry_model_status');
		$this->data['entry_sku_status'     ] = $this->language->get('entry_sku_status');
		$this->data['entry_sub_cat_status' ] = $this->language->get('entry_sub_cat_status');
		
		$this->data['entry_list_size' ] = $this->language->get('entry_list_size');
		$this->data['entry_image_size'] = $this->language->get('entry_image_size');
		
		$this->data['entry_layout'    ] = $this->language->get('entry_layout');
		$this->data['entry_position'  ] = $this->language->get('entry_position');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'    ] = $this->language->get('entry_status');
		
		$this->data['button_save'       ] = $this->language->get('button_save');
		$this->data['button_cancel'     ] = $this->language->get('button_cancel');
		$this->data['button_add_module' ] = $this->language->get('button_add_module');
		$this->data['button_remove'     ] = $this->language->get('button_remove');
		$this->data['button_insert'     ] = $this->language->get('button_insert');
		$this->data['button_clear_cache'] = $this->language->get('button_clear_cache');
		
		$this->data['note_list_height'] = $this->language->get('note_list_height');
		$this->data['note_clear_cache'] = $this->language->get('note_clear_cache');
		$this->data['note_separator'  ] = $this->language->get('note_separator');
		$this->data['note_slider'     ] = $this->language->get('note_slider');
		
		$this->data['error_warning'] = (isset ($this->error['warning'])) ? $this->error['warning'] : FALSE;
		
		$this->data['breadcrumbs'] = array (
			array (
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => FALSE
			),
			array (
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			),
			array (
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/search_advanced', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			)
		);
		
		$this->data['action'] = $this->url->link('module/search_advanced', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 30, 30);
		
		$this->data['attributes'] = $this->getAttributes();
		
		$this->load->model('catalog/category');
		
		$this->data['categories'] = $this->model_catalog_category->getCategories();
		
		$this->load->model('localisation/tax_class');
		
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->data['statuses'] = array (
			array ('id' => 0, 'name' => $this->language->get('text_disabled')),
			array ('id' => 1, 'name' => $this->language->get('text_list')),
			array ('id' => 2, 'name' => $this->language->get('text_dd_list'))
		);
		
		$this->data['types'] = array (
			array ('id' => 1, 'name' => $this->language->get('text_checkbox')),
			array ('id' => 2, 'name' => $this->language->get('text_radio')),
			array ('id' => 3, 'name' => $this->language->get('text_slider'))
		);
		
		if (isset ($this->request->post['search_advanced_module'])) {
			$this->data['modules'] = $this->request->post['search_advanced_module'];
		} else if ($this->config->get('search_advanced_module')) {
			$this->data['modules'] = $this->config->get('search_advanced_module');
		} else {
			$this->data['modules'] = array ();
		}
		
		if (isset ($this->request->post['search_advanced_setting'])) {
			$this->data['setting'] = $this->request->post['search_advanced_setting'];
		} else if ($this->config->get('search_advanced_setting')) {
			$this->data['setting'] = $this->config->get('search_advanced_setting');
		} else {
			$this->data['setting'] = array (
				'cache'           => 0,
				'title'           => NULL,
				'text'            => NULL,
				'category_status' => 0,
				'sub_cat_status'  => 0,
				'statuses'        => array (
					'title'    => 0,
					'desc'     => 0,
					'model'    => 0,
					'sku'      => 0
				),
				'price'           => NULL,
				'list_size'       => NULL,
				'image_size'      => NULL,
				'form_categories' => NULL,
				'stock'           => NULL,
				'manufacturers'   => NULL,
				'attributes'      => NULL
			);
		}
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->template = 'module/search_advanced.tpl';
		
		$this->children = array (
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	private function getAttributes() {
		$query = $this->db->query("SELECT a.attribute_id AS attribute_id, ad.name AS attribute_name, ag.attribute_group_id  AS attribute_group_id, agd.name AS attribute_group_name FROM " . DB_PREFIX . "attribute a LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (ad.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (ag.attribute_group_id = a.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (agd.attribute_group_id = ag.attribute_group_id) WHERE agd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ad.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY ag.sort_order, a.sort_order ASC");
		
		$attributes = array ();
		
		foreach ($query->rows as $row) {
			$attributes[$row['attribute_group_id']]['attribute_group_id'  ] = $row['attribute_group_id'  ];
			$attributes[$row['attribute_group_id']]['attribute_group_name'] = $row['attribute_group_name'];
			
			$attributes[$row['attribute_group_id']]['attributes'][$row['attribute_id']] = array (
				'attribute_id'   => $row['attribute_id'],
				'attribute_name' => $row['attribute_name']
			);
		}
		
		return $attributes;
	}
	
	public function clearCache() {
		$this->load->language('module/search_advanced');
		if ($this->validate()) {
			$this->cache->delete('search_advanced');
			$message = $this->language->get('text_clear_success');
		} else {
			$message = $this->error['warning'];
		}
		echo json_encode(array ('message' => $message));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/search_advanced')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return  (!$this->error) ? TRUE : FALSE;
	}
	
	public function install() {
		$this->redirect($this->url->link('module/search_advanced', 'token=' . $this->session->data['token'], 'SSL'));
	}
}
?>