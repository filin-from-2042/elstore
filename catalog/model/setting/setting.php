<?php 
class ModelSettingSetting extends Model {
	public function getSetting($group, $store_id = 0,$key='') {
		$data = array(); 

        $req = "SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'".
            ($key==false?'':" AND `key`='" . $key ."'") ;
		$query = $this->db->query($req);
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
}
?>