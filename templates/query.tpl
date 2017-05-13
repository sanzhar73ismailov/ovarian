{if $object->id && $showQueryArea}
    <tr style="background-color: #dcf8c6;"><td colspan="2">
    <div style="position:relative; left:500px;">
    <button id="button_show_query_field" onclick="show_query_field();return false;" style="display: none">Отобразить Query область</button>
    <button id="button_hide_query_field" onclick="hide_query_field();return false;" style="display:;">Скрыть Query область</button>
    </div>
    <fieldset id="query_field_id" style="display:;">
    <legend>Queries</legend>
    
    
    {*
    <div class="center_title">Пациент: № {$patient->patient_number}. <a href="index.php?page=visits&patient_id={{$patient->id}}">Назад в "Визиты"</a></div>
<div class="center_title">Исследование: {$investigation['descr']}</div>
<div class="center_title">Визит: {$visit['descr']}</div>
    *}
    
    <input type="hidden" name="query_investigation_id" value="{$investigation['id']}"/>
    <input type="hidden" name="query_record_id" value="{$object->id}"/>
    <input type="hidden" name="query_investigation_name" value="{$investigation['descr']}"/>
    <input type="hidden" name="query_visit_name" value="{$visit['descr']}"/>
    <input type="hidden" name="query_patient_number" value="{$patient->patient_number}"/>
    <input type="hidden" name="query_user_email" value="{$object->user}"/>
    
    <input type="hidden" name="user_object_role" id="user_object_role" value="{$userObjectRole}"/>
    <div style="float:right;" id="query_send_message_id"></div>
    {if $showQueryRoleIsMonitor}
    Для создания Query введите текст в поле и нажмите кнопку 'Создать Query'
    <textarea name="query_description" id="query_description" required="required" rows="5" cols="100"></textarea>
    <br/><button onclick="saveQuery();return false;">Создать Query </button>
    {/if}
    
    
    <table id="query_list" border="1" style="border-collapse: collapse;" cellpadding="3">
    <tr id="query_list_header">
    <th>N</th><th>Описание</th><th>Статус</th><th>Дата создания</th><th>Дата закрытия</th><th>Действие</th>
    </tr>
    {foreach $listQuery as $item}
    <tr>
    <td>{$item->id}</td>
    <td>{$item->description}</td>
    
    {assign var="statusColor" value="black"}
    {if $item->query_status_id == 1}{assign var="statusColor" value="red"}{/if}
    {if $item->query_status_id == 2}{assign var="statusColor" value="GoldenRod"}{/if}
    {if $item->query_status_id == 3}{assign var="statusColor" value="green"}{/if}
    <td style="color:{$statusColor};">{$item->query_status_descr}</td>
    <td>{$item->open_date}</td>
    <td>{$item->close_date}</td>
    <td>
    {if $showQueryRoleIsMonitor}
     {if $item->query_status_id==2}
        <a href="" onclick="changeQueryStatus({$item->id}, 'close'); return false;"><button>Закрыть</button></a>
        {/if}
    {else}
    {if $item->query_status_id==1}
        <a href="" onclick="changeQueryStatus({$item->id}, 'resolve'); return false;"><button>Исправлено</button></a>
        {/if}    
    {/if}
    </td>
    </tr>
    
    
    {/foreach}
    </table>
   
    </fieldset>
    
    </td>
    </tr>
	{/if}