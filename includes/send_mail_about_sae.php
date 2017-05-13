<?php
include_once 'includes/functions.php';
class SendSaeMail {
	public $emailsToArray = array ();
	public $sitename = ""; // Наименование мед центра
	public $user_name = ""; // имя пользователя
	public $user_email = ""; // email пользователя
	public $user_phone = "";
	public $patient_number = "";
	public $visit_name = ""; // Наименование визита
	public $event_name = ""; // Краткое описание СПЯ
	public $fromEmail = "";
	public $fromDisplayName = "";
	public $replyEmail = "";
	public function send_mail_about_serious_adv_event() {
		$resultSending = array ();
		// $emailsToArray = array("mail1@test.kz","mail2@test.kz","mail3@test.kz");
		
		// $sitename = "test_site_name";// Наименование мед центра
		// $user_name = "test_user_name"; // имя пользователя
		// $user_email = "test_user@mail.kz"; // email пользователя
		// $user_phone = "+7-701-78945611";
		// $patient_number = "101";
		// $visit_name = "Визит 1"; // Наименование визита
		// $event_name = "Озноб"; // Краткое описание СПЯ
		
		$message = "<h3>Уведомление о факте наличия серьезного побочного явления (СПЯ)</h3>\r\n";
		$message .= sprintf ( "<br/>Сайт: %s.\r\n", $this->sitename );
		$message .= sprintf ( "<br/>Номер пациента: %s.\r\n", $this->patient_number );
		$message .= sprintf ( "<br/>Краткое описание СПЯ: %s.\r\n", $this->event_name );
		$message .= sprintf ( "<br/>Визит: %s.\r\n", $this->visit_name );
		$message .= sprintf ( "<br/>ФИО исследователя: %s.\r\n", $this->user_name );
		$message .= sprintf ( "<br/>email исследователя: %s.\r\n", $this->user_email );
		$message .= sprintf ( "<br/>телефон исследователя: %s.\r\n", $this->user_phone );
		
		$message .= "<h4>Не отвечайте на это сообщение. Данное письмо сформировано в автоматическом режиме и не требует ответа.</h4>\r\n";
		
		$subject = sprintf ( "Уведомление о cерьезном побочном явлении у пациента N%s, визит '%s'", $this->patient_number, $this->visit_name );
		$to = implode ( ",", $this->emailsToArray );
		$result = send_mail ( $to, $subject, $message, $this->fromEmail, $this->fromDisplayName, $this->replyEmail );
		$resultSending [$to] = $result;
		return $resultSending;
	}

}
