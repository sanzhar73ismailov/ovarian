<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title> {include file="js_include.tpl"}
<script type="text/javascript">
function disable_resolved_date(){
 document.getElementById("resolved_date").required = false;
 document.getElementById("resolved_date").className = "";
 document.getElementById("resolved_date").disabled = true;
 document.getElementById("resolved_date").value = "";
}

function resolved_date_set_required(){
 document.getElementById("resolved_date").required = true;
 document.getElementById("resolved_date").className = "req_input";
 document.getElementById("resolved_date").disabled = false;
}	
</script>
</head>
<body>

	<div id="wrap">
		{include file="header.tpl"}

		<div id="content">
			<div class="center_title">
				Пациент: № {$patient->patient_number}. <a href="index.php?page=visits&patient_id={$patient->id}">Назад в "Визиты"</a>
			</div>
			<div class="center_title">Детали нежелательного явления</div>
			<div class="center_title">Визит: {$visit['descr']}</div>
			<!--   http://localhost/ovarian/edit.php?entity=investigation&patient_id=12&investigation_id=6&visit_id=1 -->
			<div class="center_title"><a href="edit.php?entity=investigation&patient_id={$patient->id}&investigation_id=6&visit_id={$visit['id']}">Назад</a></div>
			{if isset($sendMailMessage)}<div class="center_title" style='color:red;'>{$sendMailMessage}</div>{/if}
			
			{assign var="type_input" value="hidden" nocache} {* в продуктиве
			value="hidden", чтобы скрыть. в разработке value="text" *}

			<form method="post" action="edit.php">
				{*
				<form method="post" action="edit.php"
					onsubmit="return checkform(this)">
					*} {if $type_input == "text"}
					<table class="form">
						<tr>
							<td><h4>Скрытые поля</h4>{/if} 
							{if $type_input == "text"}do: {/if}<input type="{$type_input}" name="do" value="save" /> 
							{if $type_input == "text"}<br />entity: {/if}<input type="{$type_input}" name="entity" value="adverse_event_detail" /> 
							{if $type_input == "text"}<br />ID побочного явления: {/if}<input type="{$type_input}" name="adverse_event_id" value="{$advEvent.id}" /> 
							{if $type_input == "text"}</td>
						<tr>
					</table>
					{/if}

					<table class="form">
						<col width="250">
						 
						{include file="form_note_advEventDetails_req_fields.tpl"}
						<tr style="display: none;">
							<td>ID записи</td>
							<td>{if $object->id} {$object->id} {else}
								<div style="background-color: #d14836">Новый</div> {/if}
							</td>
							<input type="hidden" name="id" value="{$object->id}" />
						</tr>
						
						<tr>
							<td class='td_label_form'>Наименование</td>
							<td><input {$class_req_input} type="text" {$readonly} name="name" size="50" value="{$object->name}"/></td>
						</tr>
						<tr>
							<td class='td_label_form'>Это серьезное явление? Да/Нет</td>
							<td>Да <input {$class_req_input} type="radio"
								{$disabled} name="serious_yes_no_id" value="1" {if
								isset($object->serious_yes_no_id) &&
								$object->serious_yes_no_id == 1} checked {/if}/> Нет <input
								{$class_req_input} type="radio"
								{$disabled} name="serious_yes_no_id" value="0" {if
								isset($object->serious_yes_no_id) &&
								$object->serious_yes_no_id == 0} checked {/if}/>
								<ul type="disc"> 
								<li>Если явление <b>серьезное</b>, просьба заполнить бланк СНЯ и отправьте Спонсор-Исследователю(далее С-И) и/или Монитору 
								в течение 24 часов на электронные адреса: surya_esentay@mail.ru, kossanova@synergycro.ru</li>
								<li>Если <b>не серьезное</b>, просьба заполнить форму отчетности по НЯ (Приложение 1)</li>
								</ul>
								
							</td>
						</tr>
						<tr>
							<td class='td_label_form'>Дата начала (дд/мм/гггг)</td>
							<td><input {$class_req_input} type="text"
								{$readonly} name="start_date" id="start_date" size="50"
								value="{if isset($object->start_date)}{$object->start_date|date_format:'%d/%m/%Y'}{else}{/if}"
								onblur="IsObjDate(this);" onkeyup="TempDt(event,this);" /></td>
						</tr>
						<tr>
							<td class='td_label_form'>Явление разрешилось? Да/Нет</td>
							<td>Да <input onclick="resolved_date_set_required();" {$class_req_input} type="radio"
								{$disabled} name="resolved_yes_no_id" value="1" {if
								isset($object->resolved_yes_no_id) &&
								$object->resolved_yes_no_id == 1} checked {/if}/> 
								Нет <input  onclick="disable_resolved_date();"
								{$class_req_input} type="radio"
								{$disabled} name="resolved_yes_no_id" value="0" {if
								isset($object->resolved_yes_no_id) &&
								$object->resolved_yes_no_id == 0} checked {/if}/>
							</td>
						</tr>
						<tr>
							<td class='td_label_form'>Дата разрешения явления
								(дд/мм/гггг)</td>
							<td><input type="text"
								{$readonly} name="resolved_date" id="resolved_date" size="50"
								value="{if isset($object->resolved_date)}{$object->resolved_date|date_format:'%d/%m/%Y'}{else}{/if}"
								onblur="IsObjDate(this);" onkeyup="TempDt(event,this);" /></td>
						</tr>
						<tr>
							<td class='td_label_form'>Выраженность явления снизилась
								после прекращения приема препарата или уменьшения его дозы</td>
							<td>Да <input {$class_req_input} type="radio"
								{$disabled} name="event_intensity_decreased_yes_no_id" value="1"
								{if isset($object->event_intensity_decreased_yes_no_id)
								&& $object->event_intensity_decreased_yes_no_id == 1} checked
								{/if}/> Нет <input {$class_req_input} type="radio"
								{$disabled} name="event_intensity_decreased_yes_no_id" value="0"
								{if isset($object->event_intensity_decreased_yes_no_id)
								&& $object->event_intensity_decreased_yes_no_id == 0} checked
								{/if}/>
							</td>
						</tr>
						<tr>
							<td class='td_label_form'>Явление возникло повторно после
								возобновления приема препарата</td>
							<td>Да <input {$class_req_input} type="radio"
								{$disabled} name="event_occurred_again_yes_no_id" value="1" {if
								isset($object->event_occurred_again_yes_no_id) &&
								$object->event_occurred_again_yes_no_id == 1} checked {/if}/>
								Нет <input {$class_req_input} type="radio"
								{$disabled} name="event_occurred_again_yes_no_id" value="0" {if
								isset($object->event_occurred_again_yes_no_id) &&
								$object->event_occurred_again_yes_no_id == 0} checked {/if}/>
							</td>
						</tr>
						<tr>
							<td class='td_label_form'>Явление связано с приемом
								препарата компании J&J</td>
							<td>Да <input {$class_req_input} type="radio"
								{$disabled} name="event_associated_with_drug_yes_no_id"
								value="1" {if isset($object->event_associated_with_drug_yes_no_id)
								&& $object->event_associated_with_drug_yes_no_id == 1} checked
								{/if}/> Нет <input {$class_req_input} type="radio"
								{$disabled} name="event_associated_with_drug_yes_no_id"
								value="0" {if isset($object->event_associated_with_drug_yes_no_id)
								&& $object->event_associated_with_drug_yes_no_id == 0} checked
								{/if}/>
							</td>
						</tr>

						{include file="form_bottom.tpl"}

					</table>

				</form>
		</div>

		{include file="footer.tpl"}
	</div>

</body>
</html>
