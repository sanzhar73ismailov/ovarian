<?php
//function getDicValues($dic_name){
//	$array = array();
//	$query =  "SELECT * FROM " . DB_PREFIX . $dic_name;
//	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());
//	while ($row = mysql_fetch_array($result, MYSQL_ASSOC)){
//		$array[] = new Dictionary($row['id'], $row['name']);
//	}
//	mysql_free_result($result);
//	return $array;

// возвращает имя папки хоста со слешом на конце



function folder_host($req_uri){
	$needle   = '/';
	$pos      = strripos($req_uri, $needle);
	//echo "<h1>pos = $pos</h1>";

	return  substr($req_uri, 0, $pos);
}
//}
function mail_utf8($to, $from, $subject, $message)
{
	$subject = '=?UTF-8?B?' . base64_encode($subject) . '?=';

	$headers  = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=utf-8\r\n";
	$headers .= "From: $from\r\n";

	return mail($to, $subject, $message, $headers);
}

function send_mail($to, $subject, $message, $fromEmail, $fromDisplayName, $replyEmail) {
	/*
	 * $headers = "Content-type: text/html; charset=utf-8 \r\n";
	 * $headers .= "From: " . $fromDisplayName . " <" . $fromEmail . ">\r\n";
	 * $headers .= "Reply-To: ".$replyEmail."\r\n";
	 * $subject = '=?UTF-8?B?' . base64_encode($subject) . '?=';
	 * $result = mail($to, $subject, $message, $headers);
	 */
	require_once "SendMailSmtpClass.php"; // подключаем класс
	$mailSMTP = new SendMailSmtpClass ( 'sanzhar73@mail.ru', 'qweasd111!', 'ssl://smtp.mail.ru', 'Sanzhar', 465 ); // создаем экземпляр класса
	// $mailSMTP = new SendMailSmtpClass('логин', 'пароль', 'хост', 'имя отправителя');

	// заголовок письма
	$headers = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
	$headers .= "From: " . $fromDisplayName . " <" . 'sanzhar73@mail.ru' . ">\r\n";
	if (ZAGLUSHKA_MAIL) {
		//echo "<h3>1</h3>";
		$result = true;
	} else {
		//echo "<h3>0</h3>";
		$result = $mailSMTP->send ( $to, $subject, $message, $headers ); // отправляем письмо
	}
	// $result = $mailSMTP->send('Кому письмо', 'Тема письма', 'Текст письма', 'Заголовки письма');
	return $result;
}

function open_tpl_to_view_patient($id, $smarty, $dao, $do="view"){
	fill_patient_form_by_dic($smarty, $dao);
	$patient = null;
	$patient =$dao->getPatient($id);
	//$investigation =$dao->getInvestigationByPatientId($id);
	$investigation = null;
	if($do == "edit"){
		$smarty->assign('readonly',"");
		$smarty->assign('disabled',"");
		$smarty->assign('class',"");
		$smarty->assign('class_req_input',"class='req_input'");
		$smarty->assign('edit',true);
	}else{
		$smarty->assign('readonly',"readonly='readonly'");
		$smarty->assign('disabled',"disabled='disabled'");
		$smarty->assign('edit',false);
		$smarty->assign('class_req_input',"class='read_only_input'");
		$smarty->assign('class',"class='read_only_input'");
	}
	$smarty->assign('investigation_exist', $investigation != null ? true : false);
	$smarty->assign('patient_exist', $patient != null ? true : false);
	$smarty->assign('object',$patient == null ? new Patient(): $patient);
	$smarty->display('templates/edit_patient.tpl');

}

