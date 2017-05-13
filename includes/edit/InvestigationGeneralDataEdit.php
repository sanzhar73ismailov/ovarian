<?php
class InvestigationGenDataEdit extends EntityEdit {
	public function __construct($request, $do, $id, $dao, $smarty) {
		parent::__construct ( $request, $do, $id, $dao, $smarty );
	}
	public function setTitleForView() {
		$this->smarty->assign ( 'title', "Просмотр клин. данных" );
	}
	public function setTitleForEdit() {
		$this->smarty->assign ( 'title', "Редактирование клин. данных" );
	}
	public function save_insert($entityParsed) {
		$id = $this->dao->insert_generalData ( $entityParsed );
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	public function save_update($entityParsed) {
		$id = $this->dao->update_generalData ( $entityParsed );
		$entityObj = $this->getEntityObj ();
		return $entityObj;
	}
	public function parse_form_to_entity() {
		$request = $this->request;
		$entity = new InvestGeneralData ();
		$entity->id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'id' ) );
		$entity->patient_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'patient_id' ) );
		$entity->visit_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'visit_id' ) );
		$entity->visit_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'visit_date' ) ) );
		$entity->date_birth = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'date_birth' ) ) );
		$entity->weight_kg = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'weight_kg' ) );
		$entity->height_sm = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'height_sm' ) );
		$entity->nationality_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'nationality_id' ) );
		$entity->nationality_if_other = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'nationality_if_other' ) );
		$entity->place_living_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'place_living_id' ) );
		$entity->education_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'education_id' ) );
		$entity->social_economic_status_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'social_economic_status_id' ) );
		$entity->diag_cancer_estab_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'diag_cancer_estab_date' ) ) );
		$entity->diag_cancer_tnm_stage_t_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'diag_cancer_tnm_stage_t_id' ) );
		$entity->diag_cancer_tnm_stage_n_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'diag_cancer_tnm_stage_n_id' ) );
		$entity->diag_cancer_tnm_stage_m_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'diag_cancer_tnm_stage_m_id' ) );
		$entity->diag_cancer_clin_stage_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'diag_cancer_clin_stage_id' ) );
		$entity->surgical_treat_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treat_yes_no_id' ) );
		$entity->surgical_treat_ecstir_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treat_ecstir_yes_no_id' ) );
		$entity->surgical_treat_ecstir_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treat_ecstir_date' ) ) );
		$entity->surgical_treatment_gister01_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_gister01_yes_no_id' ) );
		$entity->surgical_treatment_gister01_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_gister01_date' ) ) );
		$entity->surgical_treatment_gister02_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_gister02_yes_no_id' ) );
		$entity->surgical_treatment_gister02_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_gister02_date' ) ) );
		$entity->surgical_treatment_gister03_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_gister03_yes_no_id' ) );
		$entity->surgical_treatment_gister03_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_gister03_date' ) ) );
		$entity->surgical_treatment_diag_laparotomia_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_diag_laparotomia_yes_no_id' ) );
		$entity->surgical_treatment_diag_laparotomia_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_diag_laparotomia_date' ) ) );
		$entity->surgical_treatment_diag_laparoscopia_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_diag_laparoscopia_yes_no_id' ) );
		$entity->surgical_treatment_diag_laparoscopia_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_diag_laparoscopia_date' ) ) );
		$entity->surgical_treatment_explorat_laparotomia_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_explorat_laparotomia_yes_no_id' ) );
		$entity->surgical_treatment_explorat_laparotomia_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'surgical_treatment_explorat_laparotomia_date' ) ) );
		$entity->chem_treat_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_yes_no_id' ) );
		$entity->chem_treat_antracyc_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_antracyc_yes_no_id' ) );
		$entity->chem_treat_platina_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_platina_yes_no_id' ) );
		$entity->chem_treat_taxans_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_taxans_yes_no_id' ) );
		$entity->chem_treat_cyclophosph_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_cyclophosph_yes_no_id' ) );
		$entity->chem_treat_other_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_other_yes_no_id' ) );
		$entity->chem_treat_other_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_treat_other_descr' ) );
		$entity->progress_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_date' ) ) );
		$entity->progress_ca125_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_ca125_yes_no_id' ) );
		$entity->progress_ca125 = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_ca125' ) );
		$entity->progress_instr_mrt_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_mrt_yes_no_id' ) );
		$entity->progress_instr_mrt_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_mrt_date' ) ) );
		$entity->progress_instr_mrt_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_mrt_norm_yes_no_id' ) );
		$entity->progress_instr_mrt_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_mrt_descr' ) );
		$entity->progress_instr_us_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_us_yes_no_id' ) );
		$entity->progress_instr_us_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_us_date' ) ) );
		$entity->progress_instr_us_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_us_norm_yes_no_id' ) );
		$entity->progress_instr_us_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_us_descr' ) );
		$entity->progress_instr_kt_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_kt_yes_no_id' ) );
		$entity->progress_instr_kt_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_kt_date' ) ) );
		$entity->progress_instr_kt_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_kt_norm_yes_no_id' ) );
		$entity->progress_instr_kt_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_kt_descr' ) );
		$entity->progress_instr_ekg_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_ekg_yes_no_id' ) );
		$entity->progress_instr_ekg_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_ekg_date' ) ) );
		$entity->progress_instr_ekg_norm_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_ekg_norm_yes_no_id' ) );
		$entity->progress_instr_ekg_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'progress_instr_ekg_descr' ) );
		$entity->recidive_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'recidive_yes_no_id' ) );
		$entity->metastases_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_yes_no_id' ) );
		$entity->metastases_lung_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_lung_yes_no_id' ) );
		$entity->metastases_lung_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_lung_date' ) ) );
		$entity->metastases_hepat_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_hepat_yes_no_id' ) );
		$entity->metastases_hepat_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_hepat_date' ) ) );
		$entity->metastases_osteo_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_osteo_yes_no_id' ) );
		$entity->metastases_osteo_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_osteo_date' ) ) );
		$entity->metastases_renal_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_renal_yes_no_id' ) );
		$entity->metastases_renal_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_renal_date' ) ) );
		$entity->metastases_lymph_nodes_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_lymph_nodes_yes_no_id' ) );
		$entity->metastases_lymph_nodes_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_lymph_nodes_date' ) ) );
		$entity->metastases_plevra_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_plevra_yes_no_id' ) );
		$entity->metastases_plevra_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_plevra_date' ) ) );
		$entity->metastases_other_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_other_descr' ) );
		$entity->metastases_surgical_treat_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_surgical_treat_yes_no_id' ) );
		$entity->metastases_surgical_treat_date = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_surgical_treat_date' ) ) );
		$entity->metastases_surgical_treat_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'metastases_surgical_treat_descr' ) );
		$entity->chem_1st_line_treat_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_line_treat_yes_no_id' ) );
		$entity->chem_1st_karboplatin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_karboplatin_yes_no_id' ) );
		$entity->chem_1st_cisplatin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_cisplatin_yes_no_id' ) );
		$entity->chem_1st_ciklofosfan_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_ciklofosfan_yes_no_id' ) );
		$entity->chem_1st_paklitaksel_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_paklitaksel_yes_no_id' ) );
		$entity->chem_1st_doksorubicin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_doksorubicin_yes_no_id' ) );
		$entity->chem_1st_bevacizumab_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_bevacizumab_yes_no_id' ) );
		$entity->chem_1st_topotekan_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_topotekan_yes_no_id' ) );
		$entity->chem_1st_gemcitabin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_gemcitabin_yes_no_id' ) );
		$entity->chem_1st_vinorelbin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_vinorelbin_yes_no_id' ) );
		$entity->chem_1st_irinotekan_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_irinotekan_yes_no_id' ) );
		$entity->chem_1st_etopozid_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_etopozid_yes_no_id' ) );
		$entity->chem_1st_epirubicin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_epirubicin_yes_no_id' ) );
		$entity->chem_1st_docetaxel_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_docetaxel_yes_no_id' ) );
		$entity->chem_1st_oksaliplatin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_oksaliplatin_yes_no_id' ) );
		$entity->chem_1st_trabektidin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_trabektidin_yes_no_id' ) );
		$entity->chem_1st_other_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_other_yes_no_id' ) );
		$entity->chem_1st_other_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_other_descr' ) );
		$entity->chem_1st_date_start = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_date_start' ) ) );
		$entity->chem_1st_date_finish = UtilDate::formatRusDateTpSqlDateStr ( $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_date_finish' ) ) );
		$entity->chem_1st_course_number = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_course_number' ) );
		$entity->chem_1st_concomitant_therapy_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_1st_concomitant_therapy_descr' ) );
		$entity->chem_2st_trabectedin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_trabectedin_yes_no_id' ) );
		$entity->chem_2st_trabectedin_dose = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_trabectedin_dose' ) );
		$entity->chem_2st_pld_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_pld_yes_no_id' ) );
		$entity->chem_2st_pld_dose = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_pld_dose' ) );
		$entity->chem_2st_doxopeg_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_doxopeg_yes_no_id' ) );
		$entity->chem_2st_doxopeg_dose = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_doxopeg_dose' ) );
		$entity->chem_2st_kelix_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_kelix_yes_no_id' ) );
		$entity->chem_2st_kelix_dose = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_kelix_dose' ) );
		$entity->chem_2st_doksorubicin_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_doksorubicin_yes_no_id' ) );
		$entity->chem_2st_doksorubicin_dose = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_doksorubicin_dose' ) );
		$entity->chem_2st_other_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_other_yes_no_id' ) );
		$entity->chem_2st_other_dose = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_other_dose' ) );
		$entity->chem_2st_concomitant_therapy_descr = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'chem_2st_concomitant_therapy_descr' ) );
		$entity->undesirable_event_yes_no_id = $this->getNullForObjectFieldIfStringEmpty ( $this->getValFromRequest ( $request, 'undesirable_event_yes_no_id' ) );
		$entity->user = $this->user;
		return $entity;
	}
	public function fill_entity_form_by_dic() {
		$smarty = $this->smarty;
		$dao = $this->dao;
		$smarty->assign ( 'nationality_vals', $dao->getDicValues ( "nationality_id" ) );
		$smarty->assign ( 'place_living_vals', $dao->getDicValues ( "place_living_id" ) );
		$smarty->assign ( 'education_vals', $dao->getDicValues ( "education_id" ) );
		$smarty->assign ( 'social_economic_status_vals', $dao->getDicValues ( "social_economic_status_id" ) );
		$smarty->assign ( 'diag_cancer_tnm_stage_t_vals', $dao->getDicValues ( "diag_cancer_tnm_stage_t_id" ) );
		$smarty->assign ( 'diag_cancer_tnm_stage_n_vals', $dao->getDicValues ( "diag_cancer_tnm_stage_n_id" ) );
		$smarty->assign ( 'diag_cancer_tnm_stage_m_vals', $dao->getDicValues ( "diag_cancer_tnm_stage_m_id" ) );
		$smarty->assign ( 'diag_cancer_clin_stage_vals', $dao->getDicValues ( "diag_cancer_clin_stage_id" ) );
		$smarty->assign ( 'surgical_treat_yes_no_vals', $dao->getDicValues ( "surgical_treat_yes_no_id" ) );
		$smarty->assign ( 'surgical_treat_ecstir_yes_no_vals', $dao->getDicValues ( "surgical_treat_ecstir_yes_no_id" ) );
		$smarty->assign ( 'surgical_treatment_gister01_yes_no_vals', $dao->getDicValues ( "surgical_treatment_gister01_yes_no_id" ) );
		$smarty->assign ( 'surgical_treatment_gister02_yes_no_vals', $dao->getDicValues ( "surgical_treatment_gister02_yes_no_id" ) );
		$smarty->assign ( 'surgical_treatment_gister03_yes_no_vals', $dao->getDicValues ( "surgical_treatment_gister03_yes_no_id" ) );
		$smarty->assign ( 'surgical_treatment_diag_laparotomia_yes_no_vals', $dao->getDicValues ( "surgical_treatment_diag_laparotomia_yes_no_id" ) );
		$smarty->assign ( 'surgical_treatment_diag_laparoscopia_yes_no_vals', $dao->getDicValues ( "surgical_treatment_diag_laparoscopia_yes_no_id" ) );
		$smarty->assign ( 'surgical_treatment_explorat_laparotomia_yes_no_vals', $dao->getDicValues ( "surgical_treatment_explorat_laparotomia_yes_no_id" ) );
		$smarty->assign ( 'chem_treat_yes_no_vals', $dao->getDicValues ( "chem_treat_yes_no_id" ) );
		$smarty->assign ( 'chem_treat_antracyc_yes_no_vals', $dao->getDicValues ( "chem_treat_antracyc_yes_no_id" ) );
		$smarty->assign ( 'chem_treat_platina_yes_no_vals', $dao->getDicValues ( "chem_treat_platina_yes_no_id" ) );
		$smarty->assign ( 'chem_treat_taxans_yes_no_vals', $dao->getDicValues ( "chem_treat_taxans_yes_no_id" ) );
		$smarty->assign ( 'chem_treat_cyclophosph_yes_no_vals', $dao->getDicValues ( "chem_treat_cyclophosph_yes_no_id" ) );
		$smarty->assign ( 'chem_treat_other_yes_no_vals', $dao->getDicValues ( "chem_treat_other_yes_no_id" ) );
		$smarty->assign ( 'progress_ca125_yes_no_vals', $dao->getDicValues ( "progress_ca125_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_mrt_yes_no_vals', $dao->getDicValues ( "progress_instr_mrt_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_mrt_norm_yes_no_vals', $dao->getDicValues ( "progress_instr_mrt_norm_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_us_yes_no_vals', $dao->getDicValues ( "progress_instr_us_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_us_norm_yes_no_vals', $dao->getDicValues ( "progress_instr_us_norm_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_kt_yes_no_vals', $dao->getDicValues ( "progress_instr_kt_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_kt_norm_yes_no_vals', $dao->getDicValues ( "progress_instr_kt_norm_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_ekg_yes_no_vals', $dao->getDicValues ( "progress_instr_ekg_yes_no_id" ) );
		$smarty->assign ( 'progress_instr_ekg_norm_yes_no_vals', $dao->getDicValues ( "progress_instr_ekg_norm_yes_no_id" ) );
		$smarty->assign ( 'recidive_yes_no_vals', $dao->getDicValues ( "recidive_yes_no_id" ) );
		$smarty->assign ( 'metastases_yes_no_vals', $dao->getDicValues ( "metastases_yes_no_id" ) );
		$smarty->assign ( 'metastases_lung_yes_no_vals', $dao->getDicValues ( "metastases_lung_yes_no_id" ) );
		$smarty->assign ( 'metastases_hepat_yes_no_vals', $dao->getDicValues ( "metastases_hepat_yes_no_id" ) );
		$smarty->assign ( 'metastases_osteo_yes_no_vals', $dao->getDicValues ( "metastases_osteo_yes_no_id" ) );
		$smarty->assign ( 'metastases_renal_yes_no_vals', $dao->getDicValues ( "metastases_renal_yes_no_id" ) );
		$smarty->assign ( 'metastases_lymph_nodes_yes_no_vals', $dao->getDicValues ( "metastases_lymph_nodes_yes_no_id" ) );
		$smarty->assign ( 'metastases_plevra_yes_no_vals', $dao->getDicValues ( "metastases_plevra_yes_no_id" ) );
		$smarty->assign ( 'metastases_surgical_treat_yes_no_vals', $dao->getDicValues ( "metastases_surgical_treat_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_line_treat_yes_no_vals', $dao->getDicValues ( "chem_1st_line_treat_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_karboplatin_yes_no_vals', $dao->getDicValues ( "chem_1st_karboplatin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_cisplatin_yes_no_vals', $dao->getDicValues ( "chem_1st_cisplatin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_ciklofosfan_yes_no_vals', $dao->getDicValues ( "chem_1st_ciklofosfan_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_paklitaksel_yes_no_vals', $dao->getDicValues ( "chem_1st_paklitaksel_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_doksorubicin_yes_no_vals', $dao->getDicValues ( "chem_1st_doksorubicin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_bevacizumab_yes_no_vals', $dao->getDicValues ( "chem_1st_bevacizumab_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_topotekan_yes_no_vals', $dao->getDicValues ( "chem_1st_topotekan_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_gemcitabin_yes_no_vals', $dao->getDicValues ( "chem_1st_gemcitabin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_vinorelbin_yes_no_vals', $dao->getDicValues ( "chem_1st_vinorelbin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_irinotekan_yes_no_vals', $dao->getDicValues ( "chem_1st_irinotekan_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_etopozid_yes_no_vals', $dao->getDicValues ( "chem_1st_etopozid_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_epirubicin_yes_no_vals', $dao->getDicValues ( "chem_1st_epirubicin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_docetaxel_yes_no_vals', $dao->getDicValues ( "chem_1st_docetaxel_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_oksaliplatin_yes_no_vals', $dao->getDicValues ( "chem_1st_oksaliplatin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_trabektidin_yes_no_vals', $dao->getDicValues ( "chem_1st_trabektidin_yes_no_id" ) );
		$smarty->assign ( 'chem_1st_other_yes_no_vals', $dao->getDicValues ( "chem_1st_other_yes_no_id" ) );
		$smarty->assign ( 'chem_2st_trabectedin_yes_no_vals', $dao->getDicValues ( "chem_2st_trabectedin_yes_no_id" ) );
		$smarty->assign ( 'chem_2st_pld_yes_no_vals', $dao->getDicValues ( "chem_2st_pld_yes_no_id" ) );
		$smarty->assign ( 'chem_2st_doxopeg_yes_no_vals', $dao->getDicValues ( "chem_2st_doxopeg_yes_no_id" ) );
		$smarty->assign ( 'chem_2st_kelix_yes_no_vals', $dao->getDicValues ( "chem_2st_kelix_yes_no_id" ) );
		$smarty->assign ( 'chem_2st_doksorubicin_yes_no_vals', $dao->getDicValues ( "chem_2st_doksorubicin_yes_no_id" ) );
		$smarty->assign ( 'chem_2st_other_yes_no_vals', $dao->getDicValues ( "chem_2st_other_yes_no_id" ) );
		$smarty->assign ( 'undesirable_event_yes_no_vals', $dao->getDicValues ( "undesirable_event_yes_no_id" ) );
	}
	public function display_tpl() {
		$this->smarty->display ( 'templates/edit_general_data.tpl' );
	}
	public function getEntityObj() {
		// throw new Exception ( "UnsupportedOperationException" );
		$entityObj = $this->dao->getInvestGeneralData ( $this->request ["patient_id"], $this->request ["visit_id"] );
		if ($entityObj == null) {
			if (GENERATE_TEST_OBJECTS) {
				$entityObj = GenerateObjects::generateInvestGeneralDataObject ($this->request ["patient_id"], $this->request ["visit_id"]);
			} else {
				$entityObj = new InvestGeneralData ();
			}
		}
		return $entityObj;
	}
}