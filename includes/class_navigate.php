<?php
class FabricaNavigate{
	public  static function createNavigate($str_path, $session){
		global $smarty;
		$navigate_obj = null;
		switch ($str_path){
			case 'contacts':
				$navigate_obj = new ContactNavigate($smarty, $session);
				break;
			case 'feedback':
				$navigate_obj = new FeedbackNavigate($smarty, $session);
				break;
			case 'register':
				$navigate_obj = new RegistrationNavigate($smarty, $session);
				break;
			case 'activate_account':
				$navigate_obj = new ActivationNavigate($smarty, $session);
				break;
			case 'login':
				$navigate_obj = new LoginNavigate($smarty, $session);
				break;
			case 'logout':
				$navigate_obj = new LogoutNavigate($smarty, $session);
				break;
			case 'list_abs_data':
				$navigate_obj = new ListNavigateAbsData($smarty, $session);
				//exit("Unsupported operation");
				break;
			case "list":
				$navigate_obj = new ListNavigate($smarty, $session);
				break;
			case "listQuery":
				$navigate_obj = new ListQuery($smarty, $session);
				break;
			case "listAdversEvent":
				$navigate_obj = new ListAdversEvent($smarty, $session);
				break;
			case "visits":
				$navigate_obj = new VisitsNavigate($smarty, $session);
				break;
			default:
				$navigate_obj = new IndexNavigate($smarty, $session);
				break;
		}
		return $navigate_obj;

	}

}

abstract class AbstractNavigate{
	protected $title;
	protected $template;
	protected $smartyArray = array();
	protected $smarty;
	protected $session;
	protected $restricted = false;
	protected $authorized;
	protected $message = "";

	public function __construct($smarty, $session){
		$this->smarty = $smarty;
		$this->session = $session;

		//echo "<h1>_SESSION[authorized]=" .$_SESSION["authorized"]."</h1>";
		//время по истечению которого сессия удаляется в секундах: 1800 - это 30 мин
		$time_to_destroy_session = 1800;

		if(!isset($_SESSION["time"]) || (time() > $_SESSION['time']+$time_to_destroy_session)) {
			unset($_SESSION['authorized']);
			session_destroy();
		}else{
			$_SESSION['time'] = time();
		}


		if(!isset($_SESSION["authorized"]) || $_SESSION["authorized"] != 1){
			$this->authorized = false;
			$smarty->assign('authorized',0);
		}else{
			$this->authorized = true;
			$smarty->assign('authorized',1);
			$smarty->assign('user_name',$_SESSION["user"]['username_email']);
			$smarty->assign('user_role',$_SESSION["user"]['role_id']);
			//var_dump($_SESSION["user"]);
		}
	}


	public function display(){

		$this->init();

		$this->smarty->assign('title',$this->title);
		$this->smarty->assign('message',$this->message);

		foreach($this->smartyArray as $key => $value){
			$this->smarty->assign($key,$value);
			//echo "$key , $value <br>";
		}

		//echo "<h1>restricted" .$this->restricted."</h1>";

		//echo "<h1>authorized" .$this->authorized."</h1>";

		if(!$this->restricted || ($this->restricted && $this->authorized)){
			$this->smarty->display('templates/' . $this->template);
		}else{
			$this->smarty->assign('title',"Вход");
			$this->smarty->assign('message',"Необходимио авторизоваться");
			$this->smarty->display('templates/login.tpl');
			exit;
		}
	}

	public abstract  function init();

}

class ContactNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		$this->title = "Контакты";
		$this->template = 'contacts.tpl';
		$this->smartyArray['admin_email']= ADMIN_EMAIL;
	}
}

class ListNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global $dao;
		$this->restricted = true;
		$this->title = "Список пациентов";
		$this->template = 'list.tpl';
		$this->message = "До встречи!";
		if($this->authorized){
			$this->smartyArray['patients'] = $dao->getPatients();
		}
	}
}

class ListQuery extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global $dao;
		$this->restricted = true;
		$this->title = "Список Query";
		$this->template = 'listQuery.tpl';
		$this->message = "До встречи!";
		if($this->authorized){
			$username_email = null;
			//var_dump($this->session['user']);
			if($this->session['user']['role_id'] == 'investigator'){
				$username_email = $this->session['user']['username_email'];
			}
			$this->smartyArray['items'] = $dao->getListAllQueries($username_email);
			//$this->smartyArray['items'] = $dao->getListAllQueries();
			//var_dump($this->session['user']['role_id']);
		}
	}
}


