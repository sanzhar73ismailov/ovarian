<?php
include_once 'class_entity.php';
class InvestGeneralData extends Entity{

	public $id;
	public $patient_id;
	public $visit_id;
	public $visit_date;
	public $date_birth;
	public $weight_kg;
	public $height_sm;
	public $nationality_id;
	public $nationality_if_other;
	public $place_living_id;
	public $education_id;
	public $social_economic_status_id;
	public $diag_cancer_estab_date;
	public $diag_cancer_tnm_stage_t_id;
	public $diag_cancer_tnm_stage_n_id;
	public $diag_cancer_tnm_stage_m_id;
	public $diag_cancer_clin_stage_id;
	public $surgical_treat_yes_no_id;
	public $surgical_treat_ecstir_yes_no_id;
	public $surgical_treat_ecstir_date;
	public $surgical_treatment_gister01_yes_no_id;
	public $surgical_treatment_gister01_date;
	public $surgical_treatment_gister02_yes_no_id;
	public $surgical_treatment_gister02_date;
	public $surgical_treatment_gister03_yes_no_id;
	public $surgical_treatment_gister03_date;
	public $surgical_treatment_diag_laparotomia_yes_no_id;
	public $surgical_treatment_diag_laparotomia_date;
	public $surgical_treatment_diag_laparoscopia_yes_no_id;
	public $surgical_treatment_diag_laparoscopia_date;
	public $surgical_treatment_explorat_laparotomia_yes_no_id;
	public $surgical_treatment_explorat_laparotomia_date;
	public $chem_treat_yes_no_id;
	public $chem_treat_antracyc_yes_no_id;
	public $chem_treat_platina_yes_no_id;
	public $chem_treat_taxans_yes_no_id;
	public $chem_treat_cyclophosph_yes_no_id;
	public $chem_treat_other_yes_no_id;
	public $chem_treat_other_descr;
	public $progress_date;
	public $progress_ca125_yes_no_id;
	public $progress_ca125;
	public $progress_instr_mrt_yes_no_id;
	public $progress_instr_mrt_date;
	public $progress_instr_mrt_norm_yes_no_id;
	public $progress_instr_mrt_descr;
	public $progress_instr_us_yes_no_id;
	public $progress_instr_us_date;
	public $progress_instr_us_norm_yes_no_id;
	public $progress_instr_us_descr;
	public $progress_instr_kt_yes_no_id;
	public $progress_instr_kt_date;
	public $progress_instr_kt_norm_yes_no_id;
	public $progress_instr_kt_descr;
	public $progress_instr_ekg_yes_no_id;
	public $progress_instr_ekg_date;
	public $progress_instr_ekg_norm_yes_no_id;
	public $progress_instr_ekg_descr;
	public $recidive_yes_no_id;
	public $metastases_yes_no_id;
	public $metastases_lung_yes_no_id;
	public $metastases_lung_date;
	public $metastases_hepat_yes_no_id;
	public $metastases_hepat_date;
	public $metastases_osteo_yes_no_id;
	public $metastases_osteo_date;
	public $metastases_renal_yes_no_id;
	public $metastases_renal_date;
	public $metastases_lymph_nodes_yes_no_id;
	public $metastases_lymph_nodes_date;
	public $metastases_plevra_yes_no_id;
	public $metastases_plevra_date;
	public $metastases_other_descr;
	public $metastases_surgical_treat_yes_no_id;
	public $metastases_surgical_treat_date;
	public $metastases_surgical_treat_descr;
	public $chem_1st_line_treat_yes_no_id;
	public $chem_1st_karboplatin_yes_no_id;
	public $chem_1st_cisplatin_yes_no_id;
	public $chem_1st_ciklofosfan_yes_no_id;
	public $chem_1st_paklitaksel_yes_no_id;
	public $chem_1st_doksorubicin_yes_no_id;
	public $chem_1st_bevacizumab_yes_no_id;
	public $chem_1st_topotekan_yes_no_id;
	public $chem_1st_gemcitabin_yes_no_id;
	public $chem_1st_vinorelbin_yes_no_id;
	public $chem_1st_irinotekan_yes_no_id;
	public $chem_1st_etopozid_yes_no_id;
	public $chem_1st_epirubicin_yes_no_id;
	public $chem_1st_docetaxel_yes_no_id;
	public $chem_1st_oksaliplatin_yes_no_id;
	public $chem_1st_trabektidin_yes_no_id;
	public $chem_1st_other_yes_no_id;
	public $chem_1st_other_descr;
	public $chem_1st_date_start;
	public $chem_1st_date_finish;
	public $chem_1st_course_number;
	public $chem_1st_concomitant_therapy_descr;
	public $chem_2st_trabectedin_yes_no_id;
	public $chem_2st_trabectedin_dose;
	public $chem_2st_pld_yes_no_id;
	public $chem_2st_pld_dose;
	public $chem_2st_doxopeg_yes_no_id;
	public $chem_2st_doxopeg_dose;
	public $chem_2st_kelix_yes_no_id;
	public $chem_2st_kelix_dose;
	public $chem_2st_doksorubicin_yes_no_id;
	public $chem_2st_doksorubicin_dose;
	public $chem_2st_other_yes_no_id;
	public $chem_2st_other_dose;
	public $chem_2st_concomitant_therapy_descr;
	public $undesirable_event_yes_no_id;
	public $checked;
	public $user;
	public $insert_date;

}

