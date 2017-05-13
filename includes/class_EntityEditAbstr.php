<?php
include_once 'edit/EntityEdit.php';
include_once 'edit/PatientEdit.php';
include_once 'edit/InvestigationGeneralDataEdit.php';
include_once 'edit/InvestigationInstrumentEdit.php';
include_once 'edit/InvestigationLabEdit.php';
include_once 'edit/InvestigationTherapyContinueEdit.php';
include_once 'edit/InvestigationTumorResponseEdit.php';
include_once 'edit/InvestigationAdverseEventEdit.php';
include_once 'edit/AdverseEventDetailEdit.php';
include_once 'edit/InvestigationInclusionEdit.php';

class EntityEditFabrica {
	public static function createEntityEdit($request, $do, $id, $dao, $smarty) {
		$entityEditObj = null;
		$entityName = $request ['entity'];
		// echo "<br/>-----------";
		// var_dump($request);
		//exit("entityName $entityName");
		if ($entityName == "patient") {
			$entityEditObj = new PatientEdit ( $request, $do, $id, $dao, $smarty );
		} elseif ($entityName == "adverse_event_detail") {
			$advEvent = $dao->getAdverseEvent($request["adverse_event_id"]);
			$patient = $dao->getPatient($advEvent['patient_id']);
			$visit = $dao->getRowById('visit', $advEvent['visit_id']);
			$smarty->assign('patient',$patient);
			$smarty->assign('visit',$visit);
			$smarty->assign('advEvent',$advEvent);
			
			$entityEditObj = new AdverseEventDetailEdit ( $request, $do, $id, $dao, $smarty );
			$entityEditObj->patient = $patient;
			$entityEditObj->visit = $visit;
			
		   
		} elseif ($entityName == "investigation") {
			$patient = $dao->getPatient($request["patient_id"]);
			$visit = $dao->getRowById('visit', $request["visit_id"]);
			$investigation = $dao->getRowById ( "investigation", $id = $request ["investigation_id"] );
			
			$smarty->assign('patient',$patient);
			$smarty->assign('visit',$visit);
			$smarty->assign('investigation',$investigation);
			
			
			switch ($investigation ['name']) {
				case 'ovarian_general_data' :
					$entityEditObj = new InvestigationGenDataEdit ( $request, $do, $id, $dao, $smarty );
					break;
				case 'ovarian_instrument' :
					$entityEditObj = new InvestigationInstrumentEdit ( $request, $do, $id, $dao, $smarty );
					break;
				case 'ovarian_lab' :
					$entityEditObj = new InvestigationLabEdit ( $request, $do, $id, $dao, $smarty );
					break;
				case 'ovarian_therapy_continue' :
					$entityEditObj = new InvestigationTherapyContinueEdit ( $request, $do, $id, $dao, $smarty );
					break;
				case 'ovarian_tumor_response' :
					$entityEditObj = new InvestigationTumorResponseEdit ( $request, $do, $id, $dao, $smarty );
					break;
				case 'ovarian_adverse_event' :
					$entityEditObj = new InvestigationAdverseEventEdit ( $request, $do, $id, $dao, $smarty );
					break;
				case 'ovarian_inclusion' :
					$entityEditObj = new InvestigationInclusionEdit ( $request, $do, $id, $dao, $smarty );
					break;	
				default :
					throw new Exception ( "No such invest_name: " . $investigation ['name'] );
			}
			
		} else {
			throw new Exception ( "UnsupportedOperationException" );
		}
		return $entityEditObj;
	}
}
