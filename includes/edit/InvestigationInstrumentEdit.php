<?php
class InvestigationInstrumentEdit extends EntityEdit {
	public function __construct($request, $do, $id, $dao, $smarty) {
		parent::__construct ( $request, $do, $id, $dao, $smarty );
	}
	public function setTitleForView() {
		$this->smarty->assign ( 'title', "Просмотр данных инструментальных исследований" );
	}
	public function setTitleForEdit() {
		$this->smarty->assign ( 'title', "Редактирование данных инструментальных исследований" );
	}
	public function save_insert($entityParsed) {
		$id = $this->dao->insert_instrument ( $entityParsed );
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	public function save_update($entityParsed) {
		$id = $this->dao->update_instrument ( $entityParsed );
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	public function parse_form_to_entity() {
		$request = $this->request;
		$entity = new InvestInstrument ();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'id' ) );
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'patient_id' ) );
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'visit_id' ) );
		$entity->instr_mrt_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_mrt_yes_no_id' ) );
		$entity->instr_mrt_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_mrt_date' ) ) );
		$entity->instr_mrt_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_mrt_norm_yes_no_id' ) );
		$entity->instr_mrt_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_mrt_descr' ) );
		$entity->instr_us_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_us_yes_no_id' ) );
		$entity->instr_us_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_us_date' ) ) );
		$entity->instr_us_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_us_norm_yes_no_id' ) );
		$entity->instr_us_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_us_descr' ) );
		$entity->instr_kt_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_kt_yes_no_id' ) );
		$entity->instr_kt_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_kt_date' ) ) );
		$entity->instr_kt_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_kt_norm_yes_no_id' ) );
		$entity->instr_kt_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_kt_descr' ) );
		$entity->instr_ekg_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_ekg_yes_no_id' ) );
		$entity->instr_ekg_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_ekg_date' ) ) );
		$entity->instr_ekg_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_ekg_norm_yes_no_id' ) );
		$entity->instr_ekg_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'instr_ekg_descr' ) );
		$entity->user = $this->user;
		return $entity;
	}
	public function fill_entity_form_by_dic() {
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign ( 'instr_mrt_yes_no_vals', $dao->getDicValues ( "instr_mrt_yes_no_id" ) );
		$smarty->assign ( 'instr_mrt_norm_yes_no_vals', $dao->getDicValues ( "instr_mrt_norm_yes_no_id" ) );
		$smarty->assign ( 'instr_us_yes_no_vals', $dao->getDicValues ( "instr_us_yes_no_id" ) );
		$smarty->assign ( 'instr_us_norm_yes_no_vals', $dao->getDicValues ( "instr_us_norm_yes_no_id" ) );
		$smarty->assign ( 'instr_kt_yes_no_vals', $dao->getDicValues ( "instr_kt_yes_no_id" ) );
		$smarty->assign ( 'instr_kt_norm_yes_no_vals', $dao->getDicValues ( "instr_kt_norm_yes_no_id" ) );
		$smarty->assign ( 'instr_ekg_yes_no_vals', $dao->getDicValues ( "instr_ekg_yes_no_id" ) );
		$smarty->assign ( 'instr_ekg_norm_yes_no_vals', $dao->getDicValues ( "instr_ekg_norm_yes_no_id" ) );
	}
	public function display_tpl() {
		$this->smarty->display ( 'templates/edit_instrument.tpl' );
	}
	public function getEntityObj() {
		// throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestInstrument ( $this->request ["patient_id"], $this->request ["visit_id"] );
		if ($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestInstrumentDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestInstrument ();
			}
		}
		
		return $entityObj;
	}
}