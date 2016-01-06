<?php
// Controller Product
class ControllerProductSearchAdvanced extends Controller {
	public function index() {
		$this->data['setting'] = $this->config->get('search_advanced_setting');
		
		$this->language->load('product/search_advanced');
		
		$this->load->model('catalog/search_advanced');
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		
		if (isset ($this->request->get['keyword'])) {
			$this->document->setTitle($this->language->get('heading_title') . ' - ' . $this->request->get['keyword']);
		} else {
			$this->document->setTitle($this->language->get('heading_title'));
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_critea'] = $this->language->get('text_critea');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_tax'] = $this->language->get('text_tax');
		$this->data['text_display'] = $this->language->get('text_display');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');
		$this->data['text_sort'] = $this->language->get('text_sort');
		$this->data['text_limit'] = $this->language->get('text_limit');
		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset ($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		$url = $url_main = $url_attributes = $url_manufacturers = $url_stocks = $url_prices = FALSE;
		
		$filter_name = (isset ($this->request->get['filter_name'])) ? (string) $this->request->get['filter_name'] : FALSE;
		$filter_title = (isset ($this->request->get['filter_title'])) ? TRUE : FALSE;
		$filter_description = (isset ($this->request->get['filter_description'])) ? TRUE : FALSE;
		$filter_model = (isset ($this->request->get['filter_model'])) ? TRUE : FALSE;
		$filter_sku = (isset ($this->request->get['filter_sku'])) ? TRUE : FALSE;
		$filter_sub_category = (isset ($this->request->get['filter_sub_category'])) ? TRUE : FALSE;
		
		$this->data['sort'] = (isset ($this->request->get['sort'])) ? (string) $this->request->get['sort'] : 'p.sort_order';
		$this->data['order'] = (isset ($this->request->get['order'])) ? (string) $this->request->get['order'] : 'ASC';
		$this->data['page'] = (isset ($this->request->get['page'])) ? (int) $this->request->get['page'] : 1;
		$this->data['limit'] = (isset ($this->request->get['limit'])) ? (int) $this->request->get['limit'] : $this->config->get('config_catalog_limit');
		
		if (isset ($this->request->get['filter_category_id'])) {
			$parts = explode ('_', (string) $this->request->get['filter_category_id']);
			$filter_category_id = (int) array_pop ($parts);
		} else {
			$filter_category_id = 0;
		}
		
		$this->data['breadcrumbs'] = array (
			array (
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home'),
				'separator' => FALSE
			)
		);
		
		$url_main .= (isset ($this->request->get['filter_name'])) ? '&filter_name=' . $this->request->get['filter_name'] : FALSE;
		$url_main .= (isset ($this->request->get['filter_title'])) ? '&filter_title=' . $this->request->get['filter_title'] : FALSE;
		$url_main .= (isset ($this->request->get['filter_description'])) ? '&filter_description=' . $this->request->get['filter_description'] : FALSE;
		$url_main .= (isset ($this->request->get['filter_model'])) ? '&filter_model=' . $this->request->get['filter_model'] : FALSE;
		$url_main .= (isset ($this->request->get['filter_sku'])) ? '&filter_sku=' . $this->request->get['filter_sku'] : FALSE;
		$url_main .= (isset ($this->request->get['filter_sub_category'])) ? '&filter_sub_category=' . $this->request->get['filter_sub_category'] : FALSE;
		$url_main .= (isset ($this->request->get['filter_category_id'])) ? '&filter_category_id=' . $this->request->get['filter_category_id'] : FALSE;
		$url_main .= (isset ($this->request->get['path'])) ? '&path=' . $this->request->get['path'] : FALSE;
		
		if (isset ($this->request->get['fa']) && is_array ($this->request->get['fa'])) {
			while (list ($key, $fa) = each ($this->request->get['fa'])) {
				if (is_array ($fa)) {
					if (isset ($fa['min']) && isset ($fa['max'])) {
						$url_attributes .= "&fa[" . $key . "][min]=" . implode ("&fa[" . $key . "][max]=", $fa);
					} else {
						$url_attributes .= "&fa[" . $key . "][]=" . implode ("&fa[" . $key . "][]=", $fa);
					}
				}
			}
		}
		
		$url_prices .= (isset ($this->request->get['fp']['min'])) ? "&fp[min]=" . (float) $this->request->get['fp']['min'] : FALSE;
		$url_prices .= (isset ($this->request->get['fp']['max'])) ? "&fp[max]=" . (float) $this->request->get['fp']['max'] : FALSE;
		
		$url_manufacturers = (isset ($this->request->get['fm']) && is_array ($this->request->get['fm'])) ? "&fm[]=" . implode ("&fm[]=", $this->request->get['fm']) : FALSE;
		$url_stocks = (isset ($this->request->get['fs']) && is_array ($this->request->get['fs'])) ? "&fs[]=" . implode ("&fs[]=", $this->request->get['fs']) : FALSE;
		
		$url .= (isset ($this->request->get['sort'])) ? '&sort=' . $this->request->get['sort'] : FALSE;
		$url .= (isset ($this->request->get['order'])) ? '&order=' . $this->request->get['order'] : FALSE;
		$url .= (isset ($this->request->get['page'])) ? '&page=' . $this->request->get['page'] : FALSE;
		$url .= (isset ($this->request->get['limit'])) ? '&limit=' . $this->request->get['limit'] : FALSE;
		
		$url = $url_main . $url . $url_attributes . $url_manufacturers . $url_stocks . $url_prices;
		
		$this->data['breadcrumbs'][] = array (
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('product/search_advanced', $url),
			'separator' => $this->language->get('text_separator')
		);
		
		$this->data['compare'] = $this->url->link('product/compare');
		$this->data['continue'] = $this->url->link('product/search_advanced&filter_category_id=' . $filter_category_id);
		
		$this->data['products'] = array ();
		
		$data = array (
			'filter_name'          => $filter_name,
			'filter_title'         => $filter_title,
			'filter_description'   => $filter_description,
			'filter_model'         => $filter_model,
			'filter_sku'           => $filter_sku,
			'filter_category_id'   => $filter_category_id,
			'filter_sub_category'  => $filter_sub_category,
			'filter_attributes'    => $this->model_catalog_search_advanced->getAttributesToForm($this->data['setting'], $filter_category_id),
			'filter_manufacturers' => $this->model_catalog_search_advanced->getManufacturersToForm($this->data['setting'], $filter_category_id),
			'filter_stocks'        => $this->model_catalog_search_advanced->getStocksToForm($this->data['setting'], $filter_category_id),
			'filter_prices'        => $this->model_catalog_search_advanced->getPricesToForm($this->data['setting'], $filter_category_id),
			'sort'                 => $this->data['sort'],
			'order'                => $this->data['order'],
			'start'                => ($this->data['page'] - 1) * $this->data['limit'],
			'limit'                => $this->data['limit']
		);
		
		$results = $this->model_catalog_search_advanced->getProducts($this->data['setting'], $data);
		
		$total = $this->model_catalog_search_advanced->getTotalProducts($this->data['setting'], $data);
		
		$image_no = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
		
		foreach ($results as $result) {
			$price = $special = $tax = $rating = FALSE;
			
			$image = $image_no;
			
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			}
			
			if ((float) $result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			}
			
			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price']);
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = (int) $result['rating'];
			}
			
			$this->data['products'][] = array (
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags (html_entity_decode ($result['description'], ENT_QUOTES, 'UTF-8')), 0, 400) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'reviews'     => sprintf($this->language->get('text_reviews'), (int) $result['reviews']),
				'href'        => $this->url->link('product/product', $url . '&product_id=' . $result['product_id'])
			);
		}
		
		$url = FALSE;
		
		$url .= (isset ($this->request->get['limit'])) ? '&limit=' . $this->request->get['limit'] : FALSE;
		
		$url = $url_main . $url . $url_attributes . $url_manufacturers . $url_stocks . $url_prices;
		
		$this->data['sorts'] = array (
			array (
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/search_advanced', 'sort=p.sort_order&order=ASC' . $url)
			),
			array (
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/search_advanced', 'sort=pd.name&order=ASC' . $url)
			),
			array (
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/search_advanced', 'sort=pd.name&order=DESC' . $url)
			),
			array (
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/search_advanced', 'sort=p.price&order=ASC' . $url)
			),
			array (
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/search_advanced', 'sort=p.price&order=DESC' . $url)
			),
			array (
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('product/search_advanced', 'sort=rating&order=DESC' . $url)
			),
			array (
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('product/search_advanced', 'sort=rating&order=ASC' . $url)
			),
			array (
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/search_advanced', 'sort=p.model&order=ASC' . $url)
			),
			array (
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/search_advanced', 'sort=p.model&order=DESC' . $url)
			)
		);
		
		$url = FALSE;
		
		$url .= (isset ($this->request->get['sort'])) ? '&sort=' . $this->request->get['sort'] : FALSE;
		$url .= (isset ($this->request->get['order'])) ? '&order=' . $this->request->get['order'] : FALSE;
		
		$url = $url_main . $url . $url_attributes . $url_manufacturers . $url_stocks . $url_prices;
		
		$this->data['limits'] = array (
			array (
				'text'  => $this->config->get('config_catalog_limit'),
				'value' => $this->config->get('config_catalog_limit'),
				'href'  => $this->url->link('product/search_advanced', $url . '&limit=' . $this->config->get('config_catalog_limit'))
			),
			array (
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('product/search_advanced', $url . '&limit=25')
			),
			array (
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('product/search_advanced', $url . '&limit=50')
			),
			array (
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('product/search_advanced', $url . '&limit=75')
			),
			array (
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('product/search_advanced', $url . '&limit=100')
			)
		);
		
		$url = FALSE;
		
		$url .= (isset ($this->request->get['sort'])) ? '&sort=' . $this->request->get['sort'] : FALSE;
		$url .= (isset ($this->request->get['order'])) ? '&order=' . $this->request->get['order'] : FALSE;
		$url .= (isset ($this->request->get['limit'])) ? '&limit=' . $this->request->get['limit'] : FALSE;
		
		$url = $url_main . $url . $url_attributes . $url_manufacturers . $url_stocks . $url_prices;
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page  = $this->data['page'];
		$pagination->limit = $this->data['limit'];
		$pagination->text  = $this->language->get('text_pagination');
		$pagination->url   = $this->url->link('product/search_advanced', $url . '&page={page}');
		
		$this->data['pagination'] = $pagination->render();
		
		//$this->data['thumb'] = $this->data['description'] = $this->data['categories'] = FALSE;
		
		if (file_exists (DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/search_advanced.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/search_advanced.tpl';
		} else {
			$this->template = 'default/template/product/search_advanced.tpl';
		}
		
		$this->children = array (
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
		
		$this->response->setOutput($this->render());
	}
}
?>