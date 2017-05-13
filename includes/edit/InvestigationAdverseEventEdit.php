<?php
class InvestigationAdverseEventEdit extends EntityEdit {
	public function __construct($request, $do, $id, $dao, $smarty) {
		parent::__construct ( $request, $do, $id, $dao, $smarty );
	}
	public function setTitleForView() {
		$this->smarty->assign ( 'title', "Просмотр данных по нежелательным явлениям" );
	}
	public function setTitleForEdit() {
		$this->smarty->assign ( 'title', "Редактирование данных по нежелательным явлениям" );
	}
	public function save_insert($entityParsed) {
		$id = $this->dao->insert_adverse_event ( $entityParsed );
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	public function save_update($entityParsed) {
		$id = $this->dao->update_adverse_event ( $entityParsed );
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	public function parse_form_to_entity() {
		$request = $this->request;
		$entity = new InvestAdverseEvent();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'patient_id'));
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_id'));
		$entity->adverse_event_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'adverse_event_yes_no_id'));
		$entity->user = $this->user;
		return $entity;
	}
	public function fill_entity_form_by_dic() {
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign ( 'adverse_event_yes_no_vals', $dao->getDicValues ( "adverse_event_yes_no_id" ) );
	}
	public function display_tpl() {
		$this->smarty->display ( 'templates/edit_adverse_event.tpl' );
	}
	public function getEntityObj() {
		// throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestAdverseEvent ( $this->request ["patient_id"], $this->request ["visit_id"] );
		if ($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestAdverseEventDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestAdverseEvent();
			}
		}

		return $entityObj;
	}
}