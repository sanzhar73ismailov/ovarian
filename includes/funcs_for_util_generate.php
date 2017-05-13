<?php
include_once 'util_functions.php';

function generateInvestGeneralDataObject(){
	echo "<h3>start generateInvestGeneralDataObject</h3>";
	$entity = new InvestGeneralData();
	generateDataObject($entity);
	echo "<h3>finish generateInvestGeneralDataObject</h3>";
}

function generateInvestInstrumentDataObject(){
	echo "<h3>start generateInvestInstrumentDataObject</h3>";
	$entity = new InvestInstrument();
	generateDataObject($entity);
	echo "<h3>finish generateInvestInstrumentDataObject</h3>";
}

function generateInvestLabDataObject(){
	echo "<h3>start generateInvestLabDataObject</h3>";
	$entity = new InvestLab();
	generateDataObject($entity);
	echo "<h3>finish generateInvestLabDataObject</h3>";
}
function generateInvestTherapyContinueDataObject(){
	echo "<h3>start generateInvestTherapyContinueDataObject</h3>";
	$entity = new InvestTherapyContinue();
	generateDataObject($entity);
	echo "<h3>finish generateInvestTherapyContinueDataObject</h3>";
}
function generateInvestTumorResponseDataObject(){
	echo "<h3>start generateInvestTumorResponseDataObject</h3>";
	$entity = new InvestTumorResponse();
	generateDataObject($entity);
	echo "<h3>finish generateInvestTumorResponseDataObject</h3>";
}
function generateInvestAdverseEventDetailDataObject(){
	echo "<h3>start generateInvestAdverseEventDetailDataObject</h3>";
	$entity = new InvestAdverseEventDetail();
	generateDataObject($entity);
	echo "<h3>finish generateInvestAdverseEventDetailDataObject</h3>";
}

function generateDataObject($entity){
	$class_vars = get_class_vars(get_class($entity));
	$year = 1980;
	foreach ($class_vars as $name => $value) {
		if(endsWithId($name)){
			$one_or_thero = rand(0,1);
			echo "\$entity->$name = $one_or_thero; <br/>";
		}elseif (endsWithDescr($name)){
			$rand_num = rand(10000,10000000000);
			echo "\$entity->$name = 'Просто текст, просто текст $rand_num'; <br/>";
		}elseif (strpos($name,'date')){
			$year++;
			echo "\$entity->$name = '$year/12/23'; <br/>";
			//echo "\$entity->$name = '21/12/2001'; <br/>";
		}else{
			$rand_num = rand(1,100000);
			echo "\$entity->$name = '$rand_num'; <br/>";
		}
	}
}