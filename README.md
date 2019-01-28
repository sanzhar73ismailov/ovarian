# ovarian

#Версия ведется в version includes/global.php файле
Формат: `yy.mm.dd.idx`
`yy`  - год, до 2х знаков
`mm`  - месяц, до 2х знаков
`dd`  - день, до 2х знаков
`idx` - порядковый номер ревизии в текущем дне, начиная с 1

##История изменений (расти вверх)

###ver. 19.01.28.1
    ~ Изменил таблицу ovarian_general_data: все descr поля - тип поменял на text
###ver. 18.11.06.1
    ~ Пас для почты вынес в global.php
###ver. 18.10.04.1
	~ Исправил ошибку в сообщении эл. почты при регистрации.
###ver. 17.10.10.1
   ~ В шаблоне templates/edit_inclusion.tpl на 76 строке вставил
   {if $patient->id < 37}
					Пациенты, получившие не более 1 линии химиотерапии платиносодержащими режимами
                {else}
                	Пациенты, получившие 1 и более линий химиотерапии платиносодержащими режимами по поводу рецидива 
                	рака яичника при условии, что периоды ремиссии между рецидивами были 6 месяцев и более
   {/if}
  
###ver. 17.09.29.1
   ~ На странице критериев включения поменял
       Пациенты, получившие не более 1 линии химиотерапии платиносодержащими режимами
       На следующую формулировку
       Пациенты, получившие 1 и более линий химиотерапии платиносодержащими режимами по поводу рецидива рака яичника при условии, что периоды ремиссии между рецидивами были 6 месяцев и более
###ver. 17.06.10.1
   + При создании Query - уведомление уходит так же и админу (помимо пользователя)
###ver. 17.06.08.1
   + подстановка префикса госпиталя к номеру пациенту при добавлении нового
   + у верифицированных вариантов на странице визитов в ячейках появляется значок белой галочки
     на зеленом фоне 
###ver. 17.05.17.1
   ~BugFix - Убрал ошибки javascript на странице лабораторных иссл.
   ~BugFix - Везде на формах выводится номер записи, если запись уже существует
   ~BugFix - Редактирование сопуствующей терапии - теперь сохраняется
###ver. 17.05.16.1
   ~BugFix - InvestigationConcomitantTherapyEdit.php - выходила ошибка на форме сопуствующе терапии.
   ~BugFix - Ошибки в текстах уведомлений по Query.
###ver. 17.05.15.1
   + добавил - если отправка на тестовую почту установлена, то пользователю будет высылаться на 
   define('TEST_USER_EMAIL', "javajan@mail.ru") - в global.php
###ver. 17.05.14.1
   + Много изменений - Query, выгрузка НЯ, верификация форм, логирование
###ver. 17.03.08.1
   ~ Доработал форму анализов
   + Добавил тестовых пользователей, пользователя для мониторинга (реальную)
   + Добавил роль "monitor"
   + На отправку уведомлений по почте поставил заглушку
###ver. 17.03.07.1
   ~ Подправил форму инструментов
   ~ Форму анализов - поставил разграничители
###ver. 17.03.06.1
	+ добавил форму "критерии включения/исключения"
	+. При сохранении, чтобы выдавал - включен он или нет
	+. Сделать на списке пациентов, чтобы отображалось, включен он или нет или еще не заполнялось
	+. Чтобы из формы пациента, можно  было переходить на форму визитов и в список пациентов на ту позицию, где были раньше
	+. Сделать, чтобы у тех пациентов, у которых не заполнялить критерии или они не прошли, невозможно было заполнять другие исследования
	~ подправли формы
###ver. 17.02.21.01
	+ config.php - добавил хостинг настройки
