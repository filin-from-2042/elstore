<?php
class ModelCatalogBatchEditorProducts extends Model {
	public function getProducts($data = array ()) {
		$sql = "SELECT " . $data['sql_fields'];
		
		if ($data['counter']) {
			$sql .= "(SELECT COUNT(pa.product_id) FROM " . DB_PREFIX . "product_attribute pa WHERE p.product_id = pa.product_id AND pa.language_id = '" . (int) $this->config->get('config_language_id') . "') AS attributes, (SELECT COUNT(po.product_id) FROM " . DB_PREFIX . "product_option po WHERE p.product_id = po.product_id)  AS options, (SELECT COUNT(p2c.product_id) FROM " . DB_PREFIX . "product_to_category p2c WHERE p.product_id = p2c.product_id) AS categories, (SELECT COUNT(psp.product_id) FROM " . DB_PREFIX . "product_special psp WHERE p.product_id = psp.product_id) AS specials, (SELECT COUNT(pdi.product_id) FROM " . DB_PREFIX . "product_discount pdi WHERE p.product_id = pdi.product_id) AS discounts, (SELECT COUNT(pre.product_id) FROM " . DB_PREFIX . "product_related pre WHERE p.product_id = pre.product_id) AS related, (SELECT COUNT(p2s.product_id) FROM " . DB_PREFIX . "product_to_store p2s WHERE p.product_id = p2s.product_id) AS stores, (SELECT COUNT(p2d.product_id) FROM " . DB_PREFIX . "product_to_download p2d WHERE p.product_id = p2d.product_id) AS downloads, (SELECT COUNT(pi.product_id) FROM " . DB_PREFIX . "product_image pi WHERE p.product_id = pi.product_id) AS images, ";
		}
		
		$sql .= "p.product_id AS product_id FROM " . DB_PREFIX . "product p " . $data['sql_tables'] . " WHERE p.product_id " . $this->getFilterSql($data) . " GROUP BY p.product_id ORDER BY " . $data['sort'] . " " . $data['order'];
		
		$sql .= " LIMIT " . $data['start'] . "," . $data['limit'];
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalProducts($data = array ()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "'";
		
		$sql .= $this->getFilterSql($data);
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	private function getFilterSql($data = array ()) {
		$sql = FALSE;
		
		if (!empty ($data['filter_keyword'])) {
			$implode = array ();
			
			if (isset ($data['filter_search_in']['exact_entry'])) {
				$words[] = $data['filter_keyword'];
			} else {
				$words = explode (' ', $data['filter_keyword']);
			}
			
			$fields = array ('name' => 'pd', 'description' => 'pd', 'model' => 'p', 'sku' => 'p', 'upc' => 'p', 'location' => 'p');
			
			foreach ($fields as $key => $field) {
				if (isset ($data['filter_search_in'][$key])) {
					foreach ($words as $word) {
						$implode[] = "LCASE(" . $field . "." . $key . ") LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
					}
				}
			}
			
			$sql .= ($implode) ? " AND ( " . implode (" OR ", $implode) . ") " : FALSE;
		}
		
		$fields_1 = array ('price', 'quantity', 'sort_order', 'minimum', 'points', 'weight', 'length', 'width', 'height');
		
		foreach ($fields_1 as $field) {
			$sql .= (isset ($data['filter_' . $field]['min'])) ? " AND p." . $field . " >= '" . (float) $data['filter_' . $field]['min'] . "'" : FALSE;
			$sql .= (isset ($data['filter_' . $field]['max'])) ? " AND p." . $field . " <= '" . (float) $data['filter_' . $field]['max'] . "'" : FALSE;
		}
		
		$sql .= (isset ($data['filter_status'  ])) ? " AND p.status   = '" . (int) $data['filter_status'  ] . "'" : FALSE;
		$sql .= (isset ($data['filter_subtract'])) ? " AND p.subtract = '" . (int) $data['filter_subtract'] . "'" : FALSE;
		$sql .= (isset ($data['filter_shipping'])) ? " AND p.shipping = '" . (int) $data['filter_shipping'] . "'" : FALSE;
		
		$fields_2 = array ('attribute' => 'attribute', 'to_category' => 'category', 'manufacturer', 'tax_class', 'stock_status', 'weight_class', 'length_class');
		
		foreach ($fields_2 as $key => $field) {
			if (is_integer ($key)) {
				$sql .= (!empty ($data['filter_' . $field]) || $data['filter_' . $field][0] == '0') ? " AND p." . $field . "_id " . $data['filter'][$field . '_not'] . " IN (" . $data['filter_' . $field] . ")" : FALSE;
			} else {
				$sql .= (!empty ($data['filter_' . $field])) ? " AND p.product_id " . $data['filter'][$field . '_not'] . " IN (SELECT product_id FROM " . DB_PREFIX . "product_" . $key . " WHERE " . $field . "_id IN (" . $data['filter_' . $field] . "))" : FALSE;
				
				$sql .= (empty ($data['filter_' . $field]) && $data['filter'][$field . '_not']) ? " AND p.product_id " . $data['filter'][$field . '_not'] . " IN (SELECT product_id FROM " . DB_PREFIX . "product_" . $key . ")" : FALSE;
			}
		}
		
		return $sql;
	}
}
?>