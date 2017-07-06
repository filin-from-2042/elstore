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
        $this->data['categories21'] = array(); // вторая вкладка в меню
        // Начнем со второй
        $categories_21 = $this->model_catalog_category->getCategories(440);

        foreach ($categories_21 as $category_21) {
            $level_2_data = array();

            $categories_22 = $this->model_catalog_category->getCategories($category_21['category_id']);

            foreach ($categories_22 as $category_22) {

                $level_2_data[] = array(
                    'name'     => $category_22['name'],
                    'href'     => $this->url->link('product/category', 'path=' . '440_'. $category_21['category_id'] . '_' . $category_22['category_id'])
                );
            }

            $this->data['categories2'][] = array(
                'name'     => $category_21['name'],
                'children' => $level_2_data,
                'href'     => $this->url->link('product/category', 'path=' . '440_'.$category_21['category_id'])
            );
        }





        $categories_1 = $this->model_catalog_category->getCategories(0);

        foreach ($categories_1 as $category_1) {
            $level_2_data = array();

           // if ($category_1['name']=='Хозтовары'){Break;}

            $categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

            foreach ($categories_2 as $category_2) {
                $level_3_data = array();

                $categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

                foreach ($categories_3 as $category_3) {
                    $level_3_data[] = array(
                        'name' => $category_3['name'],
                        'thumb' => $this->model_tool_image->resize(($category_3['image']=='' ? 'no_image.jpg' : $category_3['image']), 150, 100),
                        'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
                    );
                }


                $level_2_data[] = array(
                    'name'     => $category_2['name'],
                    'desc'     => $category_2['description'],
                    'children' => $level_3_data,
                    'thumb' => $this->model_tool_image->resize(($category_2['image']=='' ? 'no_image.jpg' : $category_2['image']), 300, 200),
                    'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])
                );
            }

            $this->data['categories'][] = array(
                'name'     => $category_1['name'],
                'children' => $level_2_data,
                'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'])
            );
        }







//        foreach ($categories as $category) {
//            if ($category['top']) {
//                // Level 2
//                $children_data = array();
//
//                $children = $this->model_catalog_category->getCategories($category['category_id']);
//
//                foreach ($children as $child) {
//                    //Будем вычислять кол-во товаров в категориях только если это кол-во надо показывать
//                    if ($this->config->get('config_product_count')) {
//                        $data = array(
//                            'filter_category_id'  => $child['category_id'],
//                            'filter_sub_category' => true
//                        );
//
//                        $product_total = $this->model_catalog_product->getTotalProducts($data);
//                    }
//
//                    $children_data[] = array(
//                        'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
//                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
//                    );
//                }
//
//                // Level 1
//                $this->data['categories'][] = array(
//                    'name'     => $category['name'],
//                    'children' => $children_data,
//                    'active'   => in_array($category['category_id'], $parts),
//                    'column'   => $category['column'] ? $category['column'] : 1,
//                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
//                );
//            }
//        }

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
}
?>
