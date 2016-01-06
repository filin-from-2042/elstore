<?php
class ControllerModuleFilter extends Controller {

  private $link = ''; # Позже, мы присвоим сюда ссылку на текущую категорию, чтобы избежать многочисленных вызовов метода rewrite
  private $path = '';
  private $sep_par = ';'; # разделитель пар опций -> значений: opt1:val1,val2,val3;opt2:val1,val2,val3 ...
  private $sep_opt = ':'; # разделитель внутри пары опция -> значения: opt1:val1,val2,val3 ...
  private $sep_val = ','; # разделитель для параметров опции: val1,val2,val3 ...
  private $index = 'filter_params'; # Индекс фильтра в GET запросе + в моделе и контроллере.
  private $variable = '&filter_params='; # Название переменной фильтра в GET запросе + в моделе и контроллере.
  private $params = ''; # Здесь будет храниться значение GET переменной $variable
  private $show_button = false;
  private $min_price = 0;
  private $max_price = 0;
  private $min_price_get = 0;
  private $max_price_get = 0;
  private $category_id = 0;
  private $products_total = 0;
  private $matches = array();
  private $options_get = array(); # Массив вида array(option_id => array(value_id => value_id, value_id => value_id)) в GET запросе
  private $settings = array();

  public function __construct($registry) {
    $this->registry = $registry;

    $module = $this->config->get('filter_module');

    $this->settings = $module[0];
    $this->settings['template'] = $this->config->get('config_template');

    $this->language->load('module/filter');

    if (isset($this->request->get['path'])) {
      $this->path = (string)$this->request->get['path'];

      $url = '';

      if (isset($this->request->get['sort'])) {
        $url .= '&sort=' . (string)$this->request->get['sort'];
      }

      if (isset($this->request->get['order'])) {
        $url .= '&order=' . (string)$this->request->get['order'];
      }

      if (isset($this->request->get['limit'])) {
        $url .= '&limit=' . (int)$this->request->get['limit'];
      }

      if (isset($this->request->get[$this->index])) {
        $this->params = $this->clean($this->request->get[$this->index]);
      }

      $this->load->model('catalog/product');
      $this->load->model('catalog/filter');

      $this->link = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->path) . $url);

			$parts = explode('_', $this->path);
			$this->category_id = end($parts);

      if ($this->params) {
        $this->matches = explode($this->sep_par, $this->params);

        foreach ($this->matches as $option_value) {
          $option = explode($this->sep_opt, $option_value);

          if (isset($option[1])) {
            if ($option[0] == 'p') {
              $this->options_get['p'][$option[1]] = $option[1];

              $range = explode('-', $option[1]);

              $this->min_price_get = (int)$range[0];
              $this->max_price_get = (int)$range[1];
            } else {
              foreach (explode($this->sep_val, $option[1]) as $value_id) {
                $this->options_get[$option[0]][$value_id] = $value_id;
              }
            }
          }
        } # end foreach
      }

      $data = array(
				'filter_category_id' => $this->category_id,
        'filter_params'      => $this->params
			);

      $products_total = $this->model_catalog_product->getTotalProducts($data);

      $this->products_total = $products_total;

