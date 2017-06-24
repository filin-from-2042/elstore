<?php
class ControllerCheckoutCreateOrder extends Controller {
    private $error = array();

    public function index()
    {

        $total_data = array();
        $total = 0;
        $taxes = $this->cart->getTaxes();

        $this->load->model('setting/extension');

        $sort_order = array();

        $results = $this->model_setting_extension->getExtensions('total');

        foreach ($results as $key => $value) {
            $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
        }

        array_multisort($sort_order, SORT_ASC, $results);

        foreach ($results as $result) {
            if ($this->config->get($result['code'] . '_status')) {
                $this->load->model('total/' . $result['code']);

                $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
            }
        }

        $sort_order = array();

        foreach ($total_data as $key => $value) {
            $sort_order[$key] = $value['sort_order'];
        }

        array_multisort($sort_order, SORT_ASC, $total_data);

        $this->language->load('checkout/checkout');

        $data = array();

        $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $data['store_id'] = $this->config->get('config_store_id');
        $data['store_name'] = $this->config->get('config_name');

        if ($data['store_id']) {
            $data['store_url'] = $this->config->get('config_url');
        } else {
            $data['store_url'] = HTTP_SERVER;
        }

        if ($this->customer->isLogged()) {
            $data['customer_id'] = $this->customer->getId();
            $data['customer_group_id'] = $this->customer->getCustomerGroupId();
            $data['firstname'] = $this->customer->getFirstName();
            $data['lastname'] = $this->customer->getLastName();
            $data['email'] = $this->customer->getEmail();
            $data['telephone'] = $this->customer->getTelephone();
            $data['fax'] = $this->customer->getFax();
            $this->load->model('account/address');

        }elseif (isset($this->session->data['guest'])) {
            $data['customer_id'] = 0;
            $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
            $data['firstname'] = $this->session->data['guest']['firstname'];
            $data['lastname'] = $this->session->data['guest']['lastname'];
            $data['email'] = $this->session->data['guest']['email'];
            $data['telephone'] = $this->session->data['guest']['telephone'];
//				$data['fax'] = $this->session->data['guest']['fax'];

        }

        $data['comment'] = '';



        $data['affiliate_id'] = 0;
        $data['commission'] = 0;

        $data['language_id'] = $this->config->get('config_language_id');
        $data['currency_id'] = $this->currency->getId();
        $data['currency_code'] = $this->currency->getCode();
        $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
        $data['ip'] = $this->request->server['REMOTE_ADDR'];

        if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
            $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
        } else {
            $data['forwarded_ip'] = '';
        }

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
        } else {
            $data['user_agent'] = '';
        }

        if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
            $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
        } else {
            $data['accept_language'] = '';
        }


        $product_data = array();

        foreach ($this->cart->getProducts() as $product) {
            $option_data = array();

            foreach ($product['option'] as $option) {
                if ($option['type'] != 'file') {
                    $value = $option['option_value'];
                } else {
                    $value = $this->encryption->decrypt($option['option_value']);
                }

                $option_data[] = array(
                    'product_option_id'       => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'option_id'               => $option['option_id'],
                    'option_value_id'         => $option['option_value_id'],
                    'name'                    => $option['name'],
                    'value'                   => $value,
                    'type'                    => $option['type']
                );
            }

            $product_data[] = array(
                'product_id' => $product['product_id'],
                'name'       => $product['name'],
                'model'      => $product['model'],
                'option'     => $option_data,
                'download'   => $product['download'],
                'quantity'   => $product['quantity'],
                'subtract'   => $product['subtract'],
                'price'      => $product['price'],
                'total'      => $product['total'],
                'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
                'reward'     => $product['reward']
            );
        }

        $data['products'] = $product_data;

        $data['vouchers'] = array();


        $data['totals'] = $total_data;

        $data['total'] = $total;


        $data['payment_firstname'] = '';
        $data['payment_lastname'] = '';

        $this->load->model('account/address');

        $data['payment_method'] = '';

        $data['payment_code'] = '';

        $data['shipping_firstname'] = '';
        $data['shipping_lastname'] = '';
        $data['shipping_company'] = '';
        $data['shipping_address_1'] = '';
        $data['shipping_address_2'] = '';
        $data['shipping_city'] = '';
        $data['shipping_postcode'] = '';
        $data['shipping_zone'] = '';
        $data['shipping_zone_id'] = '';
        $data['shipping_country'] = '';
        $data['shipping_country_id'] = '';
        $data['shipping_address_format'] = '';
        $data['shipping_method'] = '';
        $data['shipping_code'] = '';

        $this->load->model('checkout/order');
        $this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);

        $this->model_checkout_order->confirm($this->session->data['order_id'],'1','',true);

        $this->response->setOutput($this->session->data['order_id']);

        //return $this->session->data['order_id'] ;
    }
}