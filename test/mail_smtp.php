<?php
// the message

$to = "javajan@mail.ru,sanzhar73@mail.ru,sanzhar@yahoo.com,sanzhar73@gmail.com";
//$to = "javajan@mail.ru";

//$res = smtpmail('Имя получателя', 'email-получателя@mail.ru', 'Тема письма', 'HTML или обычный текст письма');
//$res = smtpmail('Имя получателя', $to, 'Проверка почты', 'HTML или обычный текст письма');
// пример использования
require_once "SendMailSmtpClass.php"; // подключаем класс


$ver = 1;
  
$mailSMTP = new SendMailSmtpClass('sanzhar73@mail.ru', 'IliveinKrakow+', 'ssl://smtp.mail.ru', 'Sanzhar', 465); // создаем экземпляр класса
// $mailSMTP = new SendMailSmtpClass('логин', 'пароль', 'хост', 'имя отправителя');
  
// заголовок письма
$headers= "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
$headers .= "From: Sanzhar <sanzhar73@mail.ru>\r\n"; // от кого письмо !!! тут e-mail, через который происходит авторизация
$result =  $mailSMTP->send($to, 'Тема письма', 'Текст письма', $headers); // отправляем письмо
// $result =  $mailSMTP->send('Кому письмо', 'Тема письма ver-' . $ver, 'Текст письма', 'Заголовки письма');
if($result === true){
    echo "Письмо успешно отправлено";
}else{
    echo "Письмо не отправлено. Ошибка: " . $result;
}

echo "<h4>---</h4>";
print_r(error_get_last());
echo "<h4>---</h4>";
print_r($res);
echo "<h4>---</h4>";
var_dump($res);
echo "<h4>---</h4>";
















