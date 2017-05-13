	{if $edit}
	<tr>
		<td><input type="submit" value="Сохранить"
			style="width: 120px; height: 20px"></td>
		<td class="req_input">Обязательные поля выделены этим цветом, <br />
		без их заполнения данные не сохранятся!</td>
	</tr>
	{else}
		<tr>
		<td>
		<a href='edit.php?entity=adverse_event_detail&id={$object->id}&do=edit&adverse_event_id={$object->adverse_event_id}'>
		{* <a href="edit.php?entity={$entity}&id={$object->id}&do=edit&patient_id={$object->patient_id}&investigation_id={$investigation['id']}&visit_id={$object->visit_id}"> *}
		<img width="20" height="20" alt="Править" src="images/edit.jpg" /></a></td>
		<td></td>
	</tr>
	{/if}