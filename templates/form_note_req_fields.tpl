	{if $edit}
	<tr>
		<td><input type="submit" value="Сохранить"
			style="width: 120px; height: 20px"></td>
		<td class="req_input">Обязательные поля выделены этим цветом, <br />
		без их заполнения данные не сохранятся!</td>
	</tr>
	{else}
		<tr>
		<td><a href="edit.php?entity={$entity}&id={$object->id}&do=edit&patient_id={$object->patient_id}&investigation_id={$investigation['id']}&visit_id={$object->visit_id}">
		{* <td><a href="edit.php?entity={$entity}&id={$object->id}&do=edit&investigation_id={$investigation['id']}"> *}
		<img width="20" height="20" alt="Править" src="images/edit.jpg" /></a></td>
		<td>{if $object->checked}
		<span style='color:green'>Верифицировано
		{if $showQueryRoleIsMonitor}<a href="edit.php?entity={$entity}&id={$object->id}&do=view&patient_id={$object->patient_id}&investigation_id={$investigation['id']}&visit_id={$object->visit_id}&change_checked=1">
		Изменить</a>{/if}
		</span>
		{else}<span style='color:red'>Не верифицировано
		{if $showQueryRoleIsMonitor}<a href="edit.php?entity={$entity}&id={$object->id}&do=view&patient_id={$object->patient_id}&investigation_id={$investigation['id']}&visit_id={$object->visit_id}&change_checked=1">
		Изменить</a>{/if}
		</span>
		{/if}</td>
	</tr>
	{/if}