//deprecated
function open_tpl_to_view_investigation($request, $smarty, $dao, $do="view"){
	$patient_id = (int) $request["patient_id"];
	$patient = $dao->getPatient($patient_id);
	$visit = $dao->getRowById('visit', $request["visit_id"]);
	$investigation = $dao->getRowById("investigation", $id=$request["investigation_id"]);
	//var_dump($visit);
	//var_dump($investigation);
	//exit(">>>>>>>>>>>>>>>>>>>>>>");
	//var_dump($investName);
	if($patient == null){
		exit("Исследование добавляется только имеющемуся пациенту");
	}
	fill_investigation_form_by_dic($investigation['name'], $smarty, $dao);
	$entity = null;
	$entity = getInvestEntity($investigation['name'], $patient_id, $request["visit_id"]);
	//echo "patient_id=$patient_id<p>";
	//var_dump($dao->getPatient((int) $_REQUEST["patient_id"]));
	if($entity == null){
		$do = 'edit';
		$entity = getNewInvestEntity($investigation['name'], $patient_id, $request["visit_id"]);
	}
	if($do == "edit"){
		$smarty->assign('readonly',"");
		$smarty->assign('disabled',"");
		$smarty->assign('class',"");
		$smarty->assign('class_req_input',"class='req_input' required");
		$smarty->assign('edit',true);
	}else{
		$smarty->assign('readonly',"readonly='readonly'");
		$smarty->assign('disabled',"disabled='disabled'");
		$smarty->assign('edit',false);
		$smarty->assign('class_req_input',"class='read_only_input'");
		$smarty->assign('class',"class='read_only_input'");
	}
	$smarty->assign('object',$entity);
	$smarty->assign('patient',$patient);
	$smarty->assign('visit',$visit);
	$smarty->assign('investigation',$investigation);
	$smarty->display(getTemplateName($investigation['name']));
}

//deprecated
function getInvestEntity($investName, $patient_id, $visit_id){
	global $dao;
	$entity = null;
	switch ($investName){
		case 'ovarian_general_data';
		$entity = $dao->getInvestGeneralData($patient_id, $visit_id);
		break;
		case 'ovarian_instrument';
		$entity = $dao->getInvestInstrument($patient_id, $visit_id);
		break;
		case 'ovarian_lab';
		$entity = $dao->getInvestLab($patient_id, $visit_id);
		break;
		case 'ovarian_therapy_continue';
		$entity = $dao->getInvestTherapyContinue($patient_id, $visit_id);
		break;
		case 'ovarian_tumor_response';
		$entity = $dao->getInvestTumorResponse($patient_id, $visit_id);
		break;
		default:
			throw new Exception("Unsupported: " . $investName);
	}
	return $entity;
}

function getNewInvestEntity($investName, $patient_id, $visit_id){
	$entity = null;
	echo "investName = $investName";
	switch ($investName){
		case 'ovarian_general_data';
		$entity = new InvestGeneralData();
		//$entity = GenerateObjects::generateInvestGeneralDataObject();
		break;
		case 'ovarian_instrument';
		$entity = new InvestInstrument();
		$entity = GenerateObjects::generateInvestInstrumentDataObject();
		var_dump($entity);
		break;
		case 'ovarian_lab';
		$entity = new InvestLab();
		break;
		case 'ovarian_therapy_continue';
		$entity = new InvestTherapyContinue();
		break;
		case 'ovarian_tumor_response';
		$entity = new InvestTumorResponse();
		break;
		default:
			throw new Exception("Unsupported: " . $investName);
	}
	$entity->patient_id = $patient_id;
	$entity->visit_id = $visit_id;
	return $entity;
}
//deprecated
function getTemplateName($investName){
	$entity = null;
	switch ($investName){
		case 'ovarian_general_data';
		return "templates/edit_general_data.tpl";
		case 'ovarian_instrument';
		return "templates/edit_instrument.tpl";
		case 'ovarian_lab';
		return "templates/edit_lab.tpl";
		case 'ovarian_therapy_continue';
		return "templates/edit_therapy_continue.tpl";
		case 'ovarian_tumor_response';
		return "templates/edit_tumor_response.tpl";
		default:
			throw new Exception("Unsupported: " . $investName);
	}
}
function open_tpl_to_view_therapy($request, $smarty, $dao, $do="view"){
	//echo "in open_tpl_to_view_therapy edit<br/>";
	$id = trim($request["id"]);
	$therapy = null;
	//var_dump($therapy);
	//exit("open_tpl_to_view_therapy");

	//
	//var_dump($patient);
	//if($patient == null){
	//	exit("Исследование добавляется только имеющемуся пациенту");
	//}

	fill_therapy_form_by_dic($smarty, $dao);

	//	$investigation = null;
	//	$investigation =$dao->getInvestigationByPatientId($patient_id);
	if($id == ""){
		$do = 'edit';
		$therapy = new Therapy();
		$therapy->patient_id = $request["patient_id"];
		$therapy->visit_id = $request["visit_id"];
	}else{
		$therapy =$dao->getTherapy($id);
	}
	$patient = $dao->getPatient($therapy->patient_id);
	//	if($investigation == null){
	//		$do = 'edit';
	//		$investigation = new Investigation();
	//		$investigation->patient_id = $patient_id;
	//	}
	if($do == "edit"){
		$smarty->assign('readonly',"");
		$smarty->assign('disabled',"");
		$smarty->assign('class',"");

		$smarty->assign('class_req_input',"class='req_input'");
		$smarty->assign('edit',true);
		//echo "in do edit<br/>";
	}else{
		$smarty->assign('readonly',"readonly='readonly'");
		$smarty->assign('disabled',"disabled='disabled'");
		$smarty->assign('edit',false);
		$smarty->assign('class_req_input',"class='read_only_input'");
		$smarty->assign('class',"class='read_only_input'");
		//echo "in do else<br/>";
	}
	$smarty->assign('object',$therapy);
	$smarty->assign('patient',$patient);
	//$smarty->assign('patient_exist', true);
	$smarty->display('templates/edit_therapy.tpl');
}

