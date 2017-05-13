<?php
/**
 * возвращает истину, если текст заканчивается на "yes_id"
 */
function endsWithId($text){
	return endsWith($text,"_id");
}

/**
 * возвращает истину, если текст заканчивается на "yes_no_id"
 */ 
function endsWithYesNoId($text){
	return endsWith($text,"yes_no_id");
}

/**
 * возвращает истину, если текст заканчивается на "_descr"
 */
function endsWithDescr($text){
	return endsWith($text,"_descr");
}

/**
 * возвращает истину, если текст ($haystack) заканчивается на подстроку ($needle)
 */
function endsWith($haystack, $needle){
	$length = strlen($needle);
	if ($length == 0) {
		return true;
	}
	return (substr($haystack, -$length) === $needle);
}