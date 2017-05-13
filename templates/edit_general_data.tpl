<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title>
{include file="js_include.tpl"}
<script type="text/javascript">
</script>
</head>
<body>

<div id="wrap">{include file="header.tpl"}

<div id="content">
{include file="form_head.tpl"}
<table class="form">
<col width="250">
    {include file="form_note_req_fields.tpl"}
    {include file="query.tpl"}
	<tr style="display:;">
		<td>ID записи</td>
		<td>{if $object->id} {$object->id} {else}
		<div style="background-color: #d14836">Новый</div>
		{/if}
		<input type="hidden" name="id" value="{$object->id}" />
		</td>
	</tr>
	
	
	
<tr>
<td class='td_label_form'>Дата визита (дд/мм/гггг)</td>
<td><input {$class_req_input} type="text" {$readonly} required name="visit_date" id="visit_date" size="50" value="{if isset($object->visit_date)}{$object->visit_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/></td>
</tr>
<tr>
<td class='td_label_form'>Дата рождения (дд/мм/гггг)</td>
<td><input {$class_req_input} type="text" {$readonly} name="date_birth" id="date_birth" size="50" value="{if isset($object->date_birth)}{$object->date_birth|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/></td>
</tr>
<tr>
<td class='td_label_form'>Масса тела в килограммах</td>
<td><input {$class_req_input} type="text" {$readonly} name="weight_kg" size="50" value="{$object->weight_kg}"/></td>
</tr>
<tr>
<td class='td_label_form'>Рост в сантиметрах</td>
<td><input {$class_req_input} type="text" {$readonly} name="height_sm" size="50" value="{$object->height_sm}"/></td>
</tr>
<tr>
<td class='td_label_form'>Этническая принадлежность</td>
<td><select {$class_req_input} {$disabled} name="nationality_id">
<option></option>
{foreach $nationality_vals as $item}
<option {if $item->id == $object->nationality_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>Этническая принадлежность (если нет в списке)</td>
<td><input type="text" {$readonly} name="nationality_if_other" size="50" value="{$object->nationality_if_other}"/></td>
</tr>
<tr>
<td class='td_label_form'>Место жительства</td>
<td><select {$class_req_input} {$disabled} name="place_living_id">
<option></option>
{foreach $place_living_vals as $item}
<option {if $item->id == $object->place_living_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>Образование</td>
<td><select {$class_req_input} {$disabled} name="education_id">
<option></option>
{foreach $education_vals as $item}
<option {if $item->id == $object->education_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>Социально-экономическое положение</td>
<td><select {$class_req_input} {$disabled} name="social_economic_status_id">
<option></option>
{foreach $social_economic_status_vals as $item}
<option {if $item->id == $object->social_economic_status_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>Дата постановки диагноза рак яичников (дд/мм/гггг)</td>
<td><input {$class_req_input} type="text" {$readonly} name="diag_cancer_estab_date" id="diag_cancer_estab_date" size="50" value="{if isset($object->diag_cancer_estab_date)}{$object->diag_cancer_estab_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/></td>
</tr>
<tr>
<td class='td_label_form'>TNM стадия на момент постановки диагноза - T</td>
<td><select {$class_req_input} {$disabled} name="diag_cancer_tnm_stage_t_id">
<option></option>
{foreach $diag_cancer_tnm_stage_t_vals as $item}
<option {if $item->id == $object->diag_cancer_tnm_stage_t_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>TNM стадия на момент постановки диагноза - N</td>
<td><select {$class_req_input} {$disabled} name="diag_cancer_tnm_stage_n_id">
<option></option>
{foreach $diag_cancer_tnm_stage_n_vals as $item}
<option {if $item->id == $object->diag_cancer_tnm_stage_n_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>TNM стадия на момент постановки диагноза - M</td>
<td><select {$class_req_input} {$disabled} name="diag_cancer_tnm_stage_m_id">
<option></option>
{foreach $diag_cancer_tnm_stage_m_vals as $item}
<option {if $item->id == $object->diag_cancer_tnm_stage_m_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
<tr>
<td class='td_label_form'>Клиническая стадия заболевания на момент постановки диагноза</td>
<td><select {$class_req_input} {$disabled} name="diag_cancer_clin_stage_id">
<option></option>
{foreach $diag_cancer_clin_stage_vals as $item}
<option {if $item->id == $object->diag_cancer_clin_stage_id} selected="selected"
{/if} value="{$item->id}">{$item->value}</option>
{/foreach}
</select></td>
</tr>
</table>


<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><span class="mark_open_close" id="surgical_treat_mark">{if isset($object->surgical_treat_yes_no_id) && $object->surgical_treat_yes_no_id == 1} - {else} + {/if}</span> <b>Хирургическое лечение</b></td>
<td>
Да <input onclick="showChildDivAndSetRequired('surgical_treat');" {$class_req_input} type="radio" {$disabled} name="surgical_treat_yes_no_id" size="50" value="1" {if isset($object->surgical_treat_yes_no_id) && $object->surgical_treat_yes_no_id == 1} checked {/if}/>
Нет <input onclick="hideChildDivAndSetRequired('surgical_treat');" {$class_req_input} type="radio" {$disabled} name="surgical_treat_yes_no_id" size="50" value="0" {if isset($object->surgical_treat_yes_no_id) && $object->surgical_treat_yes_no_id == 0} checked {/if}/></td>
</tr>
</table>
<div id="surgical_treat" {if !isset($object->surgical_treat_yes_no_id) || $object->surgical_treat_yes_no_id == 0} style='display:none' {/if} >
<table class="form">
<tr>
<td class='td_label_form'>Хирургическое лечение: 1. Экстирпация матки с придатками</td>
<td>
   Да <input type="radio" {$disabled} id="surgical_treat_ecstir_yes_no_id" name="surgical_treat_ecstir_yes_no_id" size="50" value="1" {if isset($object->surgical_treat_ecstir_yes_no_id) && $object->surgical_treat_ecstir_yes_no_id == 1} checked {/if}/>
   Нет <input type="radio" {$disabled} id="surgical_treat_ecstir_yes_no_id" name="surgical_treat_ecstir_yes_no_id" size="50" value="0" {if isset($object->surgical_treat_ecstir_yes_no_id) && $object->surgical_treat_ecstir_yes_no_id == 0} checked {/if}/>
   Дата <input type="text" {$readonly} name="surgical_treat_ecstir_date" id="surgical_treat_ecstir_date" size="10" value="{if isset($object->surgical_treat_ecstir_date)}{$object->surgical_treat_ecstir_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Хирургическое лечение: 2. Гистероскопия I</td>
<td>
   Да <input type="radio" {$disabled} name="surgical_treatment_gister01_yes_no_id" size="50" value="1" {if isset($object->surgical_treatment_gister01_yes_no_id) && $object->surgical_treatment_gister01_yes_no_id == 1} checked {/if}/>
   Нет <input type="radio" {$disabled} name="surgical_treatment_gister01_yes_no_id" size="50" value="0" {if isset($object->surgical_treatment_gister01_yes_no_id) && $object->surgical_treatment_gister01_yes_no_id == 0} checked {/if}/>
   Дата <input type="text" {$readonly} name="surgical_treatment_gister01_date" id="surgical_treatment_gister01_date" size="10" value="{if isset($object->surgical_treatment_gister01_date)}{$object->surgical_treatment_gister01_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Хирургическое лечение: 3. Гистероскопия II</td>
<td>
Да <input type="radio" {$disabled} name="surgical_treatment_gister02_yes_no_id" size="50" value="1" {if isset($object->surgical_treatment_gister02_yes_no_id) && $object->surgical_treatment_gister02_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="surgical_treatment_gister02_yes_no_id" size="50" value="0" {if isset($object->surgical_treatment_gister02_yes_no_id) && $object->surgical_treatment_gister02_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="surgical_treatment_gister02_date" id="surgical_treatment_gister02_date" size="10" value="{if isset($object->surgical_treatment_gister02_date)}{$object->surgical_treatment_gister02_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Хирургическое лечение: 4. Гистероскопия III</td>
<td>
Да <input type="radio" {$disabled} name="surgical_treatment_gister03_yes_no_id" size="50" value="1" {if isset($object->surgical_treatment_gister03_yes_no_id) && $object->surgical_treatment_gister03_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="surgical_treatment_gister03_yes_no_id" size="50" value="0" {if isset($object->surgical_treatment_gister03_yes_no_id) && $object->surgical_treatment_gister03_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="surgical_treatment_gister03_date" id="surgical_treatment_gister03_date" size="10" value="{if isset($object->surgical_treatment_gister03_date)}{$object->surgical_treatment_gister03_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Хирургическое лечение: 5. Диагностическая лапаротомия</td>
<td>
Да <input type="radio" {$disabled} name="surgical_treatment_diag_laparotomia_yes_no_id" size="50" value="1" {if isset($object->surgical_treatment_diag_laparotomia_yes_no_id) && $object->surgical_treatment_diag_laparotomia_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="surgical_treatment_diag_laparotomia_yes_no_id" size="50" value="0" {if isset($object->surgical_treatment_diag_laparotomia_yes_no_id) && $object->surgical_treatment_diag_laparotomia_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="surgical_treatment_diag_laparotomia_date" id="surgical_treatment_diag_laparotomia_date" size="10" value="{if isset($object->surgical_treatment_diag_laparotomia_date)}{$object->surgical_treatment_diag_laparotomia_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Хирургическое лечение: 6. Диагностическая лапароскопия</td>
<td>
Да <input type="radio" {$disabled} name="surgical_treatment_diag_laparoscopia_yes_no_id" size="50" value="1" {if isset($object->surgical_treatment_diag_laparoscopia_yes_no_id) && $object->surgical_treatment_diag_laparoscopia_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="surgical_treatment_diag_laparoscopia_yes_no_id" size="50" value="0" {if isset($object->surgical_treatment_diag_laparoscopia_yes_no_id) && $object->surgical_treatment_diag_laparoscopia_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="surgical_treatment_diag_laparoscopia_date" id="surgical_treatment_diag_laparoscopia_date" size="10" value="{if isset($object->surgical_treatment_diag_laparoscopia_date)}{$object->surgical_treatment_diag_laparoscopia_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Хирургическое лечение: 7. Эксплоративная лапаротомия</td>
<td>
Да <input type="radio" {$disabled} name="surgical_treatment_explorat_laparotomia_yes_no_id" size="50" value="1" {if isset($object->surgical_treatment_explorat_laparotomia_yes_no_id) && $object->surgical_treatment_explorat_laparotomia_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="surgical_treatment_explorat_laparotomia_yes_no_id" size="50" value="0" {if isset($object->surgical_treatment_explorat_laparotomia_yes_no_id) && $object->surgical_treatment_explorat_laparotomia_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="surgical_treatment_explorat_laparotomia_date" id="surgical_treatment_explorat_laparotomia_date" size="10" value="{if isset($object->surgical_treatment_explorat_laparotomia_date)}{$object->surgical_treatment_explorat_laparotomia_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
</table>
</div>


<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><span class="mark_open_close" id="chem_treat_mark">{if isset($object->chem_treat_yes_no_id) && $object->chem_treat_yes_no_id == 1} - {else} + {/if}</span> <b>Неадъювантная/Адъювантная химиотерапия</b></td>
<td>
Да <input onclick="showChildDivAndSetRequired('chem_treat');" {$class_req_input} type="radio" {$disabled} name="chem_treat_yes_no_id" size="50" value="1" {if isset($object->chem_treat_yes_no_id) && $object->chem_treat_yes_no_id == 1} checked {/if}/>
Нет <input onclick="hideChildDivAndSetRequired('chem_treat');" {$class_req_input} type="radio" {$disabled} name="chem_treat_yes_no_id" size="50" value="0" {if isset($object->chem_treat_yes_no_id) && $object->chem_treat_yes_no_id == 0} checked {/if}/></td>
</tr>
</table>

<div id="chem_treat" {if !isset($object->chem_treat_yes_no_id) || $object->chem_treat_yes_no_id == 0} style='display:none' {/if}>
<table class="form">
<tr>
<td class='td_label_form'>Неадъювантная/Адъювантная химиотерапия: Антрациклины</td>
<td>
Да <input  type="radio" {$disabled} name="chem_treat_antracyc_yes_no_id" size="50" value="1" {if isset($object->chem_treat_antracyc_yes_no_id) && $object->chem_treat_antracyc_yes_no_id == 1} checked {/if}/>
Нет <input  type="radio" {$disabled} name="chem_treat_antracyc_yes_no_id" size="50" value="0" {if isset($object->chem_treat_antracyc_yes_no_id) && $object->chem_treat_antracyc_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>Неадъювантная/Адъювантная химиотерапия: Препараты платины</td>
<td>
Да <input  type="radio" {$disabled} name="chem_treat_platina_yes_no_id" size="50" value="1" {if isset($object->chem_treat_platina_yes_no_id) && $object->chem_treat_platina_yes_no_id == 1} checked {/if}/>
Нет <input  type="radio" {$disabled} name="chem_treat_platina_yes_no_id" size="50" value="0" {if isset($object->chem_treat_platina_yes_no_id) && $object->chem_treat_platina_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>Неадъювантная/Адъювантная химиотерапия: Таксаны</td>
<td>
Да <input  type="radio" {$disabled} name="chem_treat_taxans_yes_no_id" size="50" value="1" {if isset($object->chem_treat_taxans_yes_no_id) && $object->chem_treat_taxans_yes_no_id == 1} checked {/if}/>
Нет <input  type="radio" {$disabled} name="chem_treat_taxans_yes_no_id" size="50" value="0" {if isset($object->chem_treat_taxans_yes_no_id) && $object->chem_treat_taxans_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>Неадъювантная/Адъювантная химиотерапия: Циклофосфамид</td>
<td>
Да <input  type="radio" {$disabled} name="chem_treat_cyclophosph_yes_no_id" size="50" value="1" {if isset($object->chem_treat_cyclophosph_yes_no_id) && $object->chem_treat_cyclophosph_yes_no_id == 1} checked {/if}/>
Нет <input  type="radio" {$disabled} name="chem_treat_cyclophosph_yes_no_id" size="50" value="0" {if isset($object->chem_treat_cyclophosph_yes_no_id) && $object->chem_treat_cyclophosph_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>Неадъювантная/Адъювантная химиотерапия: Другая химиотерапия</td>
<td>
Да <input  type="radio" {$disabled} name="chem_treat_other_yes_no_id" size="50" value="1" {if isset($object->chem_treat_other_yes_no_id) && $object->chem_treat_other_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_treat_other_yes_no_id" size="50" value="0" {if isset($object->chem_treat_other_yes_no_id) && $object->chem_treat_other_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>Неадъювантная/Адъювантная химиотерапия: Если да, перечислите все препараты:</td>

{* <td><input type="text" {$readonly} name="chem_treat_other_descr" value="{$object->chem_treat_other_descr}"/></td> *}
<td><textarea {$disabled}  rows="3" cols="45" name="chem_treat_other_descr">{$object->chem_treat_other_descr}</textarea></td>
</tr>
</table>
</div>


<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><b>Прогрессирование заболевания</b></td>
<td>&nbsp;</td>
</tr>
<tr>
<td class='td_label_form'>Дата регистрации прогрессирования заболевания</td>
<td><input {$class_req_input} type="text" {$readonly} name="progress_date" id="progress_date" size="50" value="{if isset($object->progress_date)}{$object->progress_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/></td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, лаб.анализы: СА 125 да/нет</td>
<td>
Да <input onclick="requiredOn('progress_ca125');" {$class_req_input} type="radio" {$disabled} name="progress_ca125_yes_no_id" size="50" value="1" {if isset($object->progress_ca125_yes_no_id) && $object->progress_ca125_yes_no_id == 1} checked {/if}/>
Нет <input onclick="requiredOff('progress_ca125');" {$class_req_input} type="radio" {$disabled} name="progress_ca125_yes_no_id" size="50" value="0" {if isset($object->progress_ca125_yes_no_id) && $object->progress_ca125_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, лаб.анализы: СА 125 Ед/мл</td>
<td><input id="progress_ca125" type="number" step="0.01" {$readonly} name="progress_ca125" size="50" value="{$object->progress_ca125}"/></td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: МРТ ОМТ проводилось</td>
<td>
Да <input {$class_req_input} type="radio" {$disabled} name="progress_instr_mrt_yes_no_id" size="50" value="1" {if isset($object->progress_instr_mrt_yes_no_id) && $object->progress_instr_mrt_yes_no_id == 1} checked {/if}/>
Нет <input {$class_req_input} type="radio" {$disabled} name="progress_instr_mrt_yes_no_id" size="50" value="0" {if isset($object->progress_instr_mrt_yes_no_id) && $object->progress_instr_mrt_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="progress_instr_mrt_date" id="progress_instr_mrt_date" size="10" value="{if isset($object->progress_instr_mrt_date)}{$object->progress_instr_mrt_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/> 
Норма <input type="radio" {$disabled} name="progress_instr_mrt_norm_yes_no_id" size="50" value="1" {if isset($object->progress_instr_mrt_norm_yes_no_id) && $object->progress_instr_mrt_norm_yes_no_id == 1} checked {/if}/>
Патология <input type="radio" {$disabled} name="progress_instr_mrt_norm_yes_no_id" size="50" value="0" {if isset($object->progress_instr_mrt_norm_yes_no_id) && $object->progress_instr_mrt_norm_yes_no_id == 0} checked {/if}/>
</td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: МРТ ОМТ Заключение</td>
<td><textarea {$disabled} rows="3" cols="45" name="progress_instr_mrt_descr">{$object->progress_instr_mrt_descr}</textarea></td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: УЗИ ОБП проводилось</td>
<td>
Да <input {$class_req_input} type="radio" {$disabled} name="progress_instr_us_yes_no_id" size="50" value="1" {if isset($object->progress_instr_us_yes_no_id) && $object->progress_instr_us_yes_no_id == 1} checked {/if}/>
Нет <input {$class_req_input} type="radio" {$disabled} name="progress_instr_us_yes_no_id" size="50" value="0" {if isset($object->progress_instr_us_yes_no_id) && $object->progress_instr_us_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="progress_instr_us_date" id="progress_instr_us_date" size="10" value="{if isset($object->progress_instr_us_date)}{$object->progress_instr_us_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
Норма <input type="radio" {$disabled} name="progress_instr_us_norm_yes_no_id" size="50" value="1" {if isset($object->progress_instr_us_norm_yes_no_id) && $object->progress_instr_us_norm_yes_no_id == 1} checked {/if}/>
Патология <input type="radio" {$disabled} name="progress_instr_us_norm_yes_no_id" size="50" value="0" {if isset($object->progress_instr_us_norm_yes_no_id) && $object->progress_instr_us_norm_yes_no_id == 0} checked {/if}/>
</td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: УЗИ ОБП Заключение</td>
<td><textarea {$disabled} rows="3" cols="45" name="progress_instr_us_descr">{$object->progress_instr_us_descr}</textarea></td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: КТ ОГК проводилось</td>
<td>
Да <input {$class_req_input} type="radio" {$disabled} name="progress_instr_kt_yes_no_id" size="50" value="1" {if isset($object->progress_instr_kt_yes_no_id) && $object->progress_instr_kt_yes_no_id == 1} checked {/if}/>
Нет <input {$class_req_input} type="radio" {$disabled} name="progress_instr_kt_yes_no_id" size="50" value="0" {if isset($object->progress_instr_kt_yes_no_id) && $object->progress_instr_kt_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="progress_instr_kt_date" id="progress_instr_kt_date" size="10" value="{if isset($object->progress_instr_kt_date)}{$object->progress_instr_kt_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
Норма <input type="radio" {$disabled} name="progress_instr_kt_norm_yes_no_id" size="50" value="1" {if isset($object->progress_instr_kt_norm_yes_no_id) && $object->progress_instr_kt_norm_yes_no_id == 1} checked {/if}/>
Патология <input type="radio" {$disabled} name="progress_instr_kt_norm_yes_no_id" size="50" value="0" {if isset($object->progress_instr_kt_norm_yes_no_id) && $object->progress_instr_kt_norm_yes_no_id == 0} checked {/if}/>
</td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: КТ ОГК Заключение</td>
<td><textarea {$disabled} rows="3" cols="45" name="progress_instr_kt_descr">{$object->progress_instr_kt_descr}</textarea></td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: ЭКГ проводилось</td>
<td>
Да <input {$class_req_input} type="radio" {$disabled} name="progress_instr_ekg_yes_no_id" size="50" value="1" {if isset($object->progress_instr_ekg_yes_no_id) && $object->progress_instr_ekg_yes_no_id == 1} checked {/if}/>
Нет <input {$class_req_input} type="radio" {$disabled} name="progress_instr_ekg_yes_no_id" size="50" value="0" {if isset($object->progress_instr_ekg_yes_no_id) && $object->progress_instr_ekg_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="progress_instr_ekg_date" id="progress_instr_ekg_date" size="10" value="{if isset($object->progress_instr_ekg_date)}{$object->progress_instr_ekg_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
Норма <input type="radio" {$disabled} name="progress_instr_ekg_norm_yes_no_id" size="50" value="1" {if isset($object->progress_instr_ekg_norm_yes_no_id) && $object->progress_instr_ekg_norm_yes_no_id == 1} checked {/if}/>
Патология <input type="radio" {$disabled} name="progress_instr_ekg_norm_yes_no_id" size="50" value="0" {if isset($object->progress_instr_ekg_norm_yes_no_id) && $object->progress_instr_ekg_norm_yes_no_id == 0} checked {/if}/>
</td>
</tr>
<tr>
<td class='td_label_form'>Прогрес-ние забол-я, Инстр. исследования: ЭКГ Заключение</td>
<td><textarea {$disabled} rows="3" cols="45" name="progress_instr_ekg_descr">{$object->progress_instr_ekg_descr}</textarea></td>
</tr>
<tr>
<td class='td_label_form'>Рецидив заболевания: да/нет</td>
<td>
Да <input {$class_req_input} type="radio" {$disabled} name="recidive_yes_no_id" size="50" value="1" {if isset($object->recidive_yes_no_id) && $object->recidive_yes_no_id == 1} checked {/if}/>
Нет <input {$class_req_input} type="radio" {$disabled} name="recidive_yes_no_id" size="50" value="0" {if isset($object->recidive_yes_no_id) && $object->recidive_yes_no_id == 0} checked {/if}/></td>
</tr>
</table>

<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><span class="mark_open_close" id="metastases_mark">{if isset($object->metastases_yes_no_id) && $object->metastases_yes_no_id == 1} - {else} + {/if}</span> <b>Метастазы</b></td>
<td>
Да <input onclick="showChildDivAndSetRequired('metastases');" {$class_req_input} type="radio" {$disabled} name="metastases_yes_no_id" size="50" value="1" {if isset($object->metastases_yes_no_id) && $object->metastases_yes_no_id == 1} checked {/if}/>
Нет <input onclick="hideChildDivAndSetRequired('metastases');" {$class_req_input} type="radio" {$disabled} name="metastases_yes_no_id" size="50" value="0" {if isset($object->metastases_yes_no_id) && $object->metastases_yes_no_id == 0} checked {/if}/></td>
</tr>
</table>
<div id="metastases" {if !isset($object->metastases_yes_no_id) || $object->metastases_yes_no_id == 0} style='display:none' {/if}>
<table class="form">
<tr>
<td class='td_label_form'>Метастазы: лёгкие</td>
<td>
Да <input type="radio" {$disabled} name="metastases_lung_yes_no_id" size="50" value="1" {if isset($object->metastases_lung_yes_no_id) && $object->metastases_lung_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_lung_yes_no_id" size="50" 
value="0" {if isset($object->metastases_lung_yes_no_id) && $object->metastases_lung_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_lung_date" id="metastases_lung_date" size="10" value="{if isset($object->metastases_lung_date)}{$object->metastases_lung_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Печень</td>
<td>
Да <input type="radio" {$disabled} name="metastases_hepat_yes_no_id" size="50" value="1" {if isset($object->metastases_hepat_yes_no_id) && $object->metastases_hepat_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_hepat_yes_no_id" size="50" 
value="0" {if isset($object->metastases_hepat_yes_no_id) && $object->metastases_hepat_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_hepat_date" id="metastases_hepat_date" size="10" value="{if isset($object->metastases_hepat_date)}{$object->metastases_hepat_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Кости</td>
<td>
Да <input type="radio" {$disabled} name="metastases_osteo_yes_no_id" size="50" value="1" {if isset($object->metastases_osteo_yes_no_id) && $object->metastases_osteo_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_osteo_yes_no_id" size="50" 
value="0" {if isset($object->metastases_osteo_yes_no_id) && $object->metastases_osteo_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_osteo_date" id="metastases_osteo_date" size="10" value="{if isset($object->metastases_osteo_date)}{$object->metastases_osteo_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Почки</td>
<td>
Да <input type="radio" {$disabled} name="metastases_renal_yes_no_id" size="50" value="1" {if isset($object->metastases_renal_yes_no_id) && $object->metastases_renal_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_renal_yes_no_id" size="50" value="0" {if isset($object->metastases_renal_yes_no_id) && $object->metastases_renal_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_renal_date" id="metastases_renal_date" size="10" value="{if isset($object->metastases_renal_date)}{$object->metastases_renal_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Л/узлы</td>
<td>
Да <input type="radio" {$disabled} name="metastases_lymph_nodes_yes_no_id" size="50" value="1" {if isset($object->metastases_lymph_nodes_yes_no_id) && $object->metastases_lymph_nodes_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_lymph_nodes_yes_no_id" size="50" 
value="0" {if isset($object->metastases_lymph_nodes_yes_no_id) && $object->metastases_lymph_nodes_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_lymph_nodes_date" id="metastases_lymph_nodes_date" size="10" value="{if isset($object->metastases_lymph_nodes_date)}{$object->metastases_lymph_nodes_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Плевра</td>
<td>
Да <input type="radio" {$disabled} name="metastases_plevra_yes_no_id" size="50" value="1" {if isset($object->metastases_plevra_yes_no_id) && $object->metastases_plevra_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_plevra_yes_no_id" size="50" 
value="0" {if isset($object->metastases_plevra_yes_no_id) && $object->metastases_plevra_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_plevra_date" id="metastases_plevra_date" size="10" value="{if isset($object->metastases_plevra_date)}{$object->metastases_plevra_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Иное</td>
<td><textarea {$disabled} rows="3" cols="45" name="metastases_other_descr">{$object->metastases_other_descr}</textarea></td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Было проведено хирургическое вмешательство</td>
<td>
Да <input type="radio" {$disabled} name="metastases_surgical_treat_yes_no_id" size="50" value="1" {if isset($object->metastases_surgical_treat_yes_no_id) && $object->metastases_surgical_treat_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="metastases_surgical_treat_yes_no_id" size="50" value="0" {if isset($object->metastases_surgical_treat_yes_no_id) && $object->metastases_surgical_treat_yes_no_id == 0} checked {/if}/>
Дата <input type="text" {$readonly} name="metastases_surgical_treat_date" id="metastases_surgical_treat_date" size="10" value="{if isset($object->metastases_surgical_treat_date)}{$object->metastases_surgical_treat_date|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>Метастазы: Объем оперативного вмешательства</td>
<td><textarea {$disabled} rows="3" cols="45" name="metastases_surgical_treat_descr">{$object->metastases_surgical_treat_descr}</textarea></td>
</tr>
</table>
</div>

<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><span class="mark_open_close" id="chem_1st_mark">{if isset($object->chem_1st_line_treat_yes_no_id) && $object->chem_1st_line_treat_yes_no_id == 1} - {else} + {/if}</span> <b>1-ая линия ХТ рецидив. рака яичников<b></td>
<td>
Да <input onclick="showChildDivAndSetRequired('chem_1st');" {$class_req_input} type="radio" {$disabled} name="chem_1st_line_treat_yes_no_id" size="50" value="1" {if isset($object->chem_1st_line_treat_yes_no_id) && $object->chem_1st_line_treat_yes_no_id == 1} checked {/if}/>
Нет <input onclick="hideChildDivAndSetRequired('chem_1st');" {$class_req_input} type="radio" {$disabled} name="chem_1st_line_treat_yes_no_id" size="50" value="0" {if isset($object->chem_1st_line_treat_yes_no_id) && $object->chem_1st_line_treat_yes_no_id == 0} checked {/if}/></td>
</tr>
</table>

<div id="chem_1st" {if !isset($object->chem_1st_line_treat_yes_no_id) || $object->chem_1st_line_treat_yes_no_id == 0} style='display:none' {/if}>
<table class="form">
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Карбоплатин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_karboplatin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_karboplatin_yes_no_id) && $object->chem_1st_karboplatin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_karboplatin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_karboplatin_yes_no_id) && $object->chem_1st_karboplatin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Цисплатин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_cisplatin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_cisplatin_yes_no_id) && $object->chem_1st_cisplatin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_cisplatin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_cisplatin_yes_no_id) && $object->chem_1st_cisplatin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Циклофосфан (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_ciklofosfan_yes_no_id" size="50" value="1" {if isset($object->chem_1st_ciklofosfan_yes_no_id) && $object->chem_1st_ciklofosfan_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_ciklofosfan_yes_no_id" size="50" value="0" {if isset($object->chem_1st_ciklofosfan_yes_no_id) && $object->chem_1st_ciklofosfan_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Паклитаксел (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_paklitaksel_yes_no_id" size="50" value="1" {if isset($object->chem_1st_paklitaksel_yes_no_id) && $object->chem_1st_paklitaksel_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_paklitaksel_yes_no_id" size="50" value="0" {if isset($object->chem_1st_paklitaksel_yes_no_id) && $object->chem_1st_paklitaksel_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Доксорубицин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_doksorubicin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_doksorubicin_yes_no_id) && $object->chem_1st_doksorubicin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_doksorubicin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_doksorubicin_yes_no_id) && $object->chem_1st_doksorubicin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Бевацизумаб (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_bevacizumab_yes_no_id" size="50" value="1" {if isset($object->chem_1st_bevacizumab_yes_no_id) && $object->chem_1st_bevacizumab_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_bevacizumab_yes_no_id" size="50" value="0" {if isset($object->chem_1st_bevacizumab_yes_no_id) && $object->chem_1st_bevacizumab_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Топотекан (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_topotekan_yes_no_id" size="50" value="1" {if isset($object->chem_1st_topotekan_yes_no_id) && $object->chem_1st_topotekan_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_topotekan_yes_no_id" size="50" value="0" {if isset($object->chem_1st_topotekan_yes_no_id) && $object->chem_1st_topotekan_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Гемцитабин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_gemcitabin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_gemcitabin_yes_no_id) && $object->chem_1st_gemcitabin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_gemcitabin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_gemcitabin_yes_no_id) && $object->chem_1st_gemcitabin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Винорельбин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_vinorelbin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_vinorelbin_yes_no_id) && $object->chem_1st_vinorelbin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_vinorelbin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_vinorelbin_yes_no_id) && $object->chem_1st_vinorelbin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Иринотекан (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_irinotekan_yes_no_id" size="50" value="1" {if isset($object->chem_1st_irinotekan_yes_no_id) && $object->chem_1st_irinotekan_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_irinotekan_yes_no_id" size="50" value="0" {if isset($object->chem_1st_irinotekan_yes_no_id) && $object->chem_1st_irinotekan_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Этопозид (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_etopozid_yes_no_id" size="50" value="1" {if isset($object->chem_1st_etopozid_yes_no_id) && $object->chem_1st_etopozid_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_etopozid_yes_no_id" size="50" value="0" {if isset($object->chem_1st_etopozid_yes_no_id) && $object->chem_1st_etopozid_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Эпирубицин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_epirubicin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_epirubicin_yes_no_id) && $object->chem_1st_epirubicin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_epirubicin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_epirubicin_yes_no_id) && $object->chem_1st_epirubicin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Доцетаксел (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_docetaxel_yes_no_id" size="50" value="1" {if isset($object->chem_1st_docetaxel_yes_no_id) && $object->chem_1st_docetaxel_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_docetaxel_yes_no_id" size="50" value="0" {if isset($object->chem_1st_docetaxel_yes_no_id) && $object->chem_1st_docetaxel_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Оксалиплатин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_oksaliplatin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_oksaliplatin_yes_no_id) && $object->chem_1st_oksaliplatin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_oksaliplatin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_oksaliplatin_yes_no_id) && $object->chem_1st_oksaliplatin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Трабектедин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_trabektidin_yes_no_id" size="50" value="1" {if isset($object->chem_1st_trabektidin_yes_no_id) && $object->chem_1st_trabektidin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_trabektidin_yes_no_id" size="50" value="0" {if isset($object->chem_1st_trabektidin_yes_no_id) && $object->chem_1st_trabektidin_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Другое (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_1st_other_yes_no_id" size="50" value="1" {if isset($object->chem_1st_other_yes_no_id) && $object->chem_1st_other_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_1st_other_yes_no_id" size="50" value="0" {if isset($object->chem_1st_other_yes_no_id) && $object->chem_1st_other_yes_no_id == 0} checked {/if}/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Если да, просьба указать торговое название препарата</td>
<td><textarea {$disabled} rows="3" cols="45" name="chem_1st_other_descr">{$object->chem_1st_other_descr}</textarea></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Даты терапии</td>
<td>
Дата начала <input type="text" {$readonly} name="chem_1st_date_start" id="chem_1st_date_start" size="10" value="{if isset($object->chem_1st_date_start)}{$object->chem_1st_date_start|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
Дата окончания <input type="text" {$readonly} name="chem_1st_date_finish" id="chem_1st_date_finish" size="10" value="{if isset($object->chem_1st_date_finish)}{$object->chem_1st_date_finish|date_format:'%d/%m/%Y'}{else}{/if}" onblur="IsObjDate(this);" onkeyup="TempDt(event,this);"/>
</td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Число курсов</td>
<td><input type="text" {$readonly} name="chem_1st_course_number" size="50" value="{$object->chem_1st_course_number}"/></td>
</tr>
<tr>
<td class='td_label_form'>1-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия</td>
<td><textarea {$disabled} rows="3" cols="45" name="chem_1st_concomitant_therapy_descr">{$object->chem_1st_concomitant_therapy_descr}</textarea></td>
</tr>
</table>
</div>


<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><b>2-ая линия ХТ рецидив. рака яичников</b></td>
<td>&nbsp;</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Трабектедин</td>
<td>
Да <input type="radio" {$disabled} name="chem_2st_trabectedin_yes_no_id" size="50" value="1" {if isset($object->chem_2st_trabectedin_yes_no_id) && $object->chem_2st_trabectedin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_2st_trabectedin_yes_no_id" size="50" value="0" {if isset($object->chem_2st_trabectedin_yes_no_id) && $object->chem_2st_trabectedin_yes_no_id == 0} checked {/if}/>
Доза <input type="text" {$readonly} name="chem_2st_trabectedin_dose" size="50" value="{$object->chem_2st_trabectedin_dose}"/>
</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД</td>
<td>
Да <input type="radio" {$disabled} name="chem_2st_pld_yes_no_id" size="50" value="1" {if isset($object->chem_2st_pld_yes_no_id) && $object->chem_2st_pld_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_2st_pld_yes_no_id" size="50" value="0" {if isset($object->chem_2st_pld_yes_no_id) && $object->chem_2st_pld_yes_no_id == 0} checked {/if}/>
Доза <input type="text" {$readonly} name="chem_2st_pld_dose" size="50" value="{$object->chem_2st_pld_dose}"/>
</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_2st_doxopeg_yes_no_id" size="50" value="1" {if isset($object->chem_2st_doxopeg_yes_no_id) && $object->chem_2st_doxopeg_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_2st_doxopeg_yes_no_id" size="50" value="0" {if isset($object->chem_2st_doxopeg_yes_no_id) && $object->chem_2st_doxopeg_yes_no_id == 0} checked {/if}/>
Доза <input type="text" {$readonly} name="chem_2st_doxopeg_dose" size="50" value="{$object->chem_2st_doxopeg_dose}"/>
</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_2st_kelix_yes_no_id" size="50" value="1" {if isset($object->chem_2st_kelix_yes_no_id) && $object->chem_2st_kelix_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_2st_kelix_yes_no_id" size="50" value="0" {if isset($object->chem_2st_kelix_yes_no_id) && $object->chem_2st_kelix_yes_no_id == 0} checked {/if}/>
Доза <input type="text" {$readonly} name="chem_2st_kelix_dose" size="50" value="{$object->chem_2st_kelix_dose}"/>
</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксорубицин (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_2st_doksorubicin_yes_no_id" size="50" value="1" {if isset($object->chem_2st_doksorubicin_yes_no_id) && $object->chem_2st_doksorubicin_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_2st_doksorubicin_yes_no_id" size="50" value="0" {if isset($object->chem_2st_doksorubicin_yes_no_id) && $object->chem_2st_doksorubicin_yes_no_id == 0} checked {/if}/>
Доза <input type="text" {$readonly} name="chem_2st_doksorubicin_dose" size="50" value="{$object->chem_2st_doksorubicin_dose}"/>
</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное (да, нет)</td>
<td>
Да <input type="radio" {$disabled} name="chem_2st_other_yes_no_id" size="50" value="1" {if isset($object->chem_2st_other_yes_no_id) && $object->chem_2st_other_yes_no_id == 1} checked {/if}/>
Нет <input type="radio" {$disabled} name="chem_2st_other_yes_no_id" size="50" value="0" {if isset($object->chem_2st_other_yes_no_id) && $object->chem_2st_other_yes_no_id == 0} checked {/if}/>
Доза <input type="text" {$readonly} name="chem_2st_other_dose" size="50" value="{$object->chem_2st_other_dose}"/>
</td>
</tr>
<tr>
<td class='td_label_form'>2-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия</td>
<td><textarea {$disabled} rows="3" cols="45" name="chem_2st_concomitant_therapy_descr">{$object->chem_2st_concomitant_therapy_descr}</textarea></td>
</tr>
</table>


<table class="form">
<tr class="tr_open_close">
<td class='td_label_form'><b>Нежелательные явления</b></td>
<td>&nbsp;</td>
</tr>
</table>
<table class="form">
<tr>
<td class='td_label_form'>Отмечал ли пациент какие-либо нежелательные явления при применении химиотерапии Трабектедин в комбинации с ПЛД? Если да, просьба заполнить бланк НЯ</td>
<td>
Да <input {$class_req_input} type="radio" {$disabled} name="undesirable_event_yes_no_id" size="50" value="1" {if isset($object->undesirable_event_yes_no_id) && $object->undesirable_event_yes_no_id == 1} checked {/if}/>
Нет <input {$class_req_input} type="radio" {$disabled} name="undesirable_event_yes_no_id" size="50" value="0" {if isset($object->undesirable_event_yes_no_id) && $object->undesirable_event_yes_no_id == 0} checked {/if}/></td>
</tr>




{include file="form_bottom.tpl"}

</table>

</form>

</div>

{include file="footer.tpl"}</div>

</body>
</html>
