<?php

class ControllerProductCategoryReproduction extends Controller {

    public function index() {
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category_reproduction.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/product/products-mini.tpl';
        } else {
            $this->template = 'default/template/product/category.tpl';
        }

        $this->children = array(
            'common/footer', // подключение блока footer
            'common/header' // подключение блока header
        );

        $this->response->setOutput($this->render());
    }

}

?>