class InvestInstrument extends Entity{
	public $id;
	public $patient_id;
	public $visit_id;
	public $instr_mrt_yes_no_id;
	public $instr_mrt_date;
	public $instr_mrt_norm_yes_no_id;
	public $instr_mrt_descr;
	public $instr_us_yes_no_id;
	public $instr_us_date;
	public $instr_us_norm_yes_no_id;
	public $instr_us_descr;
	public $instr_kt_yes_no_id;
	public $instr_kt_date;
	public $instr_kt_norm_yes_no_id;
	public $instr_kt_descr;
	public $instr_ekg_yes_no_id;
	public $instr_ekg_date;
	public $instr_ekg_norm_yes_no_id;
	public $instr_ekg_descr;
	public $checked;
	public $user;
	public $insert_date;
}

class InvestLab extends Entity{
	public $id;
	public $patient_id;
	public $visit_id;
	public $visit_date;
	public $ca125_yes_no_id;
	public $ca125;
	public $ca125_date;
	public $oak_yes_no_id;
	public $oak_date;
	public $oak_hb;
	public $oak_er;
	public $oak_leuc;
	public $oak_tr;
	public $oak_netr;
	public $bc_yes_no_id;
	public $bc_protein_yes_no_id;
	public $bc_protein;
	public $bc_protein_date;
	public $bc_bilirubin_yes_no_id;
	public $bc_bilirubin_total_yes_no_id;
	public $bc_bilirubin_total;
	public $bc_bilirubin_total_date;
	public $bc_bilirubin_direct_yes_no_id;
	public $bc_bilirubin_direct;
	public $bc_bilirubin_direct_date;
	public $bc_bilirubin_nondirect_yes_no_id;
	public $bc_bilirubin_nondirect;
	public $bc_bilirubin_nondirect_date;
	public $bc_ast_yes_no_id;
	public $bc_ast;
	public $bc_ast_date;
	public $bc_alt_yes_no_id;
	public $bc_alt;
	public $bc_alt_date;
	public $bc_creat_yes_no_id;
	public $bc_creat;
	public $bc_creat_date;
	public $bc_alk_phosphatase_yes_no_id;
	public $bc_alk_phosphatase;
	public $bc_alk_phosphatase_date;
	public $bc_mochevina_yes_no_id;
	public $bc_mochevina;
	public $bc_mochevina_date;
	public $checked;
	public $user;
	public $insert_date;
}

class InvestTherapyContinue extends Entity{
	public $id;
	public $patient_id;
	public $visit_id;
	public $therap_trab_continue_yes_no_id;
	public $therap_trab_continue_no_cause_id;
	public $user;
	public $insert_date;
}

class InvestTumorResponse extends Entity{
	public $id;
	public $patient_id;
	public $visit_id;
	public $full_response_yes_no_id;
	public $partial_response_yes_no_id;
	public $progress_desease_yes_no_id;
	public $stabilization_desease_yes_no_id;
	public $checked;
	public $user;
	public $insert_date;
}

class InvestAdverseEvent extends Entity{
	public $id;
	public $patient_id;
	public $visit_id;
	public $adverse_event_yes_no_id;
	public $adverseEventDetails = array();
	public $checked;
	public $user;
	public $insert_date;
}

