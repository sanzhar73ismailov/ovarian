<?php
session_start();
include_once 'includes/global.php';

//if(isset($_REQUEST['unreg'])){
//	unset($_SESSION["logged_user"]);
//	 header("Location: index.php");
//         exit;
//}
//echo "ddddddddddd";
$login = isset($_REQUEST['login']) ?  trim($_REQUEST['login']) : null;
$password = isset($_REQUEST['password']) ?  trim($_REQUEST['password']) : null;

$password = md5($password);



if($dao->is_user_exist($login, $password)){

	$logged_user = $dao->getUserByLogin($login);
	$dao->insert_user_visit($logged_user);
	 
	$_SESSION["user"]= (array) $logged_user;
	//$_SESSION["userObject"]= $logged_user;
	$_SESSION["authorized"]= 1;
	$_SESSION['time'] = time();

	$smarty->assign('authorized',1);
	$smarty->assign('title',"Главная страница");
	$smarty->assign('user_name',$_SESSION["user"]['username_email']);
	$smarty->assign('user_role',$_SESSION["user"]['role_id']);
	$smarty->display('templates/index.tpl');
	exit;
}else{
	$smarty->assign('authorized',0);
	$smarty->assign('title',"Вход");
	$smarty->assign('message', "Пользователь с таким логином не существует или пароль неверный или учетная запись не активирована!");
	$smarty->display('templates/login.tpl');
}