class ListAdversEvent extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global $dao;
		$this->restricted = true;
		$this->title = "Список нежелательный явлений";
		$this->template = 'listAdverseEvent.tpl';
		$this->message = "До встречи!";
		if($this->authorized){
			$username_email = null;
			//var_dump($this->session['user']);
			if($this->session['user']['role_id'] == 'investigator'){
				$username_email = $this->session['user']['username_email'];
			}
			$start_date = null;
			$end_date = null;
			$start_date_mysql = null;
			$end_date_mysql = null;
			if((isset($_POST['start_date']) and $_POST['start_date']!='')  and (isset($_POST['end_date']) and $_POST['end_date']!='') ){
				$start_date = trim($_POST['start_date']);
				$end_date = trim($_POST['end_date']);
				$start_date_mysql = $this->convertToMysqlFormat($start_date);
				$end_date_mysql = $this->convertToMysqlFormat($end_date);
			}
			//var_dump($_POST);
			//var_dump($start_date_mysql);
			//var_dump($end_date_mysql);
			$this->smartyArray['start_date'] =  $start_date;
			$this->smartyArray['end_date'] =  $end_date;
			$this->smartyArray['items'] = $dao->getListAdverseEvent($start_date_mysql, $end_date_mysql);
			//var_dump($this->session['user']['role_id']);
		}
	}
	/**
	 *
	 * Convert dd/mm/yyyy to yyyy-mm-dd
	 * @param $rusDate
	 */
	private function convertToMysqlFormat($rusDate){
		$arr = explode("/", $rusDate);
		if(sizeof($arr) == 3){
			return $arr[2] . "-" . $arr[1] . "-" . $arr[0];
		}
		return  "2030-12-31";
	}
}

class ListNavigateAbsData extends AbstractNavigate{


	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global $dao;
		$this->restricted = true;
		$this->title = "Список всех данных";
		$this->template = 'list_abs_data.tpl';
		$this->message = "До встречи!";
		if($this->authorized){
			$this->smartyArray['items'] = $dao->getAllData();
		}
	}
}
class IndexNavigate extends AbstractNavigate{
	public function init(){
		$this->restricted = true;
		$this->title = "Главная страница";
		$this->template = 'index.tpl';
	}
}

class LoginNavigate extends AbstractNavigate{
	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		$this->title = "Вход";
		$this->template = 'login.tpl';
	}
}

class LogoutNavigate extends AbstractNavigate{
	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		$this->title = "Выход";
		$this->template = 'general_message.tpl';
		$this->message = "До встречи!";
		$this->smartyArray['authorized'] = false;
		$this->smartyArray['result'] = true;
		$_SESSION = array(); //Очищаем сессию
		//session_destroy(); //Уничтожаем
	}

}

class FeedbackNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		$this->title = "Обратная связь";
		$this->template = 'feedback.tpl';
		$email = "";
		if($this->authorized){
			$email = $this->session['user']['username_email'];
		}

		$this->smartyArray['email']= $email;
	  
	}
}

class RegistrationNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		$this->title = "Регистрация";
		$this->template = 'register.tpl';
		$this->smartyArray['result']= 0;
	}
}

class ActivationNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global  $dao;
		echo "init work in ActivationNavigate<p>";

		$this->title = "Активация учетной записи";
		$this->template = 'general_message.tpl';
		$this->smartyArray['result']= 0;

		$result_activation = $dao->activate_user($_REQUEST['username_email']);
		if($result_activation){
			$this->smartyArray['result']= true;
			$this->message = "Уважаемый " . $_REQUEST['username_email'] . ", ваша учетная запись активирована!";
		}else{
			$this->smartyArray['result']= false;
			$this->message = "Уважаемый " . $_REQUEST['username_email'] . ", ваша учетная запись не активирована, обратитесь а администратору";
		}
	}
}


class EditNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global  $dao;




		//  $edntityEdit = EntityEditFabrica::createEntityEdit($entity);

		//		$this->title = "Активация учетной записи";
		//		$this->template = 'general_message.tpl';
		//		$this->smartyArray['result']= 0;


	}


}

class VisitsNavigate extends AbstractNavigate{

	public function __construct($smarty, $session){
		parent::__construct($smarty, $session);
	}

	public function init(){
		global $dao;
		$this->restricted = true;
		$patient = $dao->getPatient($_REQUEST['patient_id']);
		//var_dump($dao->getVisitTable($_REQUEST['patient_id']));
		$this->title = "Таблица расписания визитов для пациента " . $patient->patient_number;
		$this->template = 'visits.tpl';
		if($this->authorized){
			$this->smartyArray['headerNames'] = $dao->getHeaderNames();
			$this->smartyArray['table'] = $dao->getVisitTable($_REQUEST['patient_id']);
			$this->smartyArray['patient'] = $patient;
			//var_dump($dao->getVisitTable($_REQUEST['patient_id']));
		}
	}
}