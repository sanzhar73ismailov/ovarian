<?php
define('VERSION', '17.05.15.1');
define('SMARTY_DIR', '../Smarty-3.1.18/libs/');
define('SITE_NAME', "Индивидуальная регистрационная карта <br> Исследование по использованию препарата трабектедин (Йонделис®)");
define('SITE_NAME_SHORT', "Электронная ИРК - RENAISSANCE");
define('DEBUG', "1");
define('ADMIN_CODE', "ovarian2017");
define('ADMIN_EMAIL', "sanzhar73@mail.ru");
define('SENDER_EMAIL', "sanzhar73@mail.ru");
define('GENERATE_TEST_OBJECTS', "0"); // 1 - генерировать тестовые объекты для форм, 0 - не генерировать
define('ZAGLUSHKA_MAIL', "0"); // 1 - Заглушка для работы почты (отправляться не будет), 0 - почта будет отправляться
define('SEND_MAIL_TO_TEST_ADDR', "0"); // 1 - Отправка на тестовые email адреса, 0 - отправка на настоящие email адреса
define('TEST_EMAILS', "javajan@mail.ru,sanzhar@yahoo.com"); // тестовые адреса, разделенные запятой, используются если SEND_MAIL_TO_TEST_ADDR=1 
define('TEST_USER_EMAIL', "javajan@mail.ru"); // тестовые адрес пользователя, используется если SEND_MAIL_TO_TEST_ADDR=1

// check git

include_once 'includes/class_dao.php';
require_once(SMARTY_DIR . 'Smarty.class.php');
include_once 'includes/class_dictionary.php';
include_once 'includes/class_user.php';
include_once 'includes/class_navigate.php';

include_once 'includes/class_EntityEditAbstr.php';
//exit("exit on GLOBAL.php 4");
include_once 'includes/class_global.php';
include_once 'includes/functions.php';

$smarty = new Smarty();
$smarty->assign('application_name',SITE_NAME);
$smarty->assign('application_version',VERSION);

//$smarty->force_compile = true;
$dao = new Dao();
//$globalObject = new GlobalObject();
//$globalObject->smarty = $smarty;
//$globalObject->dao = $dao;


ini_set("display_errors",1);
error_reporting(E_ALL);
