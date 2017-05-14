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
<td class='td_label_form'>Сопутствующая терапия</td>
<td><textarea {$disabled} rows="10" cols="70" name="chem_2st_concomitant_therapy_descr">{$object->chem_2st_concomitant_therapy_descr}</textarea>
</td>
</tr>


{include file="form_bottom.tpl"}

</table>

</form>

</div>

{include file="footer.tpl"}</div>

</body>
</html>
