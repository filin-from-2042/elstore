<?php
class ControllerModuleBatchEditor extends Controller {
	private $error = array ();
	
	private $filters = array (
		'number' => array ('price', 'quantity', 'sort_order', 'minimum', 'points', 'weight', 'length', 'width', 'height'),
		'list'   => array ('fc' => 'category', 'fa' => 'attribute', 'fm' => 'manufacturer', 'fss' => 'stock_status', 'ftc' => 'tax_class', 'fwc' => 'weight_class', 'flc' => 'length_class'),
		'other'  => array ('status', 'subtract', 'shipping')
	);
	
	private $links = array (
		'descriptions' => array (
			'list' => array ('languages'),
			'lang' => array ('entry_name', 'entry_meta_description', 'entry_meta_keyword', 'entry_description', 'entry_seo_title', 'entry_seo_h1', 'entry_tag')
		),
		'categories' => array (
			'list' => array ('categories'),
			'lang' => array ('column_categories', 'column_main_category', 'text_none')
		),
		'attributes' => array (
			'list' => array ('languages', 'attributes'),
			'lang' => array ('column_attribute_group', 'column_attribute_name', 'column_attribute_value', 'text_none')
		),
		'options' => array (
			'list' => array (),
			'lang' => array ('entry_required', 'entry_option_value', 'entry_quantity', 'entry_subtract', 'entry_price', 'entry_option_points', 'entry_weight', 'text_yes','text_no'),
			'func' => 1
		),
		'specials' => array (
			'list' => array ('customer_groups'),
			'lang' => array ('column_customer_group', 'column_priority', 'column_discount', 'column_date_start', 'column_date_end')
		),
		'discounts' => array (
			'list' => array ('customer_groups'),
			'lang' => array ('column_customer_group', 'column_quantity', 'column_priority', 'column_discount', 'column_date_start', 'column_date_end')
		),
		'related' => array (
			'list' => array (),
			'lang' => array (),
			'func' => 1
		),
		'stores' => array (
			'list' => array ('stores'),
			'lang' => array ('text_default')
		),
		'downloads' => array (
			'list' => array ('downloads'),
			'lang' => array ()
		),
		'images' => array (
			'list' => array ('no_image'),
			'lang' => array ('text_image_manager', 'column_sort_order', 'text_clear', 'text_path'),
			'func' => 1
		),
		'rewards' => array (
			'list' => array ('customer_groups'),
			'lang' => array ('column_customer_group', 'column_points')
		)
	);
	
	private $product_description = array ('name', 'meta_description', 'meta_keyword', 'seo_title', 'seo_h1', 'url_alias', 'tag');
	
	public function index() {
		$this->data['setting'] = $this->getSetting();
		
		$this->load->language('module/batch_editor');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_min'] = $this->language->get('text_min');
		$this->data['text_max'] = $this->language->get('text_max');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_up'] = $this->language->get('text_up');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_exact_entry'] = $this->language->get('text_exact_entry');
		$this->data['text_in_name'] = $this->language->get('text_in_name');
		$this->data['text_in_description'] = $this->language->get('text_in_description');
		$this->data['text_in_model'] = $this->language->get('text_in_model');
		$this->data['text_in_sku'] = $this->language->get('text_in_sku');
		$this->data['text_in_upc'] = $this->language->get('text_in_upc');
		$this->data['text_in_location'] = $this->language->get('text_in_location');
		$this->data['text_quantity_copies'] = $this->language->get('text_quantity_copies');
		$this->data['text_path'] = $this->language->get('text_path');
		$this->data['text_clear'] = $this->language->get('text_clear');
		
		$this->data['entry_option_value'] = $this->language->get('entry_option_value');
		$this->data['entry_option_points'] = $this->language->get('entry_option_points');
		$this->data['entry_quantity'] = $this->language->get('entry_quantity');
		$this->data['entry_subtract'] = $this->language->get('entry_subtract');
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_weight'] = $this->language->get('entry_weight');
		$this->data['entry_required'] = $this->language->get('entry_required');
		
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_links'] = $this->language->get('tab_links');
		$this->data['tab_tools'] = $this->language->get('tab_tools');
		
		$this->data['column_categories'] = $this->language->get('column_categories');
		$this->data['column_main_category'] = $this->language->get('column_main_category');
		$this->data['column_attributes'] = $this->language->get('column_attributes');
		$this->data['column_options'] = $this->language->get('column_options');
		$this->data['column_specials'] = $this->language->get('column_specials');
		$this->data['column_discounts'] = $this->language->get('column_discounts');
		$this->data['column_related'] = $this->language->get('column_related');
		$this->data['column_stores'] = $this->language->get('column_stores');
		$this->data['column_downloads'] = $this->language->get('column_downloads');
		$this->data['column_images'] = $this->language->get('column_images');
		$this->data['column_rewards'] = $this->language->get('column_rewards');
		
