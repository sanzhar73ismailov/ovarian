<?php
// session_start();
include_once 'includes/config.php';
include_once 'includes/class_entity.php';
include_once 'includes/class_patient.php';
include_once 'includes/class_investigation.php';
include_once 'includes/class_therapy.php';
include_once 'includes/class_visit_dao.php';
include_once 'includes/util_functions.php';
include_once 'includes/class_util_date.php';
include_once('includes/log4php/Logger.php');
Logger::configure('config.xml');
class Dao {
	private $pdo;
	private $user;
	private $userObject;
	private $visitDao;
	private $log;
	function __construct() {
		$this->connect ();
		$this->user = $_SESSION ["user"] ['username_email'];
		// $this->user = "test_user";
		$this->visitDao = new VisitDao ( $this->pdo, $this->user );
		$this->userObject = $this->getUserByLogin ( $this->user );
		$this->log = Logger::getLogger(__CLASS__);
	}
	function __destruct() {
		// $this->pdo = null;
	}
	public function connect() {
		if ($this->pdo == null) {
			$connect_string = sprintf ( 'mysql:host=%s;dbname=%s', HOST, DB_NAME );
			$this->pdo = new PDO ( $connect_string, DB_USER, DB_PASS, array (
			PDO::ATTR_PERSISTENT => true
			) );
			$this->pdo->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			$this->pdo->query ( "SET NAMES 'utf8'" );
		}
	}
	public function getUserObject() {
		return $this->userObject;
	}
	public function getDicValues($ref_id) {
		$results = array ();
		if (endsWithYesNoId ( $ref_id )) {
			$results [] = new Dictionary ( '1', 'да' );
			$results [] = new Dictionary ( '0', 'нет' );
			return $results;
		}
		$isNoDataDic = $this->isNoDataDic ( $ref_id );
		$orValueId = "";
		if ($isNoDataDic) {
			$orValueId = " OR t.value_id='-1' ";
		}
		$query = sprintf ( "SELECT t.value_id, t.value_name FROM %sdic_val t
		where t.dic_list_id='%s' %s order by t.value_id", DB_PREFIX, $ref_id, $orValueId );
		try {
			$stmt = $this->pdo->query ( $query );
			foreach ( $stmt as $row ) {
				$results [] = new Dictionary ( $row ['value_id'], $row ['value_name'] );
			}
			// print_r($query);
			// echo "<br/>";
			// print_r($results);
			// echo "<br/>";
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $results;
	}
	public function getDicValue($ref_id, $id) {
		$dicVals = $this->getDicValues ( $ref_id );
		foreach ( $dicVals as $dic ) {
			if ($dic->id == $id) {
				return $dic;
			}
		}
		throw new Exception ( "no ref_id $ref_id wjith id=$id " );
	}
	public function isNoDataDic($ref_id) {
		$result = false;
		$query = "SELECT is_no_data FROM " . DB_PREFIX . "dic_list t where t.id='" . $ref_id . "'";
		try {
			$stmt = $this->pdo->query ( $query );
			$results = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			if (count ( $results ) == 0) {
				throw new Exception ( "Нет такого справочника: " . $ref_id );
			}
			// print_r($results);
			// echo "<br/>";
			$result = ($results [0] ['is_no_data'] == 1);
			// var_dump($result);
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $result;
	}
	public function addDicValue($dic_name, $value) {
		$results = array ();

		$query = sprintf ( "INSERT INTO %s (id, name) VALUE(null, '%s') ", DB_PREFIX . $dic_name, $value );
		// echo "1:" . $query . "\n<br>";
		try {
			$result = $this->pdo->exec ( $query );
			$dic = new Dictionary ( $this->pdo->lastInsertId (), $value );
			// echo $query . "\n<br>";
		} catch ( PDOException $ex ) {
			// echo "Ошибка:" . $ex->getMessage();
			$this->log->error($ex);
			return new Dictionary ( 0, "Такой вариант уже есть" );
		}
		return $dic;
	}
	public function getPatients() {
		$results = array ();
		$query = "SELECT
				  p.id,
				  p.patient_number,
				  p.hospital_id,
				  p.doctor,
				  p.status_include,
				  dv.value_name hospital_name,
				  DATE_FORMAT(p.insert_date,'%d/%m/%Y') as insert_date
				  FROM " . DB_PREFIX . "patient p
				  INNER JOIN  " . DB_PREFIX . "dic_val dv on (p.hospital_id=dv.value_id)
				  WHERE dv.dic_list_id='hospital_id'";
		/*
		 * select p.*, dv.value_name
		 * from ovarian_patient p
		 * inner join ovarian_dic_val dv on (p.hospital_id=dv.value_id)
		 * where dv.dic_list_id='hospital_id'
		 */

		if ($this->userObject->isInvestigator ()) {
			$query .= " AND hospital_id = '" . $this->userObject->hospital_id . "'";
		}
		// var_dump($this->userObject);
		// echo "<br/><br/>";
		// var_dump($this->userObject['role_id']);
		// echo "<br/><br/>";
		// var_dump($query);
		try {
			$stmt = $this->pdo->query ( $query );
			$results = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if (count ( $results ) == 0) {
			return null;
		}
		return $results;
	}
	public function getPatient($id) {
		$row = array ();
		$query = "SELECT
				  p.*
				FROM 
				  " . DB_PREFIX . "patient p
				  WHERE p.id = :id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_INT );
			// $stmt->bindValue(':name', $name, PDO::PARAM_STR);
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new Patient ();
		$entity->id = $row [0] ['id'];
		$entity->patient_number = $row [0] ['patient_number'];
		$entity->hospital_id = $row [0] ['hospital_id'];
		$entity->doctor = $row [0] ['doctor'];
		$entity->status_include = $row [0] ['status_include'];
		$entity->user = $row [0] ['user'];
		$entity->insert_date = $row [0] ['insert_date'];
		return $entity;
	}
	public function is_patient_exist($patient_number) {
		$row = array ();
		$query = "SELECT 1 FROM " . DB_PREFIX . "patient WHERE patient_number = :patient_number";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':patient_number', $patient_number, PDO::PARAM_STR );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if ($stmt->rowCount () == 0) {
			return false;
		}
		return true;
	}
	public function getInvestCommonMethod($invest_name_no_prefix, $patient_id, $visit_id) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . $invest_name_no_prefix . " WHERE patient_id=:patient_id AND visit_id=:visit_id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':patient_id', $patient_id, PDO::PARAM_INT );
			$stmt->bindValue ( ':visit_id', $visit_id, PDO::PARAM_INT );
			// $stmt->bindValue(':name', $name, PDO::PARAM_STR);
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $row;
	}
	public function getAdverseEventDetailsByAeId($adverse_event_id) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . "adverse_event_detail" . " WHERE adverse_event_id=:adverse_event_id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':adverse_event_id', $adverse_event_id, PDO::PARAM_INT );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $row;
	}
	public function getAdverseEventDetail($id) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . "adverse_event_detail" . " WHERE id=:id";
		$entity = null;
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_INT );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			if (count ( $row ) == 0) {
				return null;
			}
			$entity = new InvestAdverseEventDetail ();
			$entity->id = $row [0] ['id'];
			$entity->name = $row [0] ['name'];
			$entity->adverse_event_id = $row [0] ['adverse_event_id'];
			$entity->serious_yes_no_id = $row [0] ['serious_yes_no_id'];
			$entity->start_date = $row [0] ['start_date'];
			$entity->resolved_yes_no_id = $row [0] ['resolved_yes_no_id'];
			$entity->resolved_date = $row [0] ['resolved_date'];
			$entity->event_intensity_decreased_yes_no_id = $row [0] ['event_intensity_decreased_yes_no_id'];
			$entity->event_occurred_again_yes_no_id = $row [0] ['event_occurred_again_yes_no_id'];
			$entity->event_associated_with_drug_yes_no_id = $row [0] ['event_associated_with_drug_yes_no_id'];
			return $entity;
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage();
			$this->log->error($ex);
		}
		return $entity;
	}
	public function getAdverseEvent($id) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . "adverse_event" . " WHERE id=:id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_INT );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $row [0];
	}
	public function getInvestGeneralData($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "general_data", $patient_id, $visit_id );
		$entity = new InvestGeneralData ();
		if (count ( $row ) == 0) {
			return null;

			// return $entity;
		}

		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->visit_date = $row [0] ['visit_date'];
		$entity->date_birth = $row [0] ['date_birth'];
		$entity->weight_kg = $row [0] ['weight_kg'];
		$entity->height_sm = $row [0] ['height_sm'];
		$entity->nationality_id = $row [0] ['nationality_id'];
		$entity->nationality_if_other = $row [0] ['nationality_if_other'];
		$entity->place_living_id = $row [0] ['place_living_id'];
		$entity->education_id = $row [0] ['education_id'];
		$entity->social_economic_status_id = $row [0] ['social_economic_status_id'];
		$entity->diag_cancer_estab_date = $row [0] ['diag_cancer_estab_date'];
		$entity->diag_cancer_tnm_stage_t_id = $row [0] ['diag_cancer_tnm_stage_t_id'];
		$entity->diag_cancer_tnm_stage_n_id = $row [0] ['diag_cancer_tnm_stage_n_id'];
		$entity->diag_cancer_tnm_stage_m_id = $row [0] ['diag_cancer_tnm_stage_m_id'];
		$entity->diag_cancer_clin_stage_id = $row [0] ['diag_cancer_clin_stage_id'];
		$entity->surgical_treat_yes_no_id = $row [0] ['surgical_treat_yes_no_id'];
		$entity->surgical_treat_ecstir_yes_no_id = $row [0] ['surgical_treat_ecstir_yes_no_id'];
		$entity->surgical_treat_ecstir_date = $row [0] ['surgical_treat_ecstir_date'];
		$entity->surgical_treatment_gister01_yes_no_id = $row [0] ['surgical_treatment_gister01_yes_no_id'];
		$entity->surgical_treatment_gister01_date = $row [0] ['surgical_treatment_gister01_date'];
		$entity->surgical_treatment_gister02_yes_no_id = $row [0] ['surgical_treatment_gister02_yes_no_id'];
		$entity->surgical_treatment_gister02_date = $row [0] ['surgical_treatment_gister02_date'];
		$entity->surgical_treatment_gister03_yes_no_id = $row [0] ['surgical_treatment_gister03_yes_no_id'];
		$entity->surgical_treatment_gister03_date = $row [0] ['surgical_treatment_gister03_date'];
		$entity->surgical_treatment_diag_laparotomia_yes_no_id = $row [0] ['surgical_treatment_diag_laparotomia_yes_no_id'];
		$entity->surgical_treatment_diag_laparotomia_date = $row [0] ['surgical_treatment_diag_laparotomia_date'];
		$entity->surgical_treatment_diag_laparoscopia_yes_no_id = $row [0] ['surgical_treatment_diag_laparoscopia_yes_no_id'];
		$entity->surgical_treatment_diag_laparoscopia_date = $row [0] ['surgical_treatment_diag_laparoscopia_date'];
		$entity->surgical_treatment_explorat_laparotomia_yes_no_id = $row [0] ['surgical_treatment_explorat_laparotomia_yes_no_id'];
		$entity->surgical_treatment_explorat_laparotomia_date = $row [0] ['surgical_treatment_explorat_laparotomia_date'];
		$entity->chem_treat_yes_no_id = $row [0] ['chem_treat_yes_no_id'];
		$entity->chem_treat_antracyc_yes_no_id = $row [0] ['chem_treat_antracyc_yes_no_id'];
		$entity->chem_treat_platina_yes_no_id = $row [0] ['chem_treat_platina_yes_no_id'];
		$entity->chem_treat_taxans_yes_no_id = $row [0] ['chem_treat_taxans_yes_no_id'];
		$entity->chem_treat_cyclophosph_yes_no_id = $row [0] ['chem_treat_cyclophosph_yes_no_id'];
		$entity->chem_treat_other_yes_no_id = $row [0] ['chem_treat_other_yes_no_id'];
		$entity->chem_treat_other_descr = $row [0] ['chem_treat_other_descr'];
		$entity->progress_date = $row [0] ['progress_date'];
		$entity->progress_ca125_yes_no_id = $row [0] ['progress_ca125_yes_no_id'];
		$entity->progress_ca125 = $row [0] ['progress_ca125'];
		$entity->progress_instr_mrt_yes_no_id = $row [0] ['progress_instr_mrt_yes_no_id'];
		$entity->progress_instr_mrt_date = $row [0] ['progress_instr_mrt_date'];
		$entity->progress_instr_mrt_norm_yes_no_id = $row [0] ['progress_instr_mrt_norm_yes_no_id'];
		$entity->progress_instr_mrt_descr = $row [0] ['progress_instr_mrt_descr'];
		$entity->progress_instr_us_yes_no_id = $row [0] ['progress_instr_us_yes_no_id'];
		$entity->progress_instr_us_date = $row [0] ['progress_instr_us_date'];
		$entity->progress_instr_us_norm_yes_no_id = $row [0] ['progress_instr_us_norm_yes_no_id'];
		$entity->progress_instr_us_descr = $row [0] ['progress_instr_us_descr'];
		$entity->progress_instr_kt_yes_no_id = $row [0] ['progress_instr_kt_yes_no_id'];
		$entity->progress_instr_kt_date = $row [0] ['progress_instr_kt_date'];
		$entity->progress_instr_kt_norm_yes_no_id = $row [0] ['progress_instr_kt_norm_yes_no_id'];
		$entity->progress_instr_kt_descr = $row [0] ['progress_instr_kt_descr'];
		$entity->progress_instr_ekg_yes_no_id = $row [0] ['progress_instr_ekg_yes_no_id'];
		$entity->progress_instr_ekg_date = $row [0] ['progress_instr_ekg_date'];
		$entity->progress_instr_ekg_norm_yes_no_id = $row [0] ['progress_instr_ekg_norm_yes_no_id'];
		$entity->progress_instr_ekg_descr = $row [0] ['progress_instr_ekg_descr'];
		$entity->recidive_yes_no_id = $row [0] ['recidive_yes_no_id'];
		$entity->metastases_yes_no_id = $row [0] ['metastases_yes_no_id'];
		$entity->metastases_lung_yes_no_id = $row [0] ['metastases_lung_yes_no_id'];
		$entity->metastases_lung_date = $row [0] ['metastases_lung_date'];
		$entity->metastases_hepat_yes_no_id = $row [0] ['metastases_hepat_yes_no_id'];
		$entity->metastases_hepat_date = $row [0] ['metastases_hepat_date'];
		$entity->metastases_osteo_yes_no_id = $row [0] ['metastases_osteo_yes_no_id'];
		$entity->metastases_osteo_date = $row [0] ['metastases_osteo_date'];
		$entity->metastases_renal_yes_no_id = $row [0] ['metastases_renal_yes_no_id'];
		$entity->metastases_renal_date = $row [0] ['metastases_renal_date'];
		$entity->metastases_lymph_nodes_yes_no_id = $row [0] ['metastases_lymph_nodes_yes_no_id'];
		$entity->metastases_lymph_nodes_date = $row [0] ['metastases_lymph_nodes_date'];
		$entity->metastases_plevra_yes_no_id = $row [0] ['metastases_plevra_yes_no_id'];
		$entity->metastases_plevra_date = $row [0] ['metastases_plevra_date'];
		$entity->metastases_other_descr = $row [0] ['metastases_other_descr'];
		$entity->metastases_surgical_treat_yes_no_id = $row [0] ['metastases_surgical_treat_yes_no_id'];
		$entity->metastases_surgical_treat_date = $row [0] ['metastases_surgical_treat_date'];
		$entity->metastases_surgical_treat_descr = $row [0] ['metastases_surgical_treat_descr'];
		$entity->chem_1st_line_treat_yes_no_id = $row [0] ['chem_1st_line_treat_yes_no_id'];
		$entity->chem_1st_karboplatin_yes_no_id = $row [0] ['chem_1st_karboplatin_yes_no_id'];
		$entity->chem_1st_cisplatin_yes_no_id = $row [0] ['chem_1st_cisplatin_yes_no_id'];
		$entity->chem_1st_ciklofosfan_yes_no_id = $row [0] ['chem_1st_ciklofosfan_yes_no_id'];
		$entity->chem_1st_paklitaksel_yes_no_id = $row [0] ['chem_1st_paklitaksel_yes_no_id'];
		$entity->chem_1st_doksorubicin_yes_no_id = $row [0] ['chem_1st_doksorubicin_yes_no_id'];
		$entity->chem_1st_bevacizumab_yes_no_id = $row [0] ['chem_1st_bevacizumab_yes_no_id'];
		$entity->chem_1st_topotekan_yes_no_id = $row [0] ['chem_1st_topotekan_yes_no_id'];
		$entity->chem_1st_gemcitabin_yes_no_id = $row [0] ['chem_1st_gemcitabin_yes_no_id'];
		$entity->chem_1st_vinorelbin_yes_no_id = $row [0] ['chem_1st_vinorelbin_yes_no_id'];
		$entity->chem_1st_irinotekan_yes_no_id = $row [0] ['chem_1st_irinotekan_yes_no_id'];
		$entity->chem_1st_etopozid_yes_no_id = $row [0] ['chem_1st_etopozid_yes_no_id'];
		$entity->chem_1st_epirubicin_yes_no_id = $row [0] ['chem_1st_epirubicin_yes_no_id'];
		$entity->chem_1st_docetaxel_yes_no_id = $row [0] ['chem_1st_docetaxel_yes_no_id'];
		$entity->chem_1st_oksaliplatin_yes_no_id = $row [0] ['chem_1st_oksaliplatin_yes_no_id'];
		$entity->chem_1st_trabektidin_yes_no_id = $row [0] ['chem_1st_trabektidin_yes_no_id'];
		$entity->chem_1st_other_yes_no_id = $row [0] ['chem_1st_other_yes_no_id'];
		$entity->chem_1st_other_descr = $row [0] ['chem_1st_other_descr'];
		$entity->chem_1st_date_start = $row [0] ['chem_1st_date_start'];
		$entity->chem_1st_date_finish = $row [0] ['chem_1st_date_finish'];
		$entity->chem_1st_course_number = $row [0] ['chem_1st_course_number'];
		$entity->chem_1st_concomitant_therapy_descr = $row [0] ['chem_1st_concomitant_therapy_descr'];
		$entity->chem_2st_trabectedin_yes_no_id = $row [0] ['chem_2st_trabectedin_yes_no_id'];
		$entity->chem_2st_trabectedin_dose = $row [0] ['chem_2st_trabectedin_dose'];
		$entity->chem_2st_pld_yes_no_id = $row [0] ['chem_2st_pld_yes_no_id'];
		$entity->chem_2st_pld_dose = $row [0] ['chem_2st_pld_dose'];
		$entity->chem_2st_doxopeg_yes_no_id = $row [0] ['chem_2st_doxopeg_yes_no_id'];
		$entity->chem_2st_doxopeg_dose = $row [0] ['chem_2st_doxopeg_dose'];
		$entity->chem_2st_kelix_yes_no_id = $row [0] ['chem_2st_kelix_yes_no_id'];
		$entity->chem_2st_kelix_dose = $row [0] ['chem_2st_kelix_dose'];
		$entity->chem_2st_doksorubicin_yes_no_id = $row [0] ['chem_2st_doksorubicin_yes_no_id'];
		$entity->chem_2st_doksorubicin_dose = $row [0] ['chem_2st_doksorubicin_dose'];
		$entity->chem_2st_other_yes_no_id = $row [0] ['chem_2st_other_yes_no_id'];
		$entity->chem_2st_other_dose = $row [0] ['chem_2st_other_dose'];
		$entity->chem_2st_concomitant_therapy_descr = $row [0] ['chem_2st_concomitant_therapy_descr'];
		$entity->undesirable_event_yes_no_id = $row [0] ['undesirable_event_yes_no_id'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		$entity->insert_date = $row [0] ['insert_date'];
		return $entity;
	}
	public function getInvestInstrument($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "instrument", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestInstrument ();
		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->instr_mrt_yes_no_id = $row [0] ['instr_mrt_yes_no_id'];
		$entity->instr_mrt_date = $row [0] ['instr_mrt_date'];
		$entity->instr_mrt_norm_yes_no_id = $row [0] ['instr_mrt_norm_yes_no_id'];
		$entity->instr_mrt_descr = $row [0] ['instr_mrt_descr'];
		$entity->instr_us_yes_no_id = $row [0] ['instr_us_yes_no_id'];
		$entity->instr_us_date = $row [0] ['instr_us_date'];
		$entity->instr_us_norm_yes_no_id = $row [0] ['instr_us_norm_yes_no_id'];
		$entity->instr_us_descr = $row [0] ['instr_us_descr'];
		$entity->instr_kt_yes_no_id = $row [0] ['instr_kt_yes_no_id'];
		$entity->instr_kt_date = $row [0] ['instr_kt_date'];
		$entity->instr_kt_norm_yes_no_id = $row [0] ['instr_kt_norm_yes_no_id'];
		$entity->instr_kt_descr = $row [0] ['instr_kt_descr'];
		$entity->instr_ekg_yes_no_id = $row [0] ['instr_ekg_yes_no_id'];
		$entity->instr_ekg_date = $row [0] ['instr_ekg_date'];
		$entity->instr_ekg_norm_yes_no_id = $row [0] ['instr_ekg_norm_yes_no_id'];
		$entity->instr_ekg_descr = $row [0] ['instr_ekg_descr'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		return $entity;
	}
	public function getInvestLab($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "lab", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestLab ();
		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->visit_date = $row [0] ['visit_date'];
		$entity->ca125_yes_no_id = $row [0] ['ca125_yes_no_id'];
		$entity->ca125 = $row [0] ['ca125'];
		$entity->ca125_date = $row [0] ['ca125_date'];
		$entity->oak_yes_no_id = $row [0] ['oak_yes_no_id'];
		$entity->oak_date = $row [0] ['oak_date'];
		$entity->oak_hb = $row [0] ['oak_hb'];
		$entity->oak_er = $row [0] ['oak_er'];
		$entity->oak_leuc = $row [0] ['oak_leuc'];
		$entity->oak_tr = $row [0] ['oak_tr'];
		$entity->oak_netr = $row [0] ['oak_netr'];
		$entity->bc_yes_no_id = $row [0] ['bc_yes_no_id'];
		$entity->bc_protein_yes_no_id = $row [0] ['bc_protein_yes_no_id'];
		$entity->bc_protein = $row [0] ['bc_protein'];
		$entity->bc_protein_date = $row [0] ['bc_protein_date'];
		$entity->bc_bilirubin_yes_no_id = $row [0] ['bc_bilirubin_yes_no_id'];
		$entity->bc_bilirubin_total_yes_no_id = $row [0] ['bc_bilirubin_total_yes_no_id'];
		$entity->bc_bilirubin_total = $row [0] ['bc_bilirubin_total'];
		$entity->bc_bilirubin_total_date = $row [0] ['bc_bilirubin_total_date'];
		$entity->bc_bilirubin_direct_yes_no_id = $row [0] ['bc_bilirubin_direct_yes_no_id'];
		$entity->bc_bilirubin_direct = $row [0] ['bc_bilirubin_direct'];
		$entity->bc_bilirubin_direct_date = $row [0] ['bc_bilirubin_direct_date'];
		$entity->bc_bilirubin_nondirect_yes_no_id = $row [0] ['bc_bilirubin_nondirect_yes_no_id'];
		$entity->bc_bilirubin_nondirect = $row [0] ['bc_bilirubin_nondirect'];
		$entity->bc_bilirubin_nondirect_date = $row [0] ['bc_bilirubin_nondirect_date'];
		$entity->bc_ast_yes_no_id = $row [0] ['bc_ast_yes_no_id'];
		$entity->bc_ast = $row [0] ['bc_ast'];
		$entity->bc_ast_date = $row [0] ['bc_ast_date'];
		$entity->bc_alt_yes_no_id = $row [0] ['bc_alt_yes_no_id'];
		$entity->bc_alt = $row [0] ['bc_alt'];
		$entity->bc_alt_date = $row [0] ['bc_alt_date'];
		$entity->bc_creat_yes_no_id = $row [0] ['bc_creat_yes_no_id'];
		$entity->bc_creat = $row [0] ['bc_creat'];
		$entity->bc_creat_date = $row [0] ['bc_creat_date'];
		$entity->bc_alk_phosphatase_yes_no_id = $row [0] ['bc_alk_phosphatase_yes_no_id'];
		$entity->bc_alk_phosphatase = $row [0] ['bc_alk_phosphatase'];
		$entity->bc_alk_phosphatase_date = $row [0] ['bc_alk_phosphatase_date'];
		$entity->bc_mochevina_yes_no_id = $row [0] ['bc_mochevina_yes_no_id'];
		$entity->bc_mochevina = $row [0] ['bc_mochevina'];
		$entity->bc_mochevina_date = $row [0] ['bc_mochevina_date'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		$entity->insert_date = $row [0] ['insert_date'];
		return $entity;
	}
	public function getInvestTherapyContinue($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "therapy_continue", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestTherapyContinue ();
		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->therap_trab_continue_yes_no_id = $row [0] ['therap_trab_continue_yes_no_id'];
		$entity->therap_trab_continue_no_cause_id = $row [0] ['therap_trab_continue_no_cause_id'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		$entity->insert_date = $row [0] ['insert_date'];
		return $entity;
	}
	public function getInvestTumorResponse($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "tumor_response", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestTumorResponse ();
		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->full_response_yes_no_id = $row [0] ['full_response_yes_no_id'];
		$entity->partial_response_yes_no_id = $row [0] ['partial_response_yes_no_id'];
		$entity->progress_desease_yes_no_id = $row [0] ['progress_desease_yes_no_id'];
		$entity->stabilization_desease_yes_no_id = $row [0] ['stabilization_desease_yes_no_id'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		$entity->insert_date = $row [0] ['insert_date'];
		return $entity;
	}
	public function getInvestAdverseEvent($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "adverse_event", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestAdverseEvent ();
		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->adverse_event_yes_no_id = $row [0] ['adverse_event_yes_no_id'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		$entity->insert_date = $row [0] ['insert_date'];

		$rowsAdEvDetals = $this->getAdverseEventDetailsByAeId ( $entity->id );
		foreach ( $rowsAdEvDetals as $rowAdEvDetail ) {
			$entityDetail = new InvestAdverseEventDetail ();
			$entityDetail->id = $rowAdEvDetail ['id'];
			$entityDetail->name = $rowAdEvDetail ['name'];
			$entityDetail->adverse_event_id = $rowAdEvDetail ['adverse_event_id'];
			$entityDetail->serious_yes_no_id = $rowAdEvDetail ['serious_yes_no_id'];
			$entityDetail->start_date = $rowAdEvDetail ['start_date'];
			$entityDetail->resolved_yes_no_id = $rowAdEvDetail ['resolved_yes_no_id'];
			$entityDetail->resolved_date = $rowAdEvDetail ['resolved_date'];
			$entityDetail->event_intensity_decreased_yes_no_id = $rowAdEvDetail ['event_intensity_decreased_yes_no_id'];
			$entityDetail->event_occurred_again_yes_no_id = $rowAdEvDetail ['event_occurred_again_yes_no_id'];
			$entityDetail->event_associated_with_drug_yes_no_id = $rowAdEvDetail ['event_associated_with_drug_yes_no_id'];
			$entity->adverseEventDetails [] = $entityDetail;
		}

		return $entity;
	}
	public function getInvestInclusion($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "inclusion", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestInclusion();
		$entity->id=$row[0]['id'];
		$entity->patient_id=$row[0]['patient_id'];
		$entity->visit_id=$row[0]['visit_id'];
		$entity->age_18_and_more_yes_no_id=$row[0]['age_18_and_more_yes_no_id'];
		$entity->histol_confirmed_cr_yes_no_id=$row[0]['histol_confirmed_cr_yes_no_id'];
		$entity->ecog01_yes_no_id=$row[0]['ecog01_yes_no_id'];
		$entity->recurrent_plat_sensit_cancer_yes_no_id=$row[0]['recurrent_plat_sensit_cancer_yes_no_id'];
		$entity->treatment_trabect_after_doxorub_yes_no_id=$row[0]['treatment_trabect_after_doxorub_yes_no_id'];
		$entity->received_no_more_one_line_plat_chem_regimes_yes_no_id=$row[0]['received_no_more_one_line_plat_chem_regimes_yes_no_id'];
		$entity->doct_decision_trabectedin_yes_no_id=$row[0]['doct_decision_trabectedin_yes_no_id'];
		$entity->signed_consent_yes_no_id=$row[0]['signed_consent_yes_no_id'];
		$entity->age_18_less_yes_no_id=$row[0]['age_18_less_yes_no_id'];
		$entity->received_more_two_line_plat_chem_yes_no_id=$row[0]['received_more_two_line_plat_chem_yes_no_id'];
		$entity->platinum_refractory_ov_cr_yes_no_id=$row[0]['platinum_refractory_ov_cr_yes_no_id'];
		$entity->platinum_resistant_ov_cr_yes_no_id=$row[0]['platinum_resistant_ov_cr_yes_no_id'];
		$entity->refusal_central_venous_catheter_yes_no_id=$row[0]['refusal_central_venous_catheter_yes_no_id'];
		$entity->impaired_hepatic_function_yes_no_id=$row[0]['impaired_hepatic_function_yes_no_id'];
		$entity->impaired_renal_function_yes_no_id=$row[0]['impaired_renal_function_yes_no_id'];
		$entity->impaired_hematological_parameters_yes_no_id=$row[0]['impaired_hematological_parameters_yes_no_id'];
		$entity->impaired_cardiovascular_function_yes_no_id=$row[0]['impaired_cardiovascular_function_yes_no_id'];
		$entity->kaposi_sarcoma_yes_no_id=$row[0]['kaposi_sarcoma_yes_no_id'];
		$entity->pregnancy_yes_no_id=$row[0]['pregnancy_yes_no_id'];
		$entity->checked = $row [0] ['checked'];
		$entity->user=$row[0]['user'];
		$entity->insert_date=$row[0]['insert_date'];
		return $entity;
	}
	public function getInvestConcomitantTherapy($patient_id, $visit_id) {
		$row = $this->getInvestCommonMethod ( "concomitant_therapy", $patient_id, $visit_id );
		if (count ( $row ) == 0) {
			return null;
		}
		$entity = new InvestConcomitantTherapy();
		$entity->id = $row [0] ['id'];
		$entity->patient_id = $row [0] ['patient_id'];
		$entity->visit_id = $row [0] ['visit_id'];
		$entity->chem_2st_concomitant_therapy_descr = $row [0] ['chem_2st_concomitant_therapy_descr'];
		$entity->checked = $row [0] ['checked'];
		$entity->user = $row [0] ['user'];
		return $entity;
	}
	public function getInvestigation($id) {
		$row = array();
		$query = "SELECT * from " . DB_PREFIX . "investigation WHERE id=:id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_INT );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $row[0];
	}
	public function getCheckedStatusOfInvestigation($id, $table_name) {
		$row = array();
		$query = "SELECT checked from " . $table_name . " WHERE id=:id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_INT );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $row[0]['checked'];
	}
	private function getNullIfStringEmpty($str) {
		$str = strval ( $str );
		// echo strlen ($str) . "<br>";
		if (strlen ( $str ) == 0) {
			return 'null';
		}
		return "'" . $str . "'";
	}
	public function getUserByLogin($username) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . "user WHERE username_email = :username_email";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':username_email', $username, PDO::PARAM_STR );

			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if ($stmt->rowCount () == 0) {
			return null;
		}
		$object = new User ();
		$object->id = $row [0] ['id'];
		$object->username_email = $row [0] ['username_email'];
		$object->password = $row [0] ['password'];
		$object->last_name = $row [0] ['last_name'];
		$object->first_name = $row [0] ['first_name'];
		$object->patronymic_name = $row [0] ['patronymic_name'];
		$object->sex_id = $row [0] ['sex_id'];
		$object->date_birth = $row [0] ['date_birth'];
		$object->project = $row [0] ['project'];
		$object->comments = $row [0] ['comments'];
		$object->role_id = $row [0] ['role_id'];
		$object->hospital_id = $row [0] ['hospital_id'];
		$object->phone = $row [0] ['phone'];
		return $object;
	}
	public function getUsersByRole($role_id) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . "user WHERE role_id = :role_id";
		$users = array ();
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':role_id', $role_id, PDO::PARAM_STR );

			$stmt->execute ();
			$rows = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		foreach ( $rows as $row ) {
			$object = new User ();
			$object->id = $row ['id'];
			$object->username_email = $row ['username_email'];
			$object->password = $row ['password'];
			$object->last_name = $row ['last_name'];
			$object->first_name = $row ['first_name'];
			$object->patronymic_name = $row ['patronymic_name'];
			$object->sex_id = $row ['sex_id'];
			$object->date_birth = $row ['date_birth'];
			$object->project = $row ['project'];
			$object->comments = $row ['comments'];
			$object->role_id = $row ['role_id'];
			$object->hospital_id = $row ['hospital_id'];
			$users [] = $object;
		}
		return $users;
	}
	public function getUserEmailsOfAdminAndSupervisors() {
		if(SEND_MAIL_TO_TEST_ADDR){
			return explode(",", TEST_EMAILS);
		}
		$emailArray = array ();
		$adminUsers = $this->getUsersByRole ( "admin" );
		$supervisorUsers = $this->getUsersByRole ( "supervisor" );
		$monitorUsers = $this->getUsersByRole ( "monitor" );
		foreach ( $adminUsers as $user ) {
			$emailArray [] = $user->username_email;
		}
		foreach ( $supervisorUsers as $user ) {
			$emailArray [] = $user->username_email;
		}
		foreach ( $monitorUsers as $user ) {
			$emailArray [] = $user->username_email;
		}
		return $emailArray;
	}
	public function getUserEmailsOfMonitorsAndAdmin() {
		if(SEND_MAIL_TO_TEST_ADDR){
			return explode(",", TEST_EMAILS);
		}
		$emailArray = array ();
		$adminUsers = $this->getUsersByRole ( "admin" );
		$monitorUsers = $this->getUsersByRole ( "monitor" );

		foreach ( $adminUsers as $user ) {
			$emailArray [] = $user->username_email;
		}
		foreach ( $monitorUsers as $user ) {
			$emailArray [] = $user->username_email;
		}
		return $emailArray;
	}

	public function getUserAndAdminEmails($user_email) {
		$emailArray = array ();
		if(SEND_MAIL_TO_TEST_ADDR){
			$emailArray [] = TEST_USER_EMAIL;
		}else{
			$emailArray [] = trim($user_email);
		}
		$adminUsers = $this->getUsersByRole ( "admin" );
		foreach ( $adminUsers as $user ) {
			$emailArray [] = $user->username_email;
		}
		return $emailArray;
	}

	public function getUserEmail($user_email) {
		if(SEND_MAIL_TO_TEST_ADDR){
			return TEST_USER_EMAIL;
		}
		return trim($user_email);
	}
	public function is_user_exist($username, $pass = null) {
		$row = array ();
		$query = "SELECT * FROM " . DB_PREFIX . "user WHERE username_email = :username_email AND active=1";
		if ($pass != null) {
			// echo "<h1>asdasd</h1>";
			$query .= " AND password = :password";
		}
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':username_email', $username, PDO::PARAM_STR );
			if ($pass != null) {
				$stmt->bindValue ( ':password', $pass, PDO::PARAM_STR );
			}
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if ($stmt->rowCount () == 0) {
			return false;
		}
		return true;
	}
	public function activate_user($user_name) {
		$query = "UPDATE
			  `" . DB_PREFIX . "user`  
			SET 
			  `active` = 1
			  WHERE 
			  `username_email` = :username_email
			;";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':username_email', $user_name, PDO::PARAM_STR );

		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();

			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' строка добавлена';
			if ($affected_rows > 0) {
				return true;
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return false;
	}
	public function insert_user($object) {
		$query = "INSERT INTO
		  `" . DB_PREFIX . "user`
		(
		  `id`,
		  `username_email`,
		   `password`,
		  `last_name`,
		  `first_name`,
		  `patronymic_name`,
		  `sex_id`,
		  `date_birth`,
		  `project`,
		  `comments`
		  ) 
		VALUE (
		  null,
		  :username_email,
		  :password,
		  :last_name,
		  :first_name,
		  :patronymic_name,
		  :sex_id,
		  :date_birth,
		  :project,
		  :comments
		);";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':username_email', $object->username_email, PDO::PARAM_STR );
		$stmt->bindValue ( ':password', $object->password, PDO::PARAM_STR );
		$stmt->bindValue ( ':last_name', $object->last_name, PDO::PARAM_STR );
		$stmt->bindValue ( ':first_name', $object->first_name, PDO::PARAM_STR );
		$stmt->bindValue ( ':patronymic_name', $object->patronymic_name, PDO::PARAM_STR );
		$stmt->bindValue ( ':sex_id', $object->sex_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':date_birth', $object->date_birth, PDO::PARAM_STR );
		$stmt->bindValue ( ':project', $object->project, PDO::PARAM_STR );
		$stmt->bindValue ( ':comments', $object->comments, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				die ( "Ошибка, объект не сохранен" );
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_user_visit($object) {
		$query = "INSERT INTO
		  `" . DB_PREFIX . "user_visit`
		(
		  `id`,
		  `username`
		   		  ) 
		VALUE (
		  null,
		  :username
		);";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':username', $object->username_email, PDO::PARAM_STR );

		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();

			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				die ( "Ошибка, объект не сохранен" );
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function getYearDateFromRussianString($dateRus) {
		if (strlen ( $dateRus ) == 0) {
			return "null";
		}
		$parts = explode ( '/', $dateRus );
		return "'$parts[2]'";
	}
	public function getUniqueDoctorNames() {
		return $this->getUniqueNames ( "doctor" );
	}
	public function getUniqueHospitalNames() {
		return $this->getUniqueNames ( "hospital" );
	}
	public function getUniqueNames($column) {
		$results = array ();
		$arrayReturn = array ();
		$query = sprintf ( 'SELECT DISTINCT(%1$s) as name from kras_patient WHERE %1$s is not null ORDER BY %1$s', $column );
		try {
			$stmt = $this->pdo->query ( $query );
			$results = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if (count ( $results ) == 0) {
			return "";
		}
		foreach ( $results as $key => $value ) {
			$arrayReturn [] = $value ['name'];
		}
		return $arrayReturn;
	}
	public function getVisitTable($patient_id) {
		return $this->visitDao->getTable ( $patient_id );
	}
	public function getHeaderNames() {
		// $visitDao = new VisitDao($this->pdo, $this->user);
		return $this->visitDao->getHeaderNames ();
	}
	public function getVisitDao() {
		return $this->visitDao;
	}
	public function getRowById($table, $id) {
		$row = array ();
		$query = sprintf ( "select * from %s where id=:id", DB_PREFIX . $table );
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_STR );
			$stmt->execute ();
			$row = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			return $row [0];
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
			throw $ex;
		}
		return $row;
	}

	/**
	 * Меняет статус включения пациента в исследование
	 * @param $status_include - Статус включения: 1 - включен; 0 - не включен; -1 - не заполняли критерии включения (по умолчанию)
	 */
	public function update_patient_status_include($patient_id, $status_include) {
		$query = "UPDATE
				  " . DB_PREFIX . "patient
				SET
				  status_include = :status_include
				WHERE
				  id = :id
				";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':status_include', $status_include, PDO::PARAM_INT );
		// 		echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			//echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
			throw $ex;
		}
	}


	/**
	 * standart insert start
	 */
	public function insert_patient($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "patient
				(
				  patient_number,
				  hospital_id,
				  doctor,
				  user
				)
				VALUE (
				  :patient_number,
				  :hospital_id,
				  :doctor,
				  :user
				)";
		$stmt = $this->pdo->prepare ( $query );
		// $stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_number', $entity->patient_number, PDO::PARAM_STR );
		$stmt->bindValue ( ':hospital_id', $entity->hospital_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':doctor', $entity->doctor, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				die ( "Ошибка, объект не сохранен" );
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_generalData($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "general_data
				(
				  patient_id,
				  visit_id,
				  visit_date,
				  date_birth,
				  weight_kg,
				  height_sm,
				  nationality_id,
				  nationality_if_other,
				  place_living_id,
				  education_id,
				  social_economic_status_id,
				  diag_cancer_estab_date,
				  diag_cancer_tnm_stage_t_id,
				  diag_cancer_tnm_stage_n_id,
				  diag_cancer_tnm_stage_m_id,
				  diag_cancer_clin_stage_id,
				  surgical_treat_yes_no_id,
				  surgical_treat_ecstir_yes_no_id,
				  surgical_treat_ecstir_date,
				  surgical_treatment_gister01_yes_no_id,
				  surgical_treatment_gister01_date,
				  surgical_treatment_gister02_yes_no_id,
				  surgical_treatment_gister02_date,
				  surgical_treatment_gister03_yes_no_id,
				  surgical_treatment_gister03_date,
				  surgical_treatment_diag_laparotomia_yes_no_id,
				  surgical_treatment_diag_laparotomia_date,
				  surgical_treatment_diag_laparoscopia_yes_no_id,
				  surgical_treatment_diag_laparoscopia_date,
				  surgical_treatment_explorat_laparotomia_yes_no_id,
				  surgical_treatment_explorat_laparotomia_date,
				  chem_treat_yes_no_id,
				  chem_treat_antracyc_yes_no_id,
				  chem_treat_platina_yes_no_id,
				  chem_treat_taxans_yes_no_id,
				  chem_treat_cyclophosph_yes_no_id,
				  chem_treat_other_yes_no_id,
				  chem_treat_other_descr,
				  progress_date,
				  progress_ca125_yes_no_id,
				  progress_ca125,
				  progress_instr_mrt_yes_no_id,
				  progress_instr_mrt_date,
				  progress_instr_mrt_norm_yes_no_id,
				  progress_instr_mrt_descr,
				  progress_instr_us_yes_no_id,
				  progress_instr_us_date,
				  progress_instr_us_norm_yes_no_id,
				  progress_instr_us_descr,
				  progress_instr_kt_yes_no_id,
				  progress_instr_kt_date,
				  progress_instr_kt_norm_yes_no_id,
				  progress_instr_kt_descr,
				  progress_instr_ekg_yes_no_id,
				  progress_instr_ekg_date,
				  progress_instr_ekg_norm_yes_no_id,
				  progress_instr_ekg_descr,
				  recidive_yes_no_id,
				  metastases_yes_no_id,
				  metastases_lung_yes_no_id,
				  metastases_lung_date,
				  metastases_hepat_yes_no_id,
				  metastases_hepat_date,
				  metastases_osteo_yes_no_id,
				  metastases_osteo_date,
				  metastases_renal_yes_no_id,
				  metastases_renal_date,
				  metastases_lymph_nodes_yes_no_id,
				  metastases_lymph_nodes_date,
				  metastases_plevra_yes_no_id,
				  metastases_plevra_date,
				  metastases_other_descr,
				  metastases_surgical_treat_yes_no_id,
				  metastases_surgical_treat_date,
				  metastases_surgical_treat_descr,
				  chem_1st_line_treat_yes_no_id,
				  chem_1st_karboplatin_yes_no_id,
				  chem_1st_cisplatin_yes_no_id,
				  chem_1st_ciklofosfan_yes_no_id,
				  chem_1st_paklitaksel_yes_no_id,
				  chem_1st_doksorubicin_yes_no_id,
				  chem_1st_bevacizumab_yes_no_id,
				  chem_1st_topotekan_yes_no_id,
				  chem_1st_gemcitabin_yes_no_id,
				  chem_1st_vinorelbin_yes_no_id,
				  chem_1st_irinotekan_yes_no_id,
				  chem_1st_etopozid_yes_no_id,
				  chem_1st_epirubicin_yes_no_id,
				  chem_1st_docetaxel_yes_no_id,
				  chem_1st_oksaliplatin_yes_no_id,
				  chem_1st_trabektidin_yes_no_id,
				  chem_1st_other_yes_no_id,
				  chem_1st_other_descr,
				  chem_1st_date_start,
				  chem_1st_date_finish,
				  chem_1st_course_number,
				  chem_1st_concomitant_therapy_descr,
				  chem_2st_trabectedin_yes_no_id,
				  chem_2st_trabectedin_dose,
				  chem_2st_pld_yes_no_id,
				  chem_2st_pld_dose,
				  chem_2st_doxopeg_yes_no_id,
				  chem_2st_doxopeg_dose,
				  chem_2st_kelix_yes_no_id,
				  chem_2st_kelix_dose,
				  chem_2st_doksorubicin_yes_no_id,
				  chem_2st_doksorubicin_dose,
				  chem_2st_other_yes_no_id,
				  chem_2st_other_dose,
				  chem_2st_concomitant_therapy_descr,
				  undesirable_event_yes_no_id,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :visit_date,
				  :date_birth,
				  :weight_kg,
				  :height_sm,
				  :nationality_id,
				  :nationality_if_other,
				  :place_living_id,
				  :education_id,
				  :social_economic_status_id,
				  :diag_cancer_estab_date,
				  :diag_cancer_tnm_stage_t_id,
				  :diag_cancer_tnm_stage_n_id,
				  :diag_cancer_tnm_stage_m_id,
				  :diag_cancer_clin_stage_id,
				  :surgical_treat_yes_no_id,
				  :surgical_treat_ecstir_yes_no_id,
				  :surgical_treat_ecstir_date,
				  :surgical_treatment_gister01_yes_no_id,
				  :surgical_treatment_gister01_date,
				  :surgical_treatment_gister02_yes_no_id,
				  :surgical_treatment_gister02_date,
				  :surgical_treatment_gister03_yes_no_id,
				  :surgical_treatment_gister03_date,
				  :surgical_treatment_diag_laparotomia_yes_no_id,
				  :surgical_treatment_diag_laparotomia_date,
				  :surgical_treatment_diag_laparoscopia_yes_no_id,
				  :surgical_treatment_diag_laparoscopia_date,
				  :surgical_treatment_explorat_laparotomia_yes_no_id,
				  :surgical_treatment_explorat_laparotomia_date,
				  :chem_treat_yes_no_id,
				  :chem_treat_antracyc_yes_no_id,
				  :chem_treat_platina_yes_no_id,
				  :chem_treat_taxans_yes_no_id,
				  :chem_treat_cyclophosph_yes_no_id,
				  :chem_treat_other_yes_no_id,
				  :chem_treat_other_descr,
				  :progress_date,
				  :progress_ca125_yes_no_id,
				  :progress_ca125,
				  :progress_instr_mrt_yes_no_id,
				  :progress_instr_mrt_date,
				  :progress_instr_mrt_norm_yes_no_id,
				  :progress_instr_mrt_descr,
				  :progress_instr_us_yes_no_id,
				  :progress_instr_us_date,
				  :progress_instr_us_norm_yes_no_id,
				  :progress_instr_us_descr,
				  :progress_instr_kt_yes_no_id,
				  :progress_instr_kt_date,
				  :progress_instr_kt_norm_yes_no_id,
				  :progress_instr_kt_descr,
				  :progress_instr_ekg_yes_no_id,
				  :progress_instr_ekg_date,
				  :progress_instr_ekg_norm_yes_no_id,
				  :progress_instr_ekg_descr,
				  :recidive_yes_no_id,
				  :metastases_yes_no_id,
				  :metastases_lung_yes_no_id,
				  :metastases_lung_date,
				  :metastases_hepat_yes_no_id,
				  :metastases_hepat_date,
				  :metastases_osteo_yes_no_id,
				  :metastases_osteo_date,
				  :metastases_renal_yes_no_id,
				  :metastases_renal_date,
				  :metastases_lymph_nodes_yes_no_id,
				  :metastases_lymph_nodes_date,
				  :metastases_plevra_yes_no_id,
				  :metastases_plevra_date,
				  :metastases_other_descr,
				  :metastases_surgical_treat_yes_no_id,
				  :metastases_surgical_treat_date,
				  :metastases_surgical_treat_descr,
				  :chem_1st_line_treat_yes_no_id,
				  :chem_1st_karboplatin_yes_no_id,
				  :chem_1st_cisplatin_yes_no_id,
				  :chem_1st_ciklofosfan_yes_no_id,
				  :chem_1st_paklitaksel_yes_no_id,
				  :chem_1st_doksorubicin_yes_no_id,
				  :chem_1st_bevacizumab_yes_no_id,
				  :chem_1st_topotekan_yes_no_id,
				  :chem_1st_gemcitabin_yes_no_id,
				  :chem_1st_vinorelbin_yes_no_id,
				  :chem_1st_irinotekan_yes_no_id,
				  :chem_1st_etopozid_yes_no_id,
				  :chem_1st_epirubicin_yes_no_id,
				  :chem_1st_docetaxel_yes_no_id,
				  :chem_1st_oksaliplatin_yes_no_id,
				  :chem_1st_trabektidin_yes_no_id,
				  :chem_1st_other_yes_no_id,
				  :chem_1st_other_descr,
				  :chem_1st_date_start,
				  :chem_1st_date_finish,
				  :chem_1st_course_number,
				  :chem_1st_concomitant_therapy_descr,
				  :chem_2st_trabectedin_yes_no_id,
				  :chem_2st_trabectedin_dose,
				  :chem_2st_pld_yes_no_id,
				  :chem_2st_pld_dose,
				  :chem_2st_doxopeg_yes_no_id,
				  :chem_2st_doxopeg_dose,
				  :chem_2st_kelix_yes_no_id,
				  :chem_2st_kelix_dose,
				  :chem_2st_doksorubicin_yes_no_id,
				  :chem_2st_doksorubicin_dose,
				  :chem_2st_other_yes_no_id,
				  :chem_2st_other_dose,
				  :chem_2st_concomitant_therapy_descr,
				  :undesirable_event_yes_no_id,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		// $stmt->bindValue(':id', $entity->id, PDO::PARAM_STR);
		// $stmt->bindValue(':id', $entity->id, PDO::PARAM_STR);
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_date', $entity->visit_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':date_birth', $entity->date_birth, PDO::PARAM_STR );
		$stmt->bindValue ( ':weight_kg', $entity->weight_kg, PDO::PARAM_STR );
		$stmt->bindValue ( ':height_sm', $entity->height_sm, PDO::PARAM_STR );
		$stmt->bindValue ( ':nationality_id', $entity->nationality_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':nationality_if_other', $entity->nationality_if_other, PDO::PARAM_STR );
		$stmt->bindValue ( ':place_living_id', $entity->place_living_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':education_id', $entity->education_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':social_economic_status_id', $entity->social_economic_status_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_estab_date', $entity->diag_cancer_estab_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_tnm_stage_t_id', $entity->diag_cancer_tnm_stage_t_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_tnm_stage_n_id', $entity->diag_cancer_tnm_stage_n_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_tnm_stage_m_id', $entity->diag_cancer_tnm_stage_m_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_clin_stage_id', $entity->diag_cancer_clin_stage_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treat_yes_no_id', $entity->surgical_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treat_ecstir_yes_no_id', $entity->surgical_treat_ecstir_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treat_ecstir_date', $entity->surgical_treat_ecstir_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister01_yes_no_id', $entity->surgical_treatment_gister01_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister01_date', $entity->surgical_treatment_gister01_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister02_yes_no_id', $entity->surgical_treatment_gister02_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister02_date', $entity->surgical_treatment_gister02_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister03_yes_no_id', $entity->surgical_treatment_gister03_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister03_date', $entity->surgical_treatment_gister03_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparotomia_yes_no_id', $entity->surgical_treatment_diag_laparotomia_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparotomia_date', $entity->surgical_treatment_diag_laparotomia_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparoscopia_yes_no_id', $entity->surgical_treatment_diag_laparoscopia_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparoscopia_date', $entity->surgical_treatment_diag_laparoscopia_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_explorat_laparotomia_yes_no_id', $entity->surgical_treatment_explorat_laparotomia_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_explorat_laparotomia_date', $entity->surgical_treatment_explorat_laparotomia_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_yes_no_id', $entity->chem_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_antracyc_yes_no_id', $entity->chem_treat_antracyc_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_platina_yes_no_id', $entity->chem_treat_platina_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_taxans_yes_no_id', $entity->chem_treat_taxans_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_cyclophosph_yes_no_id', $entity->chem_treat_cyclophosph_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_other_yes_no_id', $entity->chem_treat_other_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_other_descr', $entity->chem_treat_other_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_date', $entity->progress_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_ca125_yes_no_id', $entity->progress_ca125_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_ca125', $entity->progress_ca125, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_yes_no_id', $entity->progress_instr_mrt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_date', $entity->progress_instr_mrt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_norm_yes_no_id', $entity->progress_instr_mrt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_descr', $entity->progress_instr_mrt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_yes_no_id', $entity->progress_instr_us_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_date', $entity->progress_instr_us_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_norm_yes_no_id', $entity->progress_instr_us_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_descr', $entity->progress_instr_us_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_yes_no_id', $entity->progress_instr_kt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_date', $entity->progress_instr_kt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_norm_yes_no_id', $entity->progress_instr_kt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_descr', $entity->progress_instr_kt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_yes_no_id', $entity->progress_instr_ekg_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_date', $entity->progress_instr_ekg_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_norm_yes_no_id', $entity->progress_instr_ekg_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_descr', $entity->progress_instr_ekg_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':recidive_yes_no_id', $entity->recidive_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_yes_no_id', $entity->metastases_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lung_yes_no_id', $entity->metastases_lung_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lung_date', $entity->metastases_lung_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_hepat_yes_no_id', $entity->metastases_hepat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_hepat_date', $entity->metastases_hepat_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_osteo_yes_no_id', $entity->metastases_osteo_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_osteo_date', $entity->metastases_osteo_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_renal_yes_no_id', $entity->metastases_renal_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_renal_date', $entity->metastases_renal_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lymph_nodes_yes_no_id', $entity->metastases_lymph_nodes_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lymph_nodes_date', $entity->metastases_lymph_nodes_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_plevra_yes_no_id', $entity->metastases_plevra_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_plevra_date', $entity->metastases_plevra_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_other_descr', $entity->metastases_other_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_surgical_treat_yes_no_id', $entity->metastases_surgical_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_surgical_treat_date', $entity->metastases_surgical_treat_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_surgical_treat_descr', $entity->metastases_surgical_treat_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_line_treat_yes_no_id', $entity->chem_1st_line_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_karboplatin_yes_no_id', $entity->chem_1st_karboplatin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_cisplatin_yes_no_id', $entity->chem_1st_cisplatin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_ciklofosfan_yes_no_id', $entity->chem_1st_ciklofosfan_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_paklitaksel_yes_no_id', $entity->chem_1st_paklitaksel_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_doksorubicin_yes_no_id', $entity->chem_1st_doksorubicin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_bevacizumab_yes_no_id', $entity->chem_1st_bevacizumab_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_topotekan_yes_no_id', $entity->chem_1st_topotekan_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_gemcitabin_yes_no_id', $entity->chem_1st_gemcitabin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_vinorelbin_yes_no_id', $entity->chem_1st_vinorelbin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_irinotekan_yes_no_id', $entity->chem_1st_irinotekan_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_etopozid_yes_no_id', $entity->chem_1st_etopozid_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_epirubicin_yes_no_id', $entity->chem_1st_epirubicin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_docetaxel_yes_no_id', $entity->chem_1st_docetaxel_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_oksaliplatin_yes_no_id', $entity->chem_1st_oksaliplatin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_trabektidin_yes_no_id', $entity->chem_1st_trabektidin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_other_yes_no_id', $entity->chem_1st_other_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_other_descr', $entity->chem_1st_other_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_date_start', $entity->chem_1st_date_start, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_date_finish', $entity->chem_1st_date_finish, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_course_number', $entity->chem_1st_course_number, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_concomitant_therapy_descr', $entity->chem_1st_concomitant_therapy_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_trabectedin_yes_no_id', $entity->chem_2st_trabectedin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_trabectedin_dose', $entity->chem_2st_trabectedin_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_pld_yes_no_id', $entity->chem_2st_pld_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_pld_dose', $entity->chem_2st_pld_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doxopeg_yes_no_id', $entity->chem_2st_doxopeg_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doxopeg_dose', $entity->chem_2st_doxopeg_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_kelix_yes_no_id', $entity->chem_2st_kelix_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_kelix_dose', $entity->chem_2st_kelix_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doksorubicin_yes_no_id', $entity->chem_2st_doksorubicin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doksorubicin_dose', $entity->chem_2st_doksorubicin_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_other_yes_no_id', $entity->chem_2st_other_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_other_dose', $entity->chem_2st_other_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_concomitant_therapy_descr', $entity->chem_2st_concomitant_therapy_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':undesirable_event_yes_no_id', $entity->undesirable_event_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' исследований добавлено';
			// if($affected_rows < 1){
			// die("Ошибка, объект не сохранен");
			// }
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_instrument($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "instrument
				(
				  patient_id,
				  visit_id,
				  instr_mrt_yes_no_id,
				  instr_mrt_date,
				  instr_mrt_norm_yes_no_id,
				  instr_mrt_descr,
				  instr_us_yes_no_id,
				  instr_us_date,
				  instr_us_norm_yes_no_id,
				  instr_us_descr,
				  instr_kt_yes_no_id,
				  instr_kt_date,
				  instr_kt_norm_yes_no_id,
				  instr_kt_descr,
				  instr_ekg_yes_no_id,
				  instr_ekg_date,
				  instr_ekg_norm_yes_no_id,
				  instr_ekg_descr,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :instr_mrt_yes_no_id,
				  :instr_mrt_date,
				  :instr_mrt_norm_yes_no_id,
				  :instr_mrt_descr,
				  :instr_us_yes_no_id,
				  :instr_us_date,
				  :instr_us_norm_yes_no_id,
				  :instr_us_descr,
				  :instr_kt_yes_no_id,
				  :instr_kt_date,
				  :instr_kt_norm_yes_no_id,
				  :instr_kt_descr,
				  :instr_ekg_yes_no_id,
				  :instr_ekg_date,
				  :instr_ekg_norm_yes_no_id,
				  :instr_ekg_descr,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_yes_no_id', $entity->instr_mrt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_date', $entity->instr_mrt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_norm_yes_no_id', $entity->instr_mrt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_descr', $entity->instr_mrt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_yes_no_id', $entity->instr_us_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_date', $entity->instr_us_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_norm_yes_no_id', $entity->instr_us_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_descr', $entity->instr_us_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_yes_no_id', $entity->instr_kt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_date', $entity->instr_kt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_norm_yes_no_id', $entity->instr_kt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_descr', $entity->instr_kt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_yes_no_id', $entity->instr_ekg_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_date', $entity->instr_ekg_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_norm_yes_no_id', $entity->instr_ekg_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_descr', $entity->instr_ekg_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_lab($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "lab
				(
				  patient_id,
				  visit_id,
				  visit_date,
				  ca125_yes_no_id,
				  ca125,
				  ca125_date,
				  oak_yes_no_id,
				  oak_date,
				  oak_hb,
				  oak_er,
				  oak_leuc,
				  oak_tr,
				  oak_netr,
				  bc_yes_no_id,
				  bc_protein_yes_no_id,
				  bc_protein,
				  bc_protein_date,
				  bc_bilirubin_yes_no_id,
				  bc_bilirubin_total_yes_no_id,
				  bc_bilirubin_total,
				  bc_bilirubin_total_date,
				  bc_bilirubin_direct_yes_no_id,
				  bc_bilirubin_direct,
				  bc_bilirubin_direct_date,
				  bc_bilirubin_nondirect_yes_no_id,
				  bc_bilirubin_nondirect,
				  bc_bilirubin_nondirect_date,
				  bc_ast_yes_no_id,
				  bc_ast,
				  bc_ast_date,
				  bc_alt_yes_no_id,
				  bc_alt,
				  bc_alt_date,
				  bc_creat_yes_no_id,
				  bc_creat,
				  bc_creat_date,
				  bc_alk_phosphatase_yes_no_id,
				  bc_alk_phosphatase,
				  bc_alk_phosphatase_date,
				  bc_mochevina_yes_no_id,
				  bc_mochevina,
				  bc_mochevina_date,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :visit_date,
				  :ca125_yes_no_id,
				  :ca125,
				  :ca125_date,
				  :oak_yes_no_id,
				  :oak_date,
				  :oak_hb,
				  :oak_er,
				  :oak_leuc,
				  :oak_tr,
				  :oak_netr,
				  :bc_yes_no_id,
				  :bc_protein_yes_no_id,
				  :bc_protein,
				  :bc_protein_date,
				  :bc_bilirubin_yes_no_id,
				  :bc_bilirubin_total_yes_no_id,
				  :bc_bilirubin_total,
				  :bc_bilirubin_total_date,
				  :bc_bilirubin_direct_yes_no_id,
				  :bc_bilirubin_direct,
				  :bc_bilirubin_direct_date,
				  :bc_bilirubin_nondirect_yes_no_id,
				  :bc_bilirubin_nondirect,
				  :bc_bilirubin_nondirect_date,
				  :bc_ast_yes_no_id,
				  :bc_ast,
				  :bc_ast_date,
				  :bc_alt_yes_no_id,
				  :bc_alt,
				  :bc_alt_date,
				  :bc_creat_yes_no_id,
				  :bc_creat,
				  :bc_creat_date,
				  :bc_alk_phosphatase_yes_no_id,
				  :bc_alk_phosphatase,
				  :bc_alk_phosphatase_date,
				  :bc_mochevina_yes_no_id,
				  :bc_mochevina,
				  :bc_mochevina_date,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_date', $entity->visit_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':ca125_yes_no_id', $entity->ca125_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':ca125', $entity->ca125, PDO::PARAM_STR );
		$stmt->bindValue ( ':ca125_date', $entity->ca125_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_yes_no_id', $entity->oak_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_date', $entity->oak_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_hb', $entity->oak_hb, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_er', $entity->oak_er, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_leuc', $entity->oak_leuc, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_tr', $entity->oak_tr, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_netr', $entity->oak_netr, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_yes_no_id', $entity->bc_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_protein_yes_no_id', $entity->bc_protein_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_protein', $entity->bc_protein, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_protein_date', $entity->bc_protein_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_yes_no_id', $entity->bc_bilirubin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_total_yes_no_id', $entity->bc_bilirubin_total_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_total', $entity->bc_bilirubin_total, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_total_date', $entity->bc_bilirubin_total_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_direct_yes_no_id', $entity->bc_bilirubin_direct_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_direct', $entity->bc_bilirubin_direct, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_direct_date', $entity->bc_bilirubin_direct_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_nondirect_yes_no_id', $entity->bc_bilirubin_nondirect_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_nondirect', $entity->bc_bilirubin_nondirect, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_nondirect_date', $entity->bc_bilirubin_nondirect_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_ast_yes_no_id', $entity->bc_ast_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_ast', $entity->bc_ast, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_ast_date', $entity->bc_ast_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alt_yes_no_id', $entity->bc_alt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alt', $entity->bc_alt, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alt_date', $entity->bc_alt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_creat_yes_no_id', $entity->bc_creat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_creat', $entity->bc_creat, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_creat_date', $entity->bc_creat_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alk_phosphatase_yes_no_id', $entity->bc_alk_phosphatase_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alk_phosphatase', $entity->bc_alk_phosphatase, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alk_phosphatase_date', $entity->bc_alk_phosphatase_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_mochevina_yes_no_id', $entity->bc_mochevina_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_mochevina', $entity->bc_mochevina, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_mochevina_date', $entity->bc_mochevina_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_tumor_response($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "tumor_response
				(
				  patient_id,
				  visit_id,
				  full_response_yes_no_id,
				  partial_response_yes_no_id,
				  progress_desease_yes_no_id,
				  stabilization_desease_yes_no_id,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :full_response_yes_no_id,
				  :partial_response_yes_no_id,
				  :progress_desease_yes_no_id,
  				  :stabilization_desease_yes_no_id,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':full_response_yes_no_id', $entity->full_response_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':partial_response_yes_no_id', $entity->partial_response_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_desease_yes_no_id', $entity->progress_desease_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':stabilization_desease_yes_no_id', $entity->stabilization_desease_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_therapy_continue($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "therapy_continue
				(
				  patient_id,
				  visit_id,
				  therap_trab_continue_yes_no_id,
  				  therap_trab_continue_no_cause_id,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :therap_trab_continue_yes_no_id,
				  :therap_trab_continue_no_cause_id,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':therap_trab_continue_yes_no_id', $entity->therap_trab_continue_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':therap_trab_continue_no_cause_id', $entity->therap_trab_continue_no_cause_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_adverse_event($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "adverse_event
				(
				  patient_id,
				  visit_id,
				  adverse_event_yes_no_id,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :adverse_event_yes_no_id,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':adverse_event_yes_no_id', $entity->adverse_event_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_adverse_event_detail($entity) {
		// var_dump($entity);
		$query = "INSERT INTO
				  " . DB_PREFIX . "adverse_event_detail
				(
				  name,
				  adverse_event_id,
				  serious_yes_no_id,
				  start_date,
				  resolved_yes_no_id,
				  resolved_date,
				  event_intensity_decreased_yes_no_id,
				  event_occurred_again_yes_no_id,
				  event_associated_with_drug_yes_no_id
				)
				VALUE (
				  :name,
				  :adverse_event_id,
				  :serious_yes_no_id,
				  :start_date,
				  :resolved_yes_no_id,
				  :resolved_date,
				  :event_intensity_decreased_yes_no_id,
				  :event_occurred_again_yes_no_id,
				  :event_associated_with_drug_yes_no_id
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':name', $entity->name, PDO::PARAM_STR );
		$stmt->bindValue ( ':adverse_event_id', $entity->adverse_event_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':serious_yes_no_id', $entity->serious_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':start_date', $entity->start_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':resolved_yes_no_id', $entity->resolved_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':resolved_date', $entity->resolved_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':event_intensity_decreased_yes_no_id', $entity->event_intensity_decreased_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':event_occurred_again_yes_no_id', $entity->event_occurred_again_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':event_associated_with_drug_yes_no_id', $entity->event_associated_with_drug_yes_no_id, PDO::PARAM_STR );

		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_inclusion($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "inclusion
				(
				  patient_id,
				  visit_id,
				  age_18_and_more_yes_no_id,
				  histol_confirmed_cr_yes_no_id,
				  ecog01_yes_no_id,
				  recurrent_plat_sensit_cancer_yes_no_id,
				  treatment_trabect_after_doxorub_yes_no_id,
				  received_no_more_one_line_plat_chem_regimes_yes_no_id,
				  doct_decision_trabectedin_yes_no_id,
				  signed_consent_yes_no_id,
				  age_18_less_yes_no_id,
				  received_more_two_line_plat_chem_yes_no_id,
				  platinum_refractory_ov_cr_yes_no_id,
				  platinum_resistant_ov_cr_yes_no_id,
				  refusal_central_venous_catheter_yes_no_id,
				  impaired_hepatic_function_yes_no_id,
				  impaired_renal_function_yes_no_id,
				  impaired_hematological_parameters_yes_no_id,
				  impaired_cardiovascular_function_yes_no_id,
				  kaposi_sarcoma_yes_no_id,
				  pregnancy_yes_no_id,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :age_18_and_more_yes_no_id,
				  :histol_confirmed_cr_yes_no_id,
				  :ecog01_yes_no_id,
				  :recurrent_plat_sensit_cancer_yes_no_id,
				  :treatment_trabect_after_doxorub_yes_no_id,
				  :received_no_more_one_line_plat_chem_regimes_yes_no_id,
				  :doct_decision_trabectedin_yes_no_id,
				  :signed_consent_yes_no_id,
				  :age_18_less_yes_no_id,
				  :received_more_two_line_plat_chem_yes_no_id,
				  :platinum_refractory_ov_cr_yes_no_id,
				  :platinum_resistant_ov_cr_yes_no_id,
				  :refusal_central_venous_catheter_yes_no_id,
				  :impaired_hepatic_function_yes_no_id,
				  :impaired_renal_function_yes_no_id,
				  :impaired_hematological_parameters_yes_no_id,
				  :impaired_cardiovascular_function_yes_no_id,
				  :kaposi_sarcoma_yes_no_id,
				  :pregnancy_yes_no_id,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':age_18_and_more_yes_no_id', $entity->age_18_and_more_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':histol_confirmed_cr_yes_no_id', $entity->histol_confirmed_cr_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':ecog01_yes_no_id', $entity->ecog01_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':recurrent_plat_sensit_cancer_yes_no_id', $entity->recurrent_plat_sensit_cancer_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':treatment_trabect_after_doxorub_yes_no_id', $entity->treatment_trabect_after_doxorub_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':received_no_more_one_line_plat_chem_regimes_yes_no_id', $entity->received_no_more_one_line_plat_chem_regimes_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':doct_decision_trabectedin_yes_no_id', $entity->doct_decision_trabectedin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':signed_consent_yes_no_id', $entity->signed_consent_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':age_18_less_yes_no_id', $entity->age_18_less_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':received_more_two_line_plat_chem_yes_no_id', $entity->received_more_two_line_plat_chem_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':platinum_refractory_ov_cr_yes_no_id', $entity->platinum_refractory_ov_cr_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':platinum_resistant_ov_cr_yes_no_id', $entity->platinum_resistant_ov_cr_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':refusal_central_venous_catheter_yes_no_id', $entity->refusal_central_venous_catheter_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_hepatic_function_yes_no_id', $entity->impaired_hepatic_function_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_renal_function_yes_no_id', $entity->impaired_renal_function_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_hematological_parameters_yes_no_id', $entity->impaired_hematological_parameters_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_cardiovascular_function_yes_no_id', $entity->impaired_cardiovascular_function_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':kaposi_sarcoma_yes_no_id', $entity->kaposi_sarcoma_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':pregnancy_yes_no_id', $entity->pregnancy_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			$statusInclusion = $entity->getStatusInclusion();
			$this->update_patient_status_include($entity->patient_id, $statusInclusion);
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	public function insert_concomitant_therapy($entity) {
		$query = "INSERT INTO
				  " . DB_PREFIX . "concomitant_therapy
				(
				  patient_id,
				  visit_id,
				  chem_2st_concomitant_therapy_descr,
				  user
				)
				VALUE (
				  :patient_id,
				  :visit_id,
				  :chem_2st_concomitant_therapy_descr,
				  :user
				)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_concomitant_therapy_descr', $entity->chem_2st_concomitant_therapy_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $this->pdo->lastInsertId ();
	}
	/**
	 * standart insert end
	 */

	/**
	 * standart update start
	 */
	public function update_patient($entity) {
		$query = "UPDATE
				  " . DB_PREFIX . "patient
				SET
				  patient_number = :patient_number,
				  hospital_id = :hospital_id,
				  doctor = :doctor,
				  user = :user
				WHERE
				  id = :id
				";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_number', $entity->patient_number, PDO::PARAM_STR );
		$stmt->bindValue ( ':hospital_id', $entity->hospital_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':doctor', $entity->doctor, PDO::PARAM_STR );
		$stmt->bindValue ( ':user', $entity->user, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_generalData($entity) {
		// echo "in update_investigation<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "general_data
		SET
		  patient_id = :patient_id,
		  visit_id = :visit_id,
		  visit_date = :visit_date,
		  date_birth = :date_birth,
		  weight_kg = :weight_kg,
		  height_sm = :height_sm,
		  nationality_id = :nationality_id,
		  nationality_if_other = :nationality_if_other,
		  place_living_id = :place_living_id,
		  education_id = :education_id,
		  social_economic_status_id = :social_economic_status_id,
		  diag_cancer_estab_date = :diag_cancer_estab_date,
		  diag_cancer_tnm_stage_t_id = :diag_cancer_tnm_stage_t_id,
		  diag_cancer_tnm_stage_n_id = :diag_cancer_tnm_stage_n_id,
		  diag_cancer_tnm_stage_m_id = :diag_cancer_tnm_stage_m_id,
		  diag_cancer_clin_stage_id = :diag_cancer_clin_stage_id,
		  surgical_treat_yes_no_id = :surgical_treat_yes_no_id,
		  surgical_treat_ecstir_yes_no_id = :surgical_treat_ecstir_yes_no_id,
		  surgical_treat_ecstir_date = :surgical_treat_ecstir_date,
		  surgical_treatment_gister01_yes_no_id = :surgical_treatment_gister01_yes_no_id,
		  surgical_treatment_gister01_date = :surgical_treatment_gister01_date,
		  surgical_treatment_gister02_yes_no_id = :surgical_treatment_gister02_yes_no_id,
		  surgical_treatment_gister02_date = :surgical_treatment_gister02_date,
		  surgical_treatment_gister03_yes_no_id = :surgical_treatment_gister03_yes_no_id,
		  surgical_treatment_gister03_date = :surgical_treatment_gister03_date,
		  surgical_treatment_diag_laparotomia_yes_no_id = :surgical_treatment_diag_laparotomia_yes_no_id,
		  surgical_treatment_diag_laparotomia_date = :surgical_treatment_diag_laparotomia_date,
		  surgical_treatment_diag_laparoscopia_yes_no_id = :surgical_treatment_diag_laparoscopia_yes_no_id,
		  surgical_treatment_diag_laparoscopia_date = :surgical_treatment_diag_laparoscopia_date,
		  surgical_treatment_explorat_laparotomia_yes_no_id = :surgical_treatment_explorat_laparotomia_yes_no_id,
		  surgical_treatment_explorat_laparotomia_date = :surgical_treatment_explorat_laparotomia_date,
		  chem_treat_yes_no_id = :chem_treat_yes_no_id,
		  chem_treat_antracyc_yes_no_id = :chem_treat_antracyc_yes_no_id,
		  chem_treat_platina_yes_no_id = :chem_treat_platina_yes_no_id,
		  chem_treat_taxans_yes_no_id = :chem_treat_taxans_yes_no_id,
		  chem_treat_cyclophosph_yes_no_id = :chem_treat_cyclophosph_yes_no_id,
		  chem_treat_other_yes_no_id = :chem_treat_other_yes_no_id,
		  chem_treat_other_descr = :chem_treat_other_descr,
		  progress_date = :progress_date,
		  progress_ca125_yes_no_id = :progress_ca125_yes_no_id,
		  progress_ca125 = :progress_ca125,
		  progress_instr_mrt_yes_no_id = :progress_instr_mrt_yes_no_id,
		  progress_instr_mrt_date = :progress_instr_mrt_date,
		  progress_instr_mrt_norm_yes_no_id = :progress_instr_mrt_norm_yes_no_id,
		  progress_instr_mrt_descr = :progress_instr_mrt_descr,
		  progress_instr_us_yes_no_id = :progress_instr_us_yes_no_id,
		  progress_instr_us_date = :progress_instr_us_date,
		  progress_instr_us_norm_yes_no_id = :progress_instr_us_norm_yes_no_id,
		  progress_instr_us_descr = :progress_instr_us_descr,
		  progress_instr_kt_yes_no_id = :progress_instr_kt_yes_no_id,
		  progress_instr_kt_date = :progress_instr_kt_date,
		  progress_instr_kt_norm_yes_no_id = :progress_instr_kt_norm_yes_no_id,
		  progress_instr_kt_descr = :progress_instr_kt_descr,
		  progress_instr_ekg_yes_no_id = :progress_instr_ekg_yes_no_id,
		  progress_instr_ekg_date = :progress_instr_ekg_date,
		  progress_instr_ekg_norm_yes_no_id = :progress_instr_ekg_norm_yes_no_id,
		  progress_instr_ekg_descr = :progress_instr_ekg_descr,
		  recidive_yes_no_id = :recidive_yes_no_id,
		  metastases_yes_no_id = :metastases_yes_no_id,
		  metastases_lung_yes_no_id = :metastases_lung_yes_no_id,
		  metastases_lung_date = :metastases_lung_date,
		  metastases_hepat_yes_no_id = :metastases_hepat_yes_no_id,
		  metastases_hepat_date = :metastases_hepat_date,
		  metastases_osteo_yes_no_id = :metastases_osteo_yes_no_id,
		  metastases_osteo_date = :metastases_osteo_date,
		  metastases_renal_yes_no_id = :metastases_renal_yes_no_id,
		  metastases_renal_date = :metastases_renal_date,
		  metastases_lymph_nodes_yes_no_id = :metastases_lymph_nodes_yes_no_id,
		  metastases_lymph_nodes_date = :metastases_lymph_nodes_date,
		  metastases_plevra_yes_no_id = :metastases_plevra_yes_no_id,
		  metastases_plevra_date = :metastases_plevra_date,
		  metastases_other_descr = :metastases_other_descr,
		  metastases_surgical_treat_yes_no_id = :metastases_surgical_treat_yes_no_id,
		  metastases_surgical_treat_date = :metastases_surgical_treat_date,
		  metastases_surgical_treat_descr = :metastases_surgical_treat_descr,
		  chem_1st_line_treat_yes_no_id = :chem_1st_line_treat_yes_no_id,
		  chem_1st_karboplatin_yes_no_id = :chem_1st_karboplatin_yes_no_id,
		  chem_1st_cisplatin_yes_no_id = :chem_1st_cisplatin_yes_no_id,
		  chem_1st_ciklofosfan_yes_no_id = :chem_1st_ciklofosfan_yes_no_id,
		  chem_1st_paklitaksel_yes_no_id = :chem_1st_paklitaksel_yes_no_id,
		  chem_1st_doksorubicin_yes_no_id = :chem_1st_doksorubicin_yes_no_id,
		  chem_1st_bevacizumab_yes_no_id = :chem_1st_bevacizumab_yes_no_id,
		  chem_1st_topotekan_yes_no_id = :chem_1st_topotekan_yes_no_id,
		  chem_1st_gemcitabin_yes_no_id = :chem_1st_gemcitabin_yes_no_id,
		  chem_1st_vinorelbin_yes_no_id = :chem_1st_vinorelbin_yes_no_id,
		  chem_1st_irinotekan_yes_no_id = :chem_1st_irinotekan_yes_no_id,
		  chem_1st_etopozid_yes_no_id = :chem_1st_etopozid_yes_no_id,
		  chem_1st_epirubicin_yes_no_id = :chem_1st_epirubicin_yes_no_id,
		  chem_1st_docetaxel_yes_no_id = :chem_1st_docetaxel_yes_no_id,
		  chem_1st_oksaliplatin_yes_no_id = :chem_1st_oksaliplatin_yes_no_id,
		  chem_1st_trabektidin_yes_no_id = :chem_1st_trabektidin_yes_no_id,
		  chem_1st_other_yes_no_id = :chem_1st_other_yes_no_id,
		  chem_1st_other_descr = :chem_1st_other_descr,
		  chem_1st_date_start = :chem_1st_date_start,
		  chem_1st_date_finish = :chem_1st_date_finish,
		  chem_1st_course_number = :chem_1st_course_number,
		  chem_1st_concomitant_therapy_descr = :chem_1st_concomitant_therapy_descr,
		  chem_2st_trabectedin_yes_no_id = :chem_2st_trabectedin_yes_no_id,
		  chem_2st_trabectedin_dose = :chem_2st_trabectedin_dose,
		  chem_2st_pld_yes_no_id = :chem_2st_pld_yes_no_id,
		  chem_2st_pld_dose = :chem_2st_pld_dose,
		  chem_2st_doxopeg_yes_no_id = :chem_2st_doxopeg_yes_no_id,
		  chem_2st_doxopeg_dose = :chem_2st_doxopeg_dose,
		  chem_2st_kelix_yes_no_id = :chem_2st_kelix_yes_no_id,
		  chem_2st_kelix_dose = :chem_2st_kelix_dose,
		  chem_2st_doksorubicin_yes_no_id = :chem_2st_doksorubicin_yes_no_id,
		  chem_2st_doksorubicin_dose = :chem_2st_doksorubicin_dose,
		  chem_2st_other_yes_no_id = :chem_2st_other_yes_no_id,
		  chem_2st_other_dose = :chem_2st_other_dose,
		  chem_2st_concomitant_therapy_descr = :chem_2st_concomitant_therapy_descr,
		  undesirable_event_yes_no_id = :undesirable_event_yes_no_id
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_date', $entity->visit_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':date_birth', $entity->date_birth, PDO::PARAM_STR );
		$stmt->bindValue ( ':weight_kg', $entity->weight_kg, PDO::PARAM_STR );
		$stmt->bindValue ( ':height_sm', $entity->height_sm, PDO::PARAM_STR );
		$stmt->bindValue ( ':nationality_id', $entity->nationality_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':nationality_if_other', $entity->nationality_if_other, PDO::PARAM_STR );
		$stmt->bindValue ( ':place_living_id', $entity->place_living_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':education_id', $entity->education_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':social_economic_status_id', $entity->social_economic_status_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_estab_date', $entity->diag_cancer_estab_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_tnm_stage_t_id', $entity->diag_cancer_tnm_stage_t_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_tnm_stage_n_id', $entity->diag_cancer_tnm_stage_n_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_tnm_stage_m_id', $entity->diag_cancer_tnm_stage_m_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':diag_cancer_clin_stage_id', $entity->diag_cancer_clin_stage_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treat_yes_no_id', $entity->surgical_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treat_ecstir_yes_no_id', $entity->surgical_treat_ecstir_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treat_ecstir_date', $entity->surgical_treat_ecstir_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister01_yes_no_id', $entity->surgical_treatment_gister01_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister01_date', $entity->surgical_treatment_gister01_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister02_yes_no_id', $entity->surgical_treatment_gister02_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister02_date', $entity->surgical_treatment_gister02_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister03_yes_no_id', $entity->surgical_treatment_gister03_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_gister03_date', $entity->surgical_treatment_gister03_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparotomia_yes_no_id', $entity->surgical_treatment_diag_laparotomia_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparotomia_date', $entity->surgical_treatment_diag_laparotomia_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparoscopia_yes_no_id', $entity->surgical_treatment_diag_laparoscopia_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_diag_laparoscopia_date', $entity->surgical_treatment_diag_laparoscopia_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_explorat_laparotomia_yes_no_id', $entity->surgical_treatment_explorat_laparotomia_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':surgical_treatment_explorat_laparotomia_date', $entity->surgical_treatment_explorat_laparotomia_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_yes_no_id', $entity->chem_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_antracyc_yes_no_id', $entity->chem_treat_antracyc_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_platina_yes_no_id', $entity->chem_treat_platina_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_taxans_yes_no_id', $entity->chem_treat_taxans_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_cyclophosph_yes_no_id', $entity->chem_treat_cyclophosph_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_other_yes_no_id', $entity->chem_treat_other_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_treat_other_descr', $entity->chem_treat_other_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_date', $entity->progress_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_ca125_yes_no_id', $entity->progress_ca125_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_ca125', $entity->progress_ca125, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_yes_no_id', $entity->progress_instr_mrt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_date', $entity->progress_instr_mrt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_norm_yes_no_id', $entity->progress_instr_mrt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_mrt_descr', $entity->progress_instr_mrt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_yes_no_id', $entity->progress_instr_us_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_date', $entity->progress_instr_us_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_norm_yes_no_id', $entity->progress_instr_us_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_us_descr', $entity->progress_instr_us_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_yes_no_id', $entity->progress_instr_kt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_date', $entity->progress_instr_kt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_norm_yes_no_id', $entity->progress_instr_kt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_kt_descr', $entity->progress_instr_kt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_yes_no_id', $entity->progress_instr_ekg_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_date', $entity->progress_instr_ekg_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_norm_yes_no_id', $entity->progress_instr_ekg_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_instr_ekg_descr', $entity->progress_instr_ekg_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':recidive_yes_no_id', $entity->recidive_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_yes_no_id', $entity->metastases_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lung_yes_no_id', $entity->metastases_lung_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lung_date', $entity->metastases_lung_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_hepat_yes_no_id', $entity->metastases_hepat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_hepat_date', $entity->metastases_hepat_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_osteo_yes_no_id', $entity->metastases_osteo_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_osteo_date', $entity->metastases_osteo_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_renal_yes_no_id', $entity->metastases_renal_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_renal_date', $entity->metastases_renal_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lymph_nodes_yes_no_id', $entity->metastases_lymph_nodes_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_lymph_nodes_date', $entity->metastases_lymph_nodes_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_plevra_yes_no_id', $entity->metastases_plevra_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_plevra_date', $entity->metastases_plevra_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_other_descr', $entity->metastases_other_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_surgical_treat_yes_no_id', $entity->metastases_surgical_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_surgical_treat_date', $entity->metastases_surgical_treat_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':metastases_surgical_treat_descr', $entity->metastases_surgical_treat_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_line_treat_yes_no_id', $entity->chem_1st_line_treat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_karboplatin_yes_no_id', $entity->chem_1st_karboplatin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_cisplatin_yes_no_id', $entity->chem_1st_cisplatin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_ciklofosfan_yes_no_id', $entity->chem_1st_ciklofosfan_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_paklitaksel_yes_no_id', $entity->chem_1st_paklitaksel_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_doksorubicin_yes_no_id', $entity->chem_1st_doksorubicin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_bevacizumab_yes_no_id', $entity->chem_1st_bevacizumab_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_topotekan_yes_no_id', $entity->chem_1st_topotekan_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_gemcitabin_yes_no_id', $entity->chem_1st_gemcitabin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_vinorelbin_yes_no_id', $entity->chem_1st_vinorelbin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_irinotekan_yes_no_id', $entity->chem_1st_irinotekan_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_etopozid_yes_no_id', $entity->chem_1st_etopozid_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_epirubicin_yes_no_id', $entity->chem_1st_epirubicin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_docetaxel_yes_no_id', $entity->chem_1st_docetaxel_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_oksaliplatin_yes_no_id', $entity->chem_1st_oksaliplatin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_trabektidin_yes_no_id', $entity->chem_1st_trabektidin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_other_yes_no_id', $entity->chem_1st_other_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_other_descr', $entity->chem_1st_other_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_date_start', $entity->chem_1st_date_start, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_date_finish', $entity->chem_1st_date_finish, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_course_number', $entity->chem_1st_course_number, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_1st_concomitant_therapy_descr', $entity->chem_1st_concomitant_therapy_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_trabectedin_yes_no_id', $entity->chem_2st_trabectedin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_trabectedin_dose', $entity->chem_2st_trabectedin_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_pld_yes_no_id', $entity->chem_2st_pld_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_pld_dose', $entity->chem_2st_pld_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doxopeg_yes_no_id', $entity->chem_2st_doxopeg_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doxopeg_dose', $entity->chem_2st_doxopeg_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_kelix_yes_no_id', $entity->chem_2st_kelix_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_kelix_dose', $entity->chem_2st_kelix_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doksorubicin_yes_no_id', $entity->chem_2st_doksorubicin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_doksorubicin_dose', $entity->chem_2st_doksorubicin_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_other_yes_no_id', $entity->chem_2st_other_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_other_dose', $entity->chem_2st_other_dose, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_concomitant_therapy_descr', $entity->chem_2st_concomitant_therapy_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':undesirable_event_yes_no_id', $entity->undesirable_event_yes_no_id, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_instrument($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "instrument
		SET
		  patient_id = :patient_id,
		  visit_id = :visit_id,
		  instr_mrt_yes_no_id = :instr_mrt_yes_no_id,
		  instr_mrt_date = :instr_mrt_date,
		  instr_mrt_norm_yes_no_id = :instr_mrt_norm_yes_no_id,
		  instr_mrt_descr = :instr_mrt_descr,
		  instr_us_yes_no_id = :instr_us_yes_no_id,
		  instr_us_date = :instr_us_date,
		  instr_us_norm_yes_no_id = :instr_us_norm_yes_no_id,
		  instr_us_descr = :instr_us_descr,
		  instr_kt_yes_no_id = :instr_kt_yes_no_id,
		  instr_kt_date = :instr_kt_date,
		  instr_kt_norm_yes_no_id = :instr_kt_norm_yes_no_id,
		  instr_kt_descr = :instr_kt_descr,
		  instr_ekg_yes_no_id = :instr_ekg_yes_no_id,
		  instr_ekg_date = :instr_ekg_date,
		  instr_ekg_norm_yes_no_id = :instr_ekg_norm_yes_no_id,
		  instr_ekg_descr = :instr_ekg_descr
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_yes_no_id', $entity->instr_mrt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_date', $entity->instr_mrt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_norm_yes_no_id', $entity->instr_mrt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_mrt_descr', $entity->instr_mrt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_yes_no_id', $entity->instr_us_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_date', $entity->instr_us_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_norm_yes_no_id', $entity->instr_us_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_us_descr', $entity->instr_us_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_yes_no_id', $entity->instr_kt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_date', $entity->instr_kt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_norm_yes_no_id', $entity->instr_kt_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_kt_descr', $entity->instr_kt_descr, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_yes_no_id', $entity->instr_ekg_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_date', $entity->instr_ekg_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_norm_yes_no_id', $entity->instr_ekg_norm_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':instr_ekg_descr', $entity->instr_ekg_descr, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_lab($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "lab
		SET
		  patient_id = :patient_id,
		  visit_id = :visit_id,
		  visit_date = :visit_date,
		  ca125_yes_no_id = :ca125_yes_no_id,
		  ca125 = :ca125,
		  ca125_date = :ca125_date,
		  oak_yes_no_id = :oak_yes_no_id,
		  oak_date = :oak_date,
		  oak_hb = :oak_hb,
		  oak_er = :oak_er,
		  oak_leuc = :oak_leuc,
		  oak_tr = :oak_tr,
		  oak_netr = :oak_netr,
		  bc_yes_no_id = :bc_yes_no_id,
		  bc_protein_yes_no_id = :bc_protein_yes_no_id,
		  bc_protein = :bc_protein,
		  bc_protein_date = :bc_protein_date,
		  bc_bilirubin_yes_no_id = :bc_bilirubin_yes_no_id,
		  bc_bilirubin_total_yes_no_id = :bc_bilirubin_total_yes_no_id,
		  bc_bilirubin_total = :bc_bilirubin_total,
		  bc_bilirubin_total_date = :bc_bilirubin_total_date,
		  bc_bilirubin_direct_yes_no_id = :bc_bilirubin_direct_yes_no_id,
		  bc_bilirubin_direct = :bc_bilirubin_direct,
		  bc_bilirubin_direct_date = :bc_bilirubin_direct_date,
		  bc_bilirubin_nondirect_yes_no_id = :bc_bilirubin_nondirect_yes_no_id,
		  bc_bilirubin_nondirect = :bc_bilirubin_nondirect,
		  bc_bilirubin_nondirect_date = :bc_bilirubin_nondirect_date,
		  bc_ast_yes_no_id = :bc_ast_yes_no_id,
		  bc_ast = :bc_ast,
		  bc_ast_date = :bc_ast_date,
		  bc_alt_yes_no_id = :bc_alt_yes_no_id,
		  bc_alt = :bc_alt,
		  bc_alt_date = :bc_alt_date,
		  bc_creat_yes_no_id = :bc_creat_yes_no_id,
		  bc_creat = :bc_creat,
		  bc_creat_date = :bc_creat_date,
		  bc_alk_phosphatase_yes_no_id = :bc_alk_phosphatase_yes_no_id,
		  bc_alk_phosphatase = :bc_alk_phosphatase,
		  bc_alk_phosphatase_date = :bc_alk_phosphatase_date,
		  bc_mochevina_yes_no_id = :bc_mochevina_yes_no_id,
		  bc_mochevina = :bc_mochevina,
		  bc_mochevina_date = :bc_mochevina_date
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_date', $entity->visit_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':ca125_yes_no_id', $entity->ca125_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':ca125', $entity->ca125, PDO::PARAM_STR );
		$stmt->bindValue ( ':ca125_date', $entity->ca125_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_yes_no_id', $entity->oak_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_date', $entity->oak_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_hb', $entity->oak_hb, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_er', $entity->oak_er, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_leuc', $entity->oak_leuc, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_tr', $entity->oak_tr, PDO::PARAM_STR );
		$stmt->bindValue ( ':oak_netr', $entity->oak_netr, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_yes_no_id', $entity->bc_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_protein_yes_no_id', $entity->bc_protein_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_protein', $entity->bc_protein, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_protein_date', $entity->bc_protein_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_yes_no_id', $entity->bc_bilirubin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_total_yes_no_id', $entity->bc_bilirubin_total_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_total', $entity->bc_bilirubin_total, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_total_date', $entity->bc_bilirubin_total_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_direct_yes_no_id', $entity->bc_bilirubin_direct_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_direct', $entity->bc_bilirubin_direct, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_direct_date', $entity->bc_bilirubin_direct_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_nondirect_yes_no_id', $entity->bc_bilirubin_nondirect_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_nondirect', $entity->bc_bilirubin_nondirect, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_bilirubin_nondirect_date', $entity->bc_bilirubin_nondirect_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_ast_yes_no_id', $entity->bc_ast_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_ast', $entity->bc_ast, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_ast_date', $entity->bc_ast_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alt_yes_no_id', $entity->bc_alt_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alt', $entity->bc_alt, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alt_date', $entity->bc_alt_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_creat_yes_no_id', $entity->bc_creat_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_creat', $entity->bc_creat, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_creat_date', $entity->bc_creat_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alk_phosphatase_yes_no_id', $entity->bc_alk_phosphatase_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alk_phosphatase', $entity->bc_alk_phosphatase, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_alk_phosphatase_date', $entity->bc_alk_phosphatase_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_mochevina_yes_no_id', $entity->bc_mochevina_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_mochevina', $entity->bc_mochevina, PDO::PARAM_STR );
		$stmt->bindValue ( ':bc_mochevina_date', $entity->bc_mochevina_date, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_tumor_response($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "tumor_response
		SET
		  patient_id = :patient_id,
		  visit_id = :visit_id,
		  full_response_yes_no_id = :full_response_yes_no_id,
		  partial_response_yes_no_id = :partial_response_yes_no_id,
		  progress_desease_yes_no_id = :progress_desease_yes_no_id,
		  stabilization_desease_yes_no_id = :stabilization_desease_yes_no_id
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':full_response_yes_no_id', $entity->full_response_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':partial_response_yes_no_id', $entity->partial_response_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':progress_desease_yes_no_id', $entity->progress_desease_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':stabilization_desease_yes_no_id', $entity->stabilization_desease_yes_no_id, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_therapy_continue($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "therapy_continue
		SET
	    patient_id = :patient_id,
	    visit_id = :visit_id,
	    therap_trab_continue_yes_no_id = :therap_trab_continue_yes_no_id,
	    therap_trab_continue_no_cause_id = :therap_trab_continue_no_cause_id
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':therap_trab_continue_yes_no_id', $entity->therap_trab_continue_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':therap_trab_continue_no_cause_id', $entity->therap_trab_continue_no_cause_id, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_adverse_event($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "adverse_event
		SET
	    patient_id = :patient_id,
	    visit_id = :visit_id,
	    adverse_event_yes_no_id = :adverse_event_yes_no_id
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':adverse_event_yes_no_id', $entity->adverse_event_yes_no_id, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' строк нежеел явлений изменено';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_adverse_event_detail($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "adverse_event_detail
		SET
	  name = :name,
	  adverse_event_id = :adverse_event_id,
	  serious_yes_no_id = :serious_yes_no_id,
	  start_date = :start_date,
	  resolved_yes_no_id = :resolved_yes_no_id,
	  resolved_date = :resolved_date,
	  event_intensity_decreased_yes_no_id = :event_intensity_decreased_yes_no_id,
	  event_occurred_again_yes_no_id = :event_occurred_again_yes_no_id,
	  event_associated_with_drug_yes_no_id = :event_associated_with_drug_yes_no_id
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':name', $entity->name, PDO::PARAM_STR );
		$stmt->bindValue ( ':adverse_event_id', $entity->adverse_event_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':serious_yes_no_id', $entity->serious_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':start_date', $entity->start_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':resolved_yes_no_id', $entity->resolved_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':resolved_date', $entity->resolved_date, PDO::PARAM_STR );
		$stmt->bindValue ( ':event_intensity_decreased_yes_no_id', $entity->event_intensity_decreased_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':event_occurred_again_yes_no_id', $entity->event_occurred_again_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':event_associated_with_drug_yes_no_id', $entity->event_associated_with_drug_yes_no_id, PDO::PARAM_STR );
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' строк нежеел явлений изменено';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_inclusion($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "inclusion
		SET
		  patient_id = :patient_id,
		  visit_id = :visit_id,
		  age_18_and_more_yes_no_id = :age_18_and_more_yes_no_id,
		  histol_confirmed_cr_yes_no_id = :histol_confirmed_cr_yes_no_id,
		  ecog01_yes_no_id = :ecog01_yes_no_id,
		  recurrent_plat_sensit_cancer_yes_no_id = :recurrent_plat_sensit_cancer_yes_no_id,
		  treatment_trabect_after_doxorub_yes_no_id = :treatment_trabect_after_doxorub_yes_no_id,
		  received_no_more_one_line_plat_chem_regimes_yes_no_id = :received_no_more_one_line_plat_chem_regimes_yes_no_id,
		  doct_decision_trabectedin_yes_no_id = :doct_decision_trabectedin_yes_no_id,
		  signed_consent_yes_no_id = :signed_consent_yes_no_id,
		  age_18_less_yes_no_id = :age_18_less_yes_no_id,
		  received_more_two_line_plat_chem_yes_no_id = :received_more_two_line_plat_chem_yes_no_id,
		  platinum_refractory_ov_cr_yes_no_id = :platinum_refractory_ov_cr_yes_no_id,
		  platinum_resistant_ov_cr_yes_no_id = :platinum_resistant_ov_cr_yes_no_id,
		  refusal_central_venous_catheter_yes_no_id = :refusal_central_venous_catheter_yes_no_id,
		  impaired_hepatic_function_yes_no_id = :impaired_hepatic_function_yes_no_id,
		  impaired_renal_function_yes_no_id = :impaired_renal_function_yes_no_id,
		  impaired_hematological_parameters_yes_no_id = :impaired_hematological_parameters_yes_no_id,
		  impaired_cardiovascular_function_yes_no_id = :impaired_cardiovascular_function_yes_no_id,
		  kaposi_sarcoma_yes_no_id = :kaposi_sarcoma_yes_no_id,
		  pregnancy_yes_no_id = :pregnancy_yes_no_id
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':age_18_and_more_yes_no_id', $entity->age_18_and_more_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':histol_confirmed_cr_yes_no_id', $entity->histol_confirmed_cr_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':ecog01_yes_no_id', $entity->ecog01_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':recurrent_plat_sensit_cancer_yes_no_id', $entity->recurrent_plat_sensit_cancer_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':treatment_trabect_after_doxorub_yes_no_id', $entity->treatment_trabect_after_doxorub_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':received_no_more_one_line_plat_chem_regimes_yes_no_id', $entity->received_no_more_one_line_plat_chem_regimes_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':doct_decision_trabectedin_yes_no_id', $entity->doct_decision_trabectedin_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':signed_consent_yes_no_id', $entity->signed_consent_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':age_18_less_yes_no_id', $entity->age_18_less_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':received_more_two_line_plat_chem_yes_no_id', $entity->received_more_two_line_plat_chem_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':platinum_refractory_ov_cr_yes_no_id', $entity->platinum_refractory_ov_cr_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':platinum_resistant_ov_cr_yes_no_id', $entity->platinum_resistant_ov_cr_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':refusal_central_venous_catheter_yes_no_id', $entity->refusal_central_venous_catheter_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_hepatic_function_yes_no_id', $entity->impaired_hepatic_function_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_renal_function_yes_no_id', $entity->impaired_renal_function_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_hematological_parameters_yes_no_id', $entity->impaired_hematological_parameters_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':impaired_cardiovascular_function_yes_no_id', $entity->impaired_cardiovascular_function_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':kaposi_sarcoma_yes_no_id', $entity->kaposi_sarcoma_yes_no_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':pregnancy_yes_no_id', $entity->pregnancy_yes_no_id, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
			$statusInclusion = $entity->getStatusInclusion();
			$this->update_patient_status_include($entity->patient_id, $statusInclusion);
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	public function update_concomitant_therapy($entity) {
		// echo "in update_ent_name<br/>";
		$query = "UPDATE
		  " . DB_PREFIX . "concomitant_therapy
		SET
		  patient_id = :patient_id,
		  visit_id = :visit_id,
		  chem_2st_concomitant_therapy_descr = :chem_2st_concomitant_therapy_descr
		WHERE
		  id = :id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $entity->id, PDO::PARAM_STR );
		$stmt->bindValue ( ':patient_id', $entity->patient_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':visit_id', $entity->visit_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':chem_2st_concomitant_therapy_descr', $entity->chem_2st_concomitant_therapy_descr, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				// die("Ошибка, объект не обновлен");
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $entity->id;
	}
	/**
	 * standart update end
	 */
	public function save_query_and_get_list($post) {
		$investigation_id = $post['query_investigation_id'];
		$record_id = $post['query_record_id'];
		$this->save_query($post);
		return $this->getListQueries($investigation_id, $record_id);
	}

	public function save_query($post) {
		$this->log->debug("START");
		$investigation_id = $post['query_investigation_id'];
		$record_id = $post['query_record_id'];
		$description = $post['query_description'];
		$query_status_id = 1;
		$query = "INSERT INTO
		  " . DB_PREFIX . "query
		(
		  investigation_id,
		  record_id,
		  description,
		  query_status_id
		) 
		VALUE (
		  :investigation_id,
		  :record_id,
		  :description,
		  :query_status_id
		)";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':investigation_id', $investigation_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':record_id', $record_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':description', $description, PDO::PARAM_STR );
		$stmt->bindValue ( ':query_status_id', $query_status_id, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			if ($affected_rows < 1) {
				echo ( "Ошибка, объект не сохранен" );
			}
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		$this->log->debug("FINISH");
		return $this->pdo->lastInsertId ();
	}

	public function getQueryById($id) {
		$objects = array ();
		$query = "SELECT q.*, d.value_name as query_status_descr FROM " . DB_PREFIX . "query q," . DB_PREFIX . "dic_val d
		WHERE q.id = :id 
		and (q.query_status_id=d.value_id and d.dic_list_id='query_status_id')";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $id, PDO::PARAM_STR );
			$stmt->execute ();
			$rows = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if ($stmt->rowCount () == 0) {
			return null;
		}
		foreach ($rows as $row) {
			$object = new InvestQuery ();
			$object->id = $row ['id'];
			$object->investigation_id = $row['investigation_id'];
			$object->record_id = $row['record_id'];
			$object->description = $row['description'];
			$object->open_date = $row['open_date'];
			$object->close_date = $row['close_date'];
			$object->query_status_id = $row['query_status_id'];
			$object->query_status_descr = $row['query_status_descr'];
			$objects[] = $object;
		}
		return $objects;
	}

	public function getListQueries($invest_id, $record_id) {
		$objects = array ();
		$query = "SELECT q.*, d.value_name as query_status_descr FROM " . DB_PREFIX . "query q," . DB_PREFIX . "dic_val d
		WHERE investigation_id = :investigation_id and record_id = :record_id 
		and (q.query_status_id=d.value_id and d.dic_list_id='query_status_id')
		order by id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':investigation_id', $invest_id, PDO::PARAM_STR );
			$stmt->bindValue ( ':record_id', $record_id, PDO::PARAM_STR );

			$stmt->execute ();
			$rows = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if ($stmt->rowCount () == 0) {
			return null;
		}
		foreach ($rows as $row) {
			$object = new InvestQuery ();
			$object->id = $row ['id'];
			$object->investigation_id = $row['investigation_id'];
			$object->record_id = $row['record_id'];
			$object->description = $row['description'];
			$object->open_date = $row['open_date'];
			$object->close_date = $row['close_date'];
			$object->query_status_id = $row['query_status_id'];
			$object->query_status_descr = $row['query_status_descr'];
			$objects[] = $object;
		}
		return $objects;
	}

	public function getListAllQueries($username_email=null) {
		$objects = array ();
		$condition_user = "";
		if($username_email != null){
			$condition_user = " AND invdata.user = '$username_email' ";
		}
		$query = "SELECT
			q.*, 
			p.id as patient_id,
			p.patient_number,
			d.value_name as query_status_descr, 
			inv.descr as investigation_descr,
            hospital_d.value_id as hospital_id,
            hospital_d.value_name as hospital_name,
            visit.id as visit_id,
            visit.name as visit_name,
            invdata.user as username_email,
            CONCAT(user.last_name, ' ', user.first_name) as user_fio
			FROM 
			" . DB_PREFIX . "query q,
            " . DB_PREFIX . "dic_val d, 
            " . DB_PREFIX . "investigation inv, 
            " . DB_PREFIX . "invest_data invdata, 
            " . DB_PREFIX . "patient p, 
            " . DB_PREFIX . "dic_val hospital_d,
            " . DB_PREFIX . "visit visit,
            " . DB_PREFIX . "user user
            WHERE 
            q.investigation_id=inv.id
            and (q.investigation_id=invdata.investigation_id and q.record_id=invdata.record_id)
            and (invdata.patient_id=p.id)
            and (p.hospital_id=hospital_d.value_id and hospital_d.dic_list_id='hospital_id')
			and (q.query_status_id=d.value_id and d.dic_list_id='query_status_id')
            and (invdata.visit_id=visit.id)
            and (user.username_email=invdata.user)
            $condition_user
			order by investigation_id, record_id"; 
            try {
            	$stmt = $this->pdo->prepare ( $query );
            	//$stmt->bindValue ( ':investigation_id', $invest_id, PDO::PARAM_STR );
            	//$stmt->bindValue ( ':record_id', $record_id, PDO::PARAM_STR );
            	//echo "<br>".$stmt->queryString . "<br>";
            	$stmt->execute ();
            	$rows = $stmt->fetchAll ( PDO::FETCH_ASSOC );
            } catch ( PDOException $ex ) {
            	echo "Ошибка:" . $ex->getMessage ();
            	$this->log->error($ex);
            }
            if ($stmt->rowCount () == 0) {
            	return null;
            }
            foreach ($rows as $row) {
            	$object = new InvestQuery ();
            	$object->id = $row ['id'];
            	$object->investigation_id = $row['investigation_id'];
            	$object->record_id = $row['record_id'];
            	$object->description = $row['description'];
            	$object->open_date = $row['open_date'];
            	$object->close_date = $row['close_date'];
            	$object->query_status_id = $row['query_status_id'];
            	$object->query_status_descr = $row['query_status_descr'];
            	$object->patient_id = $row['patient_id'];
            	$object->patient_number = $row['patient_number'];
            	$object->investigation_descr = $row['investigation_descr'];
            	$object->hospital_id = $row['hospital_id'];
            	$object->hospital_name = $row['hospital_name'];
            	$object->visit_id = $row['visit_id'];
            	$object->visit_name = $row['visit_name'];
            	$object->username_email = $row['username_email'];
            	$object->user_fio = $row['user_fio'];
            	$objects[] = $object;
            }
            return $objects;
	}

	public function getListAdverseEvent($startDate=null, $endDate=null) {
		$condition_between = "";
		if($startDate != null){
			$condition_between = sprintf(" AND avd.start_date BETWEEN '%s' and '%s'", $startDate, $endDate);
		}
		$query = "SELECT
				  p.patient_number,
				  dhosp.value_name as hospital_name,
				  v.name as visit_name,
				  p.doctor,
				  avd.name,
				  IF(avd.serious_yes_no_id=1,'Да','Нет') as serious_yes_no_id,
				  avd.start_date,
				  IF(avd.resolved_yes_no_id=1,'Да','Нет') as resolved_yes_no_id,
				  avd.resolved_date,
				  IF(avd.event_intensity_decreased_yes_no_id=1,'Да','Нет') as event_intensity_decreased_yes_no_id,
				  IF(avd.event_occurred_again_yes_no_id=1,'Да','Нет') as event_occurred_again_yes_no_id,
				  IF(avd.event_associated_with_drug_yes_no_id=1,'Да','Нет') as event_associated_with_drug_yes_no_id
				FROM
				  ovarian_adverse_event_detail avd
				  INNER JOIN ovarian_adverse_event av ON (avd.adverse_event_id = av.id)
				  INNER JOIN ovarian_patient p ON (av.patient_id = p.id)
				  INNER JOIN ovarian_visit v ON (av.visit_id = v.id)
				  INNER JOIN ovarian_dic_val dhosp ON (p.hospital_id = dhosp.value_id)
				  AND (dhosp.dic_list_id = 'hospital_id')
				  where 1=1 " . $condition_between . 
				  " ORDER BY dhosp.value_id, p.patient_number, avd.start_date "; 
		try {
			$stmt = $this->pdo->prepare ( $query );
			//$stmt->bindValue ( ':investigation_id', $invest_id, PDO::PARAM_STR );
			//$stmt->bindValue ( ':record_id', $record_id, PDO::PARAM_STR );
			//echo "<br>".$stmt->queryString . "<br>";
			$stmt->execute ();
			$rows = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $rows;
	}

	public function getListQueriesByIdForInvestIdAndRecordId($query_id) {
		$objects = array ();
		$query = "SELECT q.*, d.value_name as query_status_descr
		FROM " . DB_PREFIX . "query q," . DB_PREFIX . "dic_val d 
		WHERE 
		     investigation_id = (SELECT investigation_id FROM " . DB_PREFIX . "query WHERE id=:id) 
		     and record_id = (SELECT record_id FROM " . DB_PREFIX . "query WHERE id=:id) 
		     and (q.query_status_id=d.value_id and d.dic_list_id='query_status_id')
		     order by id";
		try {
			$stmt = $this->pdo->prepare ( $query );
			$stmt->bindValue ( ':id', $query_id, PDO::PARAM_STR );
			//$stmt->bindValue ( ':record_id', $record_id, PDO::PARAM_STR );
			//echo "<br>".$stmt->queryString . "<br>";
			$stmt->execute ();
			$rows = $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		if ($stmt->rowCount () == 0) {
			return null;
		}
		foreach ($rows as $row) {
			$object = new InvestQuery ();
			$object->id = $row ['id'];
			$object->investigation_id = $row['investigation_id'];
			$object->record_id = $row['record_id'];
			$object->description = $row['description'];
			$object->open_date = $row['open_date'];
			$object->close_date = $row['close_date'];
			$object->query_status_id = $row['query_status_id'];
			$object->query_status_descr = $row['query_status_descr'];
			$objects[] = $object;
		}
		return $objects;
	}

	public function update_query_status_and_get_list($query_id, $query_status_text){
		$this->update_status_query($query_id, $query_status_text);
		return $this->getListQueriesByIdForInvestIdAndRecordId($query_id);
	}

	public function update_status_query($query_id, $query_status_text) {
		$query_status_id = 0;
		$set_close_date = "";
		if($query_status_text == 'open'){
			$query_status_id = 1;
		}elseif ($query_status_text == 'resolve'){
			$query_status_id = 2;
		}elseif ($query_status_text == 'close'){
			$query_status_id = 3;
			$set_close_date = ", close_date=CURRENT_TIMESTAMP";

		}else{
			throw new Exception("Unknown query status");
		}
		$query = "UPDATE " . DB_PREFIX . "query SET query_status_id=:query_status_id $set_close_date WHERE id=:id";

		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $query_id, PDO::PARAM_INT );
		$stmt->bindValue ( ':query_status_id', $query_status_id, PDO::PARAM_INT );
		//echo "<br>id=". $query_id . "<br>";
		//echo "<br>query_status_id=". $query_status_id . "<br>";
		//echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			//$affected_rows = $stmt->rowCount ();
			//echo "<br/>affected_rows = " . $affected_rows . "<br/>";
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
			return FALSE;
		}
		return TRUE;
	}


	public function update_checked_status($investigation_id, $record_id) {
		// echo "in update_investigation<br/>";
		$invest_row = $this->getInvestigation($investigation_id);
		$table_name = $invest_row["name"];
		$check_status = $this->getCheckedStatusOfInvestigation($record_id, $table_name);
		$new_check_status = $check_status == 0 ? 1 : 0;
		$query = "UPDATE " . $table_name. " SET checked=:checked WHERE id=:id";
		$stmt = $this->pdo->prepare ( $query );
		$stmt->bindValue ( ':id', $record_id, PDO::PARAM_STR );
		$stmt->bindValue ( ':checked', $new_check_status, PDO::PARAM_STR );
		// echo "<br>".$stmt->queryString . "<br>";
		try {
			$stmt->execute ();
			//$affected_rows = $stmt->rowCount ();
			// echo $affected_rows.' пациент добавлен';
			//if ($affected_rows < 1) {
			// die("Ошибка, объект не обновлен");
			//}

		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
			return false;
		}
		return true;
	}
    
	public function getDataByNativeSql($sql) {
		$results = array ();
		$arrayReturn = array ();
		//$query = sprintf ( 'SELECT DISTINCT(%1$s) as name from kras_patient WHERE %1$s is not null ORDER BY %1$s', $column );
		try {
			$stmt = $this->pdo->query ( $sql );
			return $stmt->fetchAll ( PDO::FETCH_ASSOC );
		} catch ( PDOException $ex ) {
			echo "Ошибка:" . $ex->getMessage ();
			$this->log->error($ex);
		}
		return $results;
	}
	
	
	public function getListInvestVisitByInvestId($invest_id) {
		return $this->visitDao->getListInvestVisitByInvestId($invest_id);
	}

}
?>