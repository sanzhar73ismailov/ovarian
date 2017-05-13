<div class="center_title">Пациент: № {$patient->patient_number}. <a href="index.php?page=visits&patient_id={{$patient->id}}">Назад в "Визиты"</a></div>
<div class="center_title">Исследование: {$investigation['descr']}</div>
<div class="center_title">Визит: {$visit['descr']}</div>
{assign var="type_input" value="hidden" nocache} {* в продуктиве value="hidden", чтобы скрыть. в разработке value="text" *}

<form method="post" action="edit.php" id="form_id">
{* <form method="post" action="edit.php" onsubmit="return checkform(this)"> *}
{if $type_input == "text"}<table class="form"><tr><td><h4>Скрытые поля</h4>{/if}
{if $type_input == "text"}do: {/if}<input type="{$type_input}" name="do" value="save" /> 
{if $type_input =="text"}<br/>entity: {/if}<input type="{$type_input}" name="entity" value="{$entity}" />
{if $type_input =="text"}<br/>investigation_id: {/if}<input type="{$type_input}" name="investigation_id" value="{$investigation['id']}" />
{if $type_input =="text"}<br/>patient_id: {/if}<input type="{$type_input}" name="patient_id" value="{$patient->id}" />
{if $type_input =="text"}<br/>visit_id: {/if}<input type="{$type_input}" name="visit_id" value="{$visit['id']}" />
{if $type_input == "text"}</td><tr></table>{/if}