<?php
session_start ();
include_once 'includes/global.php';
// $object = $dao->getInvestigation(1)['name'];
Logger::configure ( 'config.xml' );
include_once 'includes/global.php';
$logger = Logger::getLogger ( "statistic.php" );

// $arr = array("as"=>"cval1");
// echo $arr["as"];
// var_dump (array_key_exists("as", $arr));
// var_dump ( array_key_exists("ss", $arr));

// exit();
 
for($i = 1; $i < 8; $i ++) {
	if ($i != 2)
		continue;
	
	$invest = $dao->getInvestigation ( $i );
	$invest_id = $invest ['id'];
	$invest_name = $invest ['name'];
	echo "<h2>* $invest_name.</h2>";
	
	$query = "SELECT column_name, column_comment, data_type FROM information_schema.columns c " . " WHERE table_schema = 'ovarian' AND TABLE_NAME = '$invest_name' ORDER BY c.ORDINAL_POSITION";
	$columns = $dao->getDataByNativeSql ( $query );
	// printLabels($columns);
	printValues ( $columns, $dao );
	// printMissingValues ( $columns );
	// printFrequencyStat ( $columns );
	//printDescrStatAndKomogor ( $columns );
	
	$generatePairColumns = generatePairColumns($dao, $invest_id, $columns);
	//printLabels($generatePairColumns);
	//printValues ( $generatePairColumns, $dao );
	
}
function printLabels($columns) {
	echo "VARIABLE LABELS<br/>";
	$i = 0;
	foreach ( $columns as $row ) {
		$i ++;
		// var_dump($row);
		$column_name = $row ['column_name'];
		$column_comment = $row ['column_comment'];
		$data_type = $row ['data_type'];
		if ($column_name == 'visit_id') {
			$column_comment = 'Визит';
		} elseif ($column_name == 'insert_date') {
			$column_comment = 'Дата регистрации';
		}
		
		echo "$column_name \"$column_comment\"";
		if ($i < count ( $columns ))
			echo ",<br/>";
		else
			echo ".<p/>";
	}
}
function printValues($columns, $dao) {
	echo "VALUE LABELS<br/>";
	$columns_id_count = 0;
	for($i = 0; $i < count ( $columns ); $i ++) {
		
		//var_dump($columns [$i]);
		//if(1)
		//	continue;
		$row = $columns [$i];
		$ref_column = array_key_exists("ref_column", $row) ? $row["ref_column"] : "";
		$column_name = $row ['column_name'];
		
		$skipedCols = array (
				"patient_id",
				"visit_id" 
		);
		if (in_array ( $column_name, $skipedCols )) {
			continue;
		}
		
		if (! endsWithId ( $column_name ) and !strpos($column_name, "_id.")) {
			continue;
		}
		$columns_id_count ++;
		// echo "$column_name \"$column_comment\"<br/>";
		if ($columns_id_count > 1)
			echo "/";
		echo "$column_name<br/>";
		
		// $table_res = $dao->getDataByNativeSql($query);
		
		$ref_dic_column = $ref_column ? $ref_column : $column_name;
		$dicVals = $dao->getDicValues ( $ref_dic_column );
		$dic_count = 0;
		foreach ( $dicVals as $dic ) {
			$dic_count ++;
			echo $dic->id . " \"" . $dic->value . "\"";
			if ($dic_count < count ( $dicVals ))
				echo ",<br/>";
			else
				echo "<br/>";
		}
	}
	echo ".<p/>";
}
function printMissingValues($columns) {
	echo "MISSING VALUES<br/>";
	$columns_filtered = array ();
	foreach ( $columns as $row ) {
		$data_type = $row ['data_type'];
		// echo $row ['data_type'] . "<br/>";
		
		$numberDataTypes = array (
				"int",
				"double",
				"float" 
		);
		
		if (! in_array ( $data_type, $numberDataTypes )) {
			continue;
		}
		$columns_filtered [] = $row;
	}
	$columns_id_count = 0;
	for($i = 0; $i < count ( $columns_filtered ); $i ++) {
		$row = $columns_filtered [$i];
		$column_name = $row ['column_name'];
		// $data_type = $row ['data_type'];
		// echo $row ['data_type'] . "<br/>";
		$columns_id_count ++;
		echo $column_name;
		if ($columns_id_count < count ( $columns_filtered )) {
			echo "<br/>";
		} else {
			echo " (-1)";
		}
	}
	echo ".<p/>";
}
function printFrequencyStat($columns) {
	echo "FREQUENCIES VARIABLES=<br/>";
	$columns_filtered = array ();
	foreach ( $columns as $row ) {
		$data_type = $row ['data_type'];
		$column_name = $row ['column_name'];
		
		$skipedCols = array (
				"patient_id",
				"visit_id" 
		);
		if (in_array ( $column_name, $skipedCols )) {
			continue;
		}
		
		if (! endsWithId ( $column_name )) {
			continue;
		}
		$columns_filtered [] = $row;
	}
	$columns_id_count = 0;
	for($i = 0; $i < count ( $columns_filtered ); $i ++) {
		$row = $columns_filtered [$i];
		$column_name = $row ['column_name'];
		// $data_type = $row ['data_type'];
		// echo $row ['data_type'] . "<br/>";
		$columns_id_count ++;
		echo $column_name;
		if ($columns_id_count < count ( $columns_filtered )) {
			echo "<br/>";
		} else {
			echo "<br/> /ORDER=ANALYSIS";
		}
	}
	echo ".<p/>";
}
function printDescrStatAndKomogor($columns) {
	$columns_filtered = array ();
	foreach ( $columns as $row ) {
		$data_type = $row ['data_type'];
		$column_name = $row ['column_name'];
		
		$numberDataTypes = array (
				"int",
				"double",
				"float" 
		);
		
		if (! in_array ( $data_type, $numberDataTypes )) {
			continue;
		}
		
		$skipedCols = array (
				"id",
				"patient_id",
				"visit_id",
				"checked" 
		);
		if (in_array ( $column_name, $skipedCols )) {
			continue;
		}
		
		if (endsWithId ( $column_name )) {
			continue;
		}
		
		$columns_filtered [] = $row;
	}
	$columns_id_count = 0;
	echo "DESCRIPTIVES VARIABLES=<br/>";
	for($i = 0; $i < count ( $columns_filtered ); $i ++) {
		$row = $columns_filtered [$i];
		$column_name = $row ['column_name'];
		// $data_type = $row ['data_type'];
		// echo $row ['data_type'] . "<br/>";
		$columns_id_count ++;
		echo $column_name;
		if ($columns_id_count < count ( $columns_filtered )) {
			echo "<br/>";
		} else {
			echo "<br/>   /STATISTICS=MEAN STDDEV VARIANCE RANGE MIN MAX SEMEAN";
		}
	}
	echo ".<p/>";
	$columns_id_count = 0;
	/*
	 * NPAR TESTS
	 * /K-S(NORMAL)=date_birth weight_kg
	 * /STATISTICS DESCRIPTIVES
	 * /MISSING ANALYSIS.
	 */
	
	echo "NPAR TESTS<br/>";
	echo "K-S(NORMAL)=<br/>";
	for($i = 0; $i < count ( $columns_filtered ); $i ++) {
		$row = $columns_filtered [$i];
		$column_name = $row ['column_name'];
		// $data_type = $row ['data_type'];
		// echo $row ['data_type'] . "<br/>";
		$columns_id_count ++;
		echo $column_name;
		if ($columns_id_count < count ( $columns_filtered )) {
			echo "<br/>";
		} else {
			echo "<br/> /MISSING ANALYSIS";
		}
	}
	echo ".<p/>";
}
function generatePairColumns($dao, $invest_id, $columns) {
	// $query = "SELECT column_name, column_comment, data_type
	// FROM information_schema.columns c
	// WHERE table_schema = 'ovarian' AND TABLE_NAME = '$invest_name'
	// ORDER BY c.ORDINAL_POSITION";
	// $columns = $dao->getDataByNativeSql($query);
	$insvestVizits = $dao->getListInvestVisitByInvestId ( $invest_id );
	//var_dump ( $insvestVizits );
	//if (1)
	//	return;
	$generated_columns = array();
	for($i = 0; $i < count ( $columns ); $i ++) {
		$row = $columns [$i];
		// var_dump($row);
		$column_name = $row ['column_name'];
		$column_comment = $row ['column_comment'];
		$data_type = $row ['data_type'];
		
		$numberDataTypes = array (
				"int",
				"double",
				"float"
		);
		
		if (! in_array ( $data_type, $numberDataTypes )) {
			continue;
		}
		
		$skipedCols = array (
				"id",
				"patient_id",
				"visit_id",
				"checked"
		);
		if (in_array ( $column_name, $skipedCols )) {
			continue;
		}
		foreach ($insvestVizits as $invest) {
			$carried = (int) $invest['carried'];
			if(!$carried)
				continue;
			$visit_id = $invest['visit_id'];
			$colName = $column_name . "." . $visit_id;
			$columnNew = array();
			$columnNew['column_name'] =  $colName;
			$columnNew['ref_column'] = $column_name;
			$columnNew['data_type'] = $data_type;
			$columnNew['column_comment']=$column_comment . ". Визит $visit_id";
			$generated_columns[] = $columnNew;
			//var_dump($columnNew);
			
		}
	}
	return $generated_columns;
}

