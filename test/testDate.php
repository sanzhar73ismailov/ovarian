<?php
function getDateFromFormatDate($input_val){
	$pattern = "#^\d\d/\d\d/\d\d\d\d#";
	if($input_val == null){
		return null;
	}
	if(strlen($input_val) == 0){
		return null;
	}
	if(!preg_match($pattern, $input_val)){
		die("Неправильный формат даты in getDateFromFormatDate: " . $input_val);
	}

	$parts = explode('/', $input_val);
	$d = $parts[0];
	$m = $parts[1];
	$y = $parts[2];
	if(checkdate($m, $d, $y)){
		return  array("day" => $d, "month" => $m, "year"=>$y);
	}else{
		die("Неправильная дата: " . $input_val);
	}
}

function getSqlDateFromDate($date){
	if($date == null){
		return null;
	}
	if(checkdate($date['month'], $date['day'],  $date['year'])){
		return  sprintf("%04d-%02d-%02d", $date['year'], $date['month'],$date['day']);
	}else{
		die("Неправильная дата SQL: " . $date['day'] . "-" . $date['month'] . "-" . $date['year']);
	}
}

function formatRusDateTpSqlDateStr($str){
	$date = getDateFromFormatDate($str);
	$sqlStr = getSqlDateFromDate($date);
	return $sqlStr;
}
$dateRusStr = "";
echo strlen($dateRusStr);
/*$dateRusStr = "20/02/1987";
echo "dateRusStr = $dateRusStr <br/>";
$sqlDateStr = formatRusDateTpSqlDateStr($dateRusStr);
echo "sqlDateStr = $sqlDateStr <br/>";
*/