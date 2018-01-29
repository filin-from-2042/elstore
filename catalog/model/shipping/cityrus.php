<?php
class ModelShippingCityRus extends Model
{
    function findCity($text, $limit=15)
    {
        $cities = array();
        $query = $this->db->query("SELECT city_name, post_code, region_name FROM `elektrik-1_db`.m_city WHERE city_name LIKE '".$this->db->escape($text)."%' ORDER BY poffice_count DESC LIMIT ".$limit);
        if ($query->num_rows)
        {
            foreach ($query->rows as $result) {
                $cities[$result['post_code']] = array(
                    'city_name'=>$result['city_name'],
                    'post_code'=>$result['post_code'],
                    'region_name'=>$result['region_name']
                );
            }
        }
        return $cities;
    }
}