		$this->data['column_keyword'] = $this->language->get('column_keyword');
		$this->data['column_limit'] = $this->language->get('column_limit');
		$this->data['column_priority'] = $this->language->get('column_priority');
		$this->data['column_discount'] = $this->language->get('column_discount');
		$this->data['column_date_start'] = $this->language->get('column_date_start');
		$this->data['column_date_end'] = $this->language->get('column_date_end');
		
		$this->data['column_customer_group'] = $this->language->get('column_customer_group');
		$this->data['column_attribute_group'] = $this->language->get('column_attribute_group');
		$this->data['column_attribute_name'] = $this->language->get('column_attribute_name');
		$this->data['column_attribute_value'] = $this->language->get('column_attribute_value');
		
		$this->data['column_columns'] = $this->language->get('column_columns');
		$this->data['column_weight_dimensions'] = $this->language->get('column_weight_dimensions');
		
		$this->data['column_autocomplete'] = $this->language->get('column_autocomplete');
		
		$this->data['column_separator'] = $this->language->get('column_separator');
		$this->data['column_text_start'] = $this->language->get('column_text_start');
		$this->data['column_text_end'] = $this->language->get('column_text_end');
		$this->data['column_template'] = $this->language->get('column_template');
		$this->data['column_apply'] = $this->language->get('column_apply');
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_copy'] = $this->language->get('button_copy');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_filter'] = $this->language->get('button_filter');
		$this->data['button_reset'] = $this->language->get('button_reset');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_setting'] = $this->language->get('button_setting');
		
		$this->data['button_insert_sel'] = $this->language->get('button_insert_sel');
		$this->data['button_delete_sel'] = $this->language->get('button_delete_sel');
		$this->data['button_clear_cache'] = $this->language->get('button_clear_cache');
		
		$this->data['language_id'] = (int) $this->config->get('config_language_id');
		
		foreach ($this->data['setting']['fields'] as $name=>$data) {
			$this->data['column_' . $name] = $this->language->get('column_' . $name);
			
			if (isset ($data['alias'][$this->data['language_id']]) && $data['alias'][$this->data['language_id']]) {
				$this->data['setting']['fields'][$name]['alias'] = $data['alias'][$this->data['language_id']];
			} else {
				$this->data['setting']['fields'][$name]['alias'] = $this->language->get('column_' . $name);
			}
		}
		
		foreach ($this->product_description as $column) {
			$this->data['column_' . $column] = $this->language->get('column_' . $column);
		}
		
		$lists = array ('manufacturer_id', 'stock_status_id', 'categories', 'customer_groups', 'tax_class_id', 'length_class_id', 'weight_class_id', 'discount_actions', 'calculate', 'stores', 'downloads', 'languages', 'attributes');
		
		if ($this->validateField('asticker_id', 'product')) {
			$lists[] = 'asticker_id';
		}
		
		$this->getLists($lists);
		
		$this->data['product_id'] = (isset ($this->request->post['selected'])) ? $this->request->post['selected'] : array ();
		
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
				'href'      => $this->url->link('module/batch_editor', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			)
		);
		
		if (isset ($this->request->post['quantity_copies_products'])) {
			$this->data['quantity_copies_products'] = abs ((int) $this->request->post['quantity_copies_products']);
		} else {
			$this->data['quantity_copies_products'] = 1;
		}
		
		if ($this->data['quantity_copies_products'] == 0) {
			$this->data['quantity_copies_products'] = 1;
		}
		
		$this->data['product_description'] = $this->product_description;
		
		$this->load->model('tool/image');
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 40, 40);
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['setting_link'] = $this->url->link('module/batch_editor/setting', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['main_category'] = $this->validateField('main_category', 'product_to_category');
		
		$this->data['autocomplete'] = array (
			'tpl' => array ('name', 'model', 'sku', 'upc', 'location', 'attributes'),
			'app' => array ('meta_description', 'meta_keyword', 'tag')
		);
		
		if ($this->validateField(array ('seo_title', 'seo_h1'), 'product_description')) {
			$this->data['autocomplete']['app'][] = 'seo_title';
			$this->data['autocomplete']['app'][] = 'seo_h1';
		}
		
		asort ($this->data['autocomplete']['app']);
		
		if (isset ($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			
			unset ($this->session->data['success']);
		} else {
			$this->data['success'] = FALSE;
		}
		
		$this->template = 'module/batch_editor/index.tpl';
		$this->children = array (
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	public function getProducts() {
		$this->data['setting'] = $this->getSetting();
		
		$this->load->language('module/batch_editor');
		
		$this->data['text_view'] = $this->language->get('text_view');
		$this->data['text_related'] = $this->language->get('text_related');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_path'] = $this->language->get('text_path');
		
		$this->data['column_descriptions'] = $this->language->get('column_descriptions');
		$this->data['column_categories'] = $this->language->get('column_categories');
		$this->data['column_attributes'] = $this->language->get('column_attributes');
		$this->data['column_options'] = $this->language->get('column_options');
		$this->data['column_specials'] = $this->language->get('column_specials');
		$this->data['column_discounts'] = $this->language->get('column_discounts');
		$this->data['column_manufacturer'] = $this->language->get('column_manufacturer');
		$this->data['column_stock_status'] = $this->language->get('column_stock_status');
		$this->data['column_related'] = $this->language->get('column_related');
		$this->data['column_stores'] = $this->language->get('column_stores');
		$this->data['column_downloads'] = $this->language->get('column_downloads');
		$this->data['column_images'] = $this->language->get('column_images');
		$this->data['column_rewards'] = $this->language->get('column_rewards');
		
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['filter_fields'][] = 'name';
		
		if (isset ($this->request->post['filter_fields']) && is_array ($this->request->post['filter_fields'])) {
			$this->data['filter_fields'] = array_merge ($this->data['filter_fields'], $this->request->post['filter_fields']);
		}
		
		$language_id = (int) $this->config->get('config_language_id');
		
		$tables = array ();
		
		$sql_fields = $sql_tables = $sorts = FALSE;
		
		foreach ($this->data['setting']['fields'] as $name=>$field) {
			if (in_array ($name, $this->data['filter_fields'])) {
				if (isset ($field['alias'][$language_id])) {
					$this->data['column_' . $name] = ($field['alias'][$language_id]) ? $field['alias'][$language_id] : 'column_' . $name;
				} else {
					$this->data['column_' . $name] = $this->language->get('column_' . $name);
				}
				
				if (isset ($field['link'])) {
					$value = explode ('|', $field['link']);
					
					if ($name != 'tag' || ($name == 'tag' && VERSION > '1.5.3.1')) {
						$this->data['sort_' . $name] = $sorts[] = $value[1] . '.' . $value[2];
						
						$sql_fields .= $value[1] . "." . $value[2] . " AS " . $name . ", ";
					} else {
						$sql_fields .= "(SELECT GROUP_CONCAT(pt.tag) FROM " . DB_PREFIX . "product_tag pt WHERE pt.product_id=p.product_id AND language_id='" . $language_id . "') AS " . $name . ", ";
						
						$this->data['sort_' . $name] = '';
					}
					
					if ($name == 'url_alias') {
						$sql_tables .= "LEFT JOIN " . DB_PREFIX . "url_alias ua ON (ua.query = CONCAT('product_id=', p.product_id)) ";
					} else {
						if ($name != 'tag' || ($name == 'tag' && VERSION > '1.5.3.1')) {
							if (!in_array ($value[0], $tables)) {
								if (in_array ($name, $this->product_description)) {
									$sql_tables .= "LEFT JOIN " . DB_PREFIX . $value[0] . " " . $value[1] . " ON (p.product_id = " . $value[1] . ".product_id";
								} else {
									$sql_tables .= "LEFT JOIN " . DB_PREFIX . $value[0] . " " . $value[1] . " ON (p." . $name . " = " . $value[1] . "." . $name;
								}
								
								if (preg_match ('/_description$/', $value[0])) {
									$sql_tables .= " AND " . $value[1] . ".language_id = '" . $language_id . "') ";
								} else {
									$sql_tables .= ") ";
								}
								
								$tables[] = $value[0];
							}
						}
					}
				} else {
					$this->data['sort_' . $name] = $sorts[] = 'p.' . $name;
					
					$sql_fields .= "p." . $name . " AS " . $name . ", ";
				}
			} else {
				unset ($this->data['setting']['fields'][$name]);
			}
		}
		
		$this->data['product_id'] = (isset ($this->request->post['selected'])) ? $this->request->post['selected'] : array ();
		
		$this->data['limit'] = (isset ($this->request->post['limit'])) ? abs ((int) $this->request->post['limit']) : 20;
		
		if ($this->data['limit'] < 1) {
			$this->data['limit'] = 20;
		}
		
		$this->data['page'] = (isset ($this->request->post['page'])) ? abs ((int) $this->request->post['page']) : 1;
		
		$this->data['start'] = ($this->data['page'] - 1) * $this->data['limit'];
		
		if ($this->data['start'] < 0) {
			$this->data['start'] = 0;
		}
		
		$this->data['sort'] = (isset ($this->request->post['sort'])) ? (string) $this->request->post['sort'] : 'p.product_id';
		
		if (!in_array ($this->data['sort'], $sorts)) {
			$this->data['sort'] = 'p.product_id';
		}
		
		$this->data['order'] = (isset ($this->request->post['order'])) ? (string) $this->request->post['order'] : 'ASC';
		
		$this->data['filter_keyword'] = (isset ($this->request->post['filter_keyword'])) ? trim ($this->request->post['filter_keyword']) : NULL;
		
		$this->data['filter_search_in'] = (isset ($this->request->post['filter_search_in'])) ? $this->request->post['filter_search_in'] : NULL;
		
		foreach ($this->filters['other'] as $filter) {
			$this->data['filter_' . $filter] = (isset ($this->request->post['filter_' . $filter])) ? (int) $this->request->post['filter_' . $filter] : NULL;
		}
		
		foreach ($this->filters['number'] as $filter) {
			$this->data['filter_' . $filter] = (isset ($this->request->post['filter_' . $filter])) ? $this->request->post['filter_' . $filter] : NULL;
		}
		
		foreach ($this->filters['list'] as $key => $filter) {
			$this->data['filter_' . $filter] = (isset ($this->request->post[$key]) && is_array ($this->request->post[$key])) ? implode (', ', $this->request->post[$key]) : FALSE;
			
			$this->data['filter'][$filter . '_not'] = (isset ($this->request->post['filter'][$key . '_not'])) ? 'NOT' : FALSE;
		}
		
		$data = array (
			'filter'              => $this->data['filter'],
			'filter_keyword'      => $this->data['filter_keyword'],
			'filter_search_in'    => $this->data['filter_search_in'],
			'filter_status'       => $this->data['filter_status'],
			'filter_subtract'     => $this->data['filter_subtract'],
			'filter_shipping'     => $this->data['filter_shipping'],
			'filter_price'        => $this->data['filter_price'],
			'filter_quantity'     => $this->data['filter_quantity'],
			'filter_sort_order'   => $this->data['filter_sort_order'],
			'filter_minimum'      => $this->data['filter_minimum'],
			'filter_points'       => $this->data['filter_points'],
			'filter_weight'       => $this->data['filter_weight'],
			'filter_length'       => $this->data['filter_length'],
			'filter_width'        => $this->data['filter_width'],
			'filter_height'       => $this->data['filter_height'],
			'filter_category'     => $this->data['filter_category'],
			'filter_attribute'    => $this->data['filter_attribute'],
			'filter_manufacturer' => $this->data['filter_manufacturer'],
			'filter_stock_status' => $this->data['filter_stock_status'],
			'filter_tax_class'    => $this->data['filter_tax_class'],
			'filter_weight_class' => $this->data['filter_weight_class'],
			'filter_length_class' => $this->data['filter_length_class'],
			'sort'                => $this->data['sort'],
			'order'               => $this->data['order'],
			'start'               => $this->data['start'],
			'limit'               => $this->data['limit'],
			'counter'             => $this->data['setting']['counter'],
			'sql_fields'          => $sql_fields,
			'sql_tables'          => $sql_tables
		);
		
		$this->load->model('catalog/batch_editor/products');
		
		$product_total = $this->model_catalog_batch_editor_products->getTotalProducts($data);
		
		$results = $this->model_catalog_batch_editor_products->getProducts($data);
		
		$this->data['product_description'] = $this->product_description;
		
		$this->load->model('tool/image');
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 40, 40);
		
		$this->data['token'] = $this->session->data['token'];
		
		unset ($this->links['descriptions'], $this->links['rewards']);
		
		$this->data['products'] = array ();
		
		$i = 0;
		
		foreach ($results as $result) {
			$this->data['products'][$i] = array (
				'product_id' => $result['product_id'],
				'selected'   => in_array ($result['product_id'], $this->data['product_id']),
			);
			
			if ($this->data['setting']['counter']) {
				foreach ($this->links as $name=>$field) {
					$this->data['products'][$i][$name] = (int) $result[$name];
				}
			}
			
			foreach ($this->data['setting']['fields'] as $name=>$field) {
				if ($name == 'image') {
					$this->data['products'][$i]['image'] = $result['image'];
					
					if ($result['image'] && file_exists (DIR_IMAGE . $result['image'])) {
						$this->data['products'][$i]['thumb'] = $this->model_tool_image->resize($result['image'], 40, 40);
					} else {
						$this->data['products'][$i]['thumb'] = $this->data['no_image'];
					}
				} else {
					$this->data['products'][$i][$name] = $result[$name];
				}
			}
			
			$i++;
		}
		
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $this->data['page'];
		$pagination->limit = $this->data['limit'];
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = '{page}';
		
		$this->data['pagination'] = $pagination->render();
		
		$this->template = 'module/batch_editor/products.tpl';
		
		$this->response->setOutput($this->render());
	}
	
	public function getProductList() {
		$path = (isset ($this->request->post['path'])) ? (string) $this->request->post['path'] : FALSE;
		
		if (isset ($this->links[$path])) {
			$this->data['product_id'] = (isset ($this->request->post['product_id'])) ? (int) $this->request->post['product_id'] : FALSE;
			
			if (isset ($this->links[$path]['func'])) {
				$this->load->model('catalog/batch_editor/get_lists');
				
				$this->data['product_' . $path] = $this->model_catalog_batch_editor_get_lists->{'getProduct' . $path}($this->data['product_id']);
			} else {
				$this->load->model('catalog/product');
				
				$this->data['product_' . $path] = $this->model_catalog_product->{'getProduct' . $path}($this->data['product_id']);
			}
			
			if ($path == 'descriptions') {
				if (VERSION <= '1.5.3.1') {
					$this->data['product_tags'] = $this->model_catalog_product->getProductTags($this->data['product_id']);
				} else {
					foreach ($this->data['product_descriptions'] as $key => $value) {
						$this->data['product_tags'][$key] = $value['tag'];
					}
				}
			}
			
			if ($path == 'categories' && $this->validateField('main_category', 'product_to_category')) {
				$data = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = " . $this->data['product_id'] . " AND main_category = 1")->row;
				
				if (isset ($data['category_id'])) {
					$this->data['main_category'] = $data['category_id'];
				} else {
					$this->data['main_category'] = 0;
				}
			}
			
			$this->load->language('module/batch_editor');
			
			$this->data['column_' . $path] = $this->language->get('column_' . $path);
			
			$this->data['text_no_results'] = $this->language->get('text_no_results');
			
			$this->data['button_insert'] = $this->language->get('button_insert');
			$this->data['button_remove'] = $this->language->get('button_remove');
			$this->data['button_save'] = $this->language->get('button_save');
			
			foreach ($this->links[$path]['lang'] as $lang) {
				$this->data[$lang] = $this->language->get($lang);
			}
			
			$this->data['language_id'] = (int) $this->config->get('config_language_id');
			
			$this->getLists($this->links[$path]['list']);
			
			$this->load->model('tool/image');
			
			$this->data['product_name'] = $this->model_catalog_batch_editor_get_lists->getProductName((int) $this->data['product_id']);
			
			$this->data['product_image'] = $this->model_tool_image->resize($this->model_catalog_batch_editor_get_lists->getProductImage((int) $this->data['product_id']), 40, 40);
			
			$this->template = 'module/batch_editor/product_' . $path . '.tpl';
			
			$this->response->setOutput($this->render());
		}
	}
	
	public function editProducts() {
		$warning = $success = '';
		
		$this->load->language('module/batch_editor');
		
		$path = (isset ($this->request->post['path'])) ? $this->request->post['path'] : FALSE;
		
		$action = (isset ($this->request->post['action'])) ? $this->request->post['action'] : FALSE;
		
		$this->data['product_id'] = (isset ($this->request->post['selected'])) ? $this->request->post['selected'] : array ();
		
		if ($path == 'descriptions') {
			$validate = 'validateForm';
			
			$this->data['product_' . $path][$path] = (isset ($this->request->post['product_' . $path])) ? $this->request->post['product_' . $path] : array ();
			
			$this->data['product_' . $path]['tags'] = (isset ($this->request->post['product_tags'])) ? $this->request->post['product_tags'] : array ();
		} else {
			$validate = 'validate';
			
			$this->data['product_' . $path] = (isset ($this->request->post['product_' . $path])) ? $this->request->post['product_' . $path] : array ();
		}
		
		if ($path == 'attributes') {
			foreach ($this->data['product_attributes'] as $product_attribute) {
				if (empty ($product_attribute['name'])) {
					$warning = $this->language->get('error_empty_attribute_name');
					
					break;
				}
			}
		}
		
		if ($path == 'categories' || $path == 'attributes' || $path == 'options' || $path == 'related' || $path == 'stores' || $path == 'downloads') {
			if (!$this->data['product_' . $path] && $action != 'upd') {
				$warning = $this->language->get('error_empty_' . $path);
			}
		}
		
		if ($path == 'autocomplete' && (!isset ($this->request->post['product_autocomplete']['tpl']) || !isset ($this->request->post['product_autocomplete']['app']))) {
			$warning = $this->language->get('error_empty_parameters');
		}
		
		if (!$this->data['product_id']) {
			$warning = $this->language->get('error_empty_product');
		}
		
		if ($warning) {
			$this->error['warning'] = $warning;
		}
		
		if ($this->{$validate}()) {
			$setting = $this->getSetting();
			
			if ($path == 'autocomplete') {
				$this->load->model('catalog/batch_editor/tools');
				
				$this->model_catalog_batch_editor_tools->autocomplete($this->data['product_id'], $this->data['product_' . $path], $action);
			} else if (isset ($this->links[$path]) || $path == 'copy' || $path == 'delete') {
				$this->load->model('catalog/batch_editor/product_edit');
				
				$this->model_catalog_batch_editor_product_edit->{$path}($this->data['product_id'], $this->data['product_' . $path], $action);
			} else if (isset ($setting['fields'][$path])) {
				$this->load->model('catalog/batch_editor/product_edit');
				
				$value = $this->model_catalog_batch_editor_product_edit->Edit($this->data['product_id'], $this->data['product_' . $path], $path, $setting);
			}
			
			if ($path == 'copy' || $path == 'delete') {
				$success = $this->language->get('success_edit_' . $path);
			} else {
				$success = $this->language->get('success_edit_products');
			}
			
			$this->cache->delete('product');
		}
		
		echo json_encode (array ('warning' => $warning, 'success' => $success));
	}
	
	public function setting() {
		$this->load->language('module/batch_editor');
		
		$this->document->setTitle($this->language->get('button_setting'));
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset ($this->request->post['batch_editor_setting']['limits'])) {
				$this->request->post['batch_editor_setting']['limits'] = array (20);
			}
			
			foreach ($this->request->post['batch_editor_setting']['limits'] as $key => $value) {
				$this->request->post['batch_editor_setting']['limits'][$key] = (int) $value;
				
				if (!$this->request->post['batch_editor_setting']['limits'][$key]) {
					unset ($this->request->post['batch_editor_setting']['limits'][$key]);
				}
			}
			
			foreach ($this->request->post['batch_editor_setting']['fields_sort_order'] as $key => $value) {
				$this->request->post['batch_editor_setting']['fields_sort_order'][$key] = (int) $value;
			}
			
			$fields_sort_order = $this->request->post['batch_editor_setting']['fields_sort_order'];
			
			array_multisort ($fields_sort_order, $this->request->post['batch_editor_setting']['fields']);
			
			$this->request->post['batch_editor_setting']['limits'] = array_unique ($this->request->post['batch_editor_setting']['limits']);
			
			asort ($this->request->post['batch_editor_setting']['limits']);
			
			$this->request->post['batch_editor_setting']['fields']['name']['status'] = 1;
			
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('batch_editor', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('success_edit_setting');
			
			$this->redirect($this->url->link('module/batch_editor', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['heading_title'] = $this->language->get('button_setting');
		
		$this->data['column_field_name'] = $this->language->get('column_field_name');
		$this->data['column_field_type'] = $this->language->get('column_field_type');
		$this->data['column_field_calculate'] = $this->language->get('column_field_calculate');
		$this->data['column_field_alias'] = $this->language->get('column_field_alias');
		$this->data['column_field_status'] = $this->language->get('column_field_status');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		
		$this->data['column_fields'] = $this->language->get('column_fields');
		$this->data['column_limit'] = $this->language->get('column_limit');
		$this->data['column_optional'] = $this->language->get('column_optional');
		
		$this->data['entry_counter'] = $this->language->get('entry_counter');
		
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_setting'] = $this->language->get('button_setting');
		
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
				'href'      => $this->url->link('module/batch_editor', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			),
			array (
				'text'      => $this->language->get('button_setting'),
				'href'      => $this->url->link('module/batch_editor/setting', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			)
		);
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->data['fields_default'] = array ('model', 'sku', 'upc', 'location', 'quantity', 'stock_status_id', 'image', 'manufacturer_id', 'shipping', 'price', 'points', 'tax_class_id', 'date_available', 'weight', 'weight_class_id', 'length', 'width', 'height', 'length_class_id', 'subtract', 'minimum', 'sort_order', 'status', 'viewed');
		
		$links = array (
			'manufacturer_id' => 'manufacturer|m|name',
			'stock_status_id' => 'stock_status|ss|name',
			'tax_class_id'    => 'tax_class|tc|title',
			'weight_class_id' => 'weight_class_description|wcd|title',
			'length_class_id' => 'length_class_description|lcd|title',
			'asticker_id'     => 'astickers|ast|name'
		);
		
		$exclude_fields = array ('product_id', 'date_added', 'date_modified');
		
		$data_array = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product")->rows;
		
		$this->data['product_fields'][] = array ('name' => 'name', 'type' => 'varchar(255)', 'alias' => $this->language->get('column_name'), 'link' => 'product_description|pd|name');
		$this->data['product_fields'][] = array ('name' => 'meta_description', 'type' => 'varchar(255)', 'alias' => $this->language->get('column_meta_description'), 'link' => 'product_description|pd|meta_description');
		$this->data['product_fields'][] = array ('name' => 'meta_keyword', 'type' => 'varchar(255)', 'alias' => $this->language->get('column_meta_keyword'), 'link' => 'product_description|pd|meta_keyword');
		
		if ($this->validateField(array ('seo_title', 'seo_h1'), 'product_description')) {
			$this->data['product_fields'][] = array ('name' => 'seo_title', 'type' => 'varchar(255)', 'alias' => $this->language->get('column_seo_title'), 'link' => 'product_description|pd|seo_title');
			$this->data['product_fields'][] = array ('name' => 'seo_h1', 'type' => 'varchar(255)', 'alias' => $this->language->get('column_seo_h1'), 'link' => 'product_description|pd|seo_h1');
		}
		
		if (VERSION > '1.5.3.1') {
			$this->data['product_fields'][] = array ('name' => 'tag', 'type' => 'text', 'alias' => $this->language->get('column_tag'), 'link' => 'product_description|pd|tag');
		} else {
			$this->data['product_fields'][] = array ('name' => 'tag', 'type' => 'varchar(32)', 'alias' => $this->language->get('column_tag'), 'link' => 'product_tag|pt|tag');
		}
		
		$this->data['product_fields'][] = array ('name' => 'url_alias', 'type' => 'varchar(255)', 'alias' => $this->language->get('column_url_alias'), 'link' => 'url_alias|ua|keyword');
		
		$i = count ($this->data['product_fields']);
		
		foreach ($data_array as $key=>$data) {
			if (!in_array ($data['Field'], $exclude_fields)) {
				$this->data['product_fields'][$i]['name'] = $data['Field'];
				$this->data['product_fields'][$i]['type'] = $data['Type'];
				
				if (in_array ($data['Field'], $this->data['fields_default'])) {
					$this->data['product_fields'][$i]['alias'] = $this->language->get('column_' . $data['Field']);
				}
				
				if (isset ($links[$data['Field']])) {
					$this->data['product_fields'][$i]['link'] = $links[$data['Field']];
				}
				
				if (!isset ($links[$data['Field']]) && (preg_match ('/^int/', $data['Type']) || preg_match ('/^decimal/', $data['Type']))) {
					$this->data['product_fields'][$i]['calc'] = 1;
				}
			}
			
			$i++;
		}
		
		$this->data['setting'] = $this->getSetting(FALSE);
		
		$this->data['action'] = $this->url->link('module/batch_editor/setting', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('module/batch_editor', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset ($this->error['warning'])) {
			$this->data['warning'] = $this->error['warning'];
		} else {
			$this->data['warning'] = '';
		}
		
		$this->template = 'module/batch_editor/setting.tpl';
		
		$this->children = array (
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	public function loadAttributes() {
		$this->load->model('catalog/batch_editor/get_lists');
		
		$this->load->language('module/batch_editor');
		
		$this->data['text_none'] = $this->language->get('text_none');
		
		$this->data['get'] = array (
			'table'              => (isset ($this->request->get['table'])) ? (string) $this->request->get['table'] : FALSE,
			'row_id'             => (isset ($this->request->get['row_id'])) ? (int) $this->request->get['row_id'] : 0,
			'attribute_group_id' => (isset ($this->request->get['attribute_group_id'])) ? (int) $this->request->get['attribute_group_id'] : 0
		);
		
		$this->data['attributes'] = $this->model_catalog_batch_editor_get_lists->getAttributesByGroupId($this->data['get']['attribute_group_id']);
		
		$this->template = 'module/batch_editor/select_attributes.tpl';
		
		$this->response->setOutput($this->render());
	}
	
	public function quickEditProduct() {
		$this->load->model('catalog/batch_editor/product_edit');
		
		$this->load->language('module/batch_editor');
		
		$products = (isset ($this->request->post['product_id'])) ? $this->request->post['product_id'] : FALSE;
		$value = (isset ($this->request->post['value'])) ? $this->request->post['value'] : FALSE;
		$field = (isset ($this->request->post['field'])) ? $this->request->post['field'] : FALSE;
		
		if ($this->validate()) {
			$value = $this->model_catalog_batch_editor_product_edit->Edit($products, $value, $field, $this->getSetting());
			
			$this->cache->delete('product');
		}
		
		echo json_encode (array (
			'value'   => $value,
			'warning' => (isset ($this->error['warning'])) ? $this->error['warning'] : FALSE)
		);
	}
	
	public function quickEditProductSelect() {
		$this->data['id'] = (isset ($this->request->get['id'])) ? (int) $this->request->get['id'] : FALSE;
		
		$this->data['name'] = (isset ($this->request->get['name'])) ? (string) $this->request->get['name'] : FALSE;
		
		$this->data['action'] = (isset ($this->request->get['action'])) ? (string) $this->request->get['action'] : FALSE;
		
		$this->data['actions'] = array ('status', 'shipping', 'subtract', 'manufacturer_id', 'stock_status_id', 'tax_class_id', 'length_class_id', 'weight_class_id', 'asticker_id');
		
		if (in_array ($this->data['action'], $this->data['actions'])) {
			$this->getLists(array ($this->data['action']));
			
			$this->template = 'module/batch_editor/select_quick_edit.tpl';
			
			$this->response->setOutput($this->render());
		}
	}
	
	public function clearCache() {
		$this->load->language('module/batch_editor');
		
		if ($this->validate()) {
			$this->cache->delete('batch_editor');
		}
		
		echo json_encode (array ('warning' => ($this->error) ? $this->error['warning'] : FALSE, 'success' => (!$this->error) ? $this->language->get('success_clear_cache') : FALSE));
	}
	
	public function imageResize() {
		$this->load->model('tool/image');
		
		$image = (isset ($this->request->post['image'])) ? $this->request->post['image'] : FALSE;
		
		$width = (isset ($this->request->post['width'])) ? abs ((int) $this->request->post['width']) : FALSE;
		
		$height = (isset ($this->request->post['height'])) ? abs ((int) $this->request->post['height']) : FALSE;
		
		if ($width == 0 || $height == 0) {
			$width = $height = 40;
		}
		
		if ($image && file_exists (DIR_IMAGE . $image)) {
			$image = $this->model_tool_image->resize($image, $width, $height);
		} else {
			$image = $this->model_tool_image->resize('no_image.jpg', $width, $height);
		}
		
		$this->response->setOutput($image);
	}
	
	public function getImageManager() {
		if (isset ($this->request->get['keyword']) && isset ($this->request->get['dir'])) {
			$results = $images = array ();
			
			$dir = $this->request->get['dir'];
			$keyword = trim ($this->request->get['keyword']);
			
			if (is_dir (DIR_IMAGE . $dir) && $keyword) {
				$results = glob (DIR_IMAGE . $dir . $keyword . '*.{JPG,jpg,JPEG,jpeg,PNG,png,GIF,gif}', GLOB_BRACE);
			}
			
			if ($results) {
				$this->load->model('tool/image');
				
				$i = 0;
				
				foreach ($results as $result) {
					if (!is_dir ($result)) {
						$file = str_replace (DIR_IMAGE . $dir, '', $result);
						
						$images[] = array (
							'file' => $file,
							'img'  => $this->model_tool_image->resize($dir . $file, 40, 40)
						);
					}
					
					$i++;
					
					if ($i == 10) {
						break;
					}
				}
			}
			
			$this->response->setOutput(json_encode ($images));
		} else {
			if (isset ($this->request->get['id'])) {
				$this->data['id'] = (int) $this->request->get['id'];
			} else {
				$this->data['id'] = FALSE;
			}
			
			if (isset ($this->request->get['list']) && $this->request->get['list']) {
				$this->data['list'] = (int) $this->request->get['list'];
			} else {
				$this->data['list'] = FALSE;
			}
			
			$this->data['button_remove'] = $this->language->get('button_remove');
			
			$this->data['dirs'] = $this->cache->get('batch_editor.dirs_images');
			
			if (!$this->data['dirs']) {
				$this->data['dirs'] = $this->getDirsImages();
				
				$this->cache->set('batch_editor.dirs_images', $this->data['dirs']);
			}
			
			$this->template = 'module/batch_editor/image_manager.tpl';
			
			$this->response->setOutput($this->render());
		}
	}
	
	private function getDirsImages($path = 'data/') {
		static $dirs = array ('data/');
		
		$results = scandir (DIR_IMAGE . $path);
		
		foreach ($results as $result) {
			if ($result != '.' && $result != '..' && is_dir (DIR_IMAGE . $path . $result)) {
				$dirs[] = $path . $result . '/';
				
				$this->getDirsImages($path . $result . '/');
			}
		}
		
		return $dirs;
	}
	
	private function getLists($keys = array ()) {
		$this->load->model('catalog/batch_editor/get_lists');
		
		foreach ($keys as $key) {
			$this->data[$key] = $this->model_catalog_batch_editor_get_lists->{'get' . str_replace ('_', '', $key)} ();
		}
	}
	
	private function getSetting($redirect = TRUE) {
		$setting = $this->config->get('batch_editor_setting');
		
		if (!isset ($setting['fields']) && $redirect) {
			$this->redirect($this->url->link('module/batch_editor/setting', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (!isset ($setting['limits'])) {
			$setting['limits'] = array (20);
		}
		
		if (!isset ($setting['fields'])) {
			$setting['fields'] = array ();
		}
		
		return $setting;
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/batch_editor')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return (!$this->error) ? TRUE : FALSE;
	}
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/batch_editor')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		foreach ($this->request->post['product_descriptions'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_product_name');
			}
		}
		
		if ($this->error && !isset ($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_validate_form');
		}
		
		return (!$this->error) ? TRUE : FALSE;
	}
	
	private function validateField($field, $table) {
		$status = FALSE;
		
		$data = $this->db->query('SHOW COLUMNS FROM ' . DB_PREFIX . $table)->rows;
		
		foreach ($data as $value) {
			if (is_array ($field)) {
				if (in_array ($value['Field'], $field)) {
					$status = TRUE;
					
					break;
				}
			} else {
				if ($value['Field'] == $field) {
					$status = TRUE;
					
					break;
				}
			}
		}
		
		return $status;
	}
}
?>