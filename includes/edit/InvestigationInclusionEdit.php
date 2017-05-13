<?php
class InvestigationInclusionEdit extends EntityEdit{
	public function __construct($request, $do, $id, $dao, $smarty){
		parent::__construct($request, $do, $id, $dao, $smarty);
	}

	public function setTitleForView(){
		$this->smarty->assign('title',"Просмотр данных по критериям включения/исключения");
	}

	public function setTitleForEdit(){
		$this->smarty->assign('title',"Редактирование данных по критериям включения/исключения");
	}

	public function save_insert($entityParsed){
		$id = $this->dao->insert_inclusion($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function save_update($entityParsed){
		$id = $this->dao->update_inclusion($entityParsed);
		$entityObj = $this->getEntityObj();
		return $entityObj;
	}

	public function parse_form_to_entity(){
		$request = $this->request;
		$entity = new InvestInclusion();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'id'));
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'patient_id'));
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'visit_id'));
		$entity->age_18_and_more_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'age_18_and_more_yes_no_id'));
		$entity->histol_confirmed_cr_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'histol_confirmed_cr_yes_no_id'));
		$entity->ecog01_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'ecog01_yes_no_id'));
		$entity->recurrent_plat_sensit_cancer_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'recurrent_plat_sensit_cancer_yes_no_id'));
		$entity->treatment_trabect_after_doxorub_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'treatment_trabect_after_doxorub_yes_no_id'));
		$entity->received_no_more_one_line_plat_chem_regimes_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'received_no_more_one_line_plat_chem_regimes_yes_no_id'));
		$entity->doct_decision_trabectedin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'doct_decision_trabectedin_yes_no_id'));
		$entity->signed_consent_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'signed_consent_yes_no_id'));
		$entity->age_18_less_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'age_18_less_yes_no_id'));
		$entity->received_more_two_line_plat_chem_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'received_more_two_line_plat_chem_yes_no_id'));
		$entity->platinum_refractory_ov_cr_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'platinum_refractory_ov_cr_yes_no_id'));
		$entity->platinum_resistant_ov_cr_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'platinum_resistant_ov_cr_yes_no_id'));
		$entity->refusal_central_venous_catheter_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'refusal_central_venous_catheter_yes_no_id'));
		$entity->impaired_hepatic_function_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'impaired_hepatic_function_yes_no_id'));
		$entity->impaired_renal_function_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'impaired_renal_function_yes_no_id'));
		$entity->impaired_hematological_parameters_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'impaired_hematological_parameters_yes_no_id'));
		$entity->impaired_cardiovascular_function_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'impaired_cardiovascular_function_yes_no_id'));
		$entity->kaposi_sarcoma_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'kaposi_sarcoma_yes_no_id'));
		$entity->pregnancy_yes_no_id = $this->getNullForObjectFieldIfStringEmpty($this->getValFromRequest($request, 'pregnancy_yes_no_id'));
		$entity->user=$this->user;
		return $entity;
	}

	public function fill_entity_form_by_dic(){
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign('age_18_and_more_yes_no_vals', $dao->getDicValues("age_18_and_more_yes_no_id"));
		$smarty->assign('histol_confirmed_cr_yes_no_vals', $dao->getDicValues("histol_confirmed_cr_yes_no_id"));
		$smarty->assign('ecog01_yes_no_vals', $dao->getDicValues("ecog01_yes_no_id"));
		$smarty->assign('recurrent_plat_sensit_cancer_yes_no_vals', $dao->getDicValues("recurrent_plat_sensit_cancer_yes_no_id"));
		$smarty->assign('treatment_trabect_after_doxorub_yes_no_vals', $dao->getDicValues("treatment_trabect_after_doxorub_yes_no_id"));
		$smarty->assign('received_no_more_one_line_plat_chem_regimes_yes_no_vals', $dao->getDicValues("received_no_more_one_line_plat_chem_regimes_yes_no_id"));
		$smarty->assign('doct_decision_trabectedin_yes_no_vals', $dao->getDicValues("doct_decision_trabectedin_yes_no_id"));
		$smarty->assign('signed_consent_yes_no_vals', $dao->getDicValues("signed_consent_yes_no_id"));
		$smarty->assign('age_18_less_yes_no_vals', $dao->getDicValues("age_18_less_yes_no_id"));
		$smarty->assign('received_more_two_line_plat_chem_yes_no_vals', $dao->getDicValues("received_more_two_line_plat_chem_yes_no_id"));
		$smarty->assign('platinum_refractory_ov_cr_yes_no_vals', $dao->getDicValues("platinum_refractory_ov_cr_yes_no_id"));
		$smarty->assign('platinum_resistant_ov_cr_yes_no_vals', $dao->getDicValues("platinum_resistant_ov_cr_yes_no_id"));
		$smarty->assign('refusal_central_venous_catheter_yes_no_vals', $dao->getDicValues("refusal_central_venous_catheter_yes_no_id"));
		$smarty->assign('impaired_hepatic_function_yes_no_vals', $dao->getDicValues("impaired_hepatic_function_yes_no_id"));
		$smarty->assign('impaired_renal_function_yes_no_vals', $dao->getDicValues("impaired_renal_function_yes_no_id"));
		$smarty->assign('impaired_hematological_parameters_yes_no_vals', $dao->getDicValues("impaired_hematological_parameters_yes_no_id"));
		$smarty->assign('impaired_cardiovascular_function_yes_no_vals', $dao->getDicValues("impaired_cardiovascular_function_yes_no_id"));
		$smarty->assign('kaposi_sarcoma_yes_no_vals', $dao->getDicValues("kaposi_sarcoma_yes_no_id"));
		$smarty->assign('pregnancy_yes_no_id', $dao->getDicValues("pregnancy_yes_no_id"));
	}

	public function display_tpl(){
		$this->smarty->display('templates/edit_inclusion.tpl');
	}

	public function getEntityObj(){
		//throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestInclusion($this->request["patient_id"], $this->request["visit_id"]);
		if($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestInclusionDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestInclusion ();
			}
		}
		return $entityObj;
	}
}