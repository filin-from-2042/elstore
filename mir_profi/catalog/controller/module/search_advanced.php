<?php
// Controller Module
class ControllerModuleSearchAdvanced extends Controller {
	protected function index($setting) {
		$this->data['setting'] = $this->config->get('search_advanced_setting');
		
		$this->language->load('product/search_advanced');
		
		$this->load->model('catalog/search_advanced');
		
		$this->data['heading_title'] = $this->model_catalog_search_advanced->getText($this->data['setting']['title']);
		
		$this->data['entry_search'] = $this->language->get('entry_search');
		
		$this->data['text_name'] = $this->language->get('text_name');
		$this->data['text_model'] = $this->language->get('text_model');
		$this->data['text_sku'] = $this->language->get('text_sku');
		$this->data['text_category'] = $this->language->get('text_category');
		$this->data['text_description'] = $this->language->get('text_description');
		$this->data['text_sub_category'] = $this->language->get('text_sub_category');
		
		$this->data['button_search'] = $this->language->get('button_search');
		$this->data['button_reset'] = $this->language->get('button_reset');
		
		$this->data['filter_name'] = (isset ($this->request->get['filter_name'])) ? (string) $this->request->get['filter_name'] : FALSE;
		
		$this->data['filter_title'] = (isset ($this->request->get['filter_title'])) ? TRUE : FALSE;
		$this->data['filter_description'] = (isset ($this->request->get['filter_description'])) ? TRUE : FALSE;
		$this->data['filter_model'] = (isset ($this->request->get['filter_model'])) ? TRUE : FALSE;
		$this->data['filter_sku'] = (isset ($this->request->get['filter_sku'])) ? TRUE : FALSE;
		$this->data['filter_sub_category'] = (isset ($this->request->get['filter_sub_category'])) ? TRUE : FALSE;
		
		if (isset ($this->request->get['filter_category_id'])) {
			$parts = explode ('_', (string) $this->request->get['filter_category_id']);
			$filter_category_id = (int) array_pop ($parts);
			$this->data['filter_category_id'] = (string) $this->request->get['filter_category_id'];
		} else if (isset ($this->request->get['path'])) {
			$parts = explode ('_', (string) $this->request->get['path']);
			$filter_category_id = (int) array_pop ($parts);
			$this->data['filter_category_id'] = (string) $this->request->get['path'];
		} else {
			$filter_category_id = $this->data['filter_category_id'] = 0;
		}
		
		if ($this->data['setting']['category_status']) {
			$categories_1 = $this->model_catalog_category->getCategories();
			
			foreach ($categories_1 as $category_1) {
				$level_2_data = array ();
				
				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
				
				foreach ($categories_2 as $category_2) {
					$level_3_data = array ();
					
					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
					
					foreach ($categories_3 as $category_3) {
						$level_3_data[] = array(
							'category_id' => $category_2['parent_id'] . '_' . $category_3['parent_id'] . '_'.$category_3['category_id'],
							'name'        => $category_3['name'],
						);
					}
					
					$level_2_data[] = array(
						'category_id' => $category_2['parent_id'] . '_'.$category_2['category_id'],
						'name'        => $category_2['name'],
						'children'    => $level_3_data
					);
				}
				
				$this->data['categories'][] = array(
					'category_id' => $category_1['category_id'],
					'name'        => $category_1['name'],
					'children'    => $level_2_data
				);
			}
		} else {
			$this->data['categories'] = array ();
		}
		
		if ($setting['position'] == 'column_left' || $setting['position'] == 'column_right') {
			$this->data['br'] = '<br />';
			$this->data['position'] = FALSE;
		} else {
			$this->data['br'] = FALSE;
			$this->data['position'] = TRUE;
		}
		
		$this->getFilter($filter_category_id);
	}
	
	public function getFilter($filter_category_id = 0) {
		$this->data['setting'] = $this->config->get('search_advanced_setting');
		
		$this->language->load('product/search_advanced');
		
		$this->load->model('catalog/search_advanced');
		
		$this->data['text_filter'] = $this->model_catalog_search_advanced->getText($this->data['setting']['text']);
		$this->data['text_price_1'] = $this->language->get('text_price_1');
		$this->data['text_stock'] = $this->language->get('text_stock');
		$this->data['text_manufacturers'] = $this->language->get('text_manufacturers');
		
		if (isset ($this->request->get['filter_category_id'])) {
			$parts = explode ('_', (string) $this->request->get['filter_category_id']);
			$filter_category_id = (int) array_pop ($parts);
		}
		
		$this->data['filter'] = array (
			'manufacturers' => array (),
			'attributes'    => array (),
			'stocks'        => array (),
			'prices'        => array ()
		);
		
		if (is_array ($this->data['setting']['form_categories']) && in_array ($filter_category_id, $this->data['setting']['form_categories'])) {
			$this->data['filter'] = array (
				'manufacturers' => $this->model_catalog_search_advanced->getManufacturersToForm($this->data['setting'], $filter_category_id),
				'attributes'    => $this->model_catalog_search_advanced->getAttributesToForm($this->data['setting'], $filter_category_id),
				'stocks'        => $this->model_catalog_search_advanced->getStocksToForm($this->data['setting'], $filter_category_id),
				'prices'        => $this->model_catalog_search_advanced->getPricesToForm($this->data['setting'], $filter_category_id)
			);
		}
		
		if (isset ($this->request->get['ajax'])) {
			if (file_exists (DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/search_advanced_attributes.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/search_advanced_attributes.tpl';
			} else {
				$this->template = 'default/template/module/search_advanced_attributes.tpl';
			}
		} else {
			if (file_exists (DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/search_advanced.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/search_advanced.tpl';
			} else {
				$this->template = 'default/template/module/search_advanced.tpl';
			}
		}
		
		$this->data['input_status'] = $this->data['filter_status'] = FALSE;
		
		foreach ($this->data['setting']['statuses'] as $key => $value) {
			if ($value) {
				$this->data['input_status'] = TRUE;
				break;
			}
		}
		
		foreach ($this->data['filter'] as $key => $value) {
			if ($value) {
				$this->data['filter_status'] = TRUE;
				break;
			}
		}
		
		if ($this->data['input_status'] || $this->data['filter_status'] || $this->data['setting']['category_status'] || $this->data['setting']['sub_cat_status']) {
			$this->response->setOutput($this->render());
		}
	}
}
?>