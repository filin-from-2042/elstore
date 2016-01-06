<?php
class ModelCatalogBatchEditorProductEdit extends Model {
	private $values = array ();
	
	public function Edit($product_id, $value, $field, $setting) {
		$product_id = (is_array ($product_id)) ? implode (',', $product_id) : (int) $product_id;
		
		$product_description = array ('name', 'meta_description', 'meta_keyword', 'seo_title', 'seo_h1', 'tag');
		
		if (in_array ($field, $product_description)) {
			if ($field != 'name' || ($field == 'name' && $value)) {
				if ($field != 'tag' || ($field == 'tag' && VERSION > '1.5.3.1')) {
					$this->db->query('UPDATE ' . DB_PREFIX . 'product_description SET ' . $field . ' = "' . $this->db->escape($value) . '" WHERE product_id IN (' . $product_id . ') AND language_id = ' . (int) $this->config->get('config_language_id'));
					
					$value = html_entity_decode ($value, ENT_QUOTES, 'UTF-8');
				} else {
					$this->db->query('DELETE FROM ' . DB_PREFIX . 'product_tag WHERE product_id IN (' . $product_id . ') AND language_id = ' . (int) $this->config->get('config_language_id'));
					
					$products_id = explode (',', $product_id);
					
					$tags = explode (',', $value);
					
					$data = $value = array ();
					
					foreach ($products_id as $product_id) {
						foreach ($tags as $key=>$tag) {
							$data[] = '("' . $product_id . '", "' . (int) $this->config->get('config_language_id') . '", "' . $this->db->escape(trim ($tag)) . '")';
							
							$value[] = trim ($tag);
						}
					}
					
					if ($data) {
						$this->db->query('INSERT INTO ' . DB_PREFIX . 'product_tag (product_id, language_id, tag) VALUES ' . implode (', ', $data));
					}
					
					$value = html_entity_decode (implode (',', $value), ENT_QUOTES, 'UTF-8');
				}
				
				$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . $product_id . ')');
			}
		} else if ($field == 'url_alias') {
			$products = explode (',', $product_id);
			
			foreach ($products as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int) $product_id . "'");
				
