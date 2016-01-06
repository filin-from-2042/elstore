<?php
// Model Catalog
class ModelCatalogSearchAdvanced extends Model {
	public function getAttributes($setting, $category_id) {
		$attributes = ($setting['cache']) ? $this->cache->get('search_advanced.' .(int) $this->config->get('config_language_id') . '.' . $category_id) : array ();
		
		if (!$attributes) {
			$attributes = $this->db->query("SELECT ag.attribute_group_id AS attr_group_id, agd.name AS attr_group_name, a.attribute_id AS attr_id, ad.name AS attr_name, pa.text AS text FROM " . DB_PREFIX . "attribute_group ag LEFT JOIN " . DB_PREFIX . "attribute a ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad  ON (ad.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (agd.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "product_attribute pa ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = pa.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = pa.product_id) WHERE p2c.category_id = " . (int) $category_id . " AND p.status = '1' AND pa.language_id = " . (int) $this->config->get('config_language_id') . " AND ad.language_id = " . (int) $this->config->get('config_language_id') . " AND agd.language_id = " . (int) $this->config->get('config_language_id') . " GROUP BY a.attribute_id, pa.text ORDER BY ag.sort_order, ag.attribute_group_id, a.sort_order, a.attribute_id, pa.text ASC")->rows;
			
			if ($setting['cache']) {
				$this->cache->set('search_advanced.' .(int) $this->config->get('config_language_id') . '.' . $category_id, $attributes);
			}
		}
		
		return $attributes;
	}
	
	public function getAttributesToForm($setting, $filter_category_id) {
		$this->load->model('tool/image');
		
		$attributes = $this->getAttributes($setting, $filter_category_id);
		
		$attributes_get = (isset ($this->request->get['fa']) && is_array ($this->request->get['fa'])) ? $this->request->get['fa'] : array ();
		
		$data = array ();
		
		if ($attributes) {
			$types = array (1 => 'checkbox', 2 => 'radio', 3 => 'slider');
			
			foreach ($attributes as $attribute) {
				if (isset ($setting['attributes'][$attribute['attr_id']]) && $setting['attributes'][$attribute['attr_id']]['status']) {
					$separator = $text = FALSE;
					
					$type = $types[$setting['attributes'][$attribute['attr_id']]['type']];
					
					if ($type == 'slider') {
						$min_cur = (isset ($attributes_get[$attribute['attr_id']]['min'])) ? (int) $attributes_get[$attribute['attr_id']]['min'] : $setting['attributes'][$attribute['attr_id']]['min'];
						$max_cur = (isset ($attributes_get[$attribute['attr_id']]['max'])) ? (int) $attributes_get[$attribute['attr_id']]['max'] : $setting['attributes'][$attribute['attr_id']]['max'];
						
						$min_cur = ($min_cur > $max_cur) ? $max_cur : $min_cur;
						$max_cur = ($max_cur < $min_cur) ? $min_cur : $max_cur;
						
						$text = array (
							'min'     => $setting['attributes'][$attribute['attr_id']]['min'],
							'max'     => $setting['attributes'][$attribute['attr_id']]['max'],
							'step'    => $setting['attributes'][$attribute['attr_id']]['step'],
							'min_cur' => $min_cur,
							'max_cur' => $max_cur
						);
					} else {
						if (isset ($setting['attributes'][$attribute['attr_id']]['sep']) && $setting['attributes'][$attribute['attr_id']]['sep']) {
							$array = explode ($setting['attributes'][$attribute['attr_id']]['sep'], $attribute['text']);
							
							foreach ($array as $value) {
								$checked = (isset ($attributes_get[$attribute['attr_id']]) && is_array ($attributes_get[$attribute['attr_id']]) && in_array ($value, $attributes_get[$attribute['attr_id']])) ? TRUE : FALSE;
								
								$text[] = array (
									'value'   => $value,
									'checked' => $checked
								);
							}
							
							$separator = TRUE;
						} else {
							$checked = (isset ($attributes_get[$attribute['attr_id']]) && is_array ($attributes_get[$attribute['attr_id']]) && in_array ($attribute['text'], $attributes_get[$attribute['attr_id']])) ? TRUE : FALSE;
							
							$text = array (
								'value'   => $attribute['text'],
								'checked' => $checked
							);
						}
					}
					
					if (!isset ($data[$attribute['attr_group_id']]['name'])) {
						$data[$attribute['attr_group_id']]['name'] = $attribute['attr_group_name'];
					}
					
					if (!isset ($data[$attribute['attr_group_id']]['text'][$attribute['attr_id']])) {
						$data[$attribute['attr_group_id']]['text'][$attribute['attr_id']] = array (
							'id'     => $attribute['attr_id'],
							'name'   => $attribute['attr_name'],
							'status' => $setting['attributes'][$attribute['attr_id']]['status'],
							'type'   => $type,
							'img'    => $this->model_tool_image->resize($setting['attributes'][$attribute['attr_id']]['img'], $setting['image_size']['width'], $setting['image_size']['height']),
							'hint'   => $this->getText($setting['attributes'][$attribute['attr_id']]['hint'])
						);
					}
					
					if ($type == 'slider') {
						$data[$attribute['attr_group_id']]['text'][$attribute['attr_id']]['text'] = $text;
					} else if ($separator) {
						$data[$attribute['attr_group_id']]['text'][$attribute['attr_id']]['text'] = (isset ($data[$attribute['attr_group_id']]['text'][$attribute['attr_id']]['text']) && is_array ($data[$attribute['attr_group_id']]['text'][$attribute['attr_id']]['text'])) ? $this->getUniqueValues(array_merge ($text, $data[$attribute['attr_group_id']]['text'][$attribute['attr_id']]['text'])) : $text;
					} else {
						$data[$attribute['attr_group_id']]['text'][$attribute['attr_id']]['text'][] = $text;
					}
				}
			}
		}
		
		return $data;
	}
	
