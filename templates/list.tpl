<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<title>{$title}</title>
{include file="js_include.tpl"}
<script src="jscript/jquery.tablesorter.min.js"></script>
<script type="text/javascript">
$(document).ready(function() 
	    { 
	        $("#myTable").tablesorter(); 
	    } 
	);
</script>
</head>
<body>
<div id="wrap">{include file="header.tpl"}



<div id="content">


<!--<div class="quick_panel"></div>-->
<div class="center_title">Список пациентов</div>
<div class="comment_label">* Для сортировки по столбцу кликните по заголовку этого столбца</div>
<table class="table_list" id="myTable">
	<thead>
		<tr>
			<th>Номер пациента</th>
			<th>Номер сайта</th>
			<th>ФИО исследователя </th>
			<th>Дата рег.</th>
			<th>Статус включения</th>
			<th>Визиты</th>
		</tr>
	</thead>
	<tbody>
	{foreach $patients as $item}

	<tr>
		<td style="font-size: medium;"><a href="edit.php?entity=patient&id={$item.id}">{$item.patient_number}</a></td>
		<td style="font-size: small;">{$item.hospital_name}</td>
		<td style="font-size: small;">{$item.doctor}</td>
		<td style="font-size: small;">{$item.insert_date} </td>
		<td>
				{if $item.status_include == 1}<span style="color:green;">Включен</span>
				{elseif $item.status_include == 0}<span style="color:red;">Не включен</span>
				{else}<span style="color:grey;">Не заполнялось</span>
				{/if}
		</td>
		<td style="font-size: medium;"><a href="index.php?page=visits&patient_id={$item.id}">Визиты</a></td>
<!--		<td>-->
<!--		<a href="edit.php?entity=investigation&id=0&patient_id={{$item.id}}">Изменить клинические данные</a>-->
<!--		</td>-->
	</tr>


	{/foreach}
	</tbody>
</table>


</div>


<p>&nbsp</p>
{include file="footer.tpl"}
</div>
</body>
</html>