function fill_patient_form_by_dic($smarty, $dao){
	//	$yes_no_vars = $dao->getDicValues("yes_no");
	//	$smarty->assign('sexvals',$dao->getDicValues("sex"));
	//	$smarty->assign('yesnovals',$yes_no_vars);
	//	$smarty->assign('nationalityvals', $dao->getDicValues("nationality"));
	//	$arrayDoctorNames = $dao->getUniqueDoctorNames();
	//	$smarty->assign('doctorNames',"\"".implode("\",\"", $arrayDoctorNames)."\"");
	//	$arrayHospitalNames = $dao->getUniqueHospitalNames();
	//	$smarty->assign('hospitalNames',"\"".implode("\",\"", $arrayHospitalNames)."\"");
	$smarty->assign('hospital_vals', $dao->getDicValues("hospital_id"));
	//	$smarty->assign('investigation_vals', $dao->getDicValues("investigation_id"));
	//	$smarty->assign('sex_vals', $dao->getDicValues("sex_id"));
	//	$smarty->assign('place_living_vals', $dao->getDicValues("place_living_id"));
	//	$smarty->assign('social_status_vals', $dao->getDicValues("social_status_id"));
	//	$smarty->assign('diag_cancer_localization_vals', $dao->getDicValues("diag_cancer_localization_id"));
	//	$smarty->assign('diag_cancer_degree_malignancy_vals', $dao->getDicValues("diag_cancer_degree_malignancy_id"));
	//	$smarty->assign('diag_cancer_tnm_stage_t_vals', $dao->getDicValues("diag_cancer_tnm_stage_t_id"));
	//	$smarty->assign('diag_cancer_tnm_stage_n_vals', $dao->getDicValues("diag_cancer_tnm_stage_n_id"));
	//	$smarty->assign('diag_cancer_tnm_stage_m_vals', $dao->getDicValues("diag_cancer_tnm_stage_m_id"));
	//	$smarty->assign('diag_cancer_clin_stage_vals', $dao->getDicValues("diag_cancer_clin_stage_id"));
	//	$smarty->assign('diag_cancer_ecog_status_vals', $dao->getDicValues("diag_cancer_ecog_status_id"));
}


