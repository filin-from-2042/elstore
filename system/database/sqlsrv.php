<?php
final class SQLSRV {
private $link;

public function __construct($hostname, $username, $password, $database)
{
    /*
    * Argument 2 passed to sqlsrv_connect() must be an array, string given
    */
    $connectionInfo = array (
    "UID" => $username,
    "PWD" => $password,
    "Database" => $database,
    "CharacterSet" => "UTF-8"
    );

    if (!$this->link = sqlsrv_connect($hostname, $connectionInfo)) {
    exit('Error: Could not make a database connection using ' . $username . '@' . $hostname);
    }

    /*
    if (!mssql_select_db($database, $this->link)) {
    exit('Error: Could not connect to database ' . $database);
    }
    */
    sqlsrv_query($this->link,"SET character_set_database = utf8");
    sqlsrv_query($this->link,"SET NAMES 'utf8'");
}

public function query($sql) {
    $sql = str_replace("LCASE","LOWER", $sql);
    $sql = str_replace("group","[group]", $sql);
    $sql = str_replace("username","[username]", $sql);
    $sql = str_replace("password ","[password]", $sql);
    $sql = str_replace("key","[key]", $sql);
   // $sql = str_replace("SHA1(","HASHBYTES('SHA1',", $sql);


$resource = sqlsrv_query( $this->link,$sql);

if ($resource) {
if (is_resource($resource)) {
$i = 0;

$data = array();

while ($result = sqlsrv_fetch_array($resource, SQLSRV_FETCH_ASSOC)) {
$data[$i] = $result;

$i++;
}

sqlsrv_free_stmt($resource);

$query = new stdClass();
$query->row = isset($data[0]) ? $data[0] : array();
$query->rows = $data;
$query->num_rows = $i;

unset($data);

return $query;
} else {
return true;
}
} else {
//trigger_error('Error: ' . mssql_get_last_message($this->link) . '<br />' . $sql);
trigger_error('Error: <br />' . $sql);
exit();
}
}

public function escape($value) {
/*$unpacked = unpack('H*hex', $value);

return '0x' . $unpacked['hex'];*/
    return $value;
}

public function countAffected() {
return sqlsrv_rows_affected($this->link);
}

public function getLastId() {
$last_id = false;

$resource = sqlsrv_query("SELECT @@identity AS id", $this->link);

if ($row = sqlsrv_fetch($resource)) {
$last_id = trim($row[0]);
}

sqlsrv_free_stmt($resource);

return $last_id;
}

public function __destruct() {
sqlsrv_close($this->link);
}
}