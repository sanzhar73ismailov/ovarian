<?php
class InvestigationConcomitantTherapyEdit extends EntityEdit{
	public function __construct($request, $do, $id, $dao, $smarty){
		parent::__construct($request, $do, $id, $dao, $smarty);
	}

	public function setTitleForView(){
		$this->smarty->assign('title',"Просмотр данных по сопутствующей терапии");
	}

	public function setTitleForEdit(){
		$this->smarty->assign('title',"Редактирование данных по сопутствующей терапии");
	}

	public function save_insert($entityParsed){
		$id = $this->dao->insert_concomitant_therapy($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function save_update($entityParsed){
		$id = $this->dao->update_concomitant_therapy($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function parse_form_to_entity(){
		$request = $this->request;
		$entity = new InvestConcomitantTherapy();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'patient_id'));
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_id'));
		$entity->chem_2st_concomitant_therapy_descr = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'chem_2st_concomitant_therapy_descr'));
		$entity->user=$this->user;
		return $entity;
	}

	public function fill_entity_form_by_dic(){
		$smarty = $this->smarty;
		$dao = $this->dao;
	}

	public function display_tpl(){
		$this->smarty->display('templates/edit_concomitant_therapy.tpl');
	}

	public function getEntityObj(){
		//throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestConcomitantTherapy($this->request["patient_id"], $this->request["visit_id"]);
		if($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestConcomitantTherapyObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestInclusion ();
			}
		}
		return $entityObj;
	}
}