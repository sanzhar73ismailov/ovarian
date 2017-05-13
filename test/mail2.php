<?php
// the message
$msg = "TESTMAIL - Проверка почты";
$subject = "Проверка 5 57";
$subject = '=?UTF-8?B?' . base64_encode($subject) . '?=';

$fromDisplayName = "Рассылка oncojournal";
$fromEmail = "sender@oncojournal.kz";
$replyEmail = "sanzhar73@mail.ru";

$headers  = "Content-type: text/html; charset=utf-8 \r\n";
$headers .= "From: " . $fromDisplayName . " <" . $fromEmail . ">\r\n";
$headers .= "Reply-To: ".$replyEmail."\r\n";
//$headers = "From: test@oncojournal.kz" . "\r\n";


//$rr = mail("test@oncojournal.kz","My subject",$msg, $headers);
$rr = mail("javajan@mail.ru,sanzhar73@mail.ru,sanzhar@yahoo.com,sender@oncojournal.kz,sanzhar73@gmail.com",$subject ,$msg, $headers);
print_r(error_get_last());
print_r($rr);
var_dump($rr);
?>