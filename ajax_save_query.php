<?php
session_start ();
include_once 'includes/global.php';
include_once 'includes/functions.php';
include_once('includes/log4php/Logger.php');
Logger::configure('config.xml');
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 01 Jan 1996 00:00:00 GMT');
header('Content-type: application/json'); // The JSON standard MIME header.
$logger = Logger::getLogger("ajax_save_query.php");
$logger->debug("START " . __FILE__);

function getCreateQueryMessage($query_id){
	global $logger;
	$logger->debug("START");
	$message = "";
	$patient_number = $_POST['query_patient_number'];
	$invest_name = $_POST['query_investigation_name'];
	$visit_name = $_POST['query_visit_name'];
	$query_descr = $_POST['query_description'];
	$monitor_email = $_SESSION["user"]['username_email'];
	$message = sprintf ( "<h3>Уведомление об открытии Query (запроса) N %s на дополнение/исправление данных</h3>\r\n", $query_id);
	$message .= sprintf ( "<br/>Описание запроса: <b>%s</b>.\r\n", $query_descr );
	$message .= sprintf ( "<br/>Номер пациента: %s.\r\n", $patient_number );
	$message .= sprintf ( "<br/>Визит: %s.\r\n", $visit_name );
	$message .= "<br/>Просьба зайти на форму и дополнить/исправить данные. После этого в таблице Query поменять статус на 'Разрешено'.\r\n";
	$message .= sprintf ( "<br/>При наличии вопросов обращайтесь к монитору исследования по эл. почте (%s).\r\n", $monitor_email );
	$message .= "<h4>Не отвечайте на это сообщение. Данное письмо сформировано в автоматическом режиме и не требует ответа.</h4>\r\n";
	$message .= sprintf ( "<p/>С уважением, администрация '(%s)'.\r\n", SITE_NAME_SHORT );
	$logger->debug("FINISH return: " . $message);

	return $message;
}

function getResolveQueryMessage($query_obj){
	global $logger;
	$logger->debug("START");
	$message = "";
	$logger->debug("\$_REQUEST: " . var_export($_REQUEST, true));
	$patient_number = $_REQUEST['query_patient_number'];
	$invest_name = $_REQUEST['query_investigation_name'];
	$visit_name = $_REQUEST['query_visit_name'];
	$investigator_email = $_SESSION["user"]['username_email'];
	$message = sprintf ( "<h3>Уведомление об отработке Query (запроса) N %s</h3>\r\n", $query_obj->id);
	$message .= sprintf ( "<br/>Описание query: <b>%s</b>.\r\n", $query_obj->description );
	$message .= sprintf ( "<br/>Номер пациента: %s.\r\n", $patient_number );
	$message .= sprintf ( "<br/>Визит: %s.\r\n", $visit_name );
	$message .= "<br/>Просьба зайти на форму и проверить результат и если запрос правильно отработан в таблице Query, поменять статус запроса на 'Закрыто'.\r\n";
	$message .= sprintf ( "<br/>При наличии вопросов обращайтесь к исследователю по эл. почте (%s).\r\n", $investigator_email );
	$message .= "<h4>Не отвечайте на это сообщение. Данное письмо сформировано в автоматическом режиме и не требует ответа.</h4>\r\n";
	$message .= sprintf ( "<p/>С уважением, администрация '(%s)'.\r\n", SITE_NAME_SHORT );
	$logger->debug("FINISH return: " . $message);
	return $message;
}

function getCloseQueryMessage($query_obj){
	global $logger;
	$logger->debug("START");
	$message = "";
	$logger->debug("\$_REQUEST: " . var_export($_REQUEST, true));
	$patient_number = $_REQUEST['query_patient_number'];
	$invest_name = $_REQUEST['query_investigation_name'];
	$visit_name = $_REQUEST['query_visit_name'];
	$monitor_email = $_SESSION["user"]['username_email'];
	$message = sprintf ( "<h3>Уведомление об закрытии Query (запроса) N %s</h3>\r\n", $query_obj->id);
	$message .= sprintf ( "<br/>Описание query: <b>%s</b>.\r\n", $query_obj->description );
	$message .= sprintf ( "<br/>Номер пациента: %s.\r\n", $patient_number );
	$message .= sprintf ( "<br/>Визит: %s.\r\n", $visit_name );
	$message .= "<br/>Монитор исследования закрыл(а) запрос.\r\n";
	$message .= "<h4>Не отвечайте на это сообщение. Данное письмо сформировано в автоматическом режиме и не требует ответа.</h4>\r\n";
	$message .= sprintf ( "<p/>С уважением, администрация '(%s)'.\r\n", SITE_NAME_SHORT );
	$logger->debug("FINISH return: " . $message);
	return $message;
}

function getQueryFormList ($list, $id){
	$updated_query_obj = null;
	foreach ($list as $query_element) {
		if($query_element->id == $id){
			$updated_query_obj = $query_element;
			break;
		}
	}
	return $updated_query_obj;
}

try {
	$query_list = array();
	$subject = "";
	$email_to = "";
	$message = "";
	$query_num = "";

	if(isset($_REQUEST['action']) && $_REQUEST['action']=='changeStatus'){
		$result_update = $dao->update_status_query($_REQUEST['id'], $_REQUEST['status']);
		$query_list = $dao->getListQueriesByIdForInvestIdAndRecordId($_REQUEST['id']);
		$updated_query_obj = getQueryFormList($query_list, $_REQUEST['id']);
		$query_num = $updated_query_obj->id;
		//$query_list = $dao->update_query_status_and_get_list($_REQUEST['id'], $_REQUEST['status']);
		if($_REQUEST['status'] == 'resolve'){
			$to_email_array = $dao->getUserEmailsOfMonitorsAndAdmin();
			$email_to = implode(",", $to_email_array);
			$subject = sprintf ( "Уведомление об выполнении Query (запроса) N %s", $_REQUEST['id']);
			$message = getResolveQueryMessage($updated_query_obj);
		}elseif ($_REQUEST['status'] == 'close'){
			$email_to = $_REQUEST['query_user_email'];
			$subject = sprintf ( "Уведомление об закрытии Query (запроса) N %s", $_REQUEST['id']);
			$message = getCloseQueryMessage($updated_query_obj);
		}
		$logger->debug("result_update: " . var_export($result_update, true));
	} else {
		//сохраняем Query
		$query_num = $dao->save_query($_POST);
		$email_to = $_POST['query_user_email'];
		//получаем обновленный список
		$query_list = $dao->getListQueries($_POST['query_investigation_id'], $_POST['query_record_id']);
		$message = getCreateQueryMessage($query_num);
		$subject = sprintf ( "Уведомление об открытии Query (запроса) N %s", $query_num);

	}
	$logger->debug("email_to: " . var_export($email_to, true));
	$logger->debug("subject: " . $subject);
	//$logger->debug("message: " . $message);
	$logger->debug("query_list: " . var_export($query_list, true));

	$result = array();
	$result["query_list"] = $query_list;
	$result["send_mail_result"] = send_mail ( $email_to, $subject, $message, SENDER_EMAIL, SITE_NAME_SHORT, ADMIN_EMAIL );
	$result["query_num"] = $query_num;


	//$logger->debug("post: " . var_export($_POST, true));
	//$logger->debug("message: " . var_export($message, true));

	//echo "171";
	//echo json_encode($description . " n: " . $result);
	echo json_encode($result);
	$logger->debug("FINISH " . __FILE__);
} catch (Exception $e) {
	$logger->error($e);
}
