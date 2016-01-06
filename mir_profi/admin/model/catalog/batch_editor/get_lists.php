<?php
class ModelCatalogBatchEditorGetLists extends Model {
	public function getProductName($product_id) {
		$result = $this->db->query('SELECT name FROM ' . DB_PREFIX . 'product_description WHERE product_id = ' . (int) $product_id . ' AND language_id = ' . (int) $this->config->get('config_language_id'))->row;
		
		return (isset ($result['name'])) ? html_entity_decode ($result['name'], ENT_QUOTES, 'UTF-8') : FALSE;
	}
	
	public function getProductImage($product_id) {
		$result = $this->db->query('SELECT image FROM ' . DB_PREFIX . 'product WHERE product_id = "' . (int) $product_id . '"')->row;
		
		return ($result['image'] && file_exists (DIR_IMAGE . $result['image'])) ? $result['image'] : 'no_image.jpg';
	}
	
	public function getProductOptions($product_id) {
		$this->load->model('catalog/option');
		$this->load->model('catalog/product');
		
		$options = $this->model_catalog_product->getProductOptions($product_id);
		
		$product_options = array ();
		
		foreach ($options as $option) {
			if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
				$option_value_data = array ();
				
				if (isset ($option['product_option_value'])) {
					foreach ($option['product_option_value'] as $option_value) {
						$option_value_data[] = array (
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'quantity'                => $option_value['quantity'],
							'subtract'                => $option_value['subtract'],
							'price'                   => $option_value['price'],
							'price_prefix'            => $option_value['price_prefix'],
							'points'                  => $option_value['points'],
							'points_prefix'           => $option_value['points_prefix'],
							'weight'                  => $option_value['weight'],
							'weight_prefix'           => $option_value['weight_prefix']
						);
					}
				}
				
				$product_options[] = array (
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'required'             => $option['required']
				);
			} else {
				$product_options[] = array (
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'type'              => $option['type'],
					'option_value'      => $option['option_value'],
					'required'          => $option['required']
				);
			}
		}
		
		$option_values = array ();
		