	public function getManufacturers($setting, $category_id) {
		$manufacturers = array ();
		
		if ($setting['manufacturers']['status']) {
			$manufacturers = $this->db->query("SELECT m.name AS name, m.manufacturer_id AS id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p2c.category_id = " . $category_id . " AND p.status = 1 AND p.manufacturer_id > 0 GROUP BY p.manufacturer_id ORDER BY m.sort_order ASC"
			)->rows;
		}
		
		return $manufacturers;
	}
	
	public function getManufacturersToForm($setting, $category_id) {
		$manufacturers = array ();
		
		$manufacturers_get = (isset ($this->request->get['fm']) && is_array ($this->request->get['fm'])) ? $this->request->get['fm'] : array ();
		
		foreach($this->getManufacturers($setting, $category_id) as $manufacturer) {
			$checked = (in_array ($manufacturer['id'], $manufacturers_get)) ? TRUE : FALSE;
			
			$manufacturers['values'][] = array (
				'id'      => $manufacturer['id'],
				'name'    => $manufacturer['name'],
				'checked' => $checked
			);
		}
		
		if (isset ($manufacturers['values']) && $manufacturers['values']) {
			$this->load->model('tool/image');
			
			$manufacturers['hint'] = $this->getText($setting['manufacturers']['hint']);
			$manufacturers['img' ] = $this->model_tool_image->resize($setting['manufacturers']['img'], $setting['image_size']['width'], $setting['image_size']['height']);
			
			$manufacturers['type'] = ($setting['manufacturers']['type'] == 1) ? 'checkbox' : 'radio';
		}
		
		return $manufacturers;
	}
	
