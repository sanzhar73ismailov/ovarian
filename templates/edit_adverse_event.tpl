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

			<table class="form">
				<col width="250">
				{include file="form_note_req_fields.tpl"}
				{include file="query.tpl"}
				<tr style="display: none;">
					<td>ID записи</td>
					<td>{if $object->id} {$object->id} {else}
						<div style="background-color: #d14836">Новый</div> {/if}
					</td>
					<input type="hidden" name="id" value="{$object->id}" />
				</tr>


				<tr>
					<td class='td_label_form'>Отмечались нежелательные явления
						да/нет</td>
					<td>Да <input {$class_req_input} type="radio"
						{$disabled} name="adverse_event_yes_no_id" value="1" {if
						isset($object->adverse_event_yes_no_id) &&
						$object->adverse_event_yes_no_id == 1} checked {/if}/> Нет <input
						{$class_req_input} type="radio"
						{$disabled} name="adverse_event_yes_no_id" value="0" {if
						isset($object->adverse_event_yes_no_id) &&
						$object->adverse_event_yes_no_id == 0} checked {/if}/> <br />
					</td>

				</tr>
				{if isset($object->adverse_event_yes_no_id) && $object->adverse_event_yes_no_id == 1}
				<tr>
					<td colspan="2">
						<p />
						<h3 style='color: blue;'>Список нежелательных явлений
						{if	count($object->adverseEventDetails) == 0} пуст{/if}</h3> 
						
						
			{if $edit==0}
				<a href=edit.php?entity=adverse_event_detail&adverse_event_id={$object->id}>Добавить НЯ</a>
			{/if}
						
						{if count($object->adverseEventDetails) > 0}
						<table border='1'>
							<th>Наименование явления</th>
							<th>Это серьезное явление? Да/Нет</th>
							<th>Дата начала (дд/мм/гггг)</th>
							<th>Явление разрешилось? Да/Нет</th>
							<th>Дата разрешения явления (дд/мм/гггг)</th>
							<th>Выраженность явления снизилась после прекращения приема
								препарата или уменьшения его дозы</th>
							<th>Явление возникло повторно после возобновления приема
								препарата</th>
							<th>Явление связано с приемом препарата компании J&J</th>
							{foreach $object->adverseEventDetails as $objectEvent}
							<tr>
							    <td><a href='edit.php?entity=adverse_event_detail&id={$objectEvent->id}&adverse_event_id={$object->id}'>{if isset($objectEvent->name)}{$objectEvent->name}{else}{/if}</a>
								</td>
								<td>{if isset($objectEvent->serious_yes_no_id) &&
									$objectEvent->serious_yes_no_id == 1} Да {/if} {if
									isset($objectEvent->serious_yes_no_id) &&
									$objectEvent->serious_yes_no_id == 0} Нет {/if}</td>
								<td>{if
									isset($objectEvent->start_date)}{$objectEvent->start_date|date_format:'%d/%m/%Y'}{else}{/if}
								</td>
								<td>{if isset($objectEvent->resolved_yes_no_id) &&
									$objectEvent->resolved_yes_no_id == 1} Да {/if} {if
									isset($objectEvent->resolved_yes_no_id) &&
									$objectEvent->resolved_yes_no_id == 0} Нет {/if}</td>
								<td>{if
									isset($objectEvent->resolved_date)}{$objectEvent->resolved_date|date_format:'%d/%m/%Y'}{else}{/if}
								</td>
								<td>{if
									isset($objectEvent->event_intensity_decreased_yes_no_id) &&
									$objectEvent->event_intensity_decreased_yes_no_id == 1} Да
									{/if} {if
									isset($objectEvent->event_intensity_decreased_yes_no_id) &&
									$objectEvent->event_intensity_decreased_yes_no_id == 0} Нет
									{/if}</td>
								<td>{if isset($objectEvent->event_occurred_again_yes_no_id)
									&& $objectEvent->event_occurred_again_yes_no_id == 1} Да {/if}
									{if isset($objectEvent->event_occurred_again_yes_no_id) &&
									$objectEvent->event_occurred_again_yes_no_id == 0} Нет {/if}</td>
								<td>{if
									isset($objectEvent->event_associated_with_drug_yes_no_id) &&
									$objectEvent->event_associated_with_drug_yes_no_id == 1} Да
									{/if} {if
									isset($objectEvent->event_associated_with_drug_yes_no_id) &&
									$objectEvent->event_associated_with_drug_yes_no_id == 0} Нет
									{/if}</td>
							</tr>
							{/foreach}
						</table> {/if}
					</td>
				</tr>
				{/if}


				{include file="form_bottom.tpl"}

			</table>

			</form>

		</div>

		{include file="footer.tpl"}
	</div>

</body>
</html>
