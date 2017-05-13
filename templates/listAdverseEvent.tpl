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



<div id="content"><script>
function checkDateInputs(){
	var startEl = document.getElementById("start_date");
	var endEl = document.getElementById("end_date");
	if(startEl.value != '' ||  endEl.value != ''){
	if(startEl.value == ''){
      alert("Введите дату начала периода");
      return false;
	}
	if(endEl.value == ''){
	      alert("Введите дату окончания периода");
	      return false;
	}
	}
	return true;
}
</script>
<div class="center_title">Список НЯ</div>
<form action="index.php" method="post"><input type="hidden" name="page"
	value="listAdversEvent" /> Дата начала<input id="start_date"
	onblur="IsObjDate(this);" onkeyup="TempDt(event,this);" type="text"
	name="start_date" value="{$start_date}" placeholder="дд/мм/гггг" />
Дата окончания<input id="end_date" onblur="IsObjDate(this);"
	onkeyup="TempDt(event,this);" type="text" name="end_date"
	value="{$end_date}" placeholder="дд/мм/гггг" /> <input type="submit"
	name="Поиск" onclick="return checkDateInputs();" /></form>
<div class="comment_label">* Для сортировки по столбцу кликните по
заголовку этого столбца</div>
<table class="table_list" id="myTable" style="margin: 20px;">
	<thead>
		<th>Код пациента</th>
		<th>Сайт</th>
		<th>Визит</th>
		<th>Иссл-ль</th>
		<th>НЯ</th>
		<th>Серьезное</th>
		<th>Дата начала</th>
		<th>Разрешилось</th>
		<th>Дата разрешения</th>
		<th>Выраженность снизилась после прекращения</th>
		<th>возникло повторно после возобновления приема препарата</th>
		<th>Связано с приемом препарата компании J&J</th>
	</thead>
	<tbody>
		{foreach $items as $item} {assign var="statusColor" value="black"}
		<tr>
			<td style="font-size: small;">{$item.patient_number}</td>
			<td style="font-size: small;">{$item.hospital_name}</td>
			<td style="font-size: small;">{$item.visit_name}</td>
			<td style="font-size: small;">{$item.doctor}</td>
			<td style="font-size: small;">{$item.name}</td>
			<td style="font-size: small;">{$item.serious_yes_no_id}</td>
			<td style="font-size: small;">{$item.start_date|date_format:'%d/%m/%Y'}</td>
			<td style="font-size: small;">{$item.resolved_yes_no_id}</td>
			<td style="font-size: small;">{$item.resolved_date|date_format:'%d/%m/%Y'}</td>
			<td style="font-size: small;">{$item.event_intensity_decreased_yes_no_id}</td>
			<td style="font-size: small;">{$item.event_occurred_again_yes_no_id}</td>
			<td style="font-size: small;">{$item.event_associated_with_drug_yes_no_id}</td>
		</tr>
		{/foreach}
	</tbody>
</table>
</div>


<p>&nbsp</p>
{include file="footer.tpl"}</div>
</body>
</html>
