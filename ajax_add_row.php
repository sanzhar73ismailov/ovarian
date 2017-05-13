<?php
// Prevent caching.
include_once 'includes/global.php';
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 01 Jan 1996 00:00:00 GMT');

// The JSON standard MIME header.
header('Content-type: application/json');

// This ID parameter is sent by our javascript client.

//$value = $_GET['value'];

// Here's some data that we want to send via JSON.
// We'll include the $id parameter so that we
// can show that it has been passed in correctly.
// You can send whatever data you like.
$data = array(111,222);
//$dic = $dao->addDicValue("nationality", $_GET['pole']);
$dic = $dao->addDicValue("nationality", $_GET['pole']);
// Send the data.
//echo json_encode($dic);

///$dic = $dao->addDicValue("nationality",  $_GET['pole']);
//var_dump($value);

//echo json_encode($dic);
echo json_encode($dic);

?>