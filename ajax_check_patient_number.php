<?php
// Prevent caching.
include_once 'includes/global.php';
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 01 Jan 1996 00:00:00 GMT');
header('Content-type: application/json'); // The JSON standard MIME header.

$number = $_GET['number'];
$result = $dao->is_patient_exist($number);

echo json_encode($result);
