<?php
include_once 'arr_inc.php';
include_once '../includes/util_functions.php';
// $arr = $arr_general_data;
// $arr = $arr_instrument;
//$arr = $arr_lab;
// $arr = $arr_therapy_continue;
 //$arr = $arr_tumor_response;
 //$arr = $arr_adverse_event;
 //$arr = $arr_adverse_event_details;
 $arr = $arr_inclusion;
echo "<html><head><meta charset=\"UTF-8\"></head><body>";
echo htmlspecialchars ( "<html><head><meta charset=\"UTF-8\"></head><body>" ) . "<br/>";
echo htmlspecialchars ( "<style>" ) . "<br/>";
echo htmlspecialchars ( ".td_label_form { width: 200px; }" ) . "<br/>";

echo htmlspecialchars ( "</style>" ) . "<br/>" . "<br/>";
echo htmlspecialchars ( "<table>" ) . "<br/>" . "<br/>" . "<br/>";
foreach ( $arr as $key => $value ) {
	// echo sprintf("\$investigation->%s= \$this->getNullForObjectFieldIfStringEmpty(\$request['%s']);<br>",$value,$value);
	// echo sprintf("\$investigation->%s=\$row[0]['%s'];<br>", $value,$value);
	// echo sprintf("\$stmt->bindValue(':%s', \$entity->%s, PDO::PARAM_STR);<br>", $value,$value);
	if ($key == "patient_id" or $key == "visit_id" or $key == "id" or $key == "user" or $key == "insert_date")
		continue;
	if (endsWithYesNoId ( $key ))
		printRadioYesNo ( $key, $value );
	elseif (endsWithId ( $key ))
		printSelect ( $key, $value );
	elseif (endsWithDescr ( $key ))
		printTextArea ( $key, $value );
	elseif (strpos ( $key, 'date' ) !== false)
		printDateInput ( $key, $value );
	else
		printInput ( $key, $value );
}
echo "<br/><br/><br/>" . htmlspecialchars ( "</table></body></html>" ) . "<br/>";
echo "</body></html>";
function printInput($fname, $fcomment) {
	echo htmlspecialchars ( "<tr>" ) . "<br/>";
	echo htmlspecialchars ( "<td class='td_label_form'>" ) . $fcomment . htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "<td>" );
	echo htmlspecialchars ( "<" );
	echo sprintf ( "input {\$class_req_input} type=\"text\" {\$readonly} name=\"%s\" size=\"50\" value=\"{\$object->%s}\"", $fname, $fname );
	echo htmlspecialchars ( "/>" );
	echo htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "</tr>" ) . "<br/>";
}
function printTextArea($fname, $fcomment) {
	echo htmlspecialchars ( "<tr>" ) . "<br/>";
	echo htmlspecialchars ( "<td class='td_label_form'>" ) . $fcomment . htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "<td>" );
	// <td><textarea {$disabled} rows="3" cols="45" name="chem_2st_concomitant_therapy_descr" size="50"/>{$object->chem_2st_concomitant_therapy_descr}</textarea></td>
	echo htmlspecialchars ( "<" );
	echo sprintf ( "textarea {\$disabled} rows=\"3\" cols=\"45\" name=\"%s\"", $fname, $fname );
	echo htmlspecialchars ( ">" ) . "{\$object->" . $fname . "}";
	echo htmlspecialchars ( "</textarea></td>" ) . "<br/>";
	echo htmlspecialchars ( "</tr>" ) . "<br/>";
}
function printDateInput($fname, $fcomment) {
	// <td><input {$class_req_input} type="text" {$readonly} name="date_birth"
	// id="date_birth" size="50" value="{if isset($object->date_birth)}{$object->date_birth|date_format:"%d/%m/%Y"}{else}{/if}"
	echo htmlspecialchars ( "<tr>" ) . "<br/>";
	echo htmlspecialchars ( "<td class='td_label_form'>" ) . $fcomment . htmlspecialchars ( " (дд/мм/гггг)</td>" ) . "<br/>";
	echo htmlspecialchars ( "<td>" );
	echo htmlspecialchars ( "<" );
	echo sprintf ( "input {\$class_req_input} type=\"text\" {\$readonly} name=\"%s\" id=\"%s\" size=\"50\" value=\"{if isset(\$object->%s)}{\$object->%s|date_format:'%%d/%%m/%%Y'}{else}{/if}\"", $fname, $fname, $fname, $fname );
	// onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"
	echo " onblur=\"IsObjDate(this);\" onkeyup=\"TempDt(event,this);\"";
	echo htmlspecialchars ( "/>" );
	echo htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "</tr>" ) . "<br/>";
}
function printRadioYesNo($fname, $fcomment) {
	/*
	 * Да <input required {$class_req_input} type="radio" {$readonly} name="surgical_treat_yes_no_id" size="50" value="1"
	 * {if isset($object->surgical_treat_yes_no_id) && $object->surgical_treat_yes_no_id == 1} checked {/if}/>
	 * Нет <input required {$class_req_input} type="radio" {$readonly} name="surgical_treat_yes_no_id" size="50" value="0"
	 * {if isset($object->surgical_treat_yes_no_id) && $object->surgical_treat_yes_no_id == 0} checked {/if}/>
	 */
	echo htmlspecialchars ( "<tr>" ) . "<br/>";
	echo htmlspecialchars ( "<td class='td_label_form'>" ) . $fcomment . htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "<td>" );
	echo "<br/>";
	echo htmlspecialchars ( "Да <" );
	echo sprintf ( "input {\$class_req_input} type=\"radio\" {\$disabled} name=\"%s\" value=\"1\"", $fname );
	echo sprintf ( " {if isset(\$object->%s) &&  \$object->%s == 1} checked {/if}", $fname, $fname );
	echo htmlspecialchars ( "/>" ) . "<br/>";
	echo htmlspecialchars ( "Нет <" );
	echo sprintf ( "input {\$class_req_input} type=\"radio\" {\$disabled} name=\"%s\" value=\"0\"", $fname );
	echo sprintf ( " {if isset(\$object->%s) &&  \$object->%s == 0} checked {/if}", $fname, $fname );
	echo htmlspecialchars ( "/>" );
	echo htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "</tr>" ) . "<br/>";
}