function fill_investigation_form_by_dic($invest_name,$smarty, $dao){
	switch($invest_name){
		case 'ovarian_general_data':
			fill_inv_general_data_form_by_dic($smarty, $dao);
			break;
		case 'ovarian_instrument':
			fill_inv_instrument_form_by_dic($smarty, $dao);
			break;
		case 'ovarian_lab':
			fill_inv_lab_form_by_dic($smarty, $dao);
			break;
		case 'ovarian_therapy_continue':
			fill_inv_therapy_continue_form_by_dic($smarty, $dao);
			break;
		case 'ovarian_tumor_response':
			fill_inv_tumor_response_form_by_dic($smarty, $dao);
			break;
		default: throw new Exception("No such invest_name: " . $invest_name);
	}
}

function fill_inv_general_data_form_by_dic($smarty, $dao){
	//$smarty->assign('patient_vals', $dao->getDicValues("patient_id"));
	$smarty->assign('nationality_vals', $dao->getDicValues("nationality_id"));
	$smarty->assign('place_living_vals', $dao->getDicValues("place_living_id"));
	$smarty->assign('education_vals', $dao->getDicValues("education_id"));
	$smarty->assign('social_economic_status_vals', $dao->getDicValues("social_economic_status_id"));
	$smarty->assign('diag_cancer_tnm_stage_t_vals', $dao->getDicValues("diag_cancer_tnm_stage_t_id"));
	$smarty->assign('diag_cancer_tnm_stage_n_vals', $dao->getDicValues("diag_cancer_tnm_stage_n_id"));
	$smarty->assign('diag_cancer_tnm_stage_m_vals', $dao->getDicValues("diag_cancer_tnm_stage_m_id"));
	$smarty->assign('diag_cancer_clin_stage_vals', $dao->getDicValues("diag_cancer_clin_stage_id"));
	$smarty->assign('surgical_treat_yes_no_vals', $dao->getDicValues("surgical_treat_yes_no_id"));
	$smarty->assign('surgical_treat_ecstir_yes_no_vals', $dao->getDicValues("surgical_treat_ecstir_yes_no_id"));
	$smarty->assign('surgical_treatment_gister01_yes_no_vals', $dao->getDicValues("surgical_treatment_gister01_yes_no_id"));
	$smarty->assign('surgical_treatment_gister02_yes_no_vals', $dao->getDicValues("surgical_treatment_gister02_yes_no_id"));
	$smarty->assign('surgical_treatment_gister03_yes_no_vals', $dao->getDicValues("surgical_treatment_gister03_yes_no_id"));
	$smarty->assign('surgical_treatment_diag_laparotomia_yes_no_vals', $dao->getDicValues("surgical_treatment_diag_laparotomia_yes_no_id"));
	$smarty->assign('surgical_treatment_diag_laparoscopia_yes_no_vals', $dao->getDicValues("surgical_treatment_diag_laparoscopia_yes_no_id"));
	$smarty->assign('surgical_treatment_explorat_laparotomia_yes_no_vals', $dao->getDicValues("surgical_treatment_explorat_laparotomia_yes_no_id"));
	$smarty->assign('chem_treat_yes_no_vals', $dao->getDicValues("chem_treat_yes_no_id"));
	$smarty->assign('chem_treat_antracyc_yes_no_vals', $dao->getDicValues("chem_treat_antracyc_yes_no_id"));
	$smarty->assign('chem_treat_platina_yes_no_vals', $dao->getDicValues("chem_treat_platina_yes_no_id"));
	$smarty->assign('chem_treat_taxans_yes_no_vals', $dao->getDicValues("chem_treat_taxans_yes_no_id"));
	$smarty->assign('chem_treat_cyclophosph_yes_no_vals', $dao->getDicValues("chem_treat_cyclophosph_yes_no_id"));
	$smarty->assign('chem_treat_other_yes_no_vals', $dao->getDicValues("chem_treat_other_yes_no_id"));
	$smarty->assign('progress_ca125_yes_no_vals', $dao->getDicValues("progress_ca125_yes_no_id"));
	$smarty->assign('progress_instr_mrt_yes_no_vals', $dao->getDicValues("progress_instr_mrt_yes_no_id"));
	$smarty->assign('progress_instr_mrt_norm_yes_no_vals', $dao->getDicValues("progress_instr_mrt_norm_yes_no_id"));
	$smarty->assign('progress_instr_us_yes_no_vals', $dao->getDicValues("progress_instr_us_yes_no_id"));
	$smarty->assign('progress_instr_us_norm_yes_no_vals', $dao->getDicValues("progress_instr_us_norm_yes_no_id"));
	$smarty->assign('progress_instr_kt_yes_no_vals', $dao->getDicValues("progress_instr_kt_yes_no_id"));
	$smarty->assign('progress_instr_kt_norm_yes_no_vals', $dao->getDicValues("progress_instr_kt_norm_yes_no_id"));
	$smarty->assign('progress_instr_ekg_yes_no_vals', $dao->getDicValues("progress_instr_ekg_yes_no_id"));
	$smarty->assign('progress_instr_ekg_norm_yes_no_vals', $dao->getDicValues("progress_instr_ekg_norm_yes_no_id"));
	$smarty->assign('recidive_yes_no_vals', $dao->getDicValues("recidive_yes_no_id"));
	$smarty->assign('metastases_yes_no_vals', $dao->getDicValues("metastases_yes_no_id"));
	$smarty->assign('metastases_lung_yes_no_vals', $dao->getDicValues("metastases_lung_yes_no_id"));
	$smarty->assign('metastases_hepat_yes_no_vals', $dao->getDicValues("metastases_hepat_yes_no_id"));
	$smarty->assign('metastases_osteo_yes_no_vals', $dao->getDicValues("metastases_osteo_yes_no_id"));
	$smarty->assign('metastases_renal_yes_no_vals', $dao->getDicValues("metastases_renal_yes_no_id"));
	$smarty->assign('metastases_lymph_nodes_yes_no_vals', $dao->getDicValues("metastases_lymph_nodes_yes_no_id"));
	$smarty->assign('metastases_plevra_yes_no_vals', $dao->getDicValues("metastases_plevra_yes_no_id"));
	$smarty->assign('metastases_surgical_treat_yes_no_vals', $dao->getDicValues("metastases_surgical_treat_yes_no_id"));
	$smarty->assign('chem_1st_line_treat_yes_no_vals', $dao->getDicValues("chem_1st_line_treat_yes_no_id"));
	$smarty->assign('chem_1st_karboplatin_yes_no_vals', $dao->getDicValues("chem_1st_karboplatin_yes_no_id"));
	$smarty->assign('chem_1st_cisplatin_yes_no_vals', $dao->getDicValues("chem_1st_cisplatin_yes_no_id"));
	$smarty->assign('chem_1st_ciklofosfan_yes_no_vals', $dao->getDicValues("chem_1st_ciklofosfan_yes_no_id"));
	$smarty->assign('chem_1st_paklitaksel_yes_no_vals', $dao->getDicValues("chem_1st_paklitaksel_yes_no_id"));
	$smarty->assign('chem_1st_doksorubicin_yes_no_vals', $dao->getDicValues("chem_1st_doksorubicin_yes_no_id"));
	$smarty->assign('chem_1st_bevacizumab_yes_no_vals', $dao->getDicValues("chem_1st_bevacizumab_yes_no_id"));
	$smarty->assign('chem_1st_topotekan_yes_no_vals', $dao->getDicValues("chem_1st_topotekan_yes_no_id"));
	$smarty->assign('chem_1st_gemcitabin_yes_no_vals', $dao->getDicValues("chem_1st_gemcitabin_yes_no_id"));
	$smarty->assign('chem_1st_vinorelbin_yes_no_vals', $dao->getDicValues("chem_1st_vinorelbin_yes_no_id"));
	$smarty->assign('chem_1st_irinotekan_yes_no_vals', $dao->getDicValues("chem_1st_irinotekan_yes_no_id"));
	$smarty->assign('chem_1st_etopozid_yes_no_vals', $dao->getDicValues("chem_1st_etopozid_yes_no_id"));
	$smarty->assign('chem_1st_epirubicin_yes_no_vals', $dao->getDicValues("chem_1st_epirubicin_yes_no_id"));
	$smarty->assign('chem_1st_docetaxel_yes_no_vals', $dao->getDicValues("chem_1st_docetaxel_yes_no_id"));
	$smarty->assign('chem_1st_oksaliplatin_yes_no_vals', $dao->getDicValues("chem_1st_oksaliplatin_yes_no_id"));
	$smarty->assign('chem_1st_trabektidin_yes_no_vals', $dao->getDicValues("chem_1st_trabektidin_yes_no_id"));
	$smarty->assign('chem_1st_other_yes_no_vals', $dao->getDicValues("chem_1st_other_yes_no_id"));
	$smarty->assign('chem_2st_trabectedin_yes_no_vals', $dao->getDicValues("chem_2st_trabectedin_yes_no_id"));
	$smarty->assign('chem_2st_pld_yes_no_vals', $dao->getDicValues("chem_2st_pld_yes_no_id"));
	$smarty->assign('chem_2st_doxopeg_yes_no_vals', $dao->getDicValues("chem_2st_doxopeg_yes_no_id"));
	$smarty->assign('chem_2st_kelix_yes_no_vals', $dao->getDicValues("chem_2st_kelix_yes_no_id"));
	$smarty->assign('chem_2st_doksorubicin_yes_no_vals', $dao->getDicValues("chem_2st_doksorubicin_yes_no_id"));
	$smarty->assign('chem_2st_other_yes_no_vals', $dao->getDicValues("chem_2st_other_yes_no_id"));
	$smarty->assign('undesirable_event_yes_no_vals', $dao->getDicValues("undesirable_event_yes_no_id"));
}