	public function getStocks($setting, $category_id) {
		$stocks = array ();
		
		if ($setting['stock']['status']) {
			$stocks = $this->db->query("SELECT ss.name AS name, p.stock_status_id AS id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "stock_status ss ON (ss.stock_status_id = p.stock_status_id) WHERE p2c.category_id = " . $category_id . " AND p.status = 1 AND p.quantity <= 0 AND ss.language_id = " . (int) $this->config->get('config_language_id') . " GROUP BY p.stock_status_id")->rows;
		}
		
		return $stocks;
	
	}
	
	public function getStocksToForm($setting, $category_id) {
		$stocks = array ();
		
		$stocks_get = (isset ($this->request->get['fs']) && is_array ($this->request->get['fs'])) ? $this->request->get['fs'] : array ();
		
		foreach ($this->getStocks($setting, $category_id) as $stock) {
			$checked = (in_array ($stock['id'], $stocks_get)) ? TRUE : FALSE;
			
			$stocks['values'][] = array (
				'id'      => $stock['id'],
				'name'    => $stock['name'],
				'checked' => $checked
			);
		}
		
		if (isset ($stocks['values']) && $stocks['values']) {
			$this->load->model('tool/image');
			
			$stocks['hint'] = $this->getText($setting['stock']['hint']);
			$stocks['img' ] = $this->model_tool_image->resize($setting['stock']['img'], $setting['image_size']['width'], $setting['image_size']['height']);
			
			$stocks['type'] = ($setting['stock']['type'] == 1) ? 'checkbox' : 'radio';
		}
		
		return $stocks;
	}
	
	public function getPrices($setting, $category_id) {
		$price = array ('min' => FALSE, 'max' => FALSE);
		
		if (isset ($setting['price']['status']) && $setting['price']['status']) {
			$price = $this->db->query("SELECT MAX(p.price) as max, MIN(p.price) as min FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int) $category_id . "' AND p.status = 1")->row;
		}
		
		if ($price['min'] < $price['max']) {
			return array (
				'min' => $this->currency->format($price['min'], '', '', FALSE),
				'max' => $this->currency->format($price['max'], '', '', FALSE)
			);
		} else {
			return array ();
		}
	}
	
	public function getPricesToForm($setting, $category_id) {
		$price_get = (isset ($this->request->get['fp']) && is_array ($this->request->get['fp'])) ? $this->request->get['fp'] : array ();
		
		$price = $this->getPrices($setting, $category_id);
		
		if ($price) {
			$this->load->model('tool/image');
			
			$price['min_cur'] = $price['min'];
			
			$price['max_cur'] = $price['max'];
			
			$price['step'] = $setting['price']['step'];
			
			$price['hint'] = $this->getText($setting['price']['hint']);
			
			$price['img'] = $this->model_tool_image->resize($setting['price']['img'], $setting['image_size']['width'], $setting['image_size']['height']);
			
			if (isset ($price_get['min'])) {
				$price['min_cur'] = (float) $price_get['min'];
			}
			
			if (isset ($price_get['max'])) {
				$price['max_cur'] = (float) $price_get['max'];
			}
			
			if ($price['max_cur'] < $price['min_cur']) {
				$price['max_cur'] = $price['max'];
			}
			
			if ($price['min_cur'] > $price['max_cur']) {
				$price['min_cur'] = $price['min'];
			}
		}
		
		return $price;
	}
	
	public function getProduct($product_id) {
		$customer_group_id = ($this->customer->isLogged()) ? $this->customer->getCustomerGroupId() : $this->config->get('config_customer_group_id');
		
		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int) $customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int) $customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND customer_group_id = '" . (int) $customer_group_id . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int) $this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int) $this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int) $this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			$query->row['price'] = ($query->row['discount'] ? $query->row['discount'] : $query->row['price']);
			$query->row['rating'] = (int) $query->row['rating'];
			
			return $query->row;
		} else {
			return FALSE;
		}
	}
	
	public function getProducts($setting, $data = array ()) {
		$customer_group_id = ($this->customer->isLogged()) ? $this->customer->getCustomerGroupId() : $this->config->get('config_customer_group_id');
		
		$cache = md5 (http_build_query ($data));
		
		$product_data = $this->cache->get('product.' . (int) $this->config->get('config_language_id') . '.' . (int) $this->config->get('config_store_id') . '.' . (int) $customer_group_id . '.' . $cache);
		
		if (!$product_data) {
			$sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) ";
			
			if ($data['filter_category_id']) {
				$sql .= "LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) ";
			}
			
			$sql .= "WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";
			
			$sql .= $this->getFilterSql($setting, $data);
			
			$sql .= " GROUP BY p.product_id";
			
			$sort_data = array (
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			);
			
			if (isset ($data['sort']) && in_array ($data['sort'], $sort_data)) {
				$sql .= ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') ? " ORDER BY LCASE(" . $data['sort'] . ")" : " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY p.sort_order";
			}
			
			$sql .= (isset ($data['order']) && ($data['order'] == 'DESC')) ? " DESC" : " ASC";
			
			if (isset ($data['start']) || isset ($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}
				
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}
				
				$sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
			}
			
			$query = $this->db->query($sql);
			
			$product_data = array ();
			
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
			}
			
			$this->cache->set('product.' . (int) $this->config->get('config_language_id') . '.' . (int) $this->config->get('config_store_id') . '.' . (int) $customer_group_id . '.' . $cache, $product_data);
		}
		
		return $product_data;
	}
	
	public function getTotalProducts($setting, $data = array ()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) ";
		
		$sql .= (!empty ($data['filter_category_id'])) ? " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)" : FALSE;
		
		$sql .= " WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";
		
		$sql .= $this->getFilterSql($setting, $data);
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function getText($setting) {
		return (isset ($setting[(int) $this->config->get('config_language_id')])) ? htmlspecialchars_decode ($setting[(int) $this->config->get('config_language_id')], ENT_QUOTES) : FALSE;
	}
	
	private function getUniqueValues($array = array ()) {
		asort ($array);
		
		$value_1 = FALSE;
		
		$array_2 = array ();
		
		foreach ($array as $array_1) {
			if ($array_1['value'] != $value_1) {
				$array_2[] = array (
					'value'   => $array_1['value'],
					'checked' => $array_1['checked']
				);
			}
			
			$value_1 = $array_1['value'];
		}
		
		return $array_2;
	}
	
	private function getFilterSql($setting, $data) {
		$sql = FALSE;
		
		if ($data['filter_name']) {
			$implode = array ();
			
			$words = explode (' ', $data['filter_name']);
			
			if ($setting['statuses']['title'] && $data['filter_title']) {
				foreach ($words as $word) {
					$implode[] = "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
				}
			}
			
			if ($setting['statuses']['desc'] && $data['filter_description']) {
				foreach ($words as $word) {
					$implode[] = "LCASE(pd.description) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
				}
			}
			
			if ($setting['statuses']['model'] && $data['filter_model']) {
				foreach ($words as $word) {
					$implode[] = "LCASE(p.model) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
				}
			}
			
			if ($setting['statuses']['sku'] && $data['filter_sku']) {
				foreach ($words as $word) {
					$implode[] = "LCASE(p.sku) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
				}
			}
			
			if ($implode) {
				$sql .= " AND ( " . implode(" OR ", $implode) . ") ";
			}
		}
		
		if ($data['filter_category_id']) {
			if ($data['filter_sub_category'] && $setting['sub_cat_status']) {
				$implode_data = array ();
				
				$implode_data[] = "p2c.category_id = '" . (int) $data['filter_category_id'] . "'";
				
				$this->load->model('catalog/category');
				
				$categories = $this->model_catalog_category->getCategoriesByParentId($data['filter_category_id']);
				
				foreach ($categories as $category_id) {
					$implode_data[] = "p2c.category_id = '" . (int) $category_id . "'";
				}
				
				$sql .= " AND (" . implode (' OR ', $implode_data) . ")";
			} else {
				$sql .= " AND p2c.category_id = '" . (int) $data['filter_category_id'] . "'";
			}
		}
		
		if ($data['filter_attributes']) {
			foreach ($data['filter_attributes'] as $attribute) {
				foreach ($attribute['text'] as $attribute_text) {
					if ($attribute_text['type'] == 'checkbox' || $attribute_text['type'] == 'radio') {
						$implode = array ();
						
						$text = FALSE;
						
						foreach ($attribute_text['text'] as $attribute_text_1) {
							
							if ($attribute_text_1['checked']) {
								$attribute_text_1['value'] = $this->db->escape($attribute_text_1['value']);
								
								if ($setting['attributes'][$attribute_text['id']]['sep']) {
									$implode[] = 'pa.text = "' . $attribute_text_1['value'] . '"';
									$implode[] = 'pa.text LIKE "%' . $setting['attributes'][$attribute_text['id']]['sep'] . $attribute_text_1['value'] . '"';
									$implode[] = 'pa.text LIKE "' . $attribute_text_1['value'] . $setting['attributes'][$attribute_text['id']]['sep'] . '%"';
									$implode[] = 'pa.text LIKE "%' . $setting['attributes'][$attribute_text['id']]['sep'] . $attribute_text_1['value'] . $setting['attributes'][$attribute_text['id']]['sep'] . '%"';
								} else {
									$text .= '"' . $attribute_text_1['value'] . '",';
								}
							}
						}
						
						$text .= ($implode) ? ' AND (' . implode (' OR ', $implode) . ')' : FALSE;
						
						if ($text) {
							if ($setting['attributes'][(int) $attribute_text['id']]['sep']) {
								$sql .= ' AND p.product_id IN (SELECT pa.product_id FROM ' . DB_PREFIX . 'product_attribute pa WHERE pa.attribute_id = ' . (int) $attribute_text['id'] . $text . ')';
							} else {
								$sql .= ' AND p.product_id IN (SELECT pa.product_id FROM ' . DB_PREFIX . 'product_attribute pa WHERE pa.attribute_id = ' . (int) $attribute_text['id']. ' AND pa.text IN (' . substr ($text, 0, -1) . '))';
							}
						}
					} else if ($attribute_text['type'] == 'slider') {
						$sql .= ' AND p.product_id IN (SELECT pa.product_id FROM ' . DB_PREFIX . 'product_attribute pa WHERE pa.attribute_id = ' . (int) $attribute_text['id'] . ' AND pa.text BETWEEN ' . (float) $attribute_text['text']['min_cur'] . ' AND ' . (float) $attribute_text['text']['max_cur'] . ')';
					}
				}
			}
		}
		
		if ($data['filter_manufacturers']) {
			if ($setting['manufacturers']['status']) {
				$manufacturer_id = FALSE;
				
				foreach ($data['filter_manufacturers']['values'] as $manufacturer) {
					if ($manufacturer['checked']) {
						$manufacturer_id .= '"' . (int) $manufacturer['id'] . '",';
					}
				}
				
				if (!empty ($manufacturer_id)) {
					$sql .= ' AND p.manufacturer_id IN (' . substr ($manufacturer_id, 0, -1) . ')';
				}
			}
		}
		
		if ($data['filter_stocks']) {
			if ($setting['stock']['status']) {
				$stock_id = FALSE;
				
				foreach ($data['filter_stocks']['values'] as $stock) {
					if ($stock['checked']) {
						$stock_id .= '"' . (int) $stock['id'] . '",';
					}
				}
				
				if ($stock_id) {
					$sql .= ' AND p.stock_status_id IN (' . substr ($stock_id, 0, -1) . ') AND p.quantity <= 0';
				}
			}
		}
		
		if ($data['filter_prices']) {
			if ($data['filter_category_id']) {
				$min = round ((float) $data['filter_prices']['min_cur'] / $this->currency->getValue(), 4);
				
				$max = round ((float) $data['filter_prices']['max_cur'] / $this->currency->getValue(), 4);
				
				$sql .= ' AND p.price BETWEEN ' . $min . ' AND ' . $max;
			}
		}
		
		return $sql;
	}
}
?>