/*
 * <tr>
 * <td>Медицинский центр</td>
 * <td><select {$class_req_input} {$disabled} name="hospital_id">
 * <option></option>
 * {foreach $hospital_vals as $item}
 * <option {if $item->id == $object->hospital_id} selected="selected"
 * {/if} value="{$item->id}">{$item->value}</option>
 * {/foreach}
 * </select></td>
 * </tr>
 */
function printSelect($fname, $fcomment) {
	echo htmlspecialchars ( "<tr>" ) . "<br/>";
	echo htmlspecialchars ( "<td class='td_label_form'>" ) . $fcomment . htmlspecialchars ( "</td>" ) . "<br/>";
	echo htmlspecialchars ( "<td>" );
	echo htmlspecialchars ( "<" );
	echo sprintf ( "select {\$class_req_input} {\$disabled} name=\"%s\"", $fname ) . htmlspecialchars ( ">" ) . "<br/>";
	echo htmlspecialchars ( "<option></option>" ) . "<br/>";
	echo sprintf ( "{foreach \$%s as \$item}", str_replace ( "_id", "_vals", $fname ) ) . "<br/>";
	echo htmlspecialchars ( "<option" ) . sprintf ( " {if \$item->id == \$object->%s} selected=\"selected\"<br/>", $fname );
	echo "{/if} value=\"{\$item->id}\">{\$item->value}" . htmlspecialchars ( "</option>" ) . "<br/>";
	echo "{/foreach}<br/>";
	echo htmlspecialchars ( "</select></td>" ) . "<br/>";
	echo htmlspecialchars ( "</tr>" ) . "<br/>";
}


// function endsWithId($haystack){
// 	$needle =  "_id";
//     $length = strlen($needle);
//     if ($length == 0) 
//         return true;
//     return (substr($haystack, -$length) === $needle);
// }