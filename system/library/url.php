<?php
class Url {
	private $url;
	private $ssl;
	private $rewrite = array();
	
	public function __construct($url, $ssl = '') {
		$this->url = $url;
		$this->ssl = $ssl;
	}
		
	public function addRewrite($rewrite) {
		$this->rewrite[] = $rewrite;
	}
		
	public function link($route, $args = '', $connection = 'NONSSL') {
		if ($connection ==  'NONSSL') {
			$url = $this->url;	
		} else {
			$url = $this->ssl;	
		}
		
		$url .= 'index.php?route=' . $route;

        if ($args)
        {
            if(is_array($args))
            {
               foreach($args as $arg)
               {
                   $url .= str_replace('&', '&amp;', '&' . ltrim($arg, '&'));
               }
            }
            else $url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
        }

		foreach ($this->rewrite as $rewrite) {
			$url = $rewrite->rewrite($url);
		}
				
		return $url;
	}
}
?>
