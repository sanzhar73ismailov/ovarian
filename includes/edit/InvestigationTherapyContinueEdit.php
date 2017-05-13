<?php
class InvestigationTherapyContinueEdit extends EntityEdit {
	public function __construct($request, $do, $id, $dao, $smarty) {
		parent::__construct ( $request, $do, $id, $dao, $smarty );
	}
	public function setTitleForView() {
		$this->smarty->assign ( 'title', "Просмотр данных по продолжению терапии" );
	}
	public function setTitleForEdit() {
		$this->smarty->assign ( 'title', "Редактирование данных по продолжению терапии" );
	}
	public function save_insert($entityParsed) {
		$id = $this->dao->insert_therapy_continue ( $entityParsed );
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}
	public function save_update($entityParsed) {
		$id = $this->dao->update_therapy_continue ( $entityParsed );
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}
	public function parse_form_to_entity() {
		$request = $this->request;
		$entity = new InvestTherapyContinue();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'patient_id'));
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_id'));
		$entity->therap_trab_continue_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'therap_trab_continue_yes_no_id'));
		$entity->therap_trab_continue_no_cause_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'therap_trab_continue_no_cause_id'));
		$entity->user = $this->user;
		return $entity;
	}
	public function fill_entity_form_by_dic() {
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign('therap_trab_continue_yes_no_vals', $dao->getDicValues("therap_trab_continue_yes_no_id"));
		$expression = $dao->getDicValues("therap_trab_continue_no_cause_id");
		$smarty->assign('therap_trab_continue_no_cause_vals', $expression);
	}
	public function display_tpl() {
		$this->smarty->display ( 'templates/edit_therapy_continue.tpl' );
	}
	public function getEntityObj() {
		// throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestTherapyContinue ( $this->request ["patient_id"], $this->request ["visit_id"] );
		//var_dump($entityObj);
		if($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestTherapyContinueDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestTherapyContinue ();
			}
		}
		return $entityObj;
	}
}