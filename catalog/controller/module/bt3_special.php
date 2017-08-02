<?php
class ControllerModuleBt3Special extends Controller {
	protected function index($setting) {
		$this->language->load('module/special');
 
      	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['button_cart'] = $this->language->get('button_cart');

        $this->data['viewAll'] = $this->url->link('product/special');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$this->data['products'] = array();
		
		$data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit'],
            'status' => '1',
		);

		$results = $this->model_catalog_product->getProductSpecials($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
                $image = $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) { 
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
                'special'     => (isset($result['product_special_id']) && $result['product_special_id'])? true : false,
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
                'quantity'    => $result['quantity'],
				'price'   	 => $price,
				'special' 	 => $special,
                'code'        => isset($result['model'])? ('код: ' . $result['model']):'',
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'    	 => $this->url->link('product/product', array('product_id=' . $result['product_id'] ))
			);
		}
        
        $this->data['bt3'] = $setting['bt3'];

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/special.tpl';
		} else {
			$this->template = 'default/template/module/special.tpl';
		}

		$this->render();
	}
}