<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title>
{include file="js_include.tpl"}
<script type="text/javascript">
/*ИДшники радиокнопок для биоихимии*/
var biochemRadioIds = ["bc_protein_yes_no_id", "bc_bilirubin_yes_no_id", "bc_bilirubin_total_yes_no_id", 
	                  "bc_bilirubin_direct_yes_no_id", "bc_bilirubin_nondirect_yes_no_id", 
	                  "bc_ast_yes_no_id", "bc_alt_yes_no_id", "bc_creat_yes_no_id",
	                  "bc_mochevina_yes_no_id"];
/*ИДшники инпут текстов для биоихимии*/
var biochemInputIds = ["bc_protein", "bc_protein_date", "bc_bilirubin_total", "bc_bilirubin_total_date", "bc_bilirubin_direct",
                   		"bc_bilirubin_direct_date", "bc_bilirubin_nondirect", "bc_bilirubin_nondirect_date", "bc_ast", "bc_ast_date", 
                   		"bc_alt", "bc_alt_date", "bc_creat", "bc_creat_date", "bc_mochevina", "bc_mochevina_date"];
                   		
/*ИДшники радиокнопок для билирубина*/
var bilirubinRadioIds = ["bc_bilirubin_total_yes_no_id", "bc_bilirubin_direct_yes_no_id", "bc_bilirubin_nondirect_yes_no_id"];
/*ИДшники инпут текстов для билирубина*/
var bilirubinInputIds = ["bc_bilirubin_total", "bc_bilirubin_total_date", 
						"bc_bilirubin_direct", "bc_bilirubin_direct_date", 
						"bc_bilirubin_nondirect", "bc_bilirubin_nondirect_date"];
function labDependentElsRequiredOn(obj){
	  var idBase = obj.name.replace("_yes_no_id", "");
	  requiredOn(idBase);
	  requiredOn(idBase + "_date");
}
function labDependentElsRequiredOff(obj){
	  var idBase = obj.name.replace("_yes_no_id", "");
	  requiredOff(idBase);
	  requiredOff(idBase + "_date");
}

function oakDependentElsRequiredOn(){
      var inputIds = ["oak_date", "oak_hb", "oak_er", "oak_leuc", "oak_tr", "oak_netr"];
      for(var i = 0; i < inputIds.length; i++){
	  	requiredOn(inputIds[i]);
	  }
}

function oakDependentElsRequiredOff(){
      var inputIds = ["oak_date", "oak_hb", "oak_er", "oak_leuc", "oak_tr", "oak_netr"];
      for(var i = 0; i < inputIds.length; i++){
	  	requiredOff(inputIds[i]);
	  }
}

function biochemDependentElsRequiredOn(){
      for(var i = 0; i < biochemRadioIds.length; i++){
	  	requiredRadiosOn(biochemRadioIds[i]);
	  }
}

function biochemDependentElsRequiredOff(){
      for(var i = 0; i < biochemRadioIds.length; i++){
	  	requiredRadiosOff(biochemRadioIds[i]);
	  }
	  for(var i = 0; i < biochemInputIds.length; i++){
	  	requiredOff(biochemInputIds[i]);
	  }
}

function bilirubinDependentElsRequiredOn(){
      for(var i = 0; i < bilirubinRadioIds.length; i++){
	  	requiredRadiosOn(bilirubinRadioIds[i]);
	  }
}

function bilirubinDependentElsRequiredOff(){
      for(var i = 0; i < bilirubinRadioIds.length; i++){
	  	requiredRadiosOff(bilirubinRadioIds[i]);
	  }
	  for(var i = 0; i < bilirubinInputIds.length; i++){
	  	requiredOff(bilirubinInputIds[i]);
	  }
}

</script>
</head>
<body>

<div id="wrap">{include file="header.tpl"}

<div id="content">{include file="form_head.tpl"}

<table class="form">
	<col width="250">
	{include file="form_note_req_fields.tpl"}
	{include file="query.tpl"}
	<tr style="display: ;">
		<td>ID записи</td>
		<td>{if $object->id} {$object->id} {else}
		<div style="background-color: #d14836">Новый</div>
		{/if}</td>
		<input type="hidden" name="id" value="{$object->id}" />
	</tr>



	<tr>
		<td class='td_label_form'>Дата визита (дд/мм/гггг)</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="visit_date" id="visit_date" size="50"
			value="{if isset($object->visit_date)}{$object->visit_date|date_format:'%d/%m/%Y'}{else}{/if}"
			onblur="IsObjDate(this);" onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b>СА 125</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>СА 125 да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" {$class_req_input} type="radio" {$disabled}
			{$readonly} name="ca125_yes_no_id" size="50" value="1" {if
			isset($object->ca125_yes_no_id) && $object->ca125_yes_no_id == 1}
		checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);" type="radio" {$disabled}
			{$readonly} name="ca125_yes_no_id" size="50" value="0" {if
			isset($object->ca125_yes_no_id) && $object->ca125_yes_no_id == 0}
		checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>СА 125 Ед/мл</td>
		<td><input type="number" step="0.01" {$readonly} name="ca125" id="ca125"
			size="50" value="{$object->ca125}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>СА 125 - дата проведения
		(дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="ca125_date" id="ca125_date" size="50"
			value="{if isset($object->ca125_date)}{$object->ca125_date|date_format:'%d/%m/%Y'}{else}{/if}"
			onblur="IsObjDate(this);" onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b>ОАК</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>ОАК да/нет</td>
		<td>Да <input onclick="oakDependentElsRequiredOn();" {$class_req_input} type="radio" {$disabled}
			{$readonly} name="oak_yes_no_id" size="50" value="1" {if
			isset($object->oak_yes_no_id) && $object->oak_yes_no_id == 1} checked
		{/if}/> Нет <input onclick="oakDependentElsRequiredOff();" {$class_req_input} type="radio" {$disabled}
			{$readonly} name="oak_yes_no_id" size="50" value="0" {if
			isset($object->oak_yes_no_id) && $object->oak_yes_no_id == 0} checked
		{/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>ОАК - дата проведения
		(дд/мм/гггг)</td>
		<td><input type="text" {$readonly} name="oak_date"
			id="oak_date" size="50"
			value="{if isset($object->oak_date)}{$object->oak_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>ОАК - Гемоглобин г/л</td>
		<td><input type="number" step="0.01" {$readonly} name="oak_hb" id="oak_hb"
			size="50" value="{$object->oak_hb}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>ОАК - Эритроциты 10Х12</td>
		<td><input type="number" step="0.01" {$readonly} name="oak_er" id="oak_er"
			size="50" value="{$object->oak_er}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>ОАК - Лейкоциты 10Х9</td>
		<td><input type="number" step="0.01" {$readonly} name="oak_leuc" id="oak_leuc"
			size="50" value="{$object->oak_leuc}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>ОАК - Тромбоциты 10Х9</td>
		<td><input type="number" step="0.01" {$readonly} name="oak_tr" id="oak_tr"
			size="50" value="{$object->oak_tr}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>ОАК - Нейтрофилы 10Х9</td>
		<td><input type="number" step="0.01" {$readonly} name="oak_netr" id="oak_netr"
			size="50" value="{$object->oak_netr}" /></td>
	</tr>
	<tr class="tr_open_close"><td colspan="2" class='td_label_form'><b>БИОХИМИЯ КРОВИ</b></td></tr>
	<tr>
		<td class='td_label_form'>Биох. анал. крови да/нет</td>
		<td>Да <input onclick="biochemDependentElsRequiredOn();" {$class_req_input} type="radio" {$disabled}
			{$readonly} name="bc_yes_no_id" size="50" value="1" {if
			isset($object->bc_yes_no_id) && $object->bc_yes_no_id == 1} checked
		{/if}/> Нет <input onclick="biochemDependentElsRequiredOff();" {$class_req_input} type="radio" {$disabled}
			{$readonly} name="bc_yes_no_id" size="50" value="0" {if
			isset($object->bc_yes_no_id) && $object->bc_yes_no_id == 0} checked
		{/if}/></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> Общий белок</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'> Общий белок да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_protein_yes_no_id" size="50" value="1" {if
			isset($object->bc_protein_yes_no_id) && $object->bc_protein_yes_no_id
		== 1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);"
			type="radio" {$disabled}
			{$readonly} name="bc_protein_yes_no_id" size="50" value="0" {if
			isset($object->bc_protein_yes_no_id) && $object->bc_protein_yes_no_id
		== 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'> Общий белок мкмоль/л</td>
		<td><input type="number" step="0.01" 
			{$readonly} name="bc_protein" id="bc_protein" size="50" value="{$object->bc_protein}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>
		Общий белок дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_protein_date" id="bc_protein_date" size="50"
			value="{if isset($object->bc_protein_date)}{$object->bc_protein_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b>Билирубин</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>Билирубин да/нет</td>
		<td>Да <input onclick="bilirubinDependentElsRequiredOn();" type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_yes_no_id" size="50" value="1" {if
			isset($object->bc_bilirubin_yes_no_id) &&
		$object->bc_bilirubin_yes_no_id == 1} checked {/if}/> Нет <input onclick="bilirubinDependentElsRequiredOff();"
			type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_yes_no_id" size="50" value="0" {if
			isset($object->bc_bilirubin_yes_no_id) &&
		$object->bc_bilirubin_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> Билирубин общий</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>Билирубин общий да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_total_yes_no_id" size="50" value="1"
			{if isset($object->bc_bilirubin_total_yes_no_id) &&
		$object->bc_bilirubin_total_yes_no_id == 1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);"
			type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_total_yes_no_id" size="50" value="0"
			{if isset($object->bc_bilirubin_total_yes_no_id) &&
		$object->bc_bilirubin_total_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>Билирубин общий мкмоль/л</td>
		<td><input type="number" step="0.01"
			{$readonly} name="bc_bilirubin_total" id="bc_bilirubin_total" size="50"
			value="{$object->bc_bilirubin_total}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>Билирубин общий дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_bilirubin_total_date" id="bc_bilirubin_total_date"
			id="bc_bilirubin_total_date" size="50"
			value="{if isset($object->bc_bilirubin_total_date)}{$object->bc_bilirubin_total_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> Билирубин прямой</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>Билирубин прямой да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_direct_yes_no_id" size="50" value="1"
			{if isset($object->bc_bilirubin_direct_yes_no_id) &&
		$object->bc_bilirubin_direct_yes_no_id == 1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);"
			type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_direct_yes_no_id" size="50" value="0"
			{if isset($object->bc_bilirubin_direct_yes_no_id) &&
		$object->bc_bilirubin_direct_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>Билирубин прямой мкмоль/л</td>
		<td><input type="number" step="0.01"
			{$readonly} name="bc_bilirubin_direct" id="bc_bilirubin_direct" size="50"
			value="{$object->bc_bilirubin_direct}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>Билирубин прямой дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_bilirubin_direct_date"
			id="bc_bilirubin_direct_date" size="50"
			value="{if isset($object->bc_bilirubin_direct_date)}{$object->bc_bilirubin_direct_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> Билирубин непрямой</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>Билирубин непрямой да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_nondirect_yes_no_id" size="50"
			value="1" {if isset($object->bc_bilirubin_nondirect_yes_no_id) &&
		$object->bc_bilirubin_nondirect_yes_no_id == 1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);"
			type="radio" {$disabled}
			{$readonly} name="bc_bilirubin_nondirect_yes_no_id" size="50"
			value="0" {if isset($object->bc_bilirubin_nondirect_yes_no_id) &&
		$object->bc_bilirubin_nondirect_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>Билирубин непрямой мкмоль/л</td>
		<td><input type="number" step="0.01"
			{$readonly} name="bc_bilirubin_nondirect" id="bc_bilirubin_nondirect" size="50"
			value="{$object->bc_bilirubin_nondirect}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>Билирубин непрямой дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_bilirubin_nondirect_date" id="bc_bilirubin_nondirect_date"
			id="bc_bilirubin_nondirect_date" size="50"
			value="{if isset($object->bc_bilirubin_nondirect_date)}{$object->bc_bilirubin_nondirect_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> АСТ</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>АСТ да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_ast_yes_no_id" size="50" value="1" {if
			isset($object->bc_ast_yes_no_id) && $object->bc_ast_yes_no_id == 1}
		checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);" type="radio" {$disabled}
			{$readonly} name="bc_ast_yes_no_id" size="50" value="0" {if
			isset($object->bc_ast_yes_no_id) && $object->bc_ast_yes_no_id == 0}
		checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>АСТ ме/л</td>
		<td><input type="number" step="0.01" {$readonly} name="bc_ast" id="bc_ast"
			size="50" value="{$object->bc_ast}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>АСТ дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_ast_date" id="bc_ast_date" size="50"
			value="{if isset($object->bc_ast_date)}{$object->bc_ast_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> АЛТ</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>АЛТ да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_alt_yes_no_id" size="50" value="1" {if
			isset($object->bc_alt_yes_no_id) && $object->bc_alt_yes_no_id == 1}
		checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);" type="radio" {$disabled}
			{$readonly} name="bc_alt_yes_no_id" size="50" value="0" {if
			isset($object->bc_alt_yes_no_id) && $object->bc_alt_yes_no_id == 0}
		checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>АЛТ ме/л</td>
		<td><input type="number" step="0.01" {$readonly} name="bc_alt" id="bc_alt"
			size="50" value="{$object->bc_alt}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>АЛТ дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_alt_date" id="bc_alt_date" size="50"
			value="{if isset($object->bc_alt_date)}{$object->bc_alt_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> Креатинин</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>Креатинин да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_creat_yes_no_id" size="50" value="1" {if
			isset($object->bc_creat_yes_no_id) && $object->bc_creat_yes_no_id ==
		1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);" type="radio" {$disabled}
			{$readonly} name="bc_creat_yes_no_id" size="50" value="0" {if
			isset($object->bc_creat_yes_no_id) && $object->bc_creat_yes_no_id ==
		0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>Креатинин мг/дл</td>
		<td><input type="number" step="0.01" {$readonly} name="bc_creat" id="bc_creat"
			size="50" value="{$object->bc_creat}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>Креатинин дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_creat_date" id="bc_creat_date" size="50"
			value="{if isset($object->bc_creat_date)}{$object->bc_creat_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr  style="display:none;" class="tr_open_close"><td class='td_label_form'><b> Щелочная фосфатаза да/нет</b></td><td>&nbsp;</td></tr>
	<tr style="display:none;">
		<td class='td_label_form'>Щелочная фосфатаза да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_alk_phosphatase_yes_no_id" size="50" value="1"
			{if isset($object->bc_alk_phosphatase_yes_no_id) &&
		$object->bc_alk_phosphatase_yes_no_id == 1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);"
			type="radio" {$disabled}
			{$readonly} name="bc_alk_phosphatase_yes_no_id" size="50" value="0"
			{if isset($object->bc_alk_phosphatase_yes_no_id) &&
		$object->bc_alk_phosphatase_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr style="display:none;">
		<td class='td_label_form'>Щелочная фосфатаза ед/л</td>
		<td><input type="number" step="0.01"
			{$readonly} name="bc_alk_phosphatase" id="bc_alk_phosphatase" size="50"
			value="-1" /></td>
	</tr>
	<tr style="display:none;>
		<td class='td_label_form'>Щелочная фосфатаза дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_alk_phosphatase_date"
			id="bc_alk_phosphatase_date" size="50"
			value="{if isset($object->bc_alk_phosphatase_date)}{$object->bc_alk_phosphatase_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>
	<tr class="tr_open_close"><td class='td_label_form'><b> Мочевина</b></td><td>&nbsp;</td></tr>
	<tr>
		<td class='td_label_form'>Мочевина да/нет</td>
		<td>Да <input onclick="labDependentElsRequiredOn(this);" type="radio" {$disabled}
			{$readonly} name="bc_mochevina_yes_no_id" size="50" value="1" {if
			isset($object->bc_mochevina_yes_no_id) &&
		$object->bc_mochevina_yes_no_id == 1} checked {/if}/> Нет <input onclick="labDependentElsRequiredOff(this);"
			type="radio" {$disabled}
			{$readonly} name="bc_mochevina_yes_no_id" size="50" value="0" {if
			isset($object->bc_mochevina_yes_no_id) &&
		$object->bc_mochevina_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>Мочевина мкмоль/л</td>
		<td><input type="number" step="0.01"
			{$readonly} name="bc_mochevina" id="bc_mochevina" size="50"
			value="{$object->bc_mochevina}" /></td>
	</tr>
	<tr>
		<td class='td_label_form'>Мочевина дата проведения (дд/мм/гггг)</td>
		<td><input type="text"
			{$readonly} name="bc_mochevina_date" id="bc_mochevina_date" size="50"
			value="{if isset($object->bc_mochevina_date)}{$object->bc_mochevina_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
			onkeyup="TempDt(event,this);" /></td>
	</tr>



	{include file="form_bottom.tpl"}

</table>

</form>

</div>

{include file="footer.tpl"}</div>

</body>
</html>
