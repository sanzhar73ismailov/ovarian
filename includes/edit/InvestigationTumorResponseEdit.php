<?php
class InvestigationTumorResponseEdit extends EntityEdit{
	public function __construct($request, $do, $id, $dao, $smarty){
		parent::__construct($request, $do, $id, $dao, $smarty);
	}

	public function setTitleForView(){
		$this->smarty->assign('title',"Просмотр данных по оценке эффективности лечения (RECIST)");
	}

	public function setTitleForEdit(){
		$this->smarty->assign('title',"Редактирование данных по оценке эффективности лечения (RECIST)");
	}

	public function save_insert($entityParsed){
		$id = $this->dao->insert_tumor_response($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function save_update($entityParsed){
		$id = $this->dao->update_tumor_response($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function parse_form_to_entity(){
		$request = $this->request;
		$entity = new InvestTumorResponse();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'patient_id'));
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_id'));
		$entity->full_response_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'full_response_yes_no_id'));
		$entity->partial_response_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'partial_response_yes_no_id'));
		$entity->progress_desease_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'progress_desease_yes_no_id'));
		$entity->stabilization_desease_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'stabilization_desease_yes_no_id'));
		$entity->user=$this->user;
		return $entity;
	}

	public function fill_entity_form_by_dic(){
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign('full_response_yes_no_vals', $dao->getDicValues("full_response_yes_no_id"));
		$smarty->assign('partial_response_yes_no_vals', $dao->getDicValues("partial_response_yes_no_id"));
		$smarty->assign('progress_desease_yes_no_vals', $dao->getDicValues("progress_desease_yes_no_id"));
		$smarty->assign('stabilization_desease_yes_no_vals', $dao->getDicValues("stabilization_desease_yes_no_id"));
	}

	public function display_tpl(){
		$this->smarty->display('templates/edit_tumor_response.tpl');
	}

	public function getEntityObj(){
		//throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestTumorResponse($this->request["patient_id"], $this->request["visit_id"]);
		if($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestTumorResponseDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestTumorResponse ();
			}
		}
		return $entityObj;
	}
}