class InvestAdverseEventDetail extends Entity{
	public $id;
	public $name;
	public $adverse_event_id;
	public $serious_yes_no_id;
	public $start_date;
	public $resolved_yes_no_id;
	public $resolved_date;
	public $event_intensity_decreased_yes_no_id;
	public $event_occurred_again_yes_no_id;
	public $event_associated_with_drug_yes_no_id;
}

class InvestInclusion extends Entity{
	public $id;
	public $patient_id;
	public $visit_id;
	public $age_18_and_more_yes_no_id;
	public $histol_confirmed_cr_yes_no_id;
	public $ecog01_yes_no_id;
	public $recurrent_plat_sensit_cancer_yes_no_id;
	public $treatment_trabect_after_doxorub_yes_no_id;
	public $received_no_more_one_line_plat_chem_regimes_yes_no_id;
	public $doct_decision_trabectedin_yes_no_id;
	public $signed_consent_yes_no_id;
	public $age_18_less_yes_no_id;
	public $received_more_two_line_plat_chem_yes_no_id;
	public $platinum_refractory_ov_cr_yes_no_id;
	public $platinum_resistant_ov_cr_yes_no_id;
	public $refusal_central_venous_catheter_yes_no_id;
	public $impaired_hepatic_function_yes_no_id;
	public $impaired_renal_function_yes_no_id;
	public $impaired_hematological_parameters_yes_no_id;
	public $impaired_cardiovascular_function_yes_no_id;
	public $kaposi_sarcoma_yes_no_id;
	public $pregnancy_yes_no_id;
	public $checked;
	public $user;
	public $insert_date;
	
	
	// статус включения: 1 - включен; 0 - не включен; -1 - форма не заполнялась (по умолчанию)
	public function getStatusInclusion(){
		$retRes = -1;
		if($this->patient_id == null){
			return $retRes;
		}
		$includedParam = 
		   $this->age_18_and_more_yes_no_id
		&& $this->histol_confirmed_cr_yes_no_id
		&& $this->ecog01_yes_no_id
		&& $this->recurrent_plat_sensit_cancer_yes_no_id
		&& $this->treatment_trabect_after_doxorub_yes_no_id
		&& $this->received_no_more_one_line_plat_chem_regimes_yes_no_id
		&& $this->doct_decision_trabectedin_yes_no_id
		&& $this->signed_consent_yes_no_id;
		//var_dump($includedParam);
		
		$excludedParam = 
		   (!$this->age_18_less_yes_no_id)
		&& (!$this->received_more_two_line_plat_chem_yes_no_id)
		&& (!$this->platinum_refractory_ov_cr_yes_no_id)
		&& (!$this->platinum_resistant_ov_cr_yes_no_id)
		&& (!$this->refusal_central_venous_catheter_yes_no_id)
		&& (!$this->impaired_hepatic_function_yes_no_id)
		&& (!$this->impaired_renal_function_yes_no_id)
		&& (!$this->impaired_hematological_parameters_yes_no_id)
		&& (!$this->impaired_cardiovascular_function_yes_no_id)
		&& (!$this->kaposi_sarcoma_yes_no_id)
		&& (!$this->pregnancy_yes_no_id);
		//var_dump($excludedParam);
		//$pregnancy_yes_no_id
		$retRes = (int) ($includedParam && $excludedParam);
		//var_dump($retRes);
		return $retRes;
	}
	
}

class InvestQuery extends Entity{
	public $id;
	public $investigation_id;
	public $record_id;
	public $description;
	public $open_date;
	public $close_date;
	public $query_status_id;
	public $query_status_descr;
	// for page with list of queries
	public $patient_id;
	public $patient_number;
	public $investigation_descr;
	public $hospital_id;
	public $hospital_name;
	public $visit_id;
	public $visit_name;
	public $username_email;
	public $user_fio;
	
/*
			inv.descr as investigation_descr,
            hospital_d.value_id as hospital_id,
            hospital_d.value_name as hospital_name,
            visit.name as visit_name,
            invdata.user as username_email,
            CONCAT(user.last_name, ' ', user.first_name) as user_fio
 */
}

