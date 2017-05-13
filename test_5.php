<?php
session_start();
include('includes/log4php/Logger.php');
Logger::configure('config.xml');
include_once 'includes/global.php';
$logger = Logger::getLogger("test_5.php");


function f1(){
	global $logger;
	$logger->info("in f1 function");
}

//$logger->info("This is an informational message.");
//$logger->warn("I'm not feeling so good...");
//try {
//	throw new Exception('OOOOOOOOO');
//} catch (Exception $e) {
//	$logger->error("error: " . $e );
//}
//f1();

//include_once './../includes/temp.php';
//include_once 'includes/class_dao.php';
//$object = $dao->getRowById("investigation", 1);
// $object = $dao->getDicValues("surgical_treat_ecstir_yes_no_id");
//$object = $dao->is_patient_exist("345435");

//$object = $dao->getListVisit();
//$object = $dao->getVisitTable(1);
//$headerNames = $dao->getHeaderNames();
//var_dump($headerNames);
//var_dump($object);

//$object = $dao->getInvestAdverseEvent(12, 1);

//$object = $dao->getUsersByRole("investigator");
//$object = $dao->getUserEmailsOfAdminAndSupervisors();
$object = $dao->getUserEmailsOfMonitorsAndAdmin();
//$object = $dao->getDicValue("hospital_id", "115");
//$object = $dao->update_patient_status_include(14, 25);
//$objects = $dao->getListQueries(1, 6);
//$objects = $dao->update_status_query(139, 'close');
//getListQueriesByIdForInvestIdAndRecordId
//$objects = $dao->getListQueriesByIdForInvestIdAndRecordId(29);
//$object = $dao->getAdverseEventDetailsByAeId(3);
//$object = $dao->getQueryById(109);
//$object = $dao->getList1Queries(0,0);
//$object = $dao->getInvestigation(1)['name'];
//$object = $dao->getCheckedStatusOfInvestigation(5, 'ovarian_general_data');
//update_checked_status
//$object = $dao->update_checked_status(1, 5);
//$object = $dao->getListAdverseEvent(null, null);
var_dump($object);


exit("<h1>------------------</h1>");

//var_dump($object);

//$visitDao = $dao->getVisitDao();
//var_dump($visitDao->getInvestigationTableName(1));

//$isDone = $visitDao->isInvestDone($patient_id=1, $invest_id='3', $visit_id=1);
//var_dump($isDone);