<?php
class InvestigationLabEdit extends EntityEdit{
	public function __construct($request, $do, $id, $dao, $smarty){
		parent::__construct($request, $do, $id, $dao, $smarty);
	}

	public function setTitleForView(){
		$this->smarty->assign('title',"Просмотр лабораторных данных");
	}

	public function setTitleForEdit(){
		$this->smarty->assign('title',"Редактирование лабораторных данных");
	}

	public function save_insert($entityParsed){
		$id = $this->dao->insert_lab($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function save_update($entityParsed){
		$id = $this->dao->update_lab($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function parse_form_to_entity(){
		$request = $this->request;
		$entity = new InvestLab();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'patient_id'));
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_id'));
		$entity->visit_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_date')));
		$entity->ca125_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'ca125_yes_no_id'));
		$entity->ca125 = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'ca125'));
		$entity->ca125_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'ca125_date')));
		$entity->oak_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_yes_no_id'));
		$entity->oak_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_date')));
		$entity->oak_hb = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_hb'));
		$entity->oak_er = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_er'));
		$entity->oak_leuc = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_leuc'));
		$entity->oak_tr = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_tr'));
		$entity->oak_netr = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'oak_netr'));
		$entity->bc_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_yes_no_id'));
		$entity->bc_protein_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_protein_yes_no_id'));
		$entity->bc_protein = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_protein'));
		$entity->bc_protein_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_protein_date')));
		$entity->bc_bilirubin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_yes_no_id'));
		$entity->bc_bilirubin_total_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_total_yes_no_id'));
		$entity->bc_bilirubin_total = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_total'));
		$entity->bc_bilirubin_total_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_total_date')));
		$entity->bc_bilirubin_direct_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_direct_yes_no_id'));
		$entity->bc_bilirubin_direct = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_direct'));
		$entity->bc_bilirubin_direct_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_direct_date')));
		$entity->bc_bilirubin_nondirect_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_nondirect_yes_no_id'));
		$entity->bc_bilirubin_nondirect = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_nondirect'));
		$entity->bc_bilirubin_nondirect_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_bilirubin_nondirect_date')));
		$entity->bc_ast_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_ast_yes_no_id'));
		$entity->bc_ast = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_ast'));
		$entity->bc_ast_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_ast_date')));
		$entity->bc_alt_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_alt_yes_no_id'));
		$entity->bc_alt = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_alt'));
		$entity->bc_alt_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_alt_date')));
		$entity->bc_creat_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_creat_yes_no_id'));
		$entity->bc_creat = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_creat'));
		$entity->bc_creat_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_creat_date')));
		$entity->bc_alk_phosphatase_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_alk_phosphatase_yes_no_id'));
		$entity->bc_alk_phosphatase = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_alk_phosphatase'));
		$entity->bc_alk_phosphatase_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_alk_phosphatase_date')));
		$entity->bc_mochevina_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_mochevina_yes_no_id'));
		$entity->bc_mochevina = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_mochevina'));
		$entity->bc_mochevina_date = UtilDate::formatRusDateTpSqlDateStr($this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'bc_mochevina_date')));
		$entity->user=$this->user;
		return $entity;
	}

	public function fill_entity_form_by_dic(){
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign('ca125_yes_no_vals', $dao->getDicValues("ca125_yes_no_id"));
		$smarty->assign('oak_yes_no_vals', $dao->getDicValues("oak_yes_no_id"));
		$smarty->assign('bc_yes_no_vals', $dao->getDicValues("bc_yes_no_id"));
		$smarty->assign('bc_protein_yes_no_vals', $dao->getDicValues("bc_protein_yes_no_id"));
		$smarty->assign('bc_bilirubin_yes_no_vals', $dao->getDicValues("bc_bilirubin_yes_no_id"));
		$smarty->assign('bc_bilirubin_total_yes_no_vals', $dao->getDicValues("bc_bilirubin_total_yes_no_id"));
		$smarty->assign('bc_bilirubin_direct_yes_no_vals', $dao->getDicValues("bc_bilirubin_direct_yes_no_id"));
		$smarty->assign('bc_bilirubin_nondirect_yes_no_vals', $dao->getDicValues("bc_bilirubin_nondirect_yes_no_id"));
		$smarty->assign('bc_ast_yes_no_vals', $dao->getDicValues("bc_ast_yes_no_id"));
		$smarty->assign('bc_alt_yes_no_vals', $dao->getDicValues("bc_alt_yes_no_id"));
		$smarty->assign('bc_creat_yes_no_vals', $dao->getDicValues("bc_creat_yes_no_id"));
		$smarty->assign('bc_alk_phosphatase_yes_no_vals', $dao->getDicValues("bc_alk_phosphatase_yes_no_id"));
		$smarty->assign('bc_mochevina_yes_no_vals', $dao->getDicValues("bc_mochevina_yes_no_id"));
	}

	public function display_tpl(){
		$this->smarty->display('templates/edit_lab.tpl');
	}

	public function getEntityObj(){
		//throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestLab($this->request["patient_id"], $this->request["visit_id"]);
		if($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestLabDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestLab ();
			}
		}
		//var_dump($entityObj);
		return $entityObj;
	}
}