		foreach ($options as $option) {
			if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
				if (!isset ($option_values[$option['option_id']])) {
					$option_values[$option['option_id']] = $this->model_catalog_option->getOptionValues($option['option_id']);
				}
			}
		}
		
		return array ('product_options' => $product_options, 'option_values' => $option_values);
	}
	
	public function getProductRelated($product_id) {
		$related = array ();
		
		$this->load->model('catalog/product');
		
		$products = $this->model_catalog_product->getProductRelated($product_id);
		
		if ($products) {
			$related = $this->db->query("SELECT product_id AS product_id, name AS name FROM " . DB_PREFIX . "product_description WHERE product_id IN (" . implode (', ', $products) . ") AND language_id = '" . (int) $this->config->get('config_language_id') . "'")->rows;
		}
		
		return $related;
	}
	
	public function getProductImages($product_id) {
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$images = $this->model_catalog_product->getProductImages($product_id);
		
		foreach ($images as $key => $image) {
			if ($image['image']) {
				$images[$key]['thumb'] = $this->model_tool_image->resize($image['image'], 40, 40);
			} else {
				$images[$key]['thumb'] = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}
		}
		
		return $images;
	}
	
	public function getAttributesByGroupId($group_id) {
		$attributes = $this->cache->get('batch_editor.attributes.' . (int) $group_id . '.' . (int) $this->config->get('config_language_id'));
		
		if (!$attributes) {
			$attributes = $this->db->query("SELECT ad.attribute_id AS attribute_id, ad.name AS attribute_name FROM " . DB_PREFIX . "attribute a LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (ad.attribute_id = a.attribute_id) WHERE a.attribute_group_id = '" . (int) $group_id . "' AND ad.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY a.sort_order ASC")->rows;
			
			$this->cache->set('batch_editor.attributes.' . (int) $group_id . '.' . (int) $this->config->get('config_language_id'), $attributes);
		}
		
		return $attributes;
	}
	
	public function getNoImage() {
		$this->load->model('tool/image');
		
		return $this->model_tool_image->resize('no_image.jpg', 40, 40);
	}
	
	public function getAttributes() {
		$attributes = $this->cache->get('batch_editor.attributes_all.' . (int) $this->config->get('config_language_id'));
		
		if (!$attributes) {
			$query = $this->db->query("SELECT ad.attribute_id AS attribute_id, ad.name AS attribute_name, agd.attribute_group_id AS attribute_group_id, agd.name AS attribute_group_name FROM " . DB_PREFIX . "attribute a, " . DB_PREFIX . "attribute_description ad, " . DB_PREFIX . "attribute_group_description agd, " . DB_PREFIX . "attribute_group ag WHERE a.attribute_id = ad.attribute_id AND a.attribute_group_id = agd.attribute_group_id AND ag.attribute_group_id = agd.attribute_group_id AND agd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ad.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY ag.sort_order, a.sort_order ASC");
			
			$attributes = array ();
			
			foreach ($query->rows as $row) {
				$attributes[$row['attribute_group_id']]['attribute_group_id'  ] = $row['attribute_group_id'  ];
				$attributes[$row['attribute_group_id']]['attribute_group_name'] = $row['attribute_group_name'];
				
				$attributes[$row['attribute_group_id']]['attributes'][$row['attribute_id']] = array (
					'attribute_id'   => $row['attribute_id'],
					'attribute_name' => $row['attribute_name']
				);
			}
			
			$this->cache->set('batch_editor.attributes_all.' . (int) $this->config->get('config_language_id'), $attributes);
		}
		
		return $attributes;
	}
	
	public function getStatus() {
		return array (
			array ('status' => 0, 'name' => $this->language->get('text_disabled')),
			array ('status' => 1, 'name' => $this->language->get('text_enabled')),
		);
	}
	
	public function getShipping() {
		return array (
			array ('shipping' => 0, 'name' => $this->language->get('text_no')),
			array ('shipping' => 1, 'name' => $this->language->get('text_yes')),
		);
	}
	
	public function getSubtract() {
		return array (
			array ('subtract' => 0, 'name' => $this->language->get('text_no')),
			array ('subtract' => 1, 'name' => $this->language->get('text_yes')),
		);
	}
	
	public function getManufacturerId() {
		$manufacturers = $this->cache->get('batch_editor.manufacturers_all');
		
		if (!$manufacturers) {
			$manufacturers = $this->db->query("SELECT manufacturer_id, name FROM " . DB_PREFIX . "manufacturer ORDER BY name")->rows;
			
			$this->cache->set('batch_editor.manufacturers_all', $manufacturers);
		}
		
		return $manufacturers;
	}
	
	public function getStockStatusId() {
		$stock_statuses = $this->cache->get('batch_editor.stock_statuses_all.' . (int)$this->config->get('config_language_id'));
		
		if (!$stock_statuses) {
			$stock_statuses = $this->db->query("SELECT stock_status_id, name FROM " . DB_PREFIX . "stock_status WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY name")->rows;
			
			$this->cache->set('batch_editor.stock_statuses_all.' . (int)$this->config->get('config_language_id'), $stock_statuses);
		}
		
		return $stock_statuses;
	}
	
	public function getTaxClassId() {
		$tax_classes = $this->cache->get('batch_editor.tax_classes_all');
		
		if (!$tax_classes) {
			$tax_classes = $this->db->query("SELECT tax_class_id AS tax_class_id, title AS name FROM " . DB_PREFIX . "tax_class")->rows;
			
			$this->cache->set('batch_editor.tax_classes_all', $tax_classes);
		}
		
		return $tax_classes;
	}
	
	public function getLengthClassId() {
		$length_classes = $this->cache->get('batch_editor.length_classes_all.' . (int)$this->config->get('config_language_id'));
		
		if (!$length_classes) {
				$length_classes = $this->db->query("SELECT lc.length_class_id AS length_class_id, lcd.title AS name FROM " . DB_PREFIX . "length_class lc LEFT JOIN " . DB_PREFIX . "length_class_description lcd ON (lc.length_class_id = lcd.length_class_id) WHERE lcd.language_id = '" . (int)$this->config->get('config_language_id') . "'")->rows;
				
				$this->cache->set('batch_editor.length_classes_all.' . (int)$this->config->get('config_language_id'), $length_classes);
			}
			
			return $length_classes;
	}
	
	public function getWeightClassId() {
		$weight_classes = $this->cache->get('batch_editor.weight_classes_all.' . (int) $this->config->get('config_language_id'));
		
		if (!$weight_classes) {
			$weight_classes = $this->db->query("SELECT wc.weight_class_id as weight_class_id, wcd.title AS name FROM " . DB_PREFIX . "weight_class wc LEFT JOIN " . DB_PREFIX . "weight_class_description wcd ON (wc.weight_class_id = wcd.weight_class_id) WHERE wcd.language_id = '" . (int) $this->config->get('config_language_id') . "'")->rows;
			
			$this->cache->set('batch_editor.weight_classes_all.' . (int) $this->config->get('config_language_id'), $weight_classes);
		}
		
		return $weight_classes;
	}
	
	public function getAStickerId() {
		$astickers = $this->cache->get('batch_editor.astickers_all.' . (int) $this->config->get('config_language_id'));
		
		if (!$astickers) {
			$astickers = $this->db->query("SELECT ast.asticker_id as asticker_id, ast.name AS name FROM " . DB_PREFIX . "astickers ast")->rows;
			
			$this->cache->set('batch_editor.astickers_all', $astickers);
		}
		
		return $astickers;
	}
	
	public function getLanguages() {
		$languages = $this->cache->get('batch_editor.languages_all');
		
		if (!$languages) {
			$languages = array ();
			
			$query = $this->db->query("SELECT language_id, name, image, code FROM " . DB_PREFIX . "language ORDER BY sort_order, name");
			
			foreach ($query->rows as $result) {
				$languages[$result['code']] = array (
					'language_id' => $result['language_id'],
					'name'        => $result['name'],
					'image'       => $result['image']
				);
			}
			
			$this->cache->set('batch_editor.languages_all', $languages);
		}
		
		return $languages;
	}
	
	public function getCustomerGroups() {
		if (VERSION < '1.5.3') {
			return $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_group ORDER BY name ASC")->rows;
		} else {
			return $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_group_description WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY name ASC")->rows;
		}
	}
	
	public function getDiscountActions() {
		return array (
			array ('action' => 'equal_number' , 'name' => $this->language->get('text_equal_number')),
			array ('action' => 'minus_number' , 'name' => $this->language->get('text_minus_number')),
			array ('action' => 'minus_percent', 'name' => $this->language->get('text_minus_percent'))
		);
	}
	
	public function getCalculate() {
		return array (
			array ('action' => 'equal_number'   , 'name' => $this->language->get('text_equal_number')),
			array ('action' => 'plus_number'    , 'name' => $this->language->get('text_plus_number')),
			array ('action' => 'minus_number'   , 'name' => $this->language->get('text_minus_number')),
			array ('action' => 'multiply_number', 'name' => $this->language->get('text_multiply_number')),
			array ('action' => 'divide_number'  , 'name' => $this->language->get('text_divide_number')),
			array ('action' => 'plus_percent'   , 'name' => $this->language->get('text_plus_percent')),
			array ('action' => 'minus_percent'  , 'name' => $this->language->get('text_minus_percent'))
		);
	}
	
	public function getStores() {
		$stores = $this->cache->get('batch_editor.stores_all');
		
		if (!$stores) {
			$stores = $this->db->query("SELECT store_id, name FROM " . DB_PREFIX . "store ORDER BY url")->rows;
			
			$this->cache->set('batch_editor.stores_all', $stores);
		}
		
		return $stores;
	}
	
	public function getDownloads() {
		$downloads = $this->cache->get('batch_editor.downloads_all.' . (int) $this->config->get('config_language_id'));
		
		if (!$downloads) {
			$downloads = $this->db->query("SELECT download_id, name FROM " . DB_PREFIX . "download_description WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY name ASC")->rows;
			
			$this->cache->set('batch_editor.downloads_all.' . (int) $this->config->get('config_language_id'), $downloads);
		}
		
		return $downloads;
	}
	
	public function getCategories() {
		$categories = $this->cache->get('batch_editor.categories_all.' . (int) $this->config->get('config_language_id'));
		
		if (!$categories) {
			$categories = $this->getCategory();
			
			$this->cache->set('batch_editor.categories_all.' . (int) $this->config->get('config_language_id'), $categories);
		}
		
		return $categories;
	}
	
	private function getCategory($parent_id = 0) {
		$category_data = array ();
		
		$query = $this->db->query("SELECT c.category_id, cd.name FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '" . (int) $parent_id . "' AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		foreach ($query->rows as $result) {
			$category_data[] = array (
				'category_id' => $result['category_id'],
				'name'        => $this->getPath($result['category_id'], $this->config->get('config_language_id')),
			);
			
			$category_data = array_merge ($category_data, $this->getCategory($result['category_id']));
		}
		
		return $category_data;
	}
	
	private function getPath($category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.category_id = '" . (int) $category_id . "' AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getPath($query->row['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}
}
?>