function fill_inv_instrument_form_by_dic($smarty, $dao){
	$smarty->assign('instr_mrt_yes_no_vals', $dao->getDicValues("instr_mrt_yes_no_id"));
	$smarty->assign('instr_mrt_norm_yes_no_vals', $dao->getDicValues("instr_mrt_norm_yes_no_id"));
	$smarty->assign('instr_us_yes_no_vals', $dao->getDicValues("instr_us_yes_no_id"));
	$smarty->assign('instr_us_norm_yes_no_vals', $dao->getDicValues("instr_us_norm_yes_no_id"));
	$smarty->assign('instr_kt_yes_no_vals', $dao->getDicValues("instr_kt_yes_no_id"));
	$smarty->assign('instr_kt_norm_yes_no_vals', $dao->getDicValues("instr_kt_norm_yes_no_id"));
	$smarty->assign('instr_ekg_yes_no_vals', $dao->getDicValues("instr_ekg_yes_no_id"));
	$smarty->assign('instr_ekg_norm_yes_no_vals', $dao->getDicValues("instr_ekg_norm_yes_no_id"));
}
function fill_inv_lab_form_by_dic($smarty, $dao){
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
function fill_inv_therapy_continue_form_by_dic($smarty, $dao){
	$smarty->assign('therap_trab_continue_yes_no_vals', $dao->getDicValues("therap_trab_continue_yes_no_id"));
	$smarty->assign('therap_trab_continue_no_cause_vals', $dao->getDicValues("therap_trab_continue_no_cause_id"));
}
function fill_inv_tumor_response_form_by_dic($smarty, $dao){
	$smarty->assign('full_response_yes_no_vals', $dao->getDicValues("full_response_yes_no_id"));
	$smarty->assign('partial_response_yes_no_vals', $dao->getDicValues("partial_response_yes_no_id"));
	$smarty->assign('progress_desease_yes_no_vals', $dao->getDicValues("progress_desease_yes_no_id"));
	$smarty->assign('stabilization_desease_yes_no_vals', $dao->getDicValues("stabilization_desease_yes_no_id"));
}
function russianDateToMysqlDate($param){
	$date = str_replace('/', '-', $param);
	return date('Y-m-d', strtotime($date));
}