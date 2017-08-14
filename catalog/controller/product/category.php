<?php 
class ControllerProductCategory extends Controller {  
	public function index() {
		$this->language->load('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}


		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
//			$sort = 'p.quantity';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
//			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}


		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('icon_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);

        $this->data['breadcrumbs'][] = array(
            'text'      => "Каталог",
            'href'      => $this->url->link('product/category', 'path=0'),
            'separator' => false
        );

        if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);
				if ($category_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $path . $url),
        				'separator' => $this->language->get('text_separator')
        			);
				}

			}


		} else {
			$category_id = 0;
		}

        $this->data['current_category'] = $category_id;
		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			if ($category_info['seo_title']) {
		  		$this->document->setTitle($category_info['seo_title']);
			} else {
		  		$this->document->setTitle($category_info['name']);
			}

			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');

			if ($category_info['seo_h1']) {
				$this->data['heading_title'] = $category_info['seo_h1'];
			} else {
				$this->data['heading_title'] = $category_info['name'];
			}

			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');

			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');

			// Set the last category breadcrumb
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $category_info['name'],
				'href'      => $this->url->link('product/category', 'path=' . $this->request->get['path']),
				'separator' => $this->language->get('text_separator')
			);


			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				$this->document->setOgImage($this->data['thumb']);
			} else {
				$this->data['thumb'] = '';
			}

			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);


			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				$product_total = $this->model_catalog_product->getTotalProducts($data);

				$this->data['categories'][] = array(
                    'meta_description'  => $result['meta_description'] ,
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url),
					'thumb' => $this->model_tool_image->resize(($result['image']=='' ? 'no_image.jpg' : $result['image']), $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))
				);
			}

//            $categories_1 = $this->model_catalog_category->getCategories(0);
//
//            foreach ($categories_1 as $category_1) {
//                $level_2_data = array();
//
//                $categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
//
//                foreach ($categories_2 as $category_2) {
//                    $level_3_data = array();
//
//                    $categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
//
//                    foreach ($categories_3 as $category_3) {
//                        $level_3_data[] = array(
//                            'name' => $category_3['name'],
//                            'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id']),
//                            'meta_description'  => $category_3['meta_description'] ,
//                        );
//                    }
//
//                    $level_2_data[] = array(
//                        'name'     => $category_2['name'],
//                        'children' => $level_3_data,
//                        'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id']),
//                        'meta_description'  => $category_2['meta_description'] ,
//                    );
//                }
//
//                $this->data['categories'][] = array(
//                    'name'     => $category_1['name'],
//                    'children' => $level_2_data,
//                    'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id']),
//                    'meta_description'  => $category_1['meta_description'] ,
//                );
//            }

            if ($category_id==785) $this->data['categories'] = array();
			
			$this->data['products'] = array();

            // Если попадается одна косячная папка с потолочными светильниками с кучей других глупых папок, выводим
            // эту категорию без них
            $filtersub = true;
            if ($category_id==785) $filtersub = true;


			$data = array(
				'filter_category_id' => $category_id,
                'filter_sub_category' => $filtersub,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
					
			$results = $this->model_catalog_product->getProducts($data);
			//Вызов метода getFoundProducts должен проводится сразу же после getProducts
			//только тогда он выдает правильное значения количества товаров
			$product_total = $this->model_catalog_product->getFoundProducts(); 
			
			foreach ($results as $result) {
                if ($category_info['products_template']!=NULL ) {$width = $this->config->get('config_image_category_width'); $height  = $this->config->get('config_image_category_height'); } else{$width=$this->config->get('config_image_product_width'); $height = $this->config->get('config_image_product_height');}
                if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $width, $height);
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $width, $height);
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
				
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}				
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
								
				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
                    'bestseller'  => $result['bestseller'],
					'thumb'       => $image,
					'name'        => $result['name'],
                    'code'        => isset($result['model'])?  $result['model'] : '',
                    'quantity'    => $result['quantity'],
					'description' => ($result['description']) ? utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 300) . '..' : '',
					'price'       => $price,
					'special'     => $special,
                    'latest' 	 => $result['latest'],
					'tax'         => $tax,
					'rating'      => $result['rating'],
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url),
				);

			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
										
			$this->data['sorts'] = array();
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			); 
			
			if ($this->config->get('config_review_status')) {
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				); 
				
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
			
			$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));
			
			sort($limits);
	
			foreach($limits as $value){
				$this->data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}
			
			$url = '';
			

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

