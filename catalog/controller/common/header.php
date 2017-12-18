<?php
class ControllerCommonHeader extends Controller {
    protected function index() {
        $this->data['title'] = $this->document->getTitle();

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        // For page specific css
        if (isset($this->request->get['route'])) {
            if (isset($this->request->get['product_id'])) {
                $class = '-' . $this->request->get['product_id'];
            } elseif (isset($this->request->get['path'])) {
                $class = '-' . $this->request->get['path'];
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $class = '-' . $this->request->get['manufacturer_id'];
            } elseif (isset($this->request->get['information_id'])) {
                $class = '-' . $this->request->get['information_id'];
            } else {
                $class = '';
            }
            $this->data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
        } else {
            $this->data['class'] = 'common-home';
        }

        $this->data['base'] = $server;
        $this->data['description'] = $this->document->getDescription();
        $this->data['keywords'] = $this->document->getKeywords();
        $this->data['links'] = $this->document->getLinks();
        $this->data['styles'] = $this->document->getStyles();
        $this->data['scripts'] = $this->document->getScripts();
        $this->data['lang'] = $this->language->get('code');
        $this->data['direction'] = $this->language->get('direction');
        $this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
        $this->data['name'] = $this->config->get('config_name');

        if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
            $this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
        } else {
            $this->data['icon'] = '';
        }

