<?php
include_once 'includes/util_functions.php';
abstract class EntityEdit {
	protected $request;
	protected $do = 'view';
	protected $id = 0;
	protected $smarty;
	protected $dao;
	protected $user;
	protected $userObject;
	public function __construct($request, $do, $id, $dao, $smarty) {
		$this->request = $request;
		$this->do = $do;
		$this->id = $id;
		$this->dao = $dao;
		$this->smarty = $smarty;
		// $this->user = $_SESSION["user"]['username_email'];
		$this->user = $_SESSION["user"]['username_email'];
		$this->userObject = $this->dao->getUserObject();
		//var_dump($this->userObject);
	}
	public function go() {
		if($this->do == 'view'){
		if (isset($this->request['change_checked'])){
						$this->dao->update_checked_status($this->request['investigation_id'],$this->request['id']);
					}
		}
		$object = $this->getEntityObj ();
		//var_dump($object);
		//echo "<h1>\$this->do=" . $this->do . "</h1>";
		//echo "<h1>\$this->do=" . $this->do . "</h1>";
		$this->fill_entity_form_by_dic ();
		$showQueryArea = 0;
		$showQueryRoleIsMonitor = 0;
		$listQuery = array();
		switch ($this->do) {
			case "view" :
			case "edit" :
				if($object->id == null){
					$this->do = 'edit';
				}
				if ($this->do == "view") {
					$this->assign_smarty_for_view ();
					$this->setTitleForView ();
					
				} else {
					$this->assign_smarty_for_edit ();
					$this->setTitleForEdit ();
				}
				break;
			case "save" :
				$entityParsed = $this->parse_form_to_entity ();
				//echo "<h1>" . "in save" . "</h1>";
				if ($entityParsed->id == null) {
					$object = $this->save_insert ( $entityParsed );
				} else {
					$object = $this->save_update ( $entityParsed );
				}
				$this->assign_smarty_for_view ();
				$this->setTitleForView ();
				break;
			default :
				throw new Exception ( "unknown variable do: " . $this->do );
		}

		$this->smarty->assign ( 'object', $object );
		// всем ролям, кроме investigator показывать Query
		if(($this->do == "view" or $this->do == "save") and
		($this->userObject->role_id == "investigator" or $this->userObject->role_id == "monitor")){
			if(isset($this->request['investigation_id'])) {
				$listQuery = $this->dao->getListQueries($this->request['investigation_id'], $object->id);
				$showQueryArea = 1;
				$showQueryRoleIsMonitor = $this->userObject->role_id == "monitor";
			}
			
		}
		$this->smarty->assign ( 'listQuery', $listQuery);
		$this->smarty->assign ( 'showQueryArea', $showQueryArea);
		$this->smarty->assign ( 'showQueryRoleIsMonitor', $showQueryRoleIsMonitor);
		$this->smarty->assign ( 'userObjectRole', $this->userObject->role_id);
		$this->display_tpl ();
	}
	private function assign_smarty_for_edit() {
		$this->smarty;
		$this->smarty->assign ( 'readonly', "" );
		$this->smarty->assign ( 'disabled', "" );
		$this->smarty->assign ( 'class', "" );

		$this->smarty->assign ( 'class_req_input', "class='req_input' required=''" );
		$this->smarty->assign ( 'edit', true );

	}
	private function assign_smarty_for_view() {
		$this->smarty->assign ( 'readonly', "readonly='readonly'" );
		$this->smarty->assign ( 'disabled', "disabled='disabled'" );
		$this->smarty->assign ( 'edit', false );
		$this->smarty->assign ( 'class_req_input', "class='read_only_input'" );
		$this->smarty->assign ( 'class', "class='read_only_input'" );

	}
	protected function getNullForObjectFieldIfStringEmpty($val) {
		if (! isset ( $val ))
		return null;
		if ($val == null)
		return null;
		$val = trim ( $val );
		$val = strval ( $val );
		if (strlen ( $val ) == 0)
		return null;
		return $val;
	}

	public function getValFromRequest($request, $attr){
		if(!isset($request[$attr])){
			if(endsWithId($attr))
			return '-1';
			else
			return null;
		}
		return $request[$attr];
	}

	public abstract function getEntityObj();
	public abstract function setTitleForView();
	public abstract function setTitleForEdit();
	public abstract function save_insert($entityParsed);
	public abstract function save_update($entityParsed);
	public abstract function parse_form_to_entity();
	public abstract function fill_entity_form_by_dic();
	public abstract function display_tpl();
}