//            if ( $category_info['products_template']) {$products_template='/template/product/category-mini.tpl';}
//            else
            $products_template = '/template/product/category.tpl';
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $products_template)) {
				$this->template = $this->config->get('config_template') . $products_template ;
			} else {
				$this->template = 'default/template/product/category.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
				
			$this->response->setOutput($this->render());										
    	} else {
            // если не передали переменную с категорией, значит корень каталога, иначе не найдено
            if($category_id==0)
            {
                $url = '';

                if (isset($this->request->get['path'])) {
                    $url .= '&path=' . $this->request->get['path'];
                }

                if (isset($this->request->get['filter'])) {
                    $url .= '&filter=' . $this->request->get['filter'];
                }


                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                $this->document->setTitle("Каталог товаров");
                $this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
                $this->data['heading_title'] = "Каталог товаров";


                $this->data['categories'] = array();


                $results = $this->model_catalog_category->getCategories($category_id);

                foreach ($results as $result) {

                    $this->data['categories'][] = array(
                        'name'  => $result['name'] ,
                            'meta_description'  => $result['meta_description'] ,
                        'href'  => $this->url->link('product/category', 'path=' . $result['category_id']),
                        'thumb' => $this->model_tool_image->resize(($result['image']=='' ? 'no_image.jpg' : $result['image']), $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))
                    );
                }

    //            $categories_1 = $this->model_catalog_category->getCategories(0);
    //
    //            foreach ($categories_1 as $category_1) {
    //                $level_2_data = array();
    //
    //                $categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
    //
    //                foreach ($categories_2 as $category_2) {
    //                    $level_3_data = array();
    //
    //                    $categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
    //
    //                    foreach ($categories_3 as $category_3) {
    //                        $level_3_data[] = array(
    //                            'name' => $category_3['name'],
    //                            'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id']),
    //                            'meta_description'  => $category_3['meta_description'] ,
    //                            'thumb' => $this->model_tool_image->resize(($category_3['image']=='' ? 'no_image.jpg' : $category_3['image']), $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))
    //
    //                        );
    //                    }
    //
    //                    $level_2_data[] = array(
    //                        'name'     => $category_2['name'],
    //                        'children' => $level_3_data,
    //                        'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id']),
    //                        'meta_description'  => $category_2['meta_description'] ,
    //                        'thumb' => $this->model_tool_image->resize(($category_2['image']=='' ? 'no_image.jpg' : $category_2['image']), $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))
    //
    //                    );
    //                }
    //
    //                $this->data['categories'][] = array(
    //                    'name'     => $category_1['name'],
    //                    'children' => $level_2_data,
    //                    'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id']),
    //                    'meta_description'  => $category_1['meta_description'] ,
    //                    'thumb' => $this->model_tool_image->resize(($category_1['image']=='' ? 'no_image.jpg' : $category_1['image']), $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))
    //
    //                );
    //            }


                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
                    $this->template = $this->config->get('config_template') . '/template/product/category.tpl' ;
                } else {
                    $this->template = 'default/template/product/category.tpl';
                }
            }else{
                $url = '';

                if (isset($this->request->get['path'])) {
                    $url .= '&path=' . $this->request->get['path'];
                }

                if (isset($this->request->get['filter'])) {
                    $url .= '&filter=' . $this->request->get['filter'];
                }


                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                $this->data['breadcrumbs'][] = array(
                    'text'      => $this->language->get('text_error'),
                    'href'      => $this->url->link('product/category', $url),
                    'separator' => $this->language->get('text_separator')
                );

                $this->document->setTitle($this->language->get('text_error'));

                $this->data['heading_title'] = $this->language->get('text_error');

                $this->data['text_error'] = $this->language->get('text_error');

                $this->data['button_continue'] = $this->language->get('button_continue');

                $this->data['continue'] = $this->url->link('product/category');

                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                    $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
                } else {
                    $this->template = 'default/template/error/not_found.tpl';
                }
            }

            $this->children = array(
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
}
?>
