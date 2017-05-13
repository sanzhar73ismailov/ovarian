<?php
class VisitDao {
	private 	$pdo;
	private 	$user;

	function __construct($pdo, $user){
		$this->pdo = $pdo;
		$this->user = $user;
	}

	public function getHeaderNames(){
		return $this->getListVisit();
	}

	public function getTable($patient_id){
		$investigations =  $this->getListInvestigations();
		$table = array();
		for($i=0; $i < count($investigations); $i++){
			$investigation = $investigations[$i];
			$row = array();
			$row[] = $investigation['descr'];
			$investVisits = $this->getListInvestVisitByInvestId($investigation['id']);
			foreach ($investVisits as $investVisit) {
				$investVisit['isInvestDone'] = false;
				if($investVisit['carried']){ // если исследование проводится по этому визиту
					$isInvestDone = $this->isInvestDone($patient_id, $investVisit['investigation_id'], $investVisit['visit_id']);
					$investVisit['isInvestDone'] = $isInvestDone['isInvestDone'];
					$investVisit['checked'] = $isInvestDone['checked'];
				}
				$row[] = $investVisit;
			}
			$table[] = $row;
			
		}
		//var_dump($table);
		return $table;
	}

	private function getListInvestVisitByInvestId($id){
		$results = array();
		$arrayReturn = array();
		$query = sprintf("SELECT * from ovarian_investigation_visit WHERE investigation_id='%s' ORDER BY visit_id", $id);
		try {
			$stmt = $this->pdo->query($query);
			$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
			return $results;
		} catch(PDOException $ex) {
			echo "Ошибка:" . $ex->getMessage();
			throw $ex;
		}
	}

	private function getListVisit(){
		$results = array();
		$arrayReturn = array();
		$query = "select * from ovarian_visit order by id";
		// sprintf('SELECT DISTINCT(%1$s) as name from kras_patient WHERE %1$s is not null ORDER BY %1$s', $column);
		try {
			$stmt = $this->pdo->query($query);
			$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
			return $results;
		} catch(PDOException $ex) {
			echo "Ошибка:" . $ex->getMessage();
			throw $ex;
		}
	}

	private function getListInvestigations(){
		$results = array();
		$arrayReturn = array();
		$query = "select * from ovarian_investigation order by id";
		// sprintf('SELECT DISTINCT(%1$s) as name from kras_patient WHERE %1$s is not null ORDER BY %1$s', $column);
		try {
			$stmt = $this->pdo->query($query);
			$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
			return $results;
		} catch(PDOException $ex) {
			echo "Ошибка:" . $ex->getMessage();
			throw $ex;
		}
	}

	public function getInvestigationTableName($invest_id){
		$results = array();
		$arrayReturn = array();
		$query = "select name from ovarian_investigation where id='" . $invest_id . "'";
		// sprintf('SELECT DISTINCT(%1$s) as name from kras_patient WHERE %1$s is not null ORDER BY %1$s', $column);
		try {
			$stmt = $this->pdo->query($query);
			$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
			return $results[0]['name'];
		} catch(PDOException $ex) {
			echo "Ошибка:" . $ex->getMessage();
			throw $ex;
		}
	}

	public function isInvestDone($patient_id, $invest_id, $visit_id){
		$array = array();
		$investigationTableName = $this->getInvestigationTableName($invest_id);
		$query = sprintf("select * from %s where patient_id=%s and visit_id=%s",
		$investigationTableName, $patient_id, $visit_id);
		try {
			$stmt = $this->pdo->query($query);
			$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
			$array['isInvestDone'] = count($results) > 0;
			$array['checked'] = 0;
			if(count($results) > 0){
				$array['checked'] = $results[0]['checked'];
			}
			return $array;
		} catch(PDOException $ex) {
			echo "Ошибка:" . $ex->getMessage();
			throw $ex;
		}
	}
}