<?php
class PatientEdit extends EntityEdit{

	public function __construct($request, $do, $id, $dao, $smarty){
		parent::__construct($request, $do, $id, $dao, $smarty);
	}
	
	public function setTitleForView(){
		$this->smarty->assign('title',"Просмотр пациента");
	}
	
	public function setTitleForEdit(){
		$this->smarty->assign('title',"Редактирование пациента");
	}
	
	public function save_insert($entityParsed){
		$this->id = $this->dao->insert_patient($entityParsed);
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	
	public function save_update($entityParsed){
		$this->id = $this->dao->update_patient($entityParsed);
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	
	public function parse_form_to_entity(){
		$request = $this->request;
		$entity = new Patient();
		//$patient->id= $this->getNullForObjectFieldIfStringEmpty(isset($request['id'])==true ? $request['id'] : null);
		$entity->id= $this->getNullForObjectFieldIfStringEmpty($request['id']);
		$entity->patient_number= $this->getNullForObjectFieldIfStringEmpty($request['patient_number']);
		$entity->hospital_id= $this->getNullForObjectFieldIfStringEmpty($request['hospital_id']);
		$entity->doctor= $this->getNullForObjectFieldIfStringEmpty($request['doctor']);
		$entity->user= $this->user;
		return $entity;
	}
	
	public function fill_entity_form_by_dic(){
		$this->smarty->assign('hospital_vals', $this->dao->getDicValues("hospital_id"));
	}
	
	public function display_tpl(){
		$this->smarty->display('templates/edit_patient.tpl');
	}
	
	public function getEntityObj(){
		$entityObj = $this->dao->getPatient($this->id);
		if($entityObj == null){
			$entityObj = new Patient ();
			$entityObj->hospital_id = $this->userObject->hospital_id;
			$entityObj->patient_number = str_pad($this->userObject->hospital_id, 3, "0", STR_PAD_LEFT) . "XX";
		}
		return $entityObj;
	}

}