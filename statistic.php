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
	if ($i != 7)
		continue;
	
	$invest = $dao->getInvestigation ( $i );
	$invest_id = $invest ['id'];
	$invest_name = $invest ['name'];
	echo "<h2>* $invest_name.</h2>";
	
	$query = "SELECT column_name, column_comment, data_type FROM information_schema.columns c " . " WHERE table_schema = 'ovarian' AND TABLE_NAME = '$invest_name' ORDER BY c.ORDINAL_POSITION";
	$columns = $dao->getDataByNativeSql ( $query );
	if (1) {
		printLabels ( $columns );
		printValues ( $columns, $dao );
		printMissingValues ( $columns );
		
		if ($i > 1) {
			echo "SORT CASES  BY visit_id.<br/>";
			echo "SPLIT FILE LAYERED BY visit_id.<p/>";
		}
		
		printFrequencyStat ( $columns );
		printDescrStatAndKomogor ( $columns );
		if ($i > 1) {
			echo "SPLIT FILE OFF.<p/>";
		}
		
		if ($i > 1) {
			printCrossTab ( $columns );
		}
	}
	
	if (0) {
		$twoDimPairColumns = generatePairColumns ( $dao, $invest_id, $columns );
		
		$pairColumns = transformToOneDimArray ( $twoDimPairColumns );
		printLabels ( $pairColumns );
		printValues ( $pairColumns, $dao );
		printMissingValues ( $pairColumns );
		printFridmanTest($twoDimPairColumns);
	}
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
		if ($column_name == 'id')
			continue;
		if ($column_name == 'visit_id') {
			$column_comment = 'Визит';
		} elseif ($column_name == 'insert_date') {
			$column_comment = 'Дата регистрации';
		} elseif ($column_name == 'user') {
			$column_comment = 'Пользователь';
		}
		
		echo "$column_name \"$column_comment\"";
		if ($i < count ( $columns ))
			echo ",<br/>";
		else
			echo ".<p/>";
	}
}
function printValues($columns, $dao) {
	echo "<p/>VALUE LABELS<br/>";
	$columns_id_count = 0;
	$columns_filtered = array ();
	
	for($i = 0; $i < count ( $columns ); $i ++) {
		$row = $columns [$i];
		$column_name = $row ['column_name'];
		$skipedCols = array (
				"patient_id",
				"visit_id",
				"id" 
		);
		if (in_array ( $column_name, $skipedCols )) {
			continue;
		}
		
		if (! endsWithId ( $column_name ) and ! strpos ( $column_name, "_id." )) {
			continue;
		}
		$columns_filtered [] = $row;
	}
	for($i = 0; $i < count ( $columns_filtered ); $i ++) {
		$row = $columns_filtered [$i];
		$ref_column = array_key_exists ( "ref_column", $row ) ? $row ["ref_column"] : "";
		$column_name = $row ['column_name'];
		$columns_id_count ++;
		if ($columns_id_count > 1)
			echo "/";
		echo "$column_name<br/>";
		$ref_dic_column = $ref_column ? $ref_column : $column_name;
		$dicVals = $dao->getDicValues ( $ref_dic_column );
		$dic_count = 0;
		foreach ( $dicVals as $dic ) {
			$dic_count ++;
			echo $dic->id . " \"" . $dic->value . "\"";
			if ($dic_count < count ( $dicVals ))
				echo ",<br/>";
			else if ($columns_id_count < count ( $columns_filtered )) {
				echo "<br/>";
			}
		}
		if ($columns_id_count == count ( $columns_filtered )) {
			echo ".<p/>";
		}
	}
}
function printMissingValues($columns) {
	echo "<p/>MISSING VALUES<br/>";
	$columns_filtered = array ();
	foreach ( $columns as $row ) {
		$data_type = $row ['data_type'];
		$column_name = $row ['column_name'];
		
		$numberDataTypes = array (
				"int",
				"double",
				"float" 
		);
		
		$skipedCols = array (
				"id",
				"checked" 
		);
		if (in_array ( $column_name, $skipedCols )) {
			continue;
		}
		
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
	if (! $columns_filtered) {
		echo "<p/>*FREQUENCIES VARIABLES - No parameters.<br/>";
	} else {
		echo "<p/>FREQUENCIES VARIABLES=<br/>";
	}
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
	if (! $columns_filtered) {
		echo "<p/>*DESCRIPTIVES VARIABLES - No parameters.<br/>";
	} else {
		echo "<p/>DESCRIPTIVES VARIABLES=<br/>";
	}
	
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
			echo ".<p/>";
		}
	}
	
	$columns_id_count = 0;
	/*
	 * NPAR TESTS
	 * /K-S(NORMAL)=date_birth weight_kg
	 * /STATISTICS DESCRIPTIVES
	 * /MISSING ANALYSIS.
	 */
	if (! $columns_filtered) {
		echo "<p/>*Kolmogor-Smirnov NPAR TESTS - No parameters.<br/>";
	} else {
		echo "<p/>NPAR TESTS<br/>";
		echo "K-S(NORMAL)=<br/>";
	}
	
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
			echo ".<p/>";
		}
	}
}
function printCrossTab($columns) {
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
	if (! $columns_filtered) {
		echo "<p/>*CROSSTABS - No parameters.<br/>";
	}
	$columns_id_count = 0;
	for($i = 0; $i < count ( $columns_filtered ); $i ++) {
		$row = $columns_filtered [$i];
		$column_name = $row ['column_name'];
		// $data_type = $row ['data_type'];
		// echo $row ['data_type'] . "<br/>";
		$columns_id_count ++;
		echo "CROSSTABS<br/>";
		echo "/TABLES=" . $column_name . " BY visit_id<br/>";
		echo "/FORMAT=AVALUE TABLES<br/>";
		echo "/STATISTICS=CHISQ<br/>";
		echo "/CELLS=COUNT ROW<br/>";
		echo "/COUNT ROUND CELL.<p/>";
	}
	echo ".<p/>";
}
function generatePairColumns($dao, $invest_id, $columns) {
	$insvestVizits = $dao->getListInvestVisitByInvestId ( $invest_id );
	$generated_columns = array ();
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
		$columns_in_group = array ();
		
		foreach ( $insvestVizits as $invest ) {
			$carried = ( int ) $invest ['carried'];
			if (! $carried)
				continue;
			$visit_id = $invest ['visit_id'];
			$colName = $column_name . "." . $visit_id;
			$columnNew = array ();
			$columnNew ['column_name'] = $colName;
			$columnNew ['ref_column'] = $column_name;
			$columnNew ['data_type'] = $data_type;
			$columnNew ['column_comment'] = $column_comment . ". Визит $visit_id";
			$columns_in_group [] = $columnNew;
		}
		$generated_columns [$column_name] = $columns_in_group;
	}
	return $generated_columns;
}
function transformToOneDimArray($generatePairColumns) {
	$arr = array ();
	foreach ( $generatePairColumns as $group ) {
		foreach ( $group as $col ) {
			$arr [] = $col;
		}
	}
	return $arr;
}
function printFridmanTest($twoDimPairColumns) {
	/*
	 * NPAR TESTS
	 * /FRIEDMAN=instr_mrt_date.1 instr_mrt_date.4 instr_mrt_date.7 instr_mrt_date.8
	 * /STATISTICS DESCRIPTIVES QUARTILES
	 * /MISSING LISTWISE.
	 */
	foreach ( $twoDimPairColumns as $grName => $group ) {
		if (endsWithId ( $grName )) {
			continue;
		}
		echo "NPAR TESTS<br/>";
		echo "/FRIEDMAN=";
		foreach ( $group as $col ) {
			echo $col['column_name'] . " ";
		}
		echo "<br/>/STATISTICS DESCRIPTIVES QUARTILES<br/>";
		echo "/MISSING LISTWISE.<br/>";
	}
}