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

<div id="content">{include file="form_head.tpl"}

<table class="form">
	<col width="250">
	{include file="form_note_req_fields.tpl"}
	{include file="query.tpl"}
	<tr style="display: none;">
		<td>ID записи</td>
		<td>{if $object->id} {$object->id} {else}
		<div style="background-color: #d14836">Новый</div>
		{/if}</td>
		<input type="hidden" name="id" value="{$object->id}" />
	</tr>

	<tr>
		<td class='td_label_form'>
		(RECIST*) Полный ответ (да, нет)</td>
		<td>Да <input {$class_req_input} type="radio"
			{$disabled} name="full_response_yes_no_id" size="50" value="1" {if
			isset($object->full_response_yes_no_id) &&
		$object->full_response_yes_no_id == 1} checked {/if}/> Нет <input
			{$class_req_input} type="radio"
			{$disabled} name="full_response_yes_no_id" size="50" value="0" {if
			isset($object->full_response_yes_no_id) &&
		$object->full_response_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>
		(RECIST*) Частичный ответ (да, нет)</td>
		<td>Да <input {$class_req_input} type="radio"
			{$disabled} name="partial_response_yes_no_id" size="50" value="1" {if
			isset($object->partial_response_yes_no_id) &&
		$object->partial_response_yes_no_id == 1} checked {/if}/> Нет <input
			{$class_req_input} type="radio"
			{$disabled} name="partial_response_yes_no_id" size="50" value="0" {if
			isset($object->partial_response_yes_no_id) &&
		$object->partial_response_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>
		(RECIST*) Прогрессирование заболевания (да, нет)</td>
		<td>Да <input {$class_req_input} type="radio"
			{$disabled} name="progress_desease_yes_no_id" size="50" value="1" {if
			isset($object->progress_desease_yes_no_id) &&
		$object->progress_desease_yes_no_id == 1} checked {/if}/> Нет <input
			{$class_req_input} type="radio"
			{$disabled} name="progress_desease_yes_no_id" size="50" value="0" {if
			isset($object->progress_desease_yes_no_id) &&
		$object->progress_desease_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'>
		(RECIST*) Стабилизация заболевания (да, нет)</td>
		<td>Да <input {$class_req_input} type="radio"
			{$disabled} name="stabilization_desease_yes_no_id" size="50"
			value="1" {if isset($object->stabilization_desease_yes_no_id) &&
		$object->stabilization_desease_yes_no_id == 1} checked {/if}/> Нет <input
			{$class_req_input} type="radio"
			{$disabled} name="stabilization_desease_yes_no_id" size="50"
			value="0" {if isset($object->stabilization_desease_yes_no_id) &&
		$object->stabilization_desease_yes_no_id == 0} checked {/if}/></td>
	</tr>


	{include file="form_bottom.tpl"}

</table>

</form>

</div>

{include file="footer.tpl"}</div>

</body>
</html>
