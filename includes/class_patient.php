<?php

class Patient extends Entity{
	public $id;
	public $doctor;
	public $hospital_id;
	public $hospital_name;
	public $patient_number;
	public $status_include;
	public $user;
	public $insert_date;
	

	public  function set_date_birth($date_birth){
		$this->date_birth = $date_birth;
		$this->date_birth_sql = parent::getSqlDateFromDate($date_birth);
		$this->date_birth_string=parent::getFormatStringFromDate($date_birth);
	}

	public  function get_date_birth(){
		return $this->date_birth;
	}

	public  function setDateFromSqlDate($input_val){
		$this->set_date_birth(parent::getDateFromSqlDate($input_val));
	}

	public  function setDateFromFormatDate($input_val){
		$this->set_date_birth(parent::getDateFromFormatDate($input_val));
	}

	public  function getYearDateFromRussianString($dateRus){
		if(strlen($dateRus) == 0){
			return "null";
		}
		$parts = explode('/', $dateRus);
		return  "'$parts[2]'";
	}
}
?>