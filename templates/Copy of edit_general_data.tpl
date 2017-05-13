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
	<tr style="display: none;">
		<td>ID записи</td>
		<td>{if $object->id} {$object->id} {else}
		<div style="background-color: #d14836">Новый</div>
		{/if}</td>
		<input type="hidden" name="id" value="{$object->id}" />
	</tr>
	<tr>
		<td>Дата визита</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="visit_date" size="50" value="{$object->visit_date}" /></td>
	</tr>
	<tr>
		<td>Дата рождения</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="date_birth" size="50" value="{$object->date_birth}" /></td>
	</tr>
	<tr>
		<td>Масса тела в килограммах</td>
		<td><input {$class_req_input} type="text" {$readonly} name="weight_kg"
			size="50" value="{$object->weight_kg}" /></td>
	</tr>
	<tr>
		<td>Рост в сантиметрах</td>
		<td><input {$class_req_input} type="text" {$readonly} name="height_sm"
			size="50" value="{$object->height_sm}" /></td>
	</tr>
	<tr>
		<td>Этническая принадлежность</td>
		<td><select {$class_req_input} {$disabled} name="nationality_id">
			<option></option>
			{foreach $nationality_vals as $item}
			<option {if $item->id == $object->nationality_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Этническая принадлежность (если нет в списке)</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="nationality_if_other" size="50"
			value="{$object->nationality_if_other}" /></td>
	</tr>
	<tr>
		<td>Место жительства</td>
		<td><select {$class_req_input} {$disabled} name="place_living_id">
			<option></option>
			{foreach $place_living_vals as $item}
			<option {if $item->id == $object->place_living_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Образование</td>
		<td><select {$class_req_input} {$disabled} name="education_id">
			<option></option>
			{foreach $education_vals as $item}
			<option {if $item->id == $object->education_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Социально-экономическое положение</td>
		<td><select
			{$class_req_input} {$disabled} name="social_economic_status_id">
			<option></option>
			{foreach $social_economic_status_vals as $item}
			<option {if $item->id == $object->social_economic_status_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Дата постановки диагноза рак яичников</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="diag_cancer_estab_date" size="50"
			value="{$object->diag_cancer_estab_date}" /></td>
	</tr>
	<tr>
		<td>TNM стадия на момент постановки диагноза - T</td>
		<td><select
			{$class_req_input} {$disabled} name="diag_cancer_tnm_stage_t_id">
			<option></option>
			{foreach $diag_cancer_tnm_stage_t_vals as $item}
			<option {if $item->id == $object->diag_cancer_tnm_stage_t_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>TNM стадия на момент постановки диагноза - N</td>
		<td><select
			{$class_req_input} {$disabled} name="diag_cancer_tnm_stage_n_id">
			<option></option>
			{foreach $diag_cancer_tnm_stage_n_vals as $item}
			<option {if $item->id == $object->diag_cancer_tnm_stage_n_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>TNM стадия на момент постановки диагноза - M</td>
		<td><select
			{$class_req_input} {$disabled} name="diag_cancer_tnm_stage_m_id">
			<option></option>
			{foreach $diag_cancer_tnm_stage_m_vals as $item}
			<option {if $item->id == $object->diag_cancer_tnm_stage_m_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Клиническая стадия заболевания на момент постановки диагноза</td>
		<td><select
			{$class_req_input} {$disabled} name="diag_cancer_clin_stage_id">
			<option></option>
			{foreach $diag_cancer_clin_stage_vals as $item}
			<option {if $item->id == $object->diag_cancer_clin_stage_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: да/нет</td>
		{*
		<td><select
			{$class_req_input} {$disabled} name="surgical_treat_yes_no_id">
			<option></option>
			{foreach $surgical_treat_yes_no_vals as $item}
			<option {if $item->id == $object->surgical_treat_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
		*}
		<td>
Да <input required {$class_req_input} type="radio" {$readonly} name="surgical_treat_yes_no_id" size="50" value="1" 
{if isset($object->surgical_treat_yes_no_id) &&  $object->surgical_treat_yes_no_id == 1} checked {/if}/>
Нет <input required {$class_req_input} type="radio" {$readonly} name="surgical_treat_yes_no_id" size="50" value="0"
{if  isset($object->surgical_treat_yes_no_id) && $object->surgical_treat_yes_no_id == 0} checked {/if}/>
</td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 1. Экстирпация матки с придатками</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treat_ecstir_yes_no_id">
			<option></option>
			{foreach $surgical_treat_ecstir_yes_no_vals as $item}
			<option {if $item->id == $object->surgical_treat_ecstir_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 1. Экстирпация матки с придатками дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treat_ecstir_date" size="50"
			value="{$object->surgical_treat_ecstir_date}" /></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 2. Гистероскопия I</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treatment_gister01_yes_no_id">
			<option></option>
			{foreach $surgical_treatment_gister01_yes_no_vals as $item}
			<option {if $item->id ==
			$object->surgical_treatment_gister01_yes_no_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 2. Гистероскопия I дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treatment_gister01_date" size="50"
			value="{$object->surgical_treatment_gister01_date}" /></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 3. Гистероскопия II</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treatment_gister02_yes_no_id">
			<option></option>
			{foreach $surgical_treatment_gister02_yes_no_vals as $item}
			<option {if $item->id ==
			$object->surgical_treatment_gister02_yes_no_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 3. Гистероскопия II дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treatment_gister02_date" size="50"
			value="{$object->surgical_treatment_gister02_date}" /></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 4. Гистероскопия III</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treatment_gister03_yes_no_id">
			<option></option>
			{foreach $surgical_treatment_gister03_yes_no_vals as $item}
			<option {if $item->id ==
			$object->surgical_treatment_gister03_yes_no_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 4. Гистероскопия III дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treatment_gister03_date" size="50"
			value="{$object->surgical_treatment_gister03_date}" /></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 5. Диагностическая лапаротомия</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treatment_diag_laparotomia_yes_no_id">
			<option></option>
			{foreach $surgical_treatment_diag_laparotomia_yes_no_vals as $item}
			<option {if $item->id ==
			$object->surgical_treatment_diag_laparotomia_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 5. Диагностическая лапаротомия дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treatment_diag_laparotomia_date" size="50"
			value="{$object->surgical_treatment_diag_laparotomia_date}" /></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 6. Диагностическая лапароскопия</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treatment_diag_laparoscopia_yes_no_id">
			<option></option>
			{foreach $surgical_treatment_diag_laparoscopia_yes_no_vals as $item}
			<option {if $item->id ==
			$object->surgical_treatment_diag_laparoscopia_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 6. Диагностическая лапароскопия дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treatment_diag_laparoscopia_date"
			size="50"
			value="{$object->surgical_treatment_diag_laparoscopia_date}" /></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 7. Эксплоративная лапаротомия</td>
		<td><select
			{$class_req_input} {$disabled} name="surgical_treatment_explorat_laparotomia_yes_no_id">
			<option></option>
			{foreach $surgical_treatment_explorat_laparotomia_yes_no_vals as
			$item}
			<option {if $item->id ==
			$object->surgical_treatment_explorat_laparotomia_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Хирургическое лечение: 7. Эксплоративная лапаротомия дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="surgical_treatment_explorat_laparotomia_date"
			size="50"
			value="{$object->surgical_treatment_explorat_laparotomia_date}" /></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: да/нет</td>
		<td><select {$class_req_input} {$disabled} name="chem_treat_yes_no_id">
			<option></option>
			{foreach $chem_treat_yes_no_vals as $item}
			<option {if $item->id == $object->chem_treat_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: Антрациклины</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_treat_antracyc_yes_no_id">
			<option></option>
			{foreach $chem_treat_antracyc_yes_no_vals as $item}
			<option {if $item->id == $object->chem_treat_antracyc_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: Препараты платины</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_treat_platina_yes_no_id">
			<option></option>
			{foreach $chem_treat_platina_yes_no_vals as $item}
			<option {if $item->id == $object->chem_treat_platina_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: Таксаны</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_treat_taxans_yes_no_id">
			<option></option>
			{foreach $chem_treat_taxans_yes_no_vals as $item}
			<option {if $item->id == $object->chem_treat_taxans_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: Циклофосфамид</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_treat_cyclophosph_yes_no_id">
			<option></option>
			{foreach $chem_treat_cyclophosph_yes_no_vals as $item}
			<option {if $item->id == $object->chem_treat_cyclophosph_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: Другая химиотерапия</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_treat_other_yes_no_id">
			<option></option>
			{foreach $chem_treat_other_yes_no_vals as $item}
			<option {if $item->id == $object->chem_treat_other_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Неадъювантная/Адъювантная химиотерапия: Если да, перечислите все
		препараты:</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_treat_other_descr" size="50"
			value="{$object->chem_treat_other_descr}" /></td>
	</tr>
	<tr>
		<td>Дата регистрации прогрессирования заболевания</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_date" size="50"
			value="{$object->progress_date}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, лаб.анализы: СА 125 да/нет</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_ca125_yes_no_id">
			<option></option>
			{foreach $progress_ca125_yes_no_vals as $item}
			<option {if $item->id == $object->progress_ca125_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, лаб.анализы: СА 125 Ед/мл</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_ca125" size="50"
			value="{$object->progress_ca125}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: МРТ
		ОМТ да/нет</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_mrt_yes_no_id">
			<option></option>
			{foreach $progress_instr_mrt_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_mrt_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: МРТ
		ОМТ дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_mrt_date" size="50"
			value="{$object->progress_instr_mrt_date}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: МРТ
		ОМТ норма/патология</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_mrt_norm_yes_no_id">
			<option></option>
			{foreach $progress_instr_mrt_norm_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_mrt_norm_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: МРТ
		ОМТ Заключение</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_mrt_descr" size="50"
			value="{$object->progress_instr_mrt_descr}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: УЗИ
		ОБП да/нет</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_us_yes_no_id">
			<option></option>
			{foreach $progress_instr_us_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_us_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: УЗИ
		ОБП дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_us_date" size="50"
			value="{$object->progress_instr_us_date}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: УЗИ
		ОБП норма/патология</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_us_norm_yes_no_id">
			<option></option>
			{foreach $progress_instr_us_norm_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_us_norm_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: УЗИ
		ОБП Заключение</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_us_descr" size="50"
			value="{$object->progress_instr_us_descr}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: КТ
		ОГК да/нет</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_kt_yes_no_id">
			<option></option>
			{foreach $progress_instr_kt_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_kt_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: КТ
		ОГК дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_kt_date" size="50"
			value="{$object->progress_instr_kt_date}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: КТ
		ОГК норма/патология</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_kt_norm_yes_no_id">
			<option></option>
			{foreach $progress_instr_kt_norm_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_kt_norm_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: КТ
		ОГК Заключение</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_kt_descr" size="50"
			value="{$object->progress_instr_kt_descr}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: ЭКГ
		да/нет</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_ekg_yes_no_id">
			<option></option>
			{foreach $progress_instr_ekg_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_ekg_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: ЭКГ
		дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_ekg_date" size="50"
			value="{$object->progress_instr_ekg_date}" /></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: ЭКГ
		норма/патология</td>
		<td><select
			{$class_req_input} {$disabled} name="progress_instr_ekg_norm_yes_no_id">
			<option></option>
			{foreach $progress_instr_ekg_norm_yes_no_vals as $item}
			<option {if $item->id == $object->progress_instr_ekg_norm_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Прогрессирование заболевания, Инструментальные исследования: ЭКГ
		Заключение</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="progress_instr_ekg_descr" size="50"
			value="{$object->progress_instr_ekg_descr}" /></td>
	</tr>
	<tr>
		<td>Рецидив заболевания: да/нет</td>
		<td><select {$class_req_input} {$disabled} name="recidive_yes_no_id">
			<option></option>
			{foreach $recidive_yes_no_vals as $item}
			<option {if $item->id == $object->recidive_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: да/нет</td>
		<td><select {$class_req_input} {$disabled} name="metastases_yes_no_id">
			<option></option>
			{foreach $metastases_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: лёгкие</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_lung_yes_no_id">
			<option></option>
			{foreach $metastases_lung_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_lung_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: лёгкие дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_lung_date" size="50"
			value="{$object->metastases_lung_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Печень</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_hepat_yes_no_id">
			<option></option>
			{foreach $metastases_hepat_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_hepat_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: Печень дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_hepat_date" size="50"
			value="{$object->metastases_hepat_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Кости</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_osteo_yes_no_id">
			<option></option>
			{foreach $metastases_osteo_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_osteo_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: Кости дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_osteo_date" size="50"
			value="{$object->metastases_osteo_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Почки</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_renal_yes_no_id">
			<option></option>
			{foreach $metastases_renal_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_renal_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: Почки дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_renal_date" size="50"
			value="{$object->metastases_renal_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Л/узлы</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_lymph_nodes_yes_no_id">
			<option></option>
			{foreach $metastases_lymph_nodes_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_lymph_nodes_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: Л/узлы дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_lymph_nodes_date" size="50"
			value="{$object->metastases_lymph_nodes_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Плевра</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_plevra_yes_no_id">
			<option></option>
			{foreach $metastases_plevra_yes_no_vals as $item}
			<option {if $item->id == $object->metastases_plevra_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: Плевра дата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_plevra_date" size="50"
			value="{$object->metastases_plevra_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Иное</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_other_descr" size="50"
			value="{$object->metastases_other_descr}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Было проведено хирургическое вмешательство</td>
		<td><select
			{$class_req_input} {$disabled} name="metastases_surgical_treat_yes_no_id">
			<option></option>
			{foreach $metastases_surgical_treat_yes_no_vals as $item}
			<option {if $item->id ==
			$object->metastases_surgical_treat_yes_no_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Метастазы: Дата проведения хирургического вмешательства</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_surgical_treat_date" size="50"
			value="{$object->metastases_surgical_treat_date}" /></td>
	</tr>
	<tr>
		<td>Метастазы: Объем оперативного вмешательства</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="metastases_surgical_treat_descr" size="50"
			value="{$object->metastases_surgical_treat_descr}" /></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: да/нет</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_line_treat_yes_no_id">
			<option></option>
			{foreach $chem_1st_line_treat_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_line_treat_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Карбоплатин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_karboplatin_yes_no_id">
			<option></option>
			{foreach $chem_1st_karboplatin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_karboplatin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Цисплатин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_cisplatin_yes_no_id">
			<option></option>
			{foreach $chem_1st_cisplatin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_cisplatin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Циклофосфан (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_ciklofosfan_yes_no_id">
			<option></option>
			{foreach $chem_1st_ciklofosfan_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_ciklofosfan_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Паклитаксел (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_paklitaksel_yes_no_id">
			<option></option>
			{foreach $chem_1st_paklitaksel_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_paklitaksel_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Доксорубицин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_doksorubicin_yes_no_id">
			<option></option>
			{foreach $chem_1st_doksorubicin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_doksorubicin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Бевацизумаб (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_bevacizumab_yes_no_id">
			<option></option>
			{foreach $chem_1st_bevacizumab_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_bevacizumab_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Топотекан (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_topotekan_yes_no_id">
			<option></option>
			{foreach $chem_1st_topotekan_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_topotekan_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Гемцитабин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_gemcitabin_yes_no_id">
			<option></option>
			{foreach $chem_1st_gemcitabin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_gemcitabin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Винорельбин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_vinorelbin_yes_no_id">
			<option></option>
			{foreach $chem_1st_vinorelbin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_vinorelbin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Иринотекан (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_irinotekan_yes_no_id">
			<option></option>
			{foreach $chem_1st_irinotekan_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_irinotekan_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Этопозид (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_etopozid_yes_no_id">
			<option></option>
			{foreach $chem_1st_etopozid_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_etopozid_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Эпирубицин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_epirubicin_yes_no_id">
			<option></option>
			{foreach $chem_1st_epirubicin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_epirubicin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Доцетаксел (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_docetaxel_yes_no_id">
			<option></option>
			{foreach $chem_1st_docetaxel_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_docetaxel_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Оксалиплатин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_oksaliplatin_yes_no_id">
			<option></option>
			{foreach $chem_1st_oksaliplatin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_oksaliplatin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Трабектедин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_trabektidin_yes_no_id">
			<option></option>
			{foreach $chem_1st_trabektidin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_trabektidin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Другое (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_1st_other_yes_no_id">
			<option></option>
			{foreach $chem_1st_other_yes_no_vals as $item}
			<option {if $item->id == $object->chem_1st_other_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Если да, просьба указать
		торговое название препарата</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_1st_other_descr" size="50"
			value="{$object->chem_1st_other_descr}" /></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Дата начала терапии</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_1st_date_start" size="50"
			value="{$object->chem_1st_date_start}" /></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Дата окончания терапии</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_1st_date_finish" size="50"
			value="{$object->chem_1st_date_finish}" /></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Число курсов</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_1st_course_number" size="50"
			value="{$object->chem_1st_course_number}" /></td>
	</tr>
	<tr>
		<td>1-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_1st_concomitant_therapy_descr" size="50"
			value="{$object->chem_1st_concomitant_therapy_descr}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Трабектедин
		(да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_2st_trabectedin_yes_no_id">
			<option></option>
			{foreach $chem_2st_trabectedin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_2st_trabectedin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения):
		Трабектедин, доза</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_trabectedin_dose" size="50"
			value="{$object->chem_2st_trabectedin_dose}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД (да,
		нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_2st_pld_yes_no_id">
			<option></option>
			{foreach $chem_2st_pld_yes_no_vals as $item}
			<option {if $item->id == $object->chem_2st_pld_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД, доза</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_pld_dose" size="50"
			value="{$object->chem_2st_pld_dose}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг
		(да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_2st_doxopeg_yes_no_id">
			<option></option>
			{foreach $chem_2st_doxopeg_yes_no_vals as $item}
			<option {if $item->id == $object->chem_2st_doxopeg_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг,
		доза</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_doxopeg_dose" size="50"
			value="{$object->chem_2st_doxopeg_dose}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс (да,
		нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_2st_kelix_yes_no_id">
			<option></option>
			{foreach $chem_2st_kelix_yes_no_vals as $item}
			<option {if $item->id == $object->chem_2st_kelix_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс ,
		доза</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_kelix_dose" size="50"
			value="{$object->chem_2st_kelix_dose}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения):
		Доксорубицин (да, нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_2st_doksorubicin_yes_no_id">
			<option></option>
			{foreach $chem_2st_doksorubicin_yes_no_vals as $item}
			<option {if $item->id == $object->chem_2st_doksorubicin_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения):
		Доксорубицин , доза</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_doksorubicin_dose" size="50"
			value="{$object->chem_2st_doksorubicin_dose}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное (да,
		нет)</td>
		<td><select
			{$class_req_input} {$disabled} name="chem_2st_other_yes_no_id">
			<option></option>
			{foreach $chem_2st_other_yes_no_vals as $item}
			<option {if $item->id == $object->chem_2st_other_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное, доза</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_other_dose" size="50"
			value="{$object->chem_2st_other_dose}" /></td>
	</tr>
	<tr>
		<td>2-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="chem_2st_concomitant_therapy_descr" size="50"
			value="{$object->chem_2st_concomitant_therapy_descr}" /></td>
	</tr>
	<tr>
		<td>Нежелательное явление (да, нет) - Отмечал ли пациент какие-либо
		нежелательные явления при применении химиотерапии Трабектедин в
		комбинации с ПЛД? Если да, просьба заполнить бланк НЯ</td>
		<td><select
			{$class_req_input} {$disabled} name="undesirable_event_yes_no_id">
			<option></option>
			{foreach $undesirable_event_yes_no_vals as $item}
			<option {if $item->id == $object->undesirable_event_yes_no_id}
			selected="selected" {/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>

{include file="form_bottom.tpl"}

</table>

</form>

</div>

{include file="footer.tpl"}</div>

</body>
</html>
