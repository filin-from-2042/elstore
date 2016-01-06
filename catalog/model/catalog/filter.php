<?php

class ModelCatalogFilter extends Model {

  public function getOptionsByCategoryId($category_id) {

    $options_data = $this->cache->get('option.' . $category_id . '.' . $this->config->get('config_language_id'));

    if (!$options_data && !is_array($options_data)) {

      $options_query = $this->db->query("SELECT co.option_id, co.type, co.group_count, cod.name, cod.postfix, cod.description FROM " . DB_PREFIX . "category_option co LEFT JOIN " . DB_PREFIX . "category_option_description cod ON (co.option_id = cod.option_id) LEFT JOIN " . DB_PREFIX . "category_option_to_category cotc ON (co.option_id = cotc.option_id) WHERE co.status = '1' AND cotc.category_id = '" . (int)$category_id . "' AND cod.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY co.sort_order");

      if ($options_query->num_rows) {
        $options_id = array();

        foreach ($options_query->rows as $option) $options_id[] = (int)$option['option_id'];

        $values_query = $this->db->query("SELECT cov.value_id, cov.option_id, covd.name FROM " . DB_PREFIX . "category_option_value cov LEFT JOIN " . DB_PREFIX . "category_option_value_description covd ON (cov.value_id = covd.value_id) WHERE cov.option_id IN (" . implode(',', $options_id) . ") AND covd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY cov.sort_order, covd.name");

        $values = array();

        foreach ($values_query->rows as $value) $values[$value['option_id']][] = $value;

        foreach ($options_query->rows as $option) {
          if (isset($values[$option['option_id']])) {
            $options_data[$option['option_id']] = $option;
            $options_data[$option['option_id']]['values'] = $values[$option['option_id']];
          }
        }
      }

      $this->cache->set('option.' . $category_id . '.' . $this->config->get('config_language_id'), $options_data);
    }

    return $options_data;
  }

  public function getOptionsByProductsId($products_id = array()) {
    $options_data = array();

    if ($products_id) {
      $options_query = $this->db->query("SELECT p2v.product_id, co.option_id, cod.name, cod.postfix FROM " . DB_PREFIX . "category_option co LEFT JOIN " . DB_PREFIX . "category_option_description cod ON (cod.option_id = co.option_id) LEFT JOIN " . DB_PREFIX . "product_to_value p2v ON (co.option_id = p2v.option_id) WHERE cod.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2v.product_id IN (" . implode(',', $products_id) . ") ORDER BY co.sort_order, cod.name");
      $values_query = $this->db->query("SELECT p2v.product_id, cov.option_id, covd.name FROM " . DB_PREFIX . "category_option_value cov LEFT JOIN " . DB_PREFIX . "category_option_value_description covd ON (covd.value_id = cov.value_id) LEFT JOIN " . DB_PREFIX . "product_to_value p2v ON (cov.value_id = p2v.value_id) WHERE covd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2v.product_id IN (" . implode(',', $products_id) . ") ORDER BY cov.sort_order, covd.name");

      if ($options_query->num_rows && $values_query->num_rows) {
        $values = array();
        foreach ($values_query->rows as $row) $values[$row['product_id']][$row['option_id']][] = $row['name'];

        foreach ($options_query->rows as $row) {
          if (isset($values[$row['product_id']][$row['option_id']])) {
            $options_data[$row['product_id']][$row['option_id']] = $row;
            $options_data[$row['product_id']][$row['option_id']]['values'] = implode($row['postfix'] . ' &bull; ', $values[$row['product_id']][$row['option_id']]) . $row['postfix'];
          }
        }
      }
    }

    return $options_data;
  }

  public function getManufacturersByCategoryId($category_id) {
	  $query = $this->db->query("SELECT m.manufacturer_id AS value_id, m.name, 'm' AS option_id FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) LEFT JOIN " . DB_PREFIX . "product p ON (m.manufacturer_id = p.manufacturer_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2c.category_id = '" . (int)$category_id . "' GROUP BY m.manufacturer_id ORDER BY name");

		return $query->rows;
	}

  public function getStockStatuses() {
		$query = $this->db->query("SELECT stock_status_id AS value_id, name, 's' AS option_id FROM " . DB_PREFIX . "stock_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY name");

		return $query->rows;
	}

  public function getProductPrices($data) {
    $product_data = array();

    $sql = "SELECT p.product_id, p.price, p.tax_class_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p.status = '1' AND p2c.category_id = '" . (int)$data['filter_category_id'] . "' AND p.price > '0' AND p.date_available <= NOW()";

    if (!empty($data['filter_filter'])) {
      $filter_params = $this->getFilterQuery($data['filter_filter']);

      if ($filter_params) {
        $sql .= $filter_params;
      } else {
        return 0;
      }
    }

    $sql .= " ORDER BY p.price";

    $query = $this->db->query($sql);

    foreach ($query->rows as $row) {
      $product_data[$row['product_id']] = $row['price'];
    }

    $price_data = array();

    if ($product_data) {
      $price_data['min'] = floor(min($product_data) * $this->currency->getValue());
      $price_data['max'] = ceil(max($product_data) * $this->currency->getValue());
      $price_data['products'] = $product_data;
    }

    return $price_data;
  }

  public function getMinMaxCategoryPrice($data = array()) {
    $query = $this->db->query("SELECT MIN(p.price) AS min, MAX(p.price) AS max FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p.status = '1' AND p2c.category_id = '" . (int)$data['filter_category_id'] . "' AND p.price > '0' AND p.date_available <= NOW()");

    $price_data = array();

    if ($query->num_rows) {
      $price_data['min'] = floor($query->row['min'] * $this->currency->getValue());
      $price_data['max'] = ceil($query->row['max'] * $this->currency->getValue());
    }

    return $price_data;
  }

  public function getFilterQuery($filter_params) {
    $sql = '';

    if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

    $module = $this->config->get('filter_module');

    $settings = $module[0];

    $values_id = array();
    $products_id = array();
    $options_count = 0;

    foreach (explode(';', $filter_params) as $option) {
      $values = explode(':', $option);

      if ($values[0] == 'p' && $settings['show_price']) { # if price filtering
        $between = explode('-', $values[1]);

        if (isset($between[0]) && isset($between[1])) {
          $price_from = floor((int)$between[0] / $this->currency->getValue());
          $price_to = ceil((int)$between[1] / $this->currency->getValue());

          $sql .= " AND (p.price BETWEEN '" . $price_from . "' AND '" . $price_to . "'";

          if ($settings['consider_discount']) {
            $sql .= " OR p.product_id IN (SELECT product_id FROM " . DB_PREFIX . "product_discount WHERE customer_group_id = '" . (int)$customer_group_id . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND price BETWEEN '" . $price_from . "' AND '" . $price_to . "')";
          }

          if ($settings['consider_special']) {
            $sql .= " OR p.product_id IN (SELECT product_id FROM " . DB_PREFIX . "product_special WHERE customer_group_id = '" . (int)$customer_group_id . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND price BETWEEN '" . $price_from . "' AND '" . $price_to . "')";
          }

          $sql .= ")";
        }
      } else if ($values[0] == 's' && $settings['stock_status']) { # if stock status filtering
        $data = array();
        foreach (explode(',', $values[1]) as $value_id) $data[] = "p.stock_status_id = '" . (int)$value_id . "'";

        $sql .= " AND (" . implode(' OR ', $data) . ")";
      } else if ($values[0] == 'm' && $settings['manufacturer']) { # if manufacturer filtering
        $data = array();
        foreach (explode(',', $values[1]) as $value_id) $data[] = "p.manufacturer_id = '" . (int)$value_id . "'";

        $sql .= " AND (" . implode(' OR ', $data) . ")";
      } else if (isset($values[1])) { # if options
        foreach (explode(',', $values[1]) as $value_id) $values_id[] = (int)$value_id;

        $options_count++;
      }
    }

    if ($values_id) {
      $data = array();

      foreach ($values_id as $value_id) $data[] = "value_id = '" . (int)$value_id . "'";

      $query = $this->db->query("SELECT product_id, option_id FROM " . DB_PREFIX . "product_to_value WHERE " . implode(' OR ', $data));

      $data = array();

      foreach($query->rows as $row) $data[$row['option_id']][$row['product_id']] = (int)$row['product_id']; # Separate unique products_id by options (for multiply values in product)
      foreach($data as $product_data) $products_id = array_merge($product_data, $products_id);
    }

    if ($values_id && !$products_id) return 0;

    if ($products_id) {
      $data = array();

      if (count(array_unique($products_id)) < count($products_id)) {
        foreach (array_count_values($products_id) as $product_id => $count) {
          if ($count == $options_count) $data[] = (int)$product_id;
        }
      } elseif ($options_count == 1) $data = $products_id;

      if ($data) {
        $sql .= " AND p.product_id IN (" . implode(',', $data) . ")";
      } else {
        return 0;
      }
    }

    return $sql;
  }
}

?>