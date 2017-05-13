<?php
session_start ();
include_once 'includes/global.php';

// include_once 'includes/check_session.php';
if (! isset ( $_SESSION ["authorized"] ) || $_SESSION ["authorized"] != 1) {
	$smarty->assign ( 'title', "Вход" );
	$smarty->assign ( 'message', "Необходимио авторизоваться" );
	$smarty->display ( 'templates/login.tpl' );
	exit ();
} else {
	
	$smarty->assign ( 'authorized', 1 );
	$smarty->assign('user_name',$_SESSION["user"]['username_email']);
	$smarty->assign('user_role',$_SESSION["user"]['role_id']);
}
if (isset ( $_REQUEST ["entity"] )) {
	
	$entity = $_REQUEST ["entity"];
	$smarty->assign ( 'entity', $entity );
	
	$do = isset ( $_REQUEST ["do"] ) ? $_REQUEST ["do"] : "view";
	$id = isset ( $_REQUEST ["id"] ) ? ( int ) $_REQUEST ["id"] : null;
	
	$entityEdit = EntityEditFabrica::createEntityEdit ( $_REQUEST, $do, $id, $dao, $smarty );
	$entityEdit->go ();

} else {
	exit ( "Error!" );
}
?>