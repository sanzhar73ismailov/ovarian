<?php
include_once 'includes/send_mail_about_sae.php';
class AdverseEventDetailEdit extends EntityEdit{
	public $patient;
	public $visit;

	public function __construct($request, $do, $id, $dao, $smarty){
		parent::__construct($request, $do, $id, $dao, $smarty);
	}

	public function setTitleForView(){
		$this->smarty->assign('title',"Просмотр побочного явления");
	}

	public function setTitleForEdit(){
		$this->smarty->assign('title',"Редактирование побочного явления");
	}

	public function save_insert($entityParsed){
		$this->id = $this->dao->insert_adverse_event_detail($entityParsed);
		$entityObj = $this->getEntityObj ();
		$this->sendSaeMail($entityObj);
		return $entityObj;
	}

	public function save_update($entityParsed){
		$entityObjBeforeUpdate = $this->getEntityObj ();
		//var_dump($entityObjBeforeUpdate);
		//echo "<h1>------------</h1>";
		$this->id = $this->dao->update_adverse_event_detail($entityParsed);
		$entityObj = $this->getEntityObj ();
		
		//var_dump($entityObj);
		//echo "<h1>------------</h1>";
		if(isset($entityObjBeforeUpdate->serious_yes_no_id)){
			if($entityObjBeforeUpdate->serious_yes_no_id != $entityObj->serious_yes_no_id){
				//echo "<h1>in 1</h1> ";
				$this->sendSaeMail($entityObj);
			}
		}
		
		return $entityObj;
	}

	public function parse_form_to_entity(){
		$request = $this->request;
		$entity = new InvestAdverseEventDetail();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->name = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'name'));
		$entity->adverse_event_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'adverse_event_id'));
		$entity->serious_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'serious_yes_no_id'));
		$entity->start_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'start_date')));
		$entity->resolved_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'resolved_yes_no_id'));
		$entity->resolved_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'resolved_date')));
		$entity->event_intensity_decreased_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'event_intensity_decreased_yes_no_id'));
		$entity->event_occurred_again_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'event_occurred_again_yes_no_id'));
		$entity->event_associated_with_drug_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'event_associated_with_drug_yes_no_id'));
		return $entity;
	}

	public function fill_entity_form_by_dic(){
		//$this->smarty->assign('hospital_vals', $this->dao->getDicValues("hospital_id"));
	}

	public function display_tpl(){
		$this->smarty->display('templates/edit_adverse_event_detail.tpl');
	}

	public function getEntityObj(){
		$entityObj = $this->dao->getAdverseEventDetail($this->id);
		if ($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestAdverseEventDetailDataObject ($this->request ["adverse_event_id"]);
			} else {
				$entityObj = new InvestAdverseEventDetail ();
			}
		}
		return $entityObj;
	}

	function sendSaeMail($entityObj){
		if(isset($entityObj->serious_yes_no_id) && $entityObj->serious_yes_no_id){
			//echo "<h1>in 2</h1> ";
			$sendSAEParamObj = new SendSaeMail();
			$sendSAEParamObj->emailsToArray = $this->dao->getUserEmailsOfAdminAndSupervisors();
			$hospitalDic = $this->dao->getDicValue("hospital_id", $this->patient->hospital_id);
			$sendSAEParamObj->sitename = $hospitalDic->value;// Наименование мед центра
			$sendSAEParamObj->user_name = $this->userObject->last_name . " " . $this->userObject->first_name; // имя пользователя
			$sendSAEParamObj->user_email = $this->user; // email пользователя
			$sendSAEParamObj->user_phone = $this->userObject->phone;
			$sendSAEParamObj->patient_number = $this->patient->patient_number;
			$sendSAEParamObj->visit_name = $this->visit['name']; // Наименование визита
			$sendSAEParamObj->event_name = $entityObj->name; // Краткое описание СПЯ
			$sendSAEParamObj->fromEmail = SENDER_EMAIL;
			$sendSAEParamObj->fromDisplayName = SITE_NAME_SHORT;
			$sendSAEParamObj->replyEmail = ADMIN_EMAIL;
			$resultSending = $sendSAEParamObj->send_mail_about_serious_adv_event();
			$emails = "<ol>";
			foreach ($resultSending as $email => $resultBool){
				if($resultBool){
					$emails .= "<li>" .$email . "</li>";
				}else{
					$emails .= "<li>" .$email . " - не отправлено!</li>";
				}
			}
			$emails .= "</ol>";
			
			$this->smarty->assign('sendMailMessage', "Вы указали, что нежелательное явление является серьезным.<br/>Поэтому соотвествующее уведомление отправлено на следующие адреса: " . $emails);
			//var_dump($resultSending);
		}
	}

	
}