        if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
            $this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $this->data['logo'] = '';

        }

        $this->language->load('common/header');
        $this->data['og_url'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
        $this->data['og_image'] = $this->document->getOgImage();

        $this->data['text_home'] = $this->language->get('text_home');
        $this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
        $this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $this->data['text_search'] = $this->language->get('text_search');
        $this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
        $this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
        $this->data['text_logged_simple'] = $this->language->get('text_logged_simple');
        $this->data['text_account'] = $this->language->get('text_account');
        $this->data['text_checkout'] = $this->language->get('text_checkout');
        $this->data['text_page'] = $this->language->get('text_page');
        $this->data['text_login'] = $this->language->get('text_login');
        $this->data['text_register'] = $this->language->get('text_register');
        $this->data['text_sitemap'] = $this->language->get('text_sitemap');
        $this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $this->data['text_voucher'] = $this->language->get('text_voucher');
        $this->data['text_special'] = $this->language->get('text_special');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['text_return'] = $this->language->get('text_return');
        $this->data['text_contact'] = $this->language->get('text_contact');

        $this->data['home'] = $this->url->link('common/home');
        $this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
        $this->data['logged'] = $this->customer->isLogged();
        $this->data['account'] = $this->url->link('account/account', '', 'SSL');
        $this->data['logged_simple'] = $this->url->link('account/logout', '', 'SSL');
        $this->data['shopping_cart'] = $this->url->link('checkout/cart');
        $this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
        $this->data['checkout_simple'] = $this->url->link('checkout/checkout_simple', '', 'SSL');
        $this->data['login'] = $this->url->link('account/login', '', 'SSL');
        $this->data['register'] = $this->url->link('account/register', '', 'SSL');
        $this->data['sitemap'] = $this->url->link('information/sitemap');
        $this->data['manufacturer'] = $this->url->link('product/manufacturer');
        $this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
        $this->data['special'] = $this->url->link('product/special');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
        $this->data['return'] = $this->url->link('account/return/insert', '', 'SSL');
        $this->data['contact'] = $this->url->link('information/contact');
        $this->data['shipping'] = $this->url->link('information/information', 'information_id=6');
        $this->data['terms'] = $this->url->link('information/information', 'information_id=5');
        $this->data['security'] = $this->url->link('information/information', 'information_id=3');

        // Daniel's robot detector
        $status = true;

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $robots = explode("\n", trim($this->config->get('config_robots')));

            foreach ($robots as $robot) {
                if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
                    $status = false;

                    break;
                }
            }
        }

        // A dirty hack to try to set a cookie for the multi-store feature
        $this->load->model('setting/store');

        $this->data['stores'] = array();

        if ($this->config->get('config_shared') && $status) {
            $this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();

            $stores = $this->model_setting_store->getStores();

            foreach ($stores as $store) {
                $this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
            }
        }

        // Search
        if (isset($this->request->get['search'])) {
            $this->data['search'] = $this->request->get['search'];
        } else {
            $this->data['search'] = '';
        }

        // Menu
        if (isset($this->request->get['path'])) {
            $parts = explode('_', (string)$this->request->get['path']);
        } else {
            $parts = array();
        }

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');


        $this->data['categories'] = array();

        $categories_1 = $this->model_catalog_category->getCategories(0);

        $counter = 0;
        $this->data['category_1_list'] = '';
        foreach ($categories_1 as $category_1) {
            $level_2_data = array();

            $categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

            foreach ($categories_2 as $category_2) {
                $level_3_data = array();

                $categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

                foreach ($categories_3 as $j=>$category_3) {
                    $level_3_data[] = array(
                        'name' => $category_3['name'],
                        'thumb' => $this->model_tool_image->resize(($category_3['image']=='' ? 'no_image.jpg' : $category_3['image']), 150, 100),
                        'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
                    );
                }

                // Sort array for menu best view
                // First we will show the ones with children

                $level_2_data[] = array(
                    'name'     => $category_2['name'],
                    'desc'     => $category_2['description'],
                    'children' => $level_3_data,
                    'thumb' => $this->model_tool_image->resize(($category_2['image']=='' ? 'no_image.jpg' : $category_2['image']), 300, 200),
                    'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])
                );
            }
            // с 3им уровнем вначале
            usort($level_2_data, function($a, $b){
                if (empty ($a['children']) && empty($b['children']) )
                    return ;
                elseif (!empty($a['children']) && empty($b['children']) )
                    return -1;
                elseif (empty($a['children']) && !empty($b['children']) )
                    return 1;
                elseif (!empty($a['children']) && !empty($b['children']) )
                    return ;

            });

            $this->data['categories'][] = array(
                'name'     => $category_1['name'],
                'children' => $level_2_data,
                'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'])
            );
            // html-вывод 1 уровня
            $this->data['category_1_list'] .= '<a href="#" class="list-group-item '. ($counter?'':'active') . ' text-center">'.$category_1['name'].'</a>';
            $counter++;
        }

        $this->children = array(
            'module/language',
            'module/currency',
            'module/cart'
        );

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/header.tpl';
        } else {
            $this->template = 'default/template/common/header.tpl';
        }

        $this->render();
    }
    // возвращает объект с найденными элементами(категории, товары, производители) по тексту
    public function getSearchTips()
    {
        $response = array();
        if (isset($this->request->post['search_text'])) {
            $search_text = $this->request->post['search_text'];
        } else {
            $search_text = '';
        }
        $limit = 10;
        $data = array(
            'filter_name'         => $search_text,
            'start'               =>0,
            'limit'               => $limit
        );

        $this->load->model('catalog/product');
        $results = $this->model_catalog_product->getProducts($data);
        foreach ($results as $result) {
            $response['products'][] = array(
                'name' => $result['name'],
                'code' => $result['model'],
                'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'])
            );
        }

        $this->load->model('catalog/category');
        $results = $this->model_catalog_category->getCategoriesSearched($search_text);
        foreach ($results as $result) {
            $response['categories'][] = array(
                'name' => $result['name'],
                'href' => $this->url->link('product/category', 'category_id=' . $result['category_id'])
            );
        }

        $this->load->model('catalog/manufacturer');
        $results = $this->model_catalog_manufacturer->getManufacturerSearched($search_text);
        //var_dump($results);
        foreach ($results as $result) {
            $response['manufacturers'][] = array(
                'name' => $result['name'],
                'href' => $this->url->link('product/manufacturer', 'manufacturer_id=' . $result['manufacturer_id'])
            );
        }

        $this->response->setOutput(json_encode($response));
    }
}
?>