				if ($value) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET keyword = '" . $this->db->escape($value) . "', query = 'product_id=" . (int) $product_id . "'");
				}
				
				$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id = ' . (int) $product_id);
			}
			
			$value = html_entity_decode ($value, ENT_QUOTES, 'UTF-8');
		} else {
			if (isset ($setting['fields'][$field])) {
				preg_match ('/^[a-z]*/', $setting['fields'][$field]['type'], $type);
				
				if ($type[0] == 'varchar') {
					if ($field != 'model' || ($field == 'model' && $value)) {
						$this->db->query('UPDATE ' . DB_PREFIX . 'product SET ' . $field . ' = "' . $this->db->escape($value) . '", date_modified = NOW() WHERE product_id IN (' . $product_id . ')');
					}
					
					if ($field == 'image') {
						$this->load->model('tool/image');
						
						$value = $this->model_tool_image->resize($value, 40, 40);
					} else {
						$value = html_entity_decode ($value, ENT_QUOTES, 'UTF-8');
					}
				} else {
					if ($type[0] == 'int' || $type[0] == 'tinyint') {
						$value = (int) $value;
					}
					
					if ($type[0] == 'decimal') {
						preg_match ('/[0-9]*\,[0-9]*/', $setting['fields'][$field]['type'], $type);
						
						$type = explode (',', $type[0]);
						
						$value = number_format ((float) $value, $type[1], '.', FALSE);
					}
					
					if ($type[0] == 'date') {
						if (!preg_match("/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/", $value)) {
							$value = '0000-00-00';
						}
					}
					
					if (isset ($this->request->post['calculate']) && isset ($setting['fields'][$field]['calc'])) {
						$calculate = array (
							'equal_number'    => $value,
							'plus_number'     => '(' . $field . ' + ' . $value . ')',
							'minus_number'    => '(' . $field . ' - ' . $value . ')',
							'multiply_number' => '(' . $field . ' * ' . $value . ')',
							'divide_number'   => '(' . $field . ' / ' . $value . ')',
							'plus_percent'    => '(' . $field . ' * ' . (100 + $value) * 0.01 . ')',
							'minus_percent'   => '(' . $field . ' * ' . (100 - $value) * 0.01 . ')'
						);
						
						if (isset ($calculate[$this->request->post['calculate']])) {
							$this->db->query('UPDATE ' . DB_PREFIX . 'product SET ' . $field . ' = ' . $calculate[$this->request->post['calculate']] . ', date_modified = NOW() WHERE product_id IN (' . $product_id . ')');
						}
					} else {
						$this->db->query('UPDATE ' . DB_PREFIX . 'product SET ' . $field . ' = "' . $value . '", date_modified = NOW() WHERE product_id IN (' . $product_id . ')');
					}
				}
			}
		}
		
		return $value;
	}
	
	public function Copy($products, $copies, $action) {
		if ($action == 'copy') {
			$this->load->model('catalog/product');
			
			$copies = abs ((int) $copies);
			
			if (!$copies) {
				$copies = 1;
			}
			
			for ($i = 0; $i < $copies; $i++) {
				foreach ($products as $product_id) {
					$this->model_catalog_product->copyProduct((int) $product_id);
				}
			}
		}
	}
	
	public function Delete($products, $delete, $action) {
		$this->load->model('catalog/product');
		
		if ($action == 'delete') {
			foreach ($products as $product_id) {
				$this->model_catalog_product->deleteProduct((int) $product_id);
			}
		}
	}
	
	public function Descriptions ($products, $descriptions, $action) {
		foreach ($products as $product_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int) $product_id . "'");
			
			foreach ($descriptions['descriptions'] as $language_id => $value) {
				$sql = "INSERT INTO " . DB_PREFIX . "product_description SET name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', product_id = '" . (int) $product_id . "', language_id = '" . (int) $language_id . "'";
				
				if (isset ($value['seo_title']) && isset ($value['seo_h1'])) {
					$sql .= ", seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'";
				}
				
				if (VERSION > '1.5.3.1') {
					$sql .= ", tag = '" . $this->db->escape(trim ($descriptions['tags'][(int) $language_id])) . "'";
				}
				
				$this->db->query($sql);
			}
			
			if (VERSION <= '1.5.3.1') {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_tag WHERE product_id = '" . (int) $product_id . "'");
				
				foreach ($descriptions['tags'] as $language_id => $value) {
					if ($value) {
						$tags = explode (',', $value);
						
						foreach ($tags as $tag) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_tag SET tag = '" . $this->db->escape(trim ($tag)) . "', language_id = '" . (int) $language_id . "', product_id  = '" . (int) $product_id . "'");
						}
					}
				}
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . implode (', ', $products) . ')');
	}
	
	public function Categories($products, $categories, $action) {
		$categories = array_unique ($categories);
		
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id IN (" . implode (', ', $products) . ")");
		}
		
		if ($action == 'del') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id IN (" . implode (', ', $products) . ") AND category_id IN (" . implode (', ', $categories) . ")");
		}
		
		if ($action == 'add' || $action == 'upd') {
			foreach ($products as $product_id) {
				foreach ($categories as $key => $category_id) {
					if ($category_id) {
						if ($action == 'add') {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int) $product_id . "' AND category_id = '" . (int) $category_id . "'");
							
							if (!$query->num_rows) {
								$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int) $product_id . "', category_id = '" . (int) $category_id . "'");
							}
						}
						
						if ($action == 'upd') {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int) $product_id . "', category_id = '" . (int) $category_id . "'");
						}
					}
				}
			}
			
			if (isset ($categories[0])) {
				$this->db->query("UPDATE " . DB_PREFIX . "product_to_category SET main_category = 0 WHERE product_id IN (" . implode (', ', $products) . ")");
				
				if ($categories[0]) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_to_category SET main_category = 1 WHERE product_id IN (" . implode (', ', $products) . ") AND category_id = " . (int) $categories[0]);
				}
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . implode (', ', $products) . ')');
	}
	
	public function Attributes($products, $attributes, $action) {
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id IN (" . implode (', ', $products) . ")");
		}
		
		foreach ($products as $product_id) {
			foreach ($attributes as $attribute) {
				if ($attribute['attribute_id']) {
					foreach ($attribute['product_attribute_description'] as $language_id => $attribute_description) {
						if ($action == 'del') {
							$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int) $product_id . "' AND attribute_id = '" . (int) $attribute['attribute_id'] . "'");
						}
						
						if ($action == 'add' || $action == 'upd') {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int) $product_id . "' AND attribute_id = '" . (int) $attribute['attribute_id'] . "' AND language_id = '" . (int) $language_id  . "'");
							
							if (!$query->num_rows) {
								$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int) $product_id . "', attribute_id = '" . (int) $attribute['attribute_id'] . "', language_id = '" . (int) $language_id  . "', text = '" . $this->db->escape($attribute_description['text']) . "'");
							} else {
								$this->db->query("UPDATE " . DB_PREFIX . "product_attribute SET text = '" . $this->db->escape($attribute_description['text']) . "' WHERE attribute_id = '" . (int) $attribute['attribute_id'] . "' AND product_id = '" . (int) $product_id . "' AND language_id  = '" . (int) $language_id . "'");
							}
						}
					}
				}
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . implode (', ', $products) . ')');
	}
	
	public function Options($products, $options, $action) {
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id IN (" . implode (', ', $products) . ")");
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id IN (" . implode(', ', $products) . ")");
		}
		
		foreach ($products as $product_id) {
			foreach ($options as $option) {
				if ($action == 'del') {
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int) $product_id . "' AND option_id = '" . (int) $option['option_id'] . "'");
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int) $product_id . "' AND option_id = '" . (int) $option['option_id'] . "'");
				} else {
					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int) $option['product_option_id'] . "', product_id = '" . (int) $product_id . "', option_id = '" . (int) $option['option_id'] . "', required = '" . (int) $option['required'] . "'");
						
						$option_id = $this->db->getLastId();
						
						if (isset($option['product_option_value'])) {
							foreach ($option['product_option_value'] as $option_value) {
								$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int) $option_value['product_option_value_id'] . "', product_option_id = '" . (int) $option_id . "', product_id = '" . (int) $product_id . "', option_id = '" . (int) $option['option_id'] . "', option_value_id = '" . $this->db->escape($option_value['option_value_id']) . "', quantity = '" . (int) $option_value['quantity'] . "', subtract = '" . (int) $option_value['subtract'] . "', price = '" . (float) $option_value['price'] . "', price_prefix = '" . $this->db->escape($option_value['price_prefix']) . "', points = '" . (int) $option_value['points'] . "', points_prefix = '" . $this->db->escape($option_value['points_prefix']) . "', weight = '" . (float) $option_value['weight'] . "', weight_prefix = '" . $this->db->escape($option_value['weight_prefix']) . "'");
							}
						}
					} else { 
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int) $option['product_option_id'] . "', product_id = '" . (int) $product_id . "', option_id = '" . (int) $option['option_id'] . "', option_value = '" . $this->db->escape($option['option_value']) . "', required = '" . (int) $option['required'] . "'");
					}
				}
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . implode (', ', $products) . ')');
	}
	
	public function Specials($products, $specials, $action) {
		$product_id = implode (', ', $products);
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id IN (" . $product_id . ")");
		
		if ($action == 'add') {
			$product_data_1 = $this->db->query("SELECT product_id, price FROM " . DB_PREFIX . "product WHERE product_id IN (" . $product_id . ")")->rows;
			
			foreach($product_data_1 as $product_data) {
				foreach ($specials as $special) {
					if ($special['action'] == 'equal_number') {
						$product_data['special'] = (float) $special['special'];
					} else if ($special['action'] == 'minus_number') {
						$product_data['special'] = $product_data['price'] - (float) $special['special'];
					} else if ($special['action'] == 'minus_percent') {
						$product_data['special'] = $product_data['price'] * (100 - (float) $special['special']) * 0.01;
					} else {
						$product_data['special'] = FALSE;
					}
					
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int) $product_data['product_id'] . "', customer_group_id = '" . (int) $special['customer_group_id'] . "', priority = '" . (int) $special['priority'] . "', price = '" . (float) $product_data['special'] . "', date_start  = '" . $this->db->escape($special['date_start']) . "', date_end = '" . $this->db->escape($special['date_end']) . "'");
				}
			}
		}
		
		if ($action == 'upd') {
			foreach ($specials as $special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int) $product_id . "', customer_group_id = '" . (int) $special['customer_group_id'] . "', priority = '" . (int) $special['priority'] . "', price = '" . (float) $special['special'] . "', date_start = '" . $this->db->escape($special['date_start']) . "', date_end = '" . $this->db->escape($special['date_end']) . "'");
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . $product_id . ')');
	}
	
	public function Discounts($products, $discounts, $action) {
		$product_id = implode (', ', $products);
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id IN (" . $product_id . ")");
		
		if ($action == 'add') {
			$product_data_1 = $this->db->query("SELECT product_id, price FROM " . DB_PREFIX . "product WHERE product_id IN (" . $product_id . ")")->rows;
			
			foreach($product_data_1 as $product_data) {
				foreach ($discounts as $discount) {
					if ($discount['action'] == 'equal_number') {
						$product_data['discount'] = (float) $discount['discount'];
					} else if ($discount['action'] == 'minus_number') {
						$product_data['discount'] = $product_data['price'] - (float) $discount['discount'];
					} else if ($discount['action'] == 'minus_percent') {
						$product_data['discount'] = $product_data['price'] * (100 - (float) $discount['discount']) * 0.01;
					} else {
						$product_data['discount'] = FALSE;
					}
					
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int) $product_data['product_id'] . "', customer_group_id = '" . (int) $discount['customer_group_id'] . "', quantity = '" . (int) $discount['quantity'] . "', priority = '" . (int) $discount['priority'] . "', price = '" . (float) $product_data['discount'] . "', date_start = '" . $this->db->escape($discount['date_start']) . "', date_end = '" . $this->db->escape($discount['date_end']) . "'");
				}
			}
		}
		
		if ($action == 'upd') {
			foreach ($discounts as $discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int) $product_id . "', customer_group_id = '" . (int) $discount['customer_group_id'] . "', quantity = '" . (int) $discount['quantity'] . "', priority = '" . (int) $discount['priority'] . "', price = '" . (float) $discount['discount'] . "', date_start = '" . $this->db->escape($discount['date_start']) . "', date_end = '" . $this->db->escape($discount['date_end']) . "'");
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . $product_id . ')');
	}
	
	public function Related($products, $relateds, $action) {
		if ($action == 'related_to') {
			list ($products, $relateds) = array ($relateds, $products);
			
			$action = 'add';
		}
		
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id IN (" . implode (', ', $products) . ")");
		}
		
		if ($action == 'del') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id IN (" . implode (', ', $products) . ") AND related_id IN (" . implode (', ', $relateds) . ")");
		}
		
		if ($action == 'add' || $action == 'upd') {
			foreach ($products as $product_id) {
				foreach ($relateds as $related_id) {
					if ($product_id != $related_id) {
						$this->values[] = '("' . $product_id . '", "' . $related_id . '")';
					}
				}
			}
			
			if ($this->values) {
				$this->db->query('INSERT INTO ' . DB_PREFIX . 'product_related (product_id, related_id) VALUES ' . implode (', ', $this->values) . ' ON DUPLICATE KEY UPDATE product_id = VALUES(product_id), related_id = VALUES(related_id)');
			}
		}
	}
	
	public function Stores($products, $stores, $action) {
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id IN (" . implode (', ', $products) . ")");
		}
		
		if ($action == 'del') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id IN (" . implode (', ', $products) . ") AND store_id IN (" . implode (', ', $stores) . ")");
		}
		
		if ($action == 'add' || $action == 'upd') {
			foreach ($products as $product_id) {
				foreach ($stores as $store_id) {
					if ($action == 'add') {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int) $product_id . "' AND store_id = '" . (int) $store_id . "'");
						if (!$query->num_rows) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int) $product_id . "', store_id = '" . (int) $store_id . "'");
						}
					}
					
					if ($action == 'upd') {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int) $product_id . "', store_id = '" . (int) $store_id . "'");
					}
				}
			}
		}
	}
	
	public function Downloads($products, $downloads, $action) {
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id IN (" . implode (', ', $products) . ")");
		}
		
		if ($action == 'del') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id IN (" . implode (', ', $products) . ") AND download_id IN (" . implode (', ', $downloads) . ")");
		}
		
		if ($action == 'add' || $action == 'upd') {
			foreach ($products as $product_id) {
				foreach ($downloads as $download_id) {
					if ($action == 'add') {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int) $product_id . "' AND download_id = '" . (int) $download_id . "'");
						
						if (!$query->num_rows) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int) $product_id . "', download_id = '" . (int) $download_id . "'");
						}
					}
					
					if ($action == 'upd') {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int) $product_id . "', download_id = '" . (int) $download_id . "'");
					}
				}
			}
		}
	}
	
	public function Images($products, $images, $action) {
		if ($action == 'upd') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id IN (" . implode (', ', $products) . ")");
		}
		
		if ($action == 'del') {
			foreach ($images as $image) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id IN (" . implode (', ', $products) . ") AND image = '" . $this->db->escape($image['image']) . "'");
			}
		}
		
		if ($action == 'add' || $action == 'upd') {
			foreach ($products as $product_id) {
				foreach ($images as $image) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int) $product_id . "', image = '" . $this->db->escape($image['image']) . "', sort_order = '" . (int) $image['sort_order'] . "'");
				}
			}
		}
	}
	
	public function Rewards($products, $rewards, $action) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id IN (" . implode (', ', $products) . ")");
		
		foreach ($products as $product_id) {
			foreach ($rewards as $customer_group_id=>$reward) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int) $product_id . "', customer_group_id = '" . (int) $customer_group_id . "', points = '" . $reward['points'] . "'");
			}
		}
		
		$this->db->query('UPDATE ' . DB_PREFIX . 'product SET date_modified = NOW() WHERE product_id IN (' . implode (', ', $products) . ')');
	}
}
?>