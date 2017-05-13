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
<div class="center_title">Список Query</div>
<div class="comment_label">* Для сортировки по столбцу кликните по заголовку этого столбца</div>
<table class="table_list" id="myTable" style="margin:20px;">
	<thead>
		<th>N</th>
		<th>Пациент</th>
		<th>Исследование</th>
		<th>Визит</th>
		<th>Описание</th>
		<th>Статус</th>
		<th>Дата создания</th>
		<th>Дата закрытия</th>
		<th>Пользователь</th>
		<th>Сайт</th>
	</thead>
	<tbody>

	{foreach $items as $item}
       {assign var="statusColor" value="black"}
       {if $item->query_status_id == 1}{assign var="statusColor" value="red"}{/if}
       {if $item->query_status_id == 2}{assign var="statusColor" value="GoldenRod"}{/if}
       {if $item->query_status_id == 3}{assign var="statusColor" value="green"}{/if}
	<tr>
		<td style="font-size: medium;">
		<a href="edit.php?entity=investigation&patient_id={$item->patient_id}&investigation_id={$item->investigation_id}&visit_id={$item->visit_id}">{$item->id}</a>
		</td>
		<td style="font-size: small;">{$item->patient_number}</td>
		<td style="font-size: small;">{$item->investigation_descr}</td>
		<td style="font-size: small;">{$item->visit_name}</td>
		<td style="font-size: small;">{$item->description}</td>
		<td style="font-size: small;color:{$statusColor};">{$item->query_status_descr}</td>
		<td style="font-size: small;">{$item->open_date}</td>
		<td style="font-size: small;">{$item->close_date}</td>
		<td style="font-size: small;">{$item->user_fio}<br/>({$item->username_email})</td>
		<td style="font-size: small;">{$item->hospital_name}</td>
		{*
		http://localhost/ovarian/edit.php?entity=investigation&patient_id=12&investigation_id=1&visit_id=1
		<td>
				{if $item.status_include == 1}<span style="color:green;">Включен</span>
				{elseif $item.status_include == 0}<span style="color:red;">Не включен</span>
				{else}<span style="color:grey;">Не заполнялось</span>
				{/if}
		</td>
		*}
			{*
			<!--  
	public $id;
	public $investigation_id;
	public $record_id;
	public $description;
	public $open_date;
	public $close_date;
	public $query_status_id;
	public $query_status_descr;
	// for page with list of queries 
	public $patient_number;
	public $investigation_descr;
	public $hospital_id;
	public $hospital_name;
	public $visit_name;
	public $username_email;
	public $user_fio;
	-->
	
		<td style="font-size: medium;"><a href="index.php?page=visits&patient_id={$item.id}">Визиты</a></td>
<!--		<td>-->
<!--		<a href="edit.php?entity=investigation&id=0&patient_id={{$item.id}}">Изменить клинические данные</a>-->
<!--		</td>-->
*}
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
