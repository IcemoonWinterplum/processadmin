<?php
 
try {
    $test=new PDO('sqlsrv:Server=47.52.39.211;Database=ErpDB20200315',"sa",r5V$d@ec7UDp!@#");
} catch(PDOException $e) {
    die('Could not connect to the database:' . $e);
} 

echo phpinfo();
?>