class GenerateObjects{
	public static function generateInvestGeneralDataObject($patient_id, $visit_id){
		$entity = new InvestGeneralData();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->visit_date = '2001/12/13';
		$entity->date_birth = '1967/02/15';
		$entity->weight_kg = '123';
		$entity->height_sm = '123';
		$entity->nationality_id = 1;
		$entity->nationality_if_other = '123';
		$entity->place_living_id = 1;
		$entity->education_id = 1;
		$entity->social_economic_status_id = 1;
		$entity->diag_cancer_estab_date = '2001/12/14';
		$entity->diag_cancer_tnm_stage_t_id = 1;
		$entity->diag_cancer_tnm_stage_n_id = 1;
		$entity->diag_cancer_tnm_stage_m_id = 1;
		$entity->diag_cancer_clin_stage_id = 1;
		$entity->surgical_treat_yes_no_id = 1;
		$entity->surgical_treat_ecstir_yes_no_id = 1;
		$entity->surgical_treat_ecstir_date = '2001/12/15';
		$entity->surgical_treatment_gister01_yes_no_id = 1;
		$entity->surgical_treatment_gister01_date = '2001/12/16';
		$entity->surgical_treatment_gister02_yes_no_id = 1;
		$entity->surgical_treatment_gister02_date = '2001/12/17';
		$entity->surgical_treatment_gister03_yes_no_id = 1;
		$entity->surgical_treatment_gister03_date = '2001/12/18';
		$entity->surgical_treatment_diag_laparotomia_yes_no_id = 1;
		$entity->surgical_treatment_diag_laparotomia_date = '2001/12/19';
		$entity->surgical_treatment_diag_laparoscopia_yes_no_id = 1;
		$entity->surgical_treatment_diag_laparoscopia_date = '2001/12/20';
		$entity->surgical_treatment_explorat_laparotomia_yes_no_id = 1;
		$entity->surgical_treatment_explorat_laparotomia_date = '2001/12/21';
		$entity->chem_treat_yes_no_id = 1;
		$entity->chem_treat_antracyc_yes_no_id = 1;
		$entity->chem_treat_platina_yes_no_id = 1;
		$entity->chem_treat_taxans_yes_no_id = 1;
		$entity->chem_treat_cyclophosph_yes_no_id = 1;
		$entity->chem_treat_other_yes_no_id = 1;
		$entity->chem_treat_other_descr = '123';
		$entity->progress_date = '2001/12/23';
		$entity->progress_ca125_yes_no_id = 1;
		$entity->progress_ca125 = '123';
		$entity->progress_instr_mrt_yes_no_id = 1;
		$entity->progress_instr_mrt_date = '2001/12/22';
		$entity->progress_instr_mrt_norm_yes_no_id = 1;
		$entity->progress_instr_mrt_descr = '123';
		$entity->progress_instr_us_yes_no_id = 1;
		$entity->progress_instr_us_date = '2001/12/23';
		$entity->progress_instr_us_norm_yes_no_id = 1;
		$entity->progress_instr_us_descr = '123';
		$entity->progress_instr_kt_yes_no_id = 1;
		$entity->progress_instr_kt_date = '2001/12/24';
		$entity->progress_instr_kt_norm_yes_no_id = 1;
		$entity->progress_instr_kt_descr = '123';
		$entity->progress_instr_ekg_yes_no_id = 1;
		$entity->progress_instr_ekg_date = '2001/12/25';
		$entity->progress_instr_ekg_norm_yes_no_id = 1;
		$entity->progress_instr_ekg_descr = '123';
		$entity->recidive_yes_no_id = 1;
		$entity->metastases_yes_no_id = 1;
		$entity->metastases_lung_yes_no_id = 1;
		$entity->metastases_lung_date = '2001/12/26';
		$entity->metastases_hepat_yes_no_id = 1;
		$entity->metastases_hepat_date = '2001/12/27';
		$entity->metastases_osteo_yes_no_id = 1;
		$entity->metastases_osteo_date = '2001/12/28';
		$entity->metastases_renal_yes_no_id = 1;
		$entity->metastases_renal_date = '2001/12/29';
		$entity->metastases_lymph_nodes_yes_no_id = 1;
		$entity->metastases_lymph_nodes_date = '2001/12/30';
		$entity->metastases_plevra_yes_no_id = 1;
		$entity->metastases_plevra_date = '2001/12/31';
		$entity->metastases_other_descr = '123';
		$entity->metastases_surgical_treat_yes_no_id = 1;
		$entity->metastases_surgical_treat_date = '2002/10/13';
		$entity->metastases_surgical_treat_descr = '123';
		$entity->chem_1st_line_treat_yes_no_id = 1;
		$entity->chem_1st_karboplatin_yes_no_id = 1;
		$entity->chem_1st_cisplatin_yes_no_id = 1;
		$entity->chem_1st_ciklofosfan_yes_no_id = 1;
		$entity->chem_1st_paklitaksel_yes_no_id = 1;
		$entity->chem_1st_doksorubicin_yes_no_id = 1;
		$entity->chem_1st_bevacizumab_yes_no_id = 1;
		$entity->chem_1st_topotekan_yes_no_id = 1;
		$entity->chem_1st_gemcitabin_yes_no_id = 1;
		$entity->chem_1st_vinorelbin_yes_no_id = 1;
		$entity->chem_1st_irinotekan_yes_no_id = 1;
		$entity->chem_1st_etopozid_yes_no_id = 1;
		$entity->chem_1st_epirubicin_yes_no_id = 1;
		$entity->chem_1st_docetaxel_yes_no_id = 1;
		$entity->chem_1st_oksaliplatin_yes_no_id = 1;
		$entity->chem_1st_trabektidin_yes_no_id = 1;
		$entity->chem_1st_other_yes_no_id = 1;
		$entity->chem_1st_other_descr = '123';
		$entity->chem_1st_date_start = '2002/10/14';
		$entity->chem_1st_date_finish = '2002/10/15';
		$entity->chem_1st_course_number = '123';
		$entity->chem_1st_concomitant_therapy_descr = '123';
		$entity->chem_2st_trabectedin_yes_no_id = 1;
		$entity->chem_2st_trabectedin_dose = '123';
		$entity->chem_2st_pld_yes_no_id = 1;
		$entity->chem_2st_pld_dose = '123';
		$entity->chem_2st_doxopeg_yes_no_id = 1;
		$entity->chem_2st_doxopeg_dose = '123';
		$entity->chem_2st_kelix_yes_no_id = 1;
		$entity->chem_2st_kelix_dose = '123';
		$entity->chem_2st_doksorubicin_yes_no_id = 1;
		$entity->chem_2st_doksorubicin_dose = '123';
		$entity->chem_2st_other_yes_no_id = 1;
		$entity->chem_2st_other_dose = '123';
		$entity->chem_2st_concomitant_therapy_descr = '123';
		$entity->undesirable_event_yes_no_id = 1;
		$entity->user = '123';
		//$entity->insert_date = '2002/10/16';
		return $entity;
	}
	public static function generateInvestInstrumentDataObject($patient_id, $visit_id){
		$entity = new InvestInstrument();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->instr_mrt_yes_no_id = 1;
		$entity->instr_mrt_date = '1981/12/23';
		$entity->instr_mrt_norm_yes_no_id = 0;
		$entity->instr_mrt_descr = 'Просто текст, просто текст 666954848';
		$entity->instr_us_yes_no_id = 1;
		$entity->instr_us_date = '1982/12/23';
		$entity->instr_us_norm_yes_no_id = 0;
		$entity->instr_us_descr = 'Просто текст, просто текст 111805774';
		$entity->instr_kt_yes_no_id = 0;
		$entity->instr_kt_date = '1983/12/23';
		$entity->instr_kt_norm_yes_no_id = 0;
		$entity->instr_kt_descr = 'Просто текст, просто текст 669106421';
		$entity->instr_ekg_yes_no_id = 0;
		$entity->instr_ekg_date = '1984/12/23';
		$entity->instr_ekg_norm_yes_no_id = 0;
		$entity->instr_ekg_descr = 'Просто текст, просто текст 1118139875';
		return $entity;
	}
	public static function generateInvestLabDataObject($patient_id, $visit_id){
		$entity = new InvestLab();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->visit_date = '1981/12/23';
		$entity->ca125_yes_no_id = 0;
		$entity->ca125 = '5954';
		$entity->ca125_date = '1982/12/23';
		$entity->oak_yes_no_id = 1;
		$entity->oak_date = '1983/12/23';
		$entity->oak_hb = '72428';
		$entity->oak_er = '61945';
		$entity->oak_leuc = '99009';
		$entity->oak_tr = '24878';
		$entity->oak_netr = '11869';
		$entity->bc_yes_no_id = 0;
		$entity->bc_protein_yes_no_id = 1;
		$entity->bc_protein = '76185';
		$entity->bc_protein_date = '1984/12/23';
		$entity->bc_bilirubin_yes_no_id = 1;
		$entity->bc_bilirubin_total_yes_no_id = 1;
		$entity->bc_bilirubin_total = '7969';
		$entity->bc_bilirubin_total_date = '1985/12/23';
		$entity->bc_bilirubin_direct_yes_no_id = 0;
		$entity->bc_bilirubin_direct = '90165';
		$entity->bc_bilirubin_direct_date = '1986/12/23';
		$entity->bc_bilirubin_nondirect_yes_no_id = 1;
		$entity->bc_bilirubin_nondirect = '17624';
		$entity->bc_bilirubin_nondirect_date = '1987/12/23';
		$entity->bc_ast_yes_no_id = 1;
		$entity->bc_ast = '72770';
		$entity->bc_ast_date = '1988/12/23';
		$entity->bc_alt_yes_no_id = 0;
		$entity->bc_alt = '9897';
		$entity->bc_alt_date = '1989/12/23';
		$entity->bc_creat_yes_no_id = 0;
		$entity->bc_creat = '30179';
		$entity->bc_creat_date = '1990/12/23';
		$entity->bc_alk_phosphatase_yes_no_id = 0;
		$entity->bc_alk_phosphatase = '56662';
		$entity->bc_alk_phosphatase_date = '1991/12/23';
		$entity->bc_mochevina_yes_no_id = 0;
		$entity->bc_mochevina = '9269';
		$entity->bc_mochevina_date = '1992/12/23';
		return $entity;
	}
	public static function generateInvestTherapyContinueDataObject($patient_id, $visit_id){
		$entity = new InvestTherapyContinue();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->therap_trab_continue_yes_no_id = 0;
		$entity->therap_trab_continue_no_cause_id = 0;
		return $entity;
	}
	public static function generateInvestTumorResponseDataObject($patient_id, $visit_id){
		$entity = new InvestTumorResponse();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->full_response_yes_no_id = 1;
		$entity->partial_response_yes_no_id = 1;
		$entity->progress_desease_yes_no_id = 0;
		$entity->stabilization_desease_yes_no_id = 1;
		return $entity;
	}
	public static function generateInvestAdverseEventDataObject($patient_id, $visit_id){
		$entity = new InvestAdverseEvent();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->adverse_event_yes_no_id = 1;
		return $entity;
	}
	public static function generateInvestAdverseEventDetailDataObject($adverse_event_id){
		$entity = new InvestAdverseEventDetail();
		$entity->id = null;
		$entity->name = 'Побоч явл 1';
		$entity->adverse_event_id = $adverse_event_id;
		$entity->serious_yes_no_id = 1;
		$entity->start_date = '1981/12/23';
		$entity->resolved_yes_no_id = 0;
		$entity->resolved_date = '1982/12/23';
		$entity->event_intensity_decreased_yes_no_id = 1;
		$entity->event_occurred_again_yes_no_id = 1;
		$entity->event_associated_with_drug_yes_no_id = 1;
		return $entity;
	}
	public static function generateInvestInclusionDataObject($patient_id, $visit_id){
		$entity = new InvestInclusion();
		$entity->id = null;
		$entity->patient_id = $patient_id;
		$entity->visit_id = $visit_id;
		$entity->age_18_and_more_yes_no_id=1;
		$entity->histol_confirmed_cr_yes_no_id=1;
		$entity->ecog01_yes_no_id=1;
		$entity->recurrent_plat_sensit_cancer_yes_no_id=1;
		$entity->treatment_trabect_after_doxorub_yes_no_id=1;
		$entity->received_no_more_one_line_plat_chem_regimes_yes_no_id=1;
		$entity->doct_decision_trabectedin_yes_no_id=1;
		$entity->signed_consent_yes_no_id=1;
		$entity->age_18_less_yes_no_id=1;
		$entity->received_more_two_line_plat_chem_yes_no_id=1;
		$entity->platinum_refractory_ov_cr_yes_no_id=1;
		$entity->platinum_resistant_ov_cr_yes_no_id=1;
		$entity->refusal_central_venous_catheter_yes_no_id=1;
		$entity->impaired_hepatic_function_yes_no_id=1;
		$entity->impaired_renal_function_yes_no_id=1;
		$entity->impaired_hematological_parameters_yes_no_id=1;
		$entity->impaired_cardiovascular_function_yes_no_id=1;
		$entity->kaposi_sarcoma_yes_no_id=1;
		return $entity;
	}

}
