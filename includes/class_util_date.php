<?php
class UtilDate {
	/**
	 * из дд/мм/гггг в дату
	 */
	private static function getDateFromFormatDate($input_val) {
		$pattern = "#^\d\d/\d\d/\d\d\d\d#";
		if (strlen ( $input_val ) == 0) {
			return null;
		}
		if (! preg_match ( $pattern, $input_val )) {
			die ( "Неправильный формат даты in getDateFromFormatDate: " . $input_val );
		}
		
		$parts = explode ( '/', $input_val );
		$d = $parts [0];
		$m = $parts [1];
		$y = $parts [2];
		if (checkdate ( $m, $d, $y )) {
			return array (
					"day" => $d,
					"month" => $m,
					"year" => $y 
			);
		} else {
			die ( "Неправильная дата: " . $input_val );
		}
	}
	
	/**
	 * из даты в формат SQL: гггг-мм-дд
	 */
	private static function getSqlDateFromDate($date) {
		if ($date == null) {
			return null;
		}
		if (checkdate ( $date ['month'], $date ['day'], $date ['year'] )) {
			return sprintf ( "%04d-%02d-%02d", $date ['year'], $date ['month'], $date ['day'] );
		} else {
			die ( "Неправильная дата SQL: " . $date ['day'] . "-" . $date ['month'] . "-" . $date ['year'] );
		}
	}
	
	/**
	 * из даты в формат русс.
	 * даты: дд/мм/гггг
	 */
	private static function getFormatStringFromDate($date) {
		if ($date == null) {
			return "";
		}
		if (checkdate ( $date ['month'], $date ['day'], $date ['year'] )) {
			return sprintf ( "%02d/%02d/%04d", $date ['day'], $date ['month'], $date ['year'] );
		} else {
			die ( "Неправильная дата: " . $date ['day'] . "-" . $date ['month'] . "-" . $date ['year'] );
		}
	}
	
	/**
	 * из гггг/мм/дд в дату
	 */
	private static function getDateFromSqlDate($input_val) {
		$pattern = "#^\d\d\d\d-\d\d-\d\d#";
		if (strlen ( $input_val ) == 0) {
			return null;
		}
		if (! preg_match ( $pattern, $input_val )) {
			die ( "Неправильный формат даты: " . $input_val );
		}
		$parts = explode ( '-', $input_val );
		$d = $parts [2];
		$m = $parts [1];
		$y = $parts [0];
		if (checkdate ( $m, $d, $y )) {
			return array (
					"day" => $d,
					"month" => $m,
					"year" => $y 
			);
		} else {
			die ( "Неправильная дата: " . $input_val );
		}
	}
	public static function formatRusDateTpSqlDateStr($str) {
		$date = UtilDate::getDateFromFormatDate ( $str );
		$sqlStr = UtilDate::getSqlDateFromDate ( $date );
		return $sqlStr;
	}
}