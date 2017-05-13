<?php
//include_once '../includes/global.php';
define('SITE_NAME', "Индивидуальная регистрационная карта <br> Исследование по использованию препарата трабектедин (Йонделис®)");
define('SITE_NAME_SHORT', "Электронная ИРК - RENAISSANCE");
define('DEBUG', "1");
define('ADMIN_CODE', "anemia2017");
define('ADMIN_EMAIL', "test@oncojournal.kz");
define('GENERATE_TEST_OBJECTS', "0"); // 1 - генерировать тестовые объекты для форм, 0 - не генерировать

function test_send_mail(){
	$to  = "javajan@mail.ru" ;
	//$to .= "mail2@example.com>";
	
	$subject = "Заголовок письма";
	
	$message = ' <p>Текст письма</p> </br> <b>1-ая строчка </b> </br><i>2-ая строчка </i> </br>';
	
	$headers  = "Content-type: text/html; charset=windows-1251 \r\n";
	$headers .= "From: От кого письмо <sanzhar73@mail.ru>\r\n";
	$headers .= "Reply-To: sanzhar73@mail.ru\r\n";
	
	return mail($to, $subject, $message, $headers);
}
function send_mail_about_serious_adv_event(){
	$result = false;
// 	$emailsToArray = array("mail1@test.kz","mail2@test.kz","mail3@test.kz");
	$emailsToArray = array("javajan@mail.ru");
	
	
	$sitename = "test_site_name";// Наименование мед центра
	$user_name = "test_user_name"; // имя пользователя
	$user_email = "test_user@mail.kz"; // email пользователя
	$user_phone = "+7-701-78945611";
	$patient_number = "101";
	$visit_name = "Визит 1"; // Наименование визита
	$event_name = "Озноб"; // Краткое описание СПЯ
	
	$message = "<h3>Уведомление о факте наличия серьезного побочного явления (СПЯ)</h3>\r\n";
	$message .= sprintf("<br/>Сайт: %s.\r\n", $sitename);
	$message .= sprintf("<br/>Номер пациента: %s.\r\n", $patient_number);
	$message .= sprintf("<br/>Краткое описание СПЯ: %s.\r\n", $event_name);
	$message .= sprintf("<br/>Визит: %s.\r\n", $visit_name);
	$message .= sprintf("<br/>ФИО исследователя: %s.\r\n", $user_name);
	$message .= sprintf("<br/>email исследователя: %s.\r\n", $user_email);
	$message .= sprintf("<br/>телефон исследователя: %s.\r\n", $user_phone);
	
	$message .= "<h4>Не отвечайте на это сообщение. Данное письмо сформировано в автоматическом режиме и не требует ответа.</h4>\r\n";
	
	$subject = sprintf("Уведомление о cерьезном побочном явлении у пациента N%s, визит '%s'", $patient_number, $visit_name);
	$fromEmail = ADMIN_EMAIL;
	$fromDisplayName = SITE_NAME_SHORT;
	$replyEmail = ADMIN_EMAIL;
	
	foreach ($emailsToArray as $to) {
		$result = send_mail($to, $subject, $message, $fromEmail,$fromDisplayName, $replyEmail);
		var_dump("result= $result");
	}
	return $result;
}
function send_mail($to, $subject, $message, $fromEmail,$fromDisplayName, $replyEmail){
	$headers  = "Content-type: text/html; charset=utf-8 \r\n";
	$headers .= "From: " . $fromDisplayName . " <" . $fromEmail . ">\r\n";
	$headers .= "Reply-To: ".$replyEmail."\r\n";
	$subject = '=?UTF-8?B?' . base64_encode($subject) . '?=';
	$result = mail($to, $subject, $message, $headers);
	return $result;
}

/*
$to = "sanzhar73@mail.ru";
$subject = "Тема";
$message = ' <p>Текст письма</p> </br> <b>1-ая строчка </b> </br><i>2-ая строчка </i> </br>';
$fromEmail = "test@oncojournal.kz";
$fromDisplayName = "Петров Иван";
$replyEmail = $fromEmail;

*/
$msg = "TESTMAIL";
$headers = "From: test@oncojournal.kz" . "\r\n";
//$rr = mail("test@oncojournal.kz","My subject 123",$msg, $headers);
$rr = mail("javajan@mail.ru","My subject",$msg, $headers);
print_r(error_get_last());
print_r($rr);
var_dump($rr);