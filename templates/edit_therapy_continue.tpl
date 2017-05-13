<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title>
{include file="js_include.tpl"}
<script type="text/javascript">
function disable_cause(){
 document.getElementById("continue_no_cause_id").disabled = true;
 document.getElementById("continue_no_cause_id").selectedIndex = -1;
}

function select_set_required(){
 document.getElementById("continue_no_cause_id").required = true;
 document.getElementById("continue_no_cause_id").className = "req_input";
 document.getElementById("continue_no_cause_id").disabled = false;
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
	<tr style="display: none;">
		<td>ID записи</td>
		<td>{if $object->id} {$object->id} {else}
		<div style="background-color: #d14836">Новый</div>
		{/if}</td>
		<input type="hidden" name="id" value="{$object->id}" />
	</tr>


	<tr>
		<td class='td_label_form'>Продолжена терапия трабектедином в
		комбинации с ПЛД: Лечение продолжается без изменений. Если нет, укажите причину ниже</td>
		<td>
		Да <input onclick="disable_cause();" {$class_req_input} type="radio"
			{$disabled} name="therap_trab_continue_yes_no_id" size="50" value="1"
			{if isset($object->therap_trab_continue_yes_no_id) &&
		$object->therap_trab_continue_yes_no_id == 1} checked {/if}/> 
		Нет <input onclick="select_set_required();"
			{$class_req_input} type="radio"
			{$disabled} name="therap_trab_continue_yes_no_id" size="50" value="0"
			{if isset($object->therap_trab_continue_yes_no_id) &&
		$object->therap_trab_continue_yes_no_id == 0} checked {/if}/></td>
	</tr>
	<tr>
		<td class='td_label_form'><br/><b>Причина прекращения терапии.</b> <br/>Если вы выбрали вариант "Нет данных", 
		"Пациент отказался от лечения", "Лечение остановлено по решению исследователя", то есть <b>любой кроме "Лечение остановлено по причине переезда пациента"</b>
		 просьба на форме Неблагоприятных Явлений указать НЯ </td>
		<td><select
			{$disabled} name="therap_trab_continue_no_cause_id" id="continue_no_cause_id">
			<option></option>
			{foreach $therap_trab_continue_no_cause_vals as $item}
			<option {if $item->id == $object->therap_trab_continue_no_cause_id}
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
