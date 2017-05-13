<?php
//include 'includes/global.php';
include "arr_inc.php";
echo "<h1>Start</h1>";
//$arr = $arr_general_data;
// $arr = $arr_instrument;
// $arr = $arr_lab;
// $arr = $arr_therapy_continue;
//$arr = $arr_tumor_response;
// $arr = $arr_adverse_event;
// $arr = $arr_adverse_event_details;
$arr = $arr_inclusion;
echo "<h1>" . $arr . "</h1>";
foreach ($arr as $fname=>$comment){
	
	// echo sprintf("public \$%s;<br/>", $fname);
	// printForParseFormMethod($fname); //parse_form_to_entity
	// assignFormValue($fname);
	// echo sprintf("\$stmt->bindValue(':%s', \$entity->%s, PDO::PARAM_STR);<br>", $fname, $fname);
	 assignDicVals($fname); // fill_entity_form_by_dic
	// echo sprintf("<th>%s</th>\n", ++$i);
	// echo sprintf("\$%s_trans='';<br>", $value);
}
echo "<h1>End</h1>";

function assignFormValue($field_name){
	echo sprintf("\$entity->%s=\$row[0]['%s'];<br>", $field_name, $field_name);
}

function printForParseFormMethod($fname){
	if (strpos($fname, 'date') !== false)
		echo sprintf("\$entity->%s = UtilDate::formatRusDateTpSqlDateStr(\$this->getNullForObjectFieldIfStringEmpty(\$this->getValFromRequest(\$request, '%s')));<br/>",$fname, $fname);
	else
		echo sprintf("\$entity->%s = \$this->getNullForObjectFieldIfStringEmpty(\$this->getValFromRequest(\$request, '%s'));<br/>",$fname, $fname);
	
}

function assignDicVals($field_name){
	//echo "<h4>$field_name</h4>";
	//$smarty->assign('hospital_vals', $dao->getDicValues("hospital_id"))
	if(endsWith($field_name, "_id")){
		//echo "<h4>ccc111111</h4>";
		$vals_name =  str_replace("_id", "_vals", $field_name);
		//echo $field_name . "<br/>";
		echo sprintf("\$smarty->assign('%s', \$dao->getDicValues(\"%s\"));<br/>", $vals_name, $field_name);
	}
}

function endsWith($haystack, $needle){
	$length = strlen($needle);
	if ($length == 0)
		return true;
	return (substr($haystack, -$length) === $needle);
}
?>