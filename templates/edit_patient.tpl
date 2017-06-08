<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<title>{$title}</title>
{include file="js_include.tpl"}
<script type="text/javascript">
function checkNumber(){
	var patientNumber = document.getElementById("patient_number").value;
	if(/XX$/.test(patientNumber)){
        alert("Замените в номере пациента 'XX' на порядковый номер, например '01'");
        return false;
	}
	return true;
}
</script>
</head>
<body>

<div id="wrap">{include file="header.tpl"}

<div id="content">
{* <div id="wrap">{include file="panel.tpl"} *}
<div class="center_title">Пациент</div>

<form method="post" action="edit.php">
<input type="hidden" name="do" value="save" /> <input type="hidden"
	name="entity" value="{$entity}" />

<table class="form">
	{if $edit}
	<tr>
		<td><input type="submit" value="Сохранить"
			style="width: 120px; height: 20px"></td>
		<td class="req_input">Обязательные поля выделены этим цветом, <br />
		без их заполнения данные не сохранятся!</td>
	</tr>
	{else}
	<tr>
		<td><a href="edit.php?entity={$entity}&id={$object->id}&do=edit"> <img
			width="20" height="20" alt="Править" src="images/edit.jpg" /></a></td>
		<td><a href="index.php?page=visits&patient_id={$object->id}">Визиты</a></td>
		
	</tr>
	{/if}
	<tr style="display: none;">
		<td>ID записи</td>
		<td>{if $object->id} {$object->id} {else}
		<div style="background-color: #d14836">Новый</div>
		{/if}</td>
		<input type="hidden" name="id" value="{$object->id}" />
	</tr>
	<tr>
		<td>Номер сайта (мед. центра)
		<input type="hidden" value={$object->hospital_id} name="hospital_id"/>
		</td>
		<td><select {$class_req_input} disabled readonly name="hospital_id123">
			<option></option>
			{foreach $hospital_vals as $item}
			<option {if $item->id == $object->hospital_id} selected="selected"
			{/if} value="{$item->id}">{$item->value}</option>
			{/foreach}
		</select></td>
	</tr>
	<tr>
		<td>Номер пациента
		
		</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="patient_number" id="patient_number" size="50"
			value="{$object->patient_number}" onChange="check_uniq_pat_num(this);"/>
			{if $edit and !$object->id}
		<br/><font color="blue" style="font-size: 16px;">"XX" заменить на порядковый номер, напр. "01" для первого пациента и т.д.</font>
		{/if}
			</td>
	</tr>

	{*
	<tr>
		<td>Дата рождения (дд/мм/гггг)</td>
		<td><input {$class_req_input} type="text"
			{$readonly} name="date_birth" id="date_birth" size="50"
			value="{if $object->date_birth}{date('d/m/Y',strtotime($object->date_birth))}{/if}"
			onblur="IsObjDate(this);" onkeyup="TempDt(event,this);" /></td>
	</tr>
	*}
	<tr>
		<td>ФИО исследователя</td>
		<td><input id="doctor" {$class_req_input} type="text"
			{$readonly} name="doctor" size="50" value="{$object->doctor}" /></td>
	</tr>
	
	{if $edit}
	<tr>
		<td><input type="submit" value="Сохранить" onclick="return checkNumber();"
			style="width: 120px; height: 20px"></td>
		<td><input type="reset" value="Сброс"
			style="width: 120px; height: 20px"></td>
	</tr>
	{else} {/if}

</table>

</form>

</div>

{include file="footer.tpl"}</div>

</body>
</html>
