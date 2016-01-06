<?php
class ControllerModuleTopmenu extends Controller {
	public function index() {
		$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/topmenu.css');
		$this->document->addScript('catalog/view/javascript/topmenu.js');
		
		$this->maxlength = $this->config->get('topmenu_maxlength');
		$this->hide_empty = $this->config->get('topmenu_hide_empty');
		$this->showtotal = $this->config->get('topmenu_total');
		$this->zindex = 1100;

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		
		$this->data['tmcategories'] = $this->getTopMenu();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/topmenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/topmenu.tpl';
		} else {
			$this->template = 'default/template/module/topmenu.tpl';
		}

		$this->render();
	}
		
	function getTopMenu ()	{
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$top_cats = $this->model_catalog_category->getCategories(0);
		
		$category = "<ul class=\"sf-menu\">\n";
		foreach ($top_cats as $top_cat)	{
			if ($top_cat['top']) {
				$name	= $top_cat['name'];
				$href	= $this->url->link('product/category', 'path=' . $top_cat['category_id']);
				$class	= in_array($top_cat['category_id'], $parts) ?  ' class="topactive"' : '';
				$category .= "\t<li>\n<a href=\"".$href."\"".$class.">".$name."</a>\n";
				$category .= $this->getCatTree($top_cat['category_id'], $top_cat['column'])."\n</li>\n";
			}
		}

		return $category."\n</ul>\n";


	} 	

	function getCatTree ($category_id = 0, $column = 1)	{
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$column = $column ? $column : 1;
		$categories = $this->model_catalog_category->getCategories((int)$category_id);
		$countcats = count ($categories);
		$threshold = ceil ($countcats / $column);
		$category_data = '';
		$product_total = 0;
		
		foreach ($categories as $key => $category) {
			$data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true	
			);
			
			if ($this->showtotal)	{		
				$product_total = $this->model_catalog_product->getTotalProducts($data);
				$name = $category['name'] . '&nbsp; (' . $product_total . ')';
			}	else	{
				$name = $category['name'];
			}
			if (!$threshold)	{
				$offset_column = $this->maxlength * floor ($key / $countcats * $column);
				$left = " style=\"margin-left: ". $offset_column ."px; z-index: ".--$this->zindex.";\"";
				$category_data .= "\n</ul>\n<ul". $left .">\n";
				$threshold = ceil ($countcats / $column);
			}
			
			$href = $this->url->link('product/category', 'path=' . $category['category_id']);
			$class = in_array($category['category_id'], $parts) ?  ' class="active"' : '';
			$parent = $this->getCatTree($category['category_id'], $category['column']);

			if ($parent) {
				$class = $class	? ' class="activeparent"' : ' class="parent"';
			}
			if ($product_total || !$this->hide_empty)	{
				$category_data .= "\n\t<li>\n<a href=\"".$href."\"".$class.">".$name."</a>".$parent."\n</li>\n";
			}
			$threshold--;
		}

		return strlen($category_data) ? "\n<ul style=\" z-index: ".++$this->zindex.";\">\n".$category_data."\n</ul>\n" : "";
	}
}
?>