      if ($this->products_total && $this->settings['show_price']) {
        unset($data['filter_params']);

        $min_max_price = $this->model_catalog_filter->getMinMaxCategoryPrice($data);

        if ($min_max_price) {
          $this->min_price = $min_max_price['min'];
      	  $this->max_price = $min_max_price['max'];
        }
      }
    }
  }

	protected function index() {

    if ($this->category_id && $this->products_total) {
      if ($this->options_get) {
        $this->data['heading_title'] = $this->declOfNum($this->products_total, array($this->language->get('text_total_1'), $this->language->get('text_total_2'), $this->language->get('text_total_3')));
      } else {
        $this->data['heading_title'] = $this->language->get('heading_title');
      }

      $this->data['options']              = $this->options();
      $this->data['min_price']            = $this->min_price;
  		$this->data['max_price']            = $this->max_price;
      $this->data['min_price_get']        = $this->min_price_get;
      $this->data['max_price_get']        = $this->max_price_get;
      $this->data['total']                = $this->products_total;
      $this->data['path']                 = $this->path;
      $this->data['link']                 = $this->link;
      $this->data['params']               = $this->cancel('p');
      $this->data['filter_position']      = $this->settings['position'];
      $this->data['show_button']          = $this->settings['show_button'];
      $this->data['template']             = $this->settings['template'];
      $this->data['button_show']          = $this->language->get('button_show');
      $this->data['button_hide']          = $this->language->get('button_hide');
      $this->data['button_select']        = $this->language->get('button_select');
      $this->data['text_load']            = $this->language->get('text_load');
      $this->data['text_price']           = $this->language->get('text_price');
      $this->data['text_cancel_all']      = $this->language->get('text_cancel_all');

      if (($this->min_price_get && $this->max_price_get) && ($this->min_price_get < $this->min_price || $this->max_price_get > $this->max_price)) {
        $this->redirect($this->link);
      }

      if ($this->min_price_get && $this->max_price_get) {
        $this->data['price'] = 'p' . $this->sep_opt . $this->min_price_get . '-' . $this->max_price_get;
      } else {
        $this->data['price'] = '';
      }

      if ($this->settings['show_button'] && $this->settings['position'] != 'content_bottom') {
        $this->data['scroll_button'] = 1;
      } else {
        $this->data['scroll_button'] = 0;
      }
      
      if ($this->settings['show_counter']) {
        $this->data['show_counter'] = 1;
      } else {
        $this->data['show_counter'] = 0;
      }

      if ($this->settings['hide_options'] && count($this->data['options'])-2 > $this->settings['hide_options']) {
        $this->data['hide_options'] = 1;
      } else {
        $this->data['hide_options'] = 0;
      }

      if ($this->settings['show_diagram'] && $this->settings['show_price']) {
        $this->data['diagram'] = $this->diagram();
      } else {
        $this->data['diagram'] = array();
      }

      if ($this->settings['show_selected'] && $this->options_get) {
        $this->data['selecteds'] = $this->selected();
      } else {
        $this->data['selecteds'] = array();
      }

      if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && $this->settings['show_price'] && $this->min_price && $this->max_price) {
        $this->data['show_price'] = 1;
      } else {
        $this->data['show_price'] = 0;
      }

      if ($this->settings['show_price'] && $this->min_price_get && $this->max_price_get) {
        $this->data['show_price_selected'] = 1;
      } else {
        $this->data['show_price_selected'] = 0;
      }
    } else {
      $this->data['options'] = array();
    }

		$this->id = 'filter';

		if (file_exists('catalog/view/theme/' . $this->settings['template'] . '/filter/filter.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->settings['template'] . '/stylesheet/filter/filter.css');

      if ($this->settings['position'] == 'content_top' || $this->settings['position'] == 'content_bottom') {
        $this->document->addStyle('catalog/view/theme/' . $this->settings['template'] . '/stylesheet/filter/filter-center.css');
      }
		} else {
      $this->document->addStyle('catalog/view/theme/default/stylesheet/filter/filter.css');

      if ($this->settings['position'] == 'content_top' || $this->settings['position'] == 'content_bottom') {
        $this->document->addStyle('catalog/view/theme/default/stylesheet/filter/filter-center.css');
      }
		}

    if (file_exists(DIR_TEMPLATE . $this->settings['template'] . '/template/module/filter.tpl')) {
			$this->template = $this->settings['template'] . '/template/module/filter.tpl';
		} else {
			$this->template = 'default/template/module/filter.tpl';
		}

		$this->render();
	}

	private function options() {

    $options = array();

    # Stock status filtering
    if ($this->settings['stock_status']) {
  		$results = $this->model_catalog_filter->getStockStatuses();

      $options[] = array(
        'option_id'   => 's',
        'name'        => $this->language->get('text_stock'),
        'description' => false,
        'type'        => $this->settings['stock_status_type'],
        'values'      => $results
      );
    }

    # Manufacturers filtering
    if ($this->settings['manufacturer']) {
  		$results = $this->model_catalog_filter->getManufacturersByCategoryId($this->category_id);

      if ($results) {
        $options[] = array(
          'option_id'   => 'm',
          'name'        => $this->language->get('text_manufacturer'),
          'description' => false,
          'type'        => $this->settings['manufacturer_type'],
          'values'      => $results
        );
      }
    }

    # Get category options
	  $results = $this->model_catalog_filter->getOptionsByCategoryId($this->category_id);

    if ($results) $options = array_merge($options, $results);

    $options_data = array();

		if ($options) {
		  foreach($options as $option) {
        $values = array();

        if ($option['type'] != 'group') {
          if ($option['type'] == 'select' || $option['type'] == 'radio') {
            $values[] = array(
              'value_id' => 'cancel-' . $option['option_id'],
              'name'     => $this->language->get('text_any'),
              'params'   => $this->cancel($option['option_id']),
              'selected' => !isset($this->options_get[$option['option_id']])
            );
          }

          foreach ($option['values'] as $value) {
            $params = $this->params($option['option_id'], $value['value_id'], $option['type']);

            $values[] = array(
              'value_id' => $value['value_id'],
              'name'     => $value['name'] . (isset($option['postfix']) ? $option['postfix'] : ''),
              'params'   => $params,
              'selected' => isset($this->options_get[$option['option_id']][$value['value_id']])
            );
          }
        } else { # Group values by sort_order
          for ($i = 0; $i < count($option['values']); $i = $i + $option['group_count']) {
            $group = array();
            $selected = false;

            for ($j = $i; $j < ($i + $option['group_count']); $j++) {
              if (isset($option['values'][$j])) {
                $params = $this->params($option['option_id'], $option['values'][$j]['value_id'], 'checkbox');

                $group[] = array(
                  'group_id' => $option['values'][$j]['value_id'],
                  'name'     => $option['values'][$j]['name']
                );

                if (isset($this->options_get[$option['option_id']][$option['values'][$j]['value_id']])) {
                  $selected = true;
                }

                $this->params = $params;
              }
            }

            if ($group) {
              $values[] = array(
                'value_id' => $group[0]['group_id'],
                'name'     => (count($group) > 1 ? $group[0]['name'] . ' - ' . $group[count($group)-1]['name'] : $group[0]['name']) . $option['postfix'],
                'params'   => $params,
                'selected' => $selected
              );

              if (isset($this->request->get[$this->index])) {
                $this->params = $this->clean($this->request->get[$this->index]);
              } else {
                $this->params = '';
              }
            }
          }
        }

        $options_data[$option['option_id']] = array(
          'option_id'   => $option['option_id'],
          'name'        => $option['name'],
          'description' => $option['description'],
          'type'        => $option['type'],
          'selected'    => isset($this->options_get[$option['option_id']]),
          'values'      => $values
        );
      }
    }
    return $options_data;
  }

  private function params($option_id, $value_id, $type = 'checkbox') {

    if ($this->params) {
      $options = array();
      $values = array();
      $parts = array();

      $this->matches = explode($this->sep_par, $this->params);

      foreach ($this->matches as $option) {
        $data = explode($this->sep_opt, $option);
        if (isset($data[1])) {
          $parts[] = $option;
          $options[] = $data[0];
          $values[] = explode($this->sep_val, $data[1]);
        }
      }

      if (in_array($option_id, $options)) {
        $key = array_keys($options, $option_id); # вычисляем ключ элемента для дальнейшей работы с именно этой опцией
        $key = $key[0];
      }

      $out = '';

      if ($type == 'checkbox') { # Checkbox type
        if (isset($key)) { # если эта опция уже есть в запросе, то мы не добавляем её
          if (in_array($value_id, $values[$key])) { # если это значение уже есть в запросе
            if (count($values[$key]) == 1) { # и если оно единственное
              if (count($this->matches) == 1) { # еще и с единственной опцией
                $out = ''; # то удаляем из запроса весь фильтр
              } else { # если опция не одна, удаляем только эту опцию с её параметром
                $out = str_replace((array_search($parts[$key], $parts) ? $this->sep_par . $parts[$key] : $parts[$key] . $this->sep_par), '', $this->params);
              }
            } else { # если значений несколько, удаляем это значение, оставляя другие с опцией
              $out = str_replace($parts[$key], $options[$key] . $this->sep_opt . str_replace((array_search($value_id, $values[$key]) ? $this->sep_val . $value_id : $value_id . $this->sep_val), '', implode($this->sep_val, $values[$key])), $this->params);
            }
          } else { # если значения нет в запросе, то добавляем его к значениям этой опции
            $out = str_replace($parts[$key], $options[$key] . $this->sep_opt . implode($this->sep_val, $values[$key]) . (count($values[$key]) ? $this->sep_val : '') . $value_id, $this->params);
          }
        } else { # если этой опции нет в запросе
          $out = $this->params . $this->sep_par . $option_id . $this->sep_opt . $value_id;
        }
      } elseif ($type == 'select' || $type == 'slide' || $type == 'radio') { # Selectbox type
        if (isset($key)) { # если эта опция уже есть в запросе, то мы не добавляем её
          if (in_array($value_id, $values[$key])) { # если это значение уже есть в запросе
            $out = str_replace((array_search($parts[$key], $parts) ? $this->sep_par . $parts[$key] : $parts[$key] . $this->sep_par), '', $this->params);
          } else { # если значения нет в запросе, то добавляем его к значениям этой опции
            $out = str_replace($parts[$key], $options[$key] . $this->sep_opt . $value_id, $this->params);
          }
        } else { # если этой опции нет в запросе, добавляем со значением
          $out = $this->params . $this->sep_par . $option_id . $this->sep_opt . $value_id;
        }
      } elseif ($type == 'price') { # For price only
        if (isset($key)) { # если уже выбран диапазон цен
          $out = str_replace((array_search($parts[$key], $parts) ? $this->sep_par . $parts[$key] : $parts[$key] . $this->sep_par), '', $this->params . $this->sep_par . $option_id . $this->sep_opt);
        }
      }
    } else { # если в запросе вообще нет переменной filter
      $out = $option_id . $this->sep_opt . $value_id;
    }

    return $out; # фух.
  }

  private function cancel($option_id) {
    if ($this->params) {
      $matches = array();

      $this->matches = explode($this->sep_par, $this->params);

      foreach ($this->matches as $match) {
        if (strstr($match, $option_id . $this->sep_opt) === false) {
          $matches[] = $match;
        }
      }
      if ($matches) {
        return implode($this->sep_par, $matches);
      }
    }
  }

  private function selected() {
    $options = array();

    if ($this->options_get) { # Если существуют выбранные опции

      $category_options = $this->options(); # Вытягиваем все для получения названий

      # For canceled if price is set in url
      if ($this->min_price_get && $this->max_price_get) {
        $category_options['p'] = array(
          'option_id' => 'p',
          'name'      => $this->language->get('text_price'),
          'type'      => 'select',
          'values'    => array(array(
            'value_id' => $this->min_price_get . '-' . $this->max_price_get,
            'name'     => $this->currency->getSymbolLeft() . '&nbsp;' . $this->min_price_get . '&nbsp;&mdash;&nbsp;' . $this->max_price_get . '&nbsp;' . $this->currency->getSymbolRight()
          ))
        );
      }

      foreach ($this->options_get as $option_id => $values_id) { # перебираем все опции в GET запросе
        $values = array();

        if (isset($category_options[$option_id])) {
          $type = $category_options[$option_id]['type'];

          foreach ($category_options[$option_id]['values'] as $value) { # Мы не можем получить доступ к значению по ключу, поэтому перебираем все
            if (in_array($value['value_id'], $values_id)) { # Если есть в GET такое значение - бросаем в выбранные

              $href = $this->link;

              if (count($this->options_get) > 1 || count($values_id) > 1) {
                $href .= $this->variable;

                if ($type == 'select' || $type == 'radio') {
                  $href .= $this->cancel($category_options[$option_id]['option_id']);
                } else {
                  $href .= $value['params'];
                }
              }

              $values[] = array(
                'name' => $value['name'],
                'href' => $href
              );
            }
          }

          $options[] = array(
            'name'   => $category_options[$option_id]['name'],
            'values' => $values
          );
        }
      }
    }

    return $options;
  }

  public function callback() {
    $json = array();

    $json['total'] = $this->products_total;
    $json['text_total'] = $this->declOfNum($this->products_total, array($this->language->get('button_show_total_1'), $this->language->get('button_show_total_2'), $this->language->get('button_show_total_3')));

    $json['values'] = array();

    if (isset($this->request->get['path'])) {
      foreach ($this->options() as $option) {
        $this_option = isset($this->options_get[$option['option_id']]);

        foreach ($option['values'] as $value) {
          $count = '';

          if ($this->settings['show_counter']) {
            $this_value = isset($this->options_get[$option['option_id']][$value['value_id']]);

            if (!$this_value) {
              $data = array(
        				'filter_category_id' => $this->category_id,
                'filter_params' => $value['params']
        			);

              $products = $this->model_catalog_product->getTotalProducts($data);

              $products_total = (is_null($products) ? 0 : $products);

              $different = $products_total - $this->products_total;

              if ($this_option && ($option['type'] == 'select' || $option['type'] == 'radio')) {
                $count = $products_total;
              } else {
                $different = $products_total - $this->products_total;

                if ($this_option) {
                  if ($different > 0) {
                    $count = '+' . $different;
                  } elseif ($products_total > 0) {

                    $data = array(
              				'filter_category_id' => $this->category_id,
                      'filter_params' => $this->params($option['option_id'], $value['value_id'], 'select')
              			);

                    $products_total_once = $this->model_catalog_product->getTotalProducts($data);

                    if ($products_total_once > 0) {
                      $count = $products_total;
                    } else {
                      $count = 0;
                    }
                  } else {
                    $count = 0;
                  }
                } else {
                  $count = $products_total;
                }
              }
            }
          }

          $this->params = $value['params'];

          $json['values'][$option['option_id'] . $value['value_id']] = array(
            'products' => $count,
            'params'   => $this->cancel('p')
          );
        }
      }
    }

    $this->response->setOutput(json_encode($json));
  }

  private function diagram() {

    # Generate product price diagram by SooR 18-02-2012 v.1
    $diagram_data = array();

    $data = array(
			'filter_category_id' => $this->category_id,
      'filter_params'      => $this->params
		);

    if ($this->min_price_get && $this->max_price_get && count($this->matches) == 1) {
      unset($data['filter_params']);
    }

    $product_prices_result = $this->model_catalog_filter->getProductPrices($data);

    if ($product_prices_result && count($product_prices_result['products']) > 1) {
      $diagram_width = 158;    # diagram box width (px)
      $diagram_height = 30;    # diagram box height (px)

      $min_price = $product_prices_result['min'];
      $max_price = $product_prices_result['max'];
      $price_diff = $max_price-$min_price;

      if ($price_diff > $diagram_width) {
        $price_range = $price_diff/$diagram_width;
        $diagram_item_width = 1;
      } else {
        $price_range = 1;
        $diagram_item_width = $diagram_width/$price_diff;
      }

      $diagram_items = round($diagram_width/$diagram_item_width);

      $max_count = 0;
      $diagram = array();

      for ($i = 0; $i < $diagram_items; $i++) {
        $from = $i*$price_range+$min_price;
        $to = ($i+1)*$price_range+$min_price;

        $count = 0;

        foreach ($product_prices_result['products'] as $product_id => $price) {
          if ($price >= $from && $price <= $to) {
            $count++;
          }
        }

        if ($count > $max_count) {
          $max_count = $count;
        }

        $diagram[] = array(
          'from'  => floor($from),
          'to'    => ceil($to),
          'count' => $count
        );
      }

      foreach ($diagram as $item) {

        # Items height scale

        if ($max_count > $diagram_height) {
          $height = floor($item['count']/($max_count/$diagram_height));
        } elseif ($max_count) {
          $height = floor($item['count']*($diagram_height/$max_count));
        } else {
          $height = $item['count'];
        }

        $diagram_data[] = array(
          'from'   => $item['from'],
          'to'     => $item['to'],
          'count'  => $item['count'],
          'width'  => $diagram_item_width . 'px',
          'height' => $height . 'px'
        );
      }
    }
    # end
    return $diagram_data;
  }

  private function declOfNum($number, $cases) {

    if ($number % 10 == 1 && $number % 100 != 11) {
      $key = 0;
    } elseif ($number % 10 >= 2 && $number % 10 <= 4 && ($number % 100 < 10 || $number % 100 >= 20)) {
      $key = 1;
    } else {
      $key = 2;
    }

    return sprintf($cases[$key], $number);
  }

  private function clean($params) {
    if ($params) {
      $matches = array();

      foreach (explode($this->sep_par, $params) as $option_value) {
        $option = explode($this->sep_opt, $option_value);

        if (isset($option[1])) {
          if ($option[0] == 'p') {
            $range = explode('-', $option[1]);

            if (isset($range[0]) && isset($range[1])) {
              $matches[] = 'p' . $this->sep_opt . (int)$range[0] . '-' . (int)$range[1];
            }
          } elseif ($option[0] == 'm' || $option[0] == 's') {
            $values = array();

            foreach (explode($this->sep_val, $option[1]) as $value_id) $values[] = (int)$value_id;

            $matches[] = $option[0] . $this->sep_opt . implode($this->sep_val, $values);
          } else {
            $values = array();

            foreach (explode($this->sep_val, $option[1]) as $value_id) $values[] = (int)$value_id;

            $matches[] = (int)$option[0] . $this->sep_opt . implode($this->sep_val, $values);
          }
        }
      } # end foreach

      return implode($this->sep_par, $matches);
    }
  }
}
?>