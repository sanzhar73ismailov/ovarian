<?php
session_start();
include_once 'includes/global.php';
//$object = $dao->getInvestigation(1)['name'];
Logger::configure('config.xml');
include_once 'includes/global.php';
$logger = Logger::getLogger("statistic.php");

for ($i = 1; $i < 8; $i++) {
	$invest = $dao->getInvestigation($i);
	$invest_id = $invest['id'];
	$invest_name = $invest['name'];
	echo "<h2>$invest_name</h2>";
	
	$query = "SELECT column_name, column_comment, data_type
        FROM information_schema.columns c
     WHERE table_schema = 'ovarian' AND TABLE_NAME = '$invest_name'
     ORDER BY c.ORDINAL_POSITION";
	$columns = $dao->getDataByNativeSql($query);
	//printLabels($columns);
	//printValues($columns, $dao);
	
	printLabelsForPairStat($dao, $invest_id, $columns);
	
	
// 	foreach ($table_res as $row) {
// 		//var_dump($row);
// 		$column_name = $row['column_name'];
// 		$column_comment = $row['column_comment'];
// 		$data_type = $row['data_type'];
// 		//echo "$column_name <p/>";
		
// 	}
	
	echo "<p/>";
	break;
	
}

function printLabels($columns) {
	echo "VARIABLE LABELS<br/>";
	foreach ($columns as $row) {
		//var_dump($row);
		$column_name = $row['column_name'];
		$column_comment = $row['column_comment'];
		$data_type = $row['data_type'];
		if($column_name == 'visit_id' ){
			$column_comment = 'Визит';
		}elseif ($column_name == 'insert_date'){
			$column_comment = 'Дата регистрации';
		}
		
		echo "$column_name \"$column_comment\"<br/>";
	}
	echo ".";
}

function printValues($columns, $dao) {
	echo "VALUE LABELS<br/>";
	$columns_id_count = 0;
	for ($i = 0; $i < count($columns); $i++) {
		$row = $columns[$i];
		//var_dump($row);
		$column_name = $row['column_name'];
		
		$skipedCols = array("patient_id", "visit_id");
		if (in_array($column_name, $skipedCols)) {
			continue;
		}
		
		if (!endsWithId($column_name)){
			continue;
		}
		$columns_id_count++;
		
		
		
// 		echo "$column_name \"$column_comment\"<br/>";
		if($columns_id_count > 1)
			echo "/";
		echo "$column_name<br/>";
		
		//$table_res = $dao->getDataByNativeSql($query);
		
		$dicVals = $dao->getDicValues ( $column_name );
		foreach ( $dicVals as $dic ) {
			//echo "$dic['name']<br/>";
			echo $dic->id . " \"" . $dic->value . "\"<br/>";
			

		}
		
			
	}
	echo ".";
	
}
//
function printLabelsForPairStat($dao, $invest_id, $columns){
// 	$query = "SELECT column_name, column_comment, data_type
//         FROM information_schema.columns c
//      WHERE table_schema = 'ovarian' AND TABLE_NAME = '$invest_name'
//      ORDER BY c.ORDINAL_POSITION";
// 	$columns = $dao->getDataByNativeSql($query);
	$insvestVizits = $dao->getListInvestVisitByInvestId($invest_id);
	var_dump($insvestVizits);
	if (1) return ;
	for ($i = 0; $i < count($columns); $i++) {
		$row = $columns[$i];
		//var_dump($row);
		$column_name = $row['column_name'];
		
		$skipedCols = array("patient_id", "visit_id");
		if (in_array($column_name, $skipedCols)) {
			continue;
		}
		
		if (!endsWithId($column_name)){
			continue;
		}
		
	}
}

//$object = $dao->getDataByNativeSql("select now()");

//$object = $dao->getCheckedStatusOfInvestigation(5, 'ovarian_general_data');
//update_checked_status
//$object = $dao->update_checked_status(1, 5);
//$object = $dao->getListAdverseEvent(null, null);
//var_dump($object);