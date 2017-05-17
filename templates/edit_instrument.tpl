<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title> {include file="js_include.tpl"}
<script type="text/javascript">

 function dependentElsRequiredOn(instrBase){
	//дата проведения
	  requiredOn(instrBase + "_date");
	//радиокнопки - норма/патология
	 requiredRadiosOn(instrBase + "_norm_yes_no_id");
	//заключение текстареа
	requiredOn(instrBase + "_descr");
 }	

function dependentElsRequiredOff(instrBase){
	//дата проведения
	  requiredOff(instrBase + "_date");
	//радиокнопки - норма/патология
	 requiredRadiosOff(instrBase + "_norm_yes_no_id");
	//заключение текстареа
	requiredOff(instrBase + "_descr");
 }
 

</script>
</head>
<body>

	<div id="wrap">
		{include file="header.tpl"}

		<div id="content">
			{include file="form_head.tpl"}

			<table class="form">
				<col width="250">
				{include file="form_note_req_fields.tpl"}
				{include file="query.tpl"}
				<tr style="display:;">
					<td>ID записи</td>
					<td>{if $object->id} {$object->id} {else}
						<div style="background-color: #d14836">Новый</div> {/if}
					</td>
					<input type="hidden" name="id" value="{$object->id}" />
				</tr>


                <tr class="tr_open_close"><td class='td_label_form'><b>МРТ ОМТ</b></td><td>&nbsp;</td></tr>
				<tr>
					<td class='td_label_form'>МРТ ОМТ проводили</td>
					<td>Да <input onclick="dependentElsRequiredOn('instr_mrt');" required {$class_req_input} type="radio"
						{$disabled} name="instr_mrt_yes_no_id" size="50" value="1" {if
						isset($object->instr_mrt_yes_no_id) &&
						$object->instr_mrt_yes_no_id == 1} checked {/if}/> Нет <input  onclick="dependentElsRequiredOff('instr_mrt');"
						required {$class_req_input} type="radio"
						{$disabled} name="instr_mrt_yes_no_id" size="50" value="0" {if
						isset($object->instr_mrt_yes_no_id) &&
						$object->instr_mrt_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>МРТ
						ОМТ дата проведения (дд/мм/гггг)</td>
					<td><input type="text" {$readonly} name="instr_mrt_date"
						id="instr_mrt_date" size="50"
						value="{if isset($object->instr_mrt_date)}{$object->instr_mrt_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
						onkeyup="TempDt(event,this);" /></td>
				</tr>
				<tr>
					<td class='td_label_form'>МРТ
						ОМТ (норма или патология)</td>
					<td>норма <input type="radio"
						{$disabled} name="instr_mrt_norm_yes_no_id" size="50" value="1"
						{if isset($object->instr_mrt_norm_yes_no_id) &&
						$object->instr_mrt_norm_yes_no_id == 1} checked {/if}/> патология <input
						 type="radio"
						{$disabled} name="instr_mrt_norm_yes_no_id" size="50" value="0"
						{if isset($object->instr_mrt_norm_yes_no_id) &&
						$object->instr_mrt_norm_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>МРТ 
						ОМТ Заключение</td>
					<td><textarea {$disabled} rows="3" cols="45" name="instr_mrt_descr" id="instr_mrt_descr">{$object->instr_mrt_descr}</textarea></td>
				</tr>
				<tr class="tr_open_close"><td class='td_label_form'><b>УЗИ ОБП</b></td><td>&nbsp;</td></tr>
				<tr>
					<td class='td_label_form'>УЗИ ОБП проводили</td>
					<td>Да <input onclick="dependentElsRequiredOn('instr_us');" required {$class_req_input} type="radio"
						{$disabled} name="instr_us_yes_no_id" size="50" value="1" {if
						isset($object->instr_us_yes_no_id) &&
						$object->instr_us_yes_no_id == 1} checked {/if}/> Нет <input onclick="dependentElsRequiredOff('instr_us');"
						required {$class_req_input} type="radio"
						{$disabled} name="instr_us_yes_no_id" size="50" value="0" {if
						isset($object->instr_us_yes_no_id) &&
						$object->instr_us_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>УЗИ
						ОБП дата проведения (дд/мм/гггг)</td>
					<td><input type="text" {$readonly} name="instr_us_date"
						id="instr_us_date" size="50"
						value="{if isset($object->instr_us_date)}{$object->instr_us_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
						onkeyup="TempDt(event,this);" /></td>
				</tr>
				<tr>
					<td class='td_label_form'>УЗИ
						ОБП (норма или патология)</td>
					<td>норма <input type="radio"
						{$disabled} name="instr_us_norm_yes_no_id" size="50" value="1" {if
						isset($object->instr_us_norm_yes_no_id) &&
						$object->instr_us_norm_yes_no_id == 1} checked {/if}/> патология <input
						 type="radio"
						{$disabled} name="instr_us_norm_yes_no_id" size="50" value="0" {if
						isset($object->instr_us_norm_yes_no_id) &&
						$object->instr_us_norm_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>УЗИ
						ОБП Заключение</td>
					<td><textarea {$disabled} rows="3" cols="45" name="instr_us_descr" id="instr_us_descr">{$object->instr_us_descr}</textarea></td>
				</tr>
				<tr class="tr_open_close"><td class='td_label_form'><b>КТ ОГК</b></td><td>&nbsp;</td></tr>
				<tr>
					<td class='td_label_form'>КТ ОГК проводили</td>
					<td>Да <input onclick="dependentElsRequiredOn('instr_kt');" required {$class_req_input} type="radio"
						{$disabled} name="instr_kt_yes_no_id" size="50" value="1" {if
						isset($object->instr_kt_yes_no_id) &&
						$object->instr_kt_yes_no_id == 1} checked {/if}/> Нет <input onclick="dependentElsRequiredOff('instr_kt');"
						required {$class_req_input} type="radio"
						{$disabled} name="instr_kt_yes_no_id" size="50" value="0" {if
						isset($object->instr_kt_yes_no_id) &&
						$object->instr_kt_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>КТ
						ОГК дата проведения (дд/мм/гггг)</td>
					<td><input type="text" {$readonly} name="instr_kt_date"
						id="instr_kt_date" size="50"
						value="{if isset($object->instr_kt_date)}{$object->instr_kt_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
						onkeyup="TempDt(event,this);" /></td>
				</tr>
				<tr>
					<td class='td_label_form'>КТ
						ОГК (норма или патология)</td>
					<td>норма <input type="radio"
						{$disabled} name="instr_kt_norm_yes_no_id" size="50" value="1" {if
						isset($object->instr_kt_norm_yes_no_id) &&
						$object->instr_kt_norm_yes_no_id == 1} checked {/if}/> патология <input
						type="radio"
						{$disabled} name="instr_kt_norm_yes_no_id" size="50" value="0" {if
						isset($object->instr_kt_norm_yes_no_id) &&
						$object->instr_kt_norm_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>КТ
						ОГК Заключение</td>
					<td><textarea {$disabled} rows="3" cols="45" name="instr_kt_descr" id="instr_kt_descr">{$object->instr_kt_descr}</textarea></td>
				</tr>
				<tr class="tr_open_close"><td class='td_label_form'><b>ЭКГ</b></td><td>&nbsp;</td></tr>
				<tr>
					<td class='td_label_form'>ЭКГ проводили</td>
					<td>Да <input onclick="dependentElsRequiredOn('instr_ekg');" required {$class_req_input} type="radio"
						{$disabled} name="instr_ekg_yes_no_id" size="50" value="1" {if
						isset($object->instr_ekg_yes_no_id) &&
						$object->instr_ekg_yes_no_id == 1} checked {/if}/> Нет <input onclick="dependentElsRequiredOff('instr_ekg');"
						required {$class_req_input} type="radio"
						{$disabled} name="instr_ekg_yes_no_id" size="50" value="0" {if
						isset($object->instr_ekg_yes_no_id) &&
						$object->instr_ekg_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>ЭКГ
						дата проведения (дд/мм/гггг)</td>
					<td><input type="text" {$readonly} name="instr_ekg_date"
						id="instr_ekg_date" size="50"
						value="{if isset($object->instr_ekg_date)}{$object->instr_ekg_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);"
						onkeyup="TempDt(event,this);" /></td>
				</tr>
				<tr>
					<td class='td_label_form'>ЭКГ
						(норма или патология)</td>
					<td>норма <input type="radio"
						{$disabled} name="instr_ekg_norm_yes_no_id" size="50" value="1"
						{if isset($object->instr_ekg_norm_yes_no_id) &&
						$object->instr_ekg_norm_yes_no_id == 1} checked {/if}/> патология <input
						 type="radio"
						{$disabled} name="instr_ekg_norm_yes_no_id" size="50" value="0"
						{if isset($object->instr_ekg_norm_yes_no_id) &&
						$object->instr_ekg_norm_yes_no_id == 0} checked {/if}/>
					</td>
				</tr>
				<tr>
					<td class='td_label_form'>ЭКГ
						Заключение</td>
					<td><textarea {$disabled} rows="3" cols="45" name="instr_ekg_descr" id="instr_ekg_descr">{$object->instr_ekg_descr}</textarea></td>
				</tr>



				{include file="form_bottom.tpl"}

			</table>

			</form>

		</div>

		{include file="footer.tpl"}
	</div>

</body>
</html>
