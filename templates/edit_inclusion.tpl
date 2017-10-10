<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title> {include file="js_include.tpl"}
<script type="text/javascript">
	
</script>
</head>
<body>

	<div id="wrap">
		{include file="header.tpl"}

		<div id="content">
			{include file="form_head.tpl"}

			<table class="form_iclusion">
				<col width="250">
				{include file="form_note_req_fields.tpl"}
				{include file="query.tpl"}
				<tr style="display: ;">
					<td>ID записи</td>
					<td>{if $object->id} {$object->id} {else}
						<div style="background-color: #d14836">Новый</div> {/if}
					</td>
					<input type="hidden" name="id" value="{$object->id}" />
				</tr>


				<tr>
				<td class='td_label_form'>Статус включения</td>
				<td>
				{if $object->getStatusInclusion()==1}<span style="color:green;">Включен</span>
				{elseif $object->getStatusInclusion()==0}<span style="color:red;">Не включен</span>
				{else}<span style="color:grey;">Не заполнялось</span>
				{/if}
				</td>
				</tr>
				<tr class="tr_open_close">
				<td class='td_label_form'><b>Критерии включения*</b></td>
				<td>*Пациент может быть включен если все ответы «да»</td>
				<tr>
				<td class='td_label_form'>Возраст ≥18</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="age_18_and_more_yes_no_id" value="1" {if isset($object->age_18_and_more_yes_no_id) && $object->age_18_and_more_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="age_18_and_more_yes_no_id" value="0" {if isset($object->age_18_and_more_yes_no_id) && $object->age_18_and_more_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Гистологический подтвержденный эпителиальный рак яичника</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="histol_confirmed_cr_yes_no_id" value="1" {if isset($object->histol_confirmed_cr_yes_no_id) && $object->histol_confirmed_cr_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="histol_confirmed_cr_yes_no_id" value="0" {if isset($object->histol_confirmed_cr_yes_no_id) && $object->histol_confirmed_cr_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>ECOG 0-1</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="ecog01_yes_no_id" value="1" {if isset($object->ecog01_yes_no_id) && $object->ecog01_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="ecog01_yes_no_id" value="0" {if isset($object->ecog01_yes_no_id) && $object->ecog01_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с рецидивирующим платиночувствительным раком яичника (Бесплатиновый интервал от 6 до 12 месяцев)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="recurrent_plat_sensit_cancer_yes_no_id" value="1" {if isset($object->recurrent_plat_sensit_cancer_yes_no_id) && $object->recurrent_plat_sensit_cancer_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="recurrent_plat_sensit_cancer_yes_no_id" value="0" {if isset($object->recurrent_plat_sensit_cancer_yes_no_id) && $object->recurrent_plat_sensit_cancer_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты, в процессе лечения трабектедином, получившие 1-2 циклов лечения препаратом трабектедин по поводу рецидива платиночувствительного рака яичника, в дозировке 1,1 мг/м2 в виде 3-часовой внутривенной инфузии после введения пегилированного липосомального доксорубицина в дозировке 30 мг/м2 в виде 60-минутной внутривенной инфузии каждые 3 недели</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="treatment_trabect_after_doxorub_yes_no_id" value="1" {if isset($object->treatment_trabect_after_doxorub_yes_no_id) && $object->treatment_trabect_after_doxorub_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="treatment_trabect_after_doxorub_yes_no_id" value="0" {if isset($object->treatment_trabect_after_doxorub_yes_no_id) && $object->treatment_trabect_after_doxorub_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>
				{if $patient->id < 37}
					Пациенты, получившие не более 1 линии химиотерапии платиносодержащими режимами
                {else}
                	Пациенты, получившие 1 и более линий химиотерапии платиносодержащими режимами по поводу рецидива 
                	рака яичника при условии, что периоды ремиссии между рецидивами были 6 месяцев и более
                {/if}
				</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="received_no_more_one_line_plat_chem_regimes_yes_no_id" value="1" {if isset($object->received_no_more_one_line_plat_chem_regimes_yes_no_id) && $object->received_no_more_one_line_plat_chem_regimes_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="received_no_more_one_line_plat_chem_regimes_yes_no_id" value="0" {if isset($object->received_no_more_one_line_plat_chem_regimes_yes_no_id) && $object->received_no_more_one_line_plat_chem_regimes_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Решение врача о терапии пациента трабектедином</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="doct_decision_trabectedin_yes_no_id" value="1" {if isset($object->doct_decision_trabectedin_yes_no_id) && $object->doct_decision_trabectedin_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="doct_decision_trabectedin_yes_no_id" value="0" {if isset($object->doct_decision_trabectedin_yes_no_id) && $object->doct_decision_trabectedin_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Подписанное информированное согласие перед включением в исследование</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="signed_consent_yes_no_id" value="1" {if isset($object->signed_consent_yes_no_id) && $object->signed_consent_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="signed_consent_yes_no_id" value="0" {if isset($object->signed_consent_yes_no_id) && $object->signed_consent_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr class="tr_open_close">
				<td class='td_label_form'><b>Критерии исключения**</b></td>
				<td>**Пациент может быть включен если все ответы «нет»</td>
				<tr>
				<td class='td_label_form'>Возраст до 18 лет</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="age_18_less_yes_no_id" value="1" {if isset($object->age_18_less_yes_no_id) && $object->age_18_less_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="age_18_less_yes_no_id" value="0" {if isset($object->age_18_less_yes_no_id) && $object->age_18_less_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты, получившие лечение более 2 линии химиотерапии</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="received_more_two_line_plat_chem_yes_no_id" value="1" {if isset($object->received_more_two_line_plat_chem_yes_no_id) && $object->received_more_two_line_plat_chem_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="received_more_two_line_plat_chem_yes_no_id" value="0" {if isset($object->received_more_two_line_plat_chem_yes_no_id) && $object->received_more_two_line_plat_chem_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с платино-рефрактерным типом рака яичника (прогрессирование на фоне химиотерапии 1-й линии)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="platinum_refractory_ov_cr_yes_no_id" value="1" {if isset($object->platinum_refractory_ov_cr_yes_no_id) && $object->platinum_refractory_ov_cr_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="platinum_refractory_ov_cr_yes_no_id" value="0" {if isset($object->platinum_refractory_ov_cr_yes_no_id) && $object->platinum_refractory_ov_cr_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с платино-резистентным типом рака яичника: БПИ <6 месяцев (прогрессирование в течение шести месяцев после первой линии химиотерапии на основе платины)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="platinum_resistant_ov_cr_yes_no_id" value="1" {if isset($object->platinum_resistant_ov_cr_yes_no_id) && $object->platinum_resistant_ov_cr_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="platinum_resistant_ov_cr_yes_no_id" value="0" {if isset($object->platinum_resistant_ov_cr_yes_no_id) && $object->platinum_resistant_ov_cr_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Отказ пациента от центрального венозного катетера</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="refusal_central_venous_catheter_yes_no_id" value="1" {if isset($object->refusal_central_venous_catheter_yes_no_id) && $object->refusal_central_venous_catheter_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="refusal_central_venous_catheter_yes_no_id" value="0" {if isset($object->refusal_central_venous_catheter_yes_no_id) && $object->refusal_central_venous_catheter_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с нарушением функции печени (пациентов с повышенным уровнем билирубина)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="impaired_hepatic_function_yes_no_id" value="1" {if isset($object->impaired_hepatic_function_yes_no_id) && $object->impaired_hepatic_function_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="impaired_hepatic_function_yes_no_id" value="0" {if isset($object->impaired_hepatic_function_yes_no_id) && $object->impaired_hepatic_function_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с нарушением функции почек (клиренс креатинина >1.5 мг/дл)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="impaired_renal_function_yes_no_id" value="1" {if isset($object->impaired_renal_function_yes_no_id) && $object->impaired_renal_function_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="impaired_renal_function_yes_no_id" value="0" {if isset($object->impaired_renal_function_yes_no_id) && $object->impaired_renal_function_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с нарушениями гематологических показателей (нейтропенией< 1500/мкл и тромбоцитопенией < 100000/мкл)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="impaired_hematological_parameters_yes_no_id" value="1" {if isset($object->impaired_hematological_parameters_yes_no_id) && $object->impaired_hematological_parameters_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="impaired_hematological_parameters_yes_no_id" value="0" {if isset($object->impaired_hematological_parameters_yes_no_id) && $object->impaired_hematological_parameters_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Пациенты с серьезными нарушениями ССС (у пациентов с заболеваниями сердца и со снижением фракции левожелудочкового выброса)</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="impaired_cardiovascular_function_yes_no_id" value="1" {if isset($object->impaired_cardiovascular_function_yes_no_id) && $object->impaired_cardiovascular_function_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="impaired_cardiovascular_function_yes_no_id" value="0" {if isset($object->impaired_cardiovascular_function_yes_no_id) && $object->impaired_cardiovascular_function_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<tr>
				<td class='td_label_form'>Саркома Капоши у пациентов со СПИДом, которые могут эффективно лечиться локальной терапией или системной терапией альфа-интерфероном</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="kaposi_sarcoma_yes_no_id" value="1" {if isset($object->kaposi_sarcoma_yes_no_id) && $object->kaposi_sarcoma_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="kaposi_sarcoma_yes_no_id" value="0" {if isset($object->kaposi_sarcoma_yes_no_id) && $object->kaposi_sarcoma_yes_no_id == 0} checked {/if}/></td>
				</tr>
				<td class='td_label_form'>Беременность/лактация</td>
				<td>
				Да <input {$class_req_input} type="radio" {$disabled} name="pregnancy_yes_no_id" value="1" {if isset($object->pregnancy_yes_no_id) && $object->pregnancy_yes_no_id == 1} checked {/if}/>
				Нет <input {$class_req_input} type="radio" {$disabled} name="pregnancy_yes_no_id" value="0" {if isset($object->pregnancy_yes_no_id) && $object->pregnancy_yes_no_id == 0} checked {/if}/></td>
				</tr>



				{include file="form_bottom.tpl"}

			</table>

			</form>

		</div>

		{include file="footer.tpl"}
	</div>

</body>
</html>
