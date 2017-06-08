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



<div id="content"><!--<div class="quick_panel"></div>-->
<div class="center_title">Таблица расписания визитов для пациента {$patient->patient_number} (<a href="edit.php?entity=patient&id={$patient->id}">к пациенту</a>)</div>
<table class="table_list_visits">
	<thead>
		<tr>
			<th>Исследования</th>
			{foreach $headerNames as $headerName}
			<th>{$headerName['name']}</th>
			{/foreach}
		</tr>
	</thead>
	<tbody>

		{foreach $table as $row name=outerfoo}
			{assign var="href_class" value="not-active_href"}
			{if $smarty.foreach.outerfoo.first || (!$smarty.foreach.outerfoo.first && $patient->status_include == 1)}
				{assign var="href_class" value=""}
			{/if}
			<tr>
				{foreach from=$row item=col name=foo}
				{if $smarty.foreach.foo.first}<td>{$col}</td> {else}
				<td class={if $col['carried']}
				{if $col['isInvestDone']}'greenTd'{else}'yellowTd'{/if}
				{else}'noColorTd'{/if}>
				{if $col['carried']}
				 <a class="{$href_class}" href="edit.php?entity=investigation&patient_id={$patient->id}&investigation_id={$col['investigation_id']}&visit_id={$col['visit_id']}">
					{if $col['isInvestDone']}Открыть{else}Заполнить {/if} 
				</a> 
				{if $col['checked']}<img width="20" height="20" alt="Править" src="images/verified-41-256.png">{/if}
				{else} &nbsp; {/if} {/if}</td>
				{/foreach} 
			</tr>
			
		{/foreach}
	
	</tbody>
</table>


</div>


<p>&nbsp</p>
{include file="footer.tpl"}</div>
</body>
</html>
