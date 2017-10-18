-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Окт 18 2017 г., 05:58
-- Версия сервера: 5.5.52-MariaDB-cll-lve
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `p-5080_ovarian`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_adverse_event`
--

CREATE TABLE `ovarian_adverse_event` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `adverse_event_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Отмечались неблагоприятные явления да/нет',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Неблагоприятные явления';

--
-- Дамп данных таблицы `ovarian_adverse_event`
--

INSERT INTO `ovarian_adverse_event` (`id`, `patient_id`, `visit_id`, `adverse_event_yes_no_id`, `checked`, `user`, `insert_date`) VALUES
(16, 20, 1, 0, 0, 'Esengalieva.roza@mail.ru', '2017-03-28 12:20:12'),
(17, 21, 1, 1, 0, 'test071@test.kz', '2017-03-29 09:27:59'),
(18, 22, 1, 0, 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:46:27'),
(19, 22, 2, 1, 0, 'aiman_bulatova@mail.ru', '2017-04-21 06:42:33'),
(20, 20, 2, 0, 0, 'Esengalieva.roza@mail.ru', '2017-05-16 08:38:08'),
(21, 28, 1, 0, 0, 'kossanova@synergycro.ru', '2017-05-16 09:44:19'),
(22, 28, 2, 0, 0, 'kossanova@synergycro.ru', '2017-05-16 10:12:41'),
(23, 21, 2, 0, 0, 'kossanova@synergycro.ru', '2017-05-16 10:20:22'),
(24, 22, 3, 1, 0, 'aiman_bulatova@mail.ru', '2017-05-22 11:03:28'),
(25, 22, 4, 1, 0, 'aiman_bulatova@mail.ru', '2017-06-02 06:47:29'),
(26, 29, 1, 0, 0, 'aiman_bulatova@mail.ru', '2017-06-05 04:27:21'),
(27, 20, 3, 1, 0, 'Esengalieva.roza@mail.ru', '2017-06-06 09:56:27'),
(28, 21, 3, 0, 0, 'kossanova@synergycro.ru', '2017-06-06 10:28:02'),
(29, 21, 4, 0, 0, 'kossanova@synergycro.ru', '2017-06-06 10:29:48'),
(30, 30, 1, 0, 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:31:05'),
(31, 30, 2, 0, 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:32:39'),
(32, 31, 1, 0, 0, 'simba83-83@mail.ru', '2017-06-16 09:44:50'),
(33, 18, 1, 0, 0, 'zarinka.zi@mail.ru', '2017-06-21 07:44:22'),
(34, 20, 4, 0, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:32:02'),
(35, 22, 5, 1, 0, 'aiman_bulatova@mail.ru', '2017-06-28 07:54:20'),
(36, 29, 2, 0, 0, 'aiman_bulatova@mail.ru', '2017-06-28 10:16:26'),
(37, 29, 3, 0, 0, 'aiman_bulatova@mail.ru', '2017-06-30 03:27:14'),
(38, 18, 2, 0, 0, 'zarinka.zi@mail.ru', '2017-07-01 02:39:16'),
(39, 18, 3, 0, 0, 'zarinka.zi@mail.ru', '2017-07-15 04:59:10'),
(40, 29, 4, 1, 0, 'aiman_bulatova@mail.ru', '2017-07-20 10:48:45'),
(41, 22, 6, 1, 0, 'aiman_bulatova@mail.ru', '2017-07-28 13:01:21'),
(42, 32, 1, 0, 0, 'davran_a@mail.ru', '2017-07-29 16:42:22'),
(43, 32, 2, 0, 0, 'davran_a@mail.ru', '2017-07-29 16:48:00'),
(44, 33, 1, 0, 0, 'davran_a@mail.ru', '2017-07-29 17:15:48'),
(45, 28, 3, 0, 0, 'Esengalieva.roza@mail.ru', '2017-08-03 10:05:59'),
(46, 35, 1, 0, 0, 'Esengalieva.roza@mail.ru', '2017-08-09 11:40:20'),
(47, 20, 5, 0, 0, 'Esengalieva.roza@mail.ru', '2017-08-10 05:07:41'),
(48, 29, 5, 1, 0, 'aiman_bulatova@mail.ru', '2017-08-11 03:20:35'),
(49, 18, 4, 0, 0, 'zarinka.zi@mail.ru', '2017-08-18 07:20:12'),
(50, 35, 2, 0, 0, 'Esengalieva.roza@mail.ru', '2017-08-22 14:05:15'),
(51, 20, 6, 0, 0, 'Esengalieva.roza@mail.ru', '2017-09-03 11:26:02'),
(52, 29, 6, 1, 0, 'aiman_bulatova@mail.ru', '2017-09-04 06:06:05'),
(53, 29, 7, 0, 0, 'aiman_bulatova@mail.ru', '2017-09-24 07:02:05'),
(54, 22, 7, 0, 0, 'aiman_bulatova@mail.ru', '2017-09-24 10:11:11'),
(55, 18, 5, 1, 0, 'zarinka.zi@mail.ru', '2017-09-27 01:17:58'),
(56, 22, 8, 0, 0, 'aiman_bulatova@mail.ru', '2017-09-27 10:18:46'),
(57, 36, 1, 1, 0, 'nikki_93@bk.ru', '2017-10-10 08:31:07');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_adverse_event_detail`
--

CREATE TABLE `ovarian_adverse_event_detail` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL COMMENT 'Наименование явления (строковое описание)',
  `adverse_event_id` int(11) NOT NULL COMMENT 'Внешний ключ на таблицу недоброжелат явлений',
  `serious_yes_no_id` int(11) DEFAULT NULL COMMENT 'Это серьезное явление? Да/Нет',
  `start_date` date DEFAULT NULL COMMENT 'Дата начала',
  `resolved_yes_no_id` int(11) DEFAULT NULL COMMENT 'Явление разрешилось? Да/Нет',
  `resolved_date` date DEFAULT NULL COMMENT 'Дата разрешения явления',
  `event_intensity_decreased_yes_no_id` int(11) DEFAULT NULL COMMENT 'Выраженность явления снизилась после прекращения приема препарата или уменьшения его дозы?',
  `event_occurred_again_yes_no_id` int(11) DEFAULT NULL COMMENT 'Явление возникло повторно после возобновления приема препарата?',
  `event_associated_with_drug_yes_no_id` int(11) DEFAULT NULL COMMENT 'Явление связано с приемом препарата компании J&J?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Нежелаетельные явления подробно';

--
-- Дамп данных таблицы `ovarian_adverse_event_detail`
--

INSERT INTO `ovarian_adverse_event_detail` (`id`, `name`, `adverse_event_id`, `serious_yes_no_id`, `start_date`, `resolved_yes_no_id`, `resolved_date`, `event_intensity_decreased_yes_no_id`, `event_occurred_again_yes_no_id`, `event_associated_with_drug_yes_no_id`) VALUES
(24, 'умеренная тошнота', 27, 0, '2017-05-13', 1, '2017-05-15', 1, 1, 1),
(26, 'лейкопения 1ст', 41, 0, '2017-07-27', 0, NULL, 0, 0, 0),
(27, 'лейкопения 1ст', 48, 0, '2017-08-04', 0, NULL, 0, 0, 0),
(28, 'лейкопения 2ст', 19, 0, '2015-04-20', 1, '2015-04-25', 1, 1, 1),
(29, 'лейкопения 2ст', 24, 0, '2017-05-11', 1, '2017-05-16', 1, 1, 1),
(30, 'лейкопения 2ст', 25, 0, '2017-06-27', 1, '2017-07-03', 1, 1, 1),
(31, 'лейкопения 2ст', 35, 0, '2017-06-27', 1, '2017-07-03', 1, 0, 1),
(32, 'лейкопения 1тс', 52, 0, '2017-08-25', 0, NULL, 0, 0, 0),
(33, 'Лейкопения', 55, 0, '2017-09-05', 1, '2017-09-06', 0, 0, 1),
(34, 'тошнота', 17, 0, '2017-10-10', 0, NULL, 0, 1, 1),
(35, 'лейкопения', 17, 0, '2017-10-09', 0, NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_concomitant_therapy`
--

CREATE TABLE `ovarian_concomitant_therapy` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `chem_2st_concomitant_therapy_descr` text COMMENT 'Сопутствующая терапия: описание',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сопутствующая терапия';

--
-- Дамп данных таблицы `ovarian_concomitant_therapy`
--

INSERT INTO `ovarian_concomitant_therapy` (`id`, `patient_id`, `visit_id`, `chem_2st_concomitant_therapy_descr`, `checked`, `user`, `insert_date`) VALUES
(1, 21, 1, 'rterter', 0, 'sanzhar73@mail.ru', '2017-05-16 05:41:14'),
(2, 21, 2, 'etertr', 0, 'sanzhar73@mail.ru', '2017-05-16 05:41:20'),
(3, 20, 2, 'Флунол 150 мг внутрь, ондасетрон 24 мг в/в кап № 2, атропин, дексаметазон по схеме.', 0, 'Esengalieva.roza@mail.ru', '2017-05-16 08:39:23'),
(4, 20, 1, 'Атропин, дексаметазон, ондасетрон по схеме', 0, 'Esengalieva.roza@mail.ru', '2017-05-16 08:39:51'),
(5, 22, 1, 'Эссенциале 5,0 в/в, \r\nондасетрон 8 мг №1\r\nдексаметазон 20 мг №2', 0, 'aiman_bulatova@mail.ru', '2017-05-22 10:52:33'),
(6, 22, 2, 'уродезоксифолиевая кислота 250мг 2р/д\r\nомепразол 20 мг 2 р/д\r\nдексаметазон 20 мг №6 \r\nондасетрон 8 мг №2', 0, 'aiman_bulatova@mail.ru', '2017-05-22 10:53:29'),
(7, 22, 3, 'хитрозол 1 мерная ложка 3 р/д №2\r\nдексаметазон 20 мг №3\r\nондасетрон 8 мг №1', 0, 'aiman_bulatova@mail.ru', '2017-05-22 11:03:49'),
(8, 22, 4, 'дексаметазон 12 мг №3\r\nондасетрон 8 мг №2\r\nомепразол 20 мг 2 р/д №5', 0, 'aiman_bulatova@mail.ru', '2017-06-02 06:49:25'),
(9, 29, 1, 'дексаметазон 12 мг №2\r\nондасетрон 12 мг №2', 0, 'aiman_bulatova@mail.ru', '2017-06-05 04:27:49'),
(10, 20, 3, 'Атропин 0.5 п/к, дексаметазон 20 мг в/в кап № 1, Ондасетрон 32 мг № 3, флунол 150 мг.', 0, 'Esengalieva.roza@mail.ru', '2017-06-06 10:02:28'),
(11, 30, 1, 'Осетрон-8 мг в\\в кап. №-2.', 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:31:57'),
(12, 31, 1, 'NaCl0,9%-250 мл+ ондасетрон – 8 мг в/в кап.  \r\nNaCl0,9%-250 мл+дексаметазон – 20 мг в/в кап.\r\nГепарин 0,2 мг+ NaCl0,9%-10 мл в подключичный катетер.', 0, 'simba83-83@mail.ru', '2017-06-16 09:46:30'),
(13, 18, 1, 'р-р натрия хлорида 400,0 + ондем 8мг + дексаметазон 8мг№2 в/в,  поляризующая смесь 400,0 №2 в/в кап', 0, 'zarinka.zi@mail.ru', '2017-06-21 07:45:08'),
(14, 20, 4, 'атропин 0.5 п/к, дексаметазон 20 мг в/в, ондасетрон 32 мг в/в № 3, флунол 150 мг внутрь', 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:32:53'),
(15, 28, 1, 'атропин, дексаметазон, ондасетрон, флунол, кетотоп', 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:34:54'),
(16, 28, 2, 'флунол 150 мг, атропин 0.5 п/к, дексаметазон 20 мг, ондасетрон 24 мг, кетотоп 2,0 в/м', 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:37:14'),
(17, 22, 5, 'дексаметазон 12 мг №2\r\nондасетрон 8 мг №2', 0, 'aiman_bulatova@mail.ru', '2017-06-28 07:55:17'),
(18, 29, 2, 'дексаметазон, ондасетрон', 0, 'aiman_bulatova@mail.ru', '2017-06-28 10:16:50'),
(19, 29, 3, 'дексаметазон 12мг №2\r\nондасетрон 8мг №2', 0, 'aiman_bulatova@mail.ru', '2017-06-30 03:27:53'),
(20, 18, 2, '(р-р натрия хлорида 400,0 + ондем 8мг + дексаметазон 8мг№2 в/в,  поляризующая смесь 400,0 №2 в/в кап', 0, 'zarinka.zi@mail.ru', '2017-07-01 02:40:50'),
(21, 18, 3, '(р-р натрия хлорида 400,0 + ондем 8мг + дексаметазон 8мг № 2 в/в, поляризующая смесь 400,0 в/в кап. №2).  ', 0, 'zarinka.zi@mail.ru', '2017-07-15 05:00:19'),
(22, 29, 4, 'дексаметазон 12мг вв №2, ондсетрон 8мг вв №2', 0, 'aiman_bulatova@mail.ru', '2017-07-20 10:56:18'),
(23, 22, 6, 'ондасетрон 8мг вв №2, дексаметазон 12мг вв №2', 0, 'aiman_bulatova@mail.ru', '2017-07-28 13:01:53'),
(24, 32, 1, 'гепатопротекторы - Урсозим по 2 капсулы внутрь 1 раз в день, длительно', 0, 'davran_a@mail.ru', '2017-07-29 16:42:05'),
(25, 32, 2, 'Гепатопротекторы - Капсулы Урсозим 2 внутрь 1 раз в день, длительно', 0, 'davran_a@mail.ru', '2017-07-29 16:48:39'),
(26, 33, 1, 'Гепатопротекторы - Урсосан по 2 капсулы внутрь 2 раза в день длительно', 0, 'davran_a@mail.ru', '2017-07-29 17:16:37'),
(27, 28, 3, 'Флунол 150 мг,атропин 0,5 п/к,дексаметазон 20 мг, ондасетрон 16 мг.', 0, 'Esengalieva.roza@mail.ru', '2017-08-03 10:25:57'),
(28, 35, 1, 'Атропин, дексаметазон, ондасетрон по схеме', 0, 'Esengalieva.roza@mail.ru', '2017-08-09 11:40:50'),
(29, 20, 5, 'Флунол 150 мг,атропин 0,5 п/к,дексаметазон 20 мг, ондасетрон 32 мг.', 0, 'Esengalieva.roza@mail.ru', '2017-08-10 05:08:51'),
(30, 29, 5, 'ондасетрон 8мг №2, дексаметазон 12мг №2', 0, 'aiman_bulatova@mail.ru', '2017-08-11 03:22:48'),
(31, 18, 4, 'Проводилась сопроводительная, дезинтоксикационная, антиэметическая  терапия (р-р натрия хлорида 400,0 + ондем 8мг + дексаметазон 8мг № 2 в/в, поляризующая смесь 400,0 в/в кап. №2).', 0, 'zarinka.zi@mail.ru', '2017-08-18 07:20:33'),
(32, 35, 2, 'Флунол 150 мг,атропин 0,5 п/к,дексаметазон 20 мг, ондасетрон 16 мг.', 0, 'Esengalieva.roza@mail.ru', '2017-08-22 14:19:09'),
(33, 20, 6, 'Флунол 150 мг,атропин 0,5 п/к,дексаметазон 20 мг, ондасетрон 32 мг.', 0, 'Esengalieva.roza@mail.ru', '2017-09-03 11:26:51'),
(34, 29, 6, 'ондасетрон 8мг вв №2, дексаметазон 12мг вв №2', 0, 'aiman_bulatova@mail.ru', '2017-09-04 06:08:41'),
(35, 29, 7, 'дексаметазон 12мг №2, ондасетрон 8мг №2', 0, 'aiman_bulatova@mail.ru', '2017-09-24 07:03:24'),
(36, 22, 7, 'онадсетрон 8мг№2, дексаметазон 12мг №2', 0, 'aiman_bulatova@mail.ru', '2017-09-24 10:11:34'),
(37, 18, 5, 'Проводилась сопроводительная, дезинтоксикационная, антиэметическая  терапия (р-р натрия хлорида 400,0 + ондем 8мг + дексаметазон 8мг № 2 в/в, поляризующая смесь 400,0 в/в кап. №2).   ', 0, 'zarinka.zi@mail.ru', '2017-09-27 01:23:04'),
(38, 22, 8, 'нет', 0, 'aiman_bulatova@mail.ru', '2017-09-27 10:19:33'),
(39, 36, 1, 'Гептрал 500 мг, ТАТ 600 - 1200 м', 0, 'nikki_93@bk.ru', '2017-10-10 09:18:04');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_dic_list`
--

CREATE TABLE `ovarian_dic_list` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT 'Идентификатор справочника',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Название справочника',
  `is_no_data` tinyint(1) NOT NULL COMMENT 'Допускается вариант ''Нет данных''  (1-да, 0-нет)',
  `rownum` int(11) NOT NULL COMMENT 'счетчик'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_dic_list`
--

INSERT INTO `ovarian_dic_list` (`id`, `name`, `is_no_data`, `rownum`) VALUES
('diag_cancer_clin_stage_id', 'Клиническая стадия заболевания', 1, 11),
('diag_cancer_tnm_stage_m_id', 'TNM стадия на момент постановки диагноза - M', 1, 10),
('diag_cancer_tnm_stage_n_id', 'TNM стадия на момент постановки диагноза - N', 1, 9),
('diag_cancer_tnm_stage_t_id', 'TNM стадия на момент постановки диагноза - T', 1, 8),
('education_id', 'Образование', 0, 6),
('hospital_id', 'Медицинский центр', 0, 3),
('nationality_id', 'Этническая принадлежность', 0, 4),
('no_data_id', 'Нет данных', 0, 13),
('place_living_id', 'Место жительства', 0, 5),
('query_status_id', 'Статус Query', 0, 17),
('social_economic_status_id', 'Социально-экономическое положение', 0, 7),
('therap_trab_continue_no_cause_id', 'Причина прекращения терапии трабектедином', 1, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_dic_val`
--

CREATE TABLE `ovarian_dic_val` (
  `id` int(11) NOT NULL,
  `dic_list_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'внеш ключ к dic_list',
  `value_id` int(11) NOT NULL COMMENT 'ключ',
  `value_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_dic_val`
--

INSERT INTO `ovarian_dic_val` (`id`, `dic_list_id`, `value_id`, `value_name`) VALUES
(1, 'hospital_id', 1, 'Сайт 001 - Казахский научно-исследовательский институт онкологии и радиологии (КазНИИОиР)'),
(2, 'hospital_id', 2, 'Сайт 002 - Городской онкологический диспансер г.Алматы'),
(3, 'hospital_id', 3, 'Сайт 003 - Южно-Казахстанский областной онкологический диспансер'),
(4, 'hospital_id', 4, 'Сайт 004 - Онкологический центр г. Астана'),
(5, 'hospital_id', 5, 'Сайт 005 - Областной онкологический диспансер ЗКО'),
(6, 'hospital_id', 6, 'Сайт 006 - Павлодарский областной онкологический диспансер'),
(7, 'hospital_id', 7, 'Сайт 007 - Восточно-Казахстанский областной онкологический диспансер'),
(8, 'hospital_id', 8, 'Сайт 008 - Областной онкологический диспансер СКО'),
(9, 'hospital_id', 12, 'Сайт 009 - Жамбылский областной онкологический диспансер'),
(10, 'hospital_id', 10, 'Сайт 010 - Кызылординский областной онкологический диспансер'),
(11, 'nationality_id', 1, 'казахи'),
(12, 'nationality_id', 2, 'русские'),
(13, 'nationality_id', 3, 'уйгуры'),
(14, 'nationality_id', 4, 'татары'),
(15, 'nationality_id', 5, 'корейцы '),
(16, 'nationality_id', 6, 'другие'),
(17, 'place_living_id', 1, 'город'),
(18, 'place_living_id', 2, 'село'),
(19, 'education_id', 1, 'Нет официального образования'),
(20, 'education_id', 2, 'Начальная школа'),
(21, 'education_id', 3, 'Средняя школа'),
(22, 'education_id', 4, 'Колледж/Университет/Высшее образование '),
(23, 'social_economic_status_id', 1, 'Низкое'),
(24, 'social_economic_status_id', 2, 'Среднее'),
(25, 'social_economic_status_id', 3, 'Высокое'),
(27, 'no_data_id', -1, 'нет данных'),
(28, 'diag_cancer_tnm_stage_t_id', 1, 'T0'),
(29, 'diag_cancer_tnm_stage_t_id', 2, 'Tis'),
(30, 'diag_cancer_tnm_stage_t_id', 3, 'T1'),
(31, 'diag_cancer_tnm_stage_t_id', 4, 'T2'),
(32, 'diag_cancer_tnm_stage_t_id', 5, 'T3'),
(33, 'diag_cancer_tnm_stage_t_id', 6, 'T4'),
(34, 'diag_cancer_tnm_stage_t_id', 7, 'Tx'),
(35, 'diag_cancer_tnm_stage_n_id', 1, 'N0'),
(36, 'diag_cancer_tnm_stage_n_id', 2, 'N1'),
(37, 'diag_cancer_tnm_stage_n_id', 3, 'N2'),
(38, 'diag_cancer_tnm_stage_n_id', 4, 'N3'),
(39, 'diag_cancer_tnm_stage_n_id', 5, 'Nx'),
(40, 'diag_cancer_tnm_stage_m_id', 1, 'M0'),
(41, 'diag_cancer_tnm_stage_m_id', 2, 'M1'),
(42, 'diag_cancer_tnm_stage_m_id', 3, 'Mx'),
(43, 'diag_cancer_clin_stage_id', 1, 'I'),
(44, 'diag_cancer_clin_stage_id', 2, 'II'),
(45, 'diag_cancer_clin_stage_id', 3, 'III'),
(46, 'diag_cancer_clin_stage_id', 4, 'IV'),
(50, 'therap_trab_continue_no_cause_id', 1, 'Пациент отказался от лечения '),
(51, 'therap_trab_continue_no_cause_id', 2, 'Лечение остановлено по причине переезда пациента'),
(52, 'therap_trab_continue_no_cause_id', 3, 'Лечение остановлено по решению исследователя'),
(53, 'query_status_id', 1, 'Открыт'),
(54, 'query_status_id', 2, 'Разрешено'),
(55, 'query_status_id', 3, 'Закрыто'),
(56, 'hospital_id', 9, 'Сайт 009-Алматинский региональный онкологический диспансер');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_general_data`
--

CREATE TABLE `ovarian_general_data` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL,
  `visit_date` date NOT NULL COMMENT 'Дата визита',
  `date_birth` date NOT NULL COMMENT 'Дата рождения',
  `weight_kg` double DEFAULT NULL COMMENT 'Масса тела в килограммах',
  `height_sm` double DEFAULT NULL COMMENT 'Рост в сантиметрах',
  `nationality_id` int(11) NOT NULL COMMENT 'Этническая принадлежность',
  `nationality_if_other` varchar(50) DEFAULT NULL COMMENT 'Этническая принадлежность (если нет в списке)',
  `place_living_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Место жительства',
  `education_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Образование',
  `social_economic_status_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Социально-экономическое положение',
  `diag_cancer_estab_date` date NOT NULL COMMENT 'Дата постановки диагноза рак яичников',
  `diag_cancer_tnm_stage_t_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'TNM стадия на момент постановки диагноза - T',
  `diag_cancer_tnm_stage_n_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'TNM стадия на момент постановки диагноза - N',
  `diag_cancer_tnm_stage_m_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'TNM стадия на момент постановки диагноза - M',
  `diag_cancer_clin_stage_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Клиническая стадия заболевания на момент постановки диагноза',
  `surgical_treat_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: да/нет',
  `surgical_treat_ecstir_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 1. Экстирпация матки с придатками',
  `surgical_treat_ecstir_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 1. Экстирпация матки с придатками дата',
  `surgical_treatment_gister01_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 2. Гистероскопия I',
  `surgical_treatment_gister01_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 2. Гистероскопия I дата',
  `surgical_treatment_gister02_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 3. Гистероскопия II',
  `surgical_treatment_gister02_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 3. Гистероскопия II дата',
  `surgical_treatment_gister03_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 4. Гистероскопия III',
  `surgical_treatment_gister03_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 4. Гистероскопия III дата',
  `surgical_treatment_diag_laparotomia_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 5. Диагностическая лапаротомия',
  `surgical_treatment_diag_laparotomia_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 5. Диагностическая лапаротомия дата',
  `surgical_treatment_diag_laparoscopia_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 6. Диагностическая лапароскопия',
  `surgical_treatment_diag_laparoscopia_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 6. Диагностическая лапароскопия дата',
  `surgical_treatment_explorat_laparotomia_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Хирургическое лечение: 7. Эксплоративная лапаротомия',
  `surgical_treatment_explorat_laparotomia_date` date DEFAULT NULL COMMENT 'Хирургическое лечение: 7. Эксплоративная лапаротомия дата',
  `chem_treat_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Неадъювантная/Адъювантная химиотерапия: да/нет',
  `chem_treat_antracyc_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Неадъювантная/Адъювантная химиотерапия: Антрациклины',
  `chem_treat_platina_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Неадъювантная/Адъювантная химиотерапия: Препараты платины',
  `chem_treat_taxans_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Неадъювантная/Адъювантная химиотерапия: Таксаны',
  `chem_treat_cyclophosph_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Неадъювантная/Адъювантная химиотерапия: Циклофосфамид',
  `chem_treat_other_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Неадъювантная/Адъювантная химиотерапия: Другая химиотерапия',
  `chem_treat_other_descr` varchar(100) DEFAULT NULL COMMENT 'Неадъювантная/Адъювантная химиотерапия: Если да, перечислите все препараты:',
  `progress_date` date NOT NULL COMMENT 'Дата регистрации прогрессирования заболевания',
  `progress_ca125_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, лаб.анализы: СА 125 да/нет',
  `progress_ca125` double(15,2) DEFAULT NULL COMMENT 'Прогрессирование заболевания, лаб.анализы: СА 125 Ед/мл',
  `progress_instr_mrt_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ да/нет',
  `progress_instr_mrt_date` date DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ дата',
  `progress_instr_mrt_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ норма/патология',
  `progress_instr_mrt_descr` varchar(255) DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ Заключение',
  `progress_instr_us_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП да/нет',
  `progress_instr_us_date` date DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП дата',
  `progress_instr_us_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП норма/патология',
  `progress_instr_us_descr` varchar(255) DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП Заключение',
  `progress_instr_kt_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: КТ ОГК да/нет',
  `progress_instr_kt_date` date DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: КТ ОГК дата',
  `progress_instr_kt_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: КТ ОГК норма/патология',
  `progress_instr_kt_descr` varchar(255) DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: КТ ОГК Заключение',
  `progress_instr_ekg_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: ЭКГ да/нет',
  `progress_instr_ekg_date` date DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: ЭКГ дата',
  `progress_instr_ekg_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Прогрессирование заболевания, Инструментальные исследования: ЭКГ норма/патология',
  `progress_instr_ekg_descr` varchar(255) DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: ЭКГ Заключение',
  `recidive_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Рецидив заболевания: да/нет',
  `metastases_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: да/нет',
  `metastases_lung_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: лёгкие',
  `metastases_lung_date` date DEFAULT NULL COMMENT 'Метастазы: лёгкие дата',
  `metastases_hepat_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: Печень',
  `metastases_hepat_date` date DEFAULT NULL COMMENT 'Метастазы: Печень дата',
  `metastases_osteo_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: Кости',
  `metastases_osteo_date` date DEFAULT NULL COMMENT 'Метастазы: Кости дата',
  `metastases_renal_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: Почки',
  `metastases_renal_date` date DEFAULT NULL COMMENT 'Метастазы: Почки дата',
  `metastases_lymph_nodes_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: Л/узлы',
  `metastases_lymph_nodes_date` date DEFAULT NULL COMMENT 'Метастазы: Л/узлы дата',
  `metastases_plevra_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: Плевра',
  `metastases_plevra_date` date DEFAULT NULL COMMENT 'Метастазы: Плевра дата',
  `metastases_other_descr` varchar(100) DEFAULT NULL COMMENT 'Метастазы: Иное',
  `metastases_surgical_treat_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Метастазы: Было проведено хирургическое вмешательство',
  `metastases_surgical_treat_date` date DEFAULT NULL COMMENT 'Метастазы: Дата проведения хирургического вмешательства',
  `metastases_surgical_treat_descr` varchar(100) DEFAULT NULL COMMENT 'Метастазы: Объем оперативного вмешательства',
  `chem_1st_line_treat_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: да/нет',
  `chem_1st_karboplatin_yes_no_id` int(11) DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Карбоплатин (да, нет)',
  `chem_1st_cisplatin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Цисплатин (да, нет)',
  `chem_1st_ciklofosfan_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Циклофосфан (да, нет)',
  `chem_1st_paklitaksel_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Паклитаксел (да, нет)',
  `chem_1st_doksorubicin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Доксорубицин (да, нет)',
  `chem_1st_bevacizumab_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Бевацизумаб (да, нет)',
  `chem_1st_topotekan_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Топотекан (да, нет)',
  `chem_1st_gemcitabin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Гемцитабин (да, нет)',
  `chem_1st_vinorelbin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Винорельбин (да, нет)',
  `chem_1st_irinotekan_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Иринотекан (да, нет)',
  `chem_1st_etopozid_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Этопозид (да, нет)',
  `chem_1st_epirubicin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Эпирубицин (да, нет)',
  `chem_1st_docetaxel_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Доцетаксел (да, нет)',
  `chem_1st_oksaliplatin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Оксалиплатин (да, нет)',
  `chem_1st_trabektidin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Трабектедин  (да, нет)',
  `chem_1st_other_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '1-ая линия ХТ рецидив. рака яичников: Другое (да, нет)',
  `chem_1st_other_descr` varchar(100) DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Если да, просьба указать торговое название препарата',
  `chem_1st_date_start` date DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Дата начала терапии',
  `chem_1st_date_finish` date DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Дата окончания терапии',
  `chem_1st_course_number` int(11) DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Число курсов',
  `chem_1st_concomitant_therapy_descr` varchar(100) DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия',
  `chem_2st_trabectedin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Трабектедин (да, нет)',
  `chem_2st_trabectedin_dose` double(15,2) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Трабектедин, доза',
  `chem_2st_pld_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД (да, нет)',
  `chem_2st_pld_dose` double(15,2) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД, доза',
  `chem_2st_doxopeg_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг (да, нет)',
  `chem_2st_doxopeg_dose` double(15,2) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг, доза',
  `chem_2st_kelix_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс  (да, нет)',
  `chem_2st_kelix_dose` double(15,2) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс , доза',
  `chem_2st_doksorubicin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксорубицин (да, нет)',
  `chem_2st_doksorubicin_dose` double(15,2) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксорубицин , доза',
  `chem_2st_other_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное (да, нет)',
  `chem_2st_other_dose` double(15,2) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное, доза',
  `chem_2st_concomitant_therapy_descr` varchar(100) DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия',
  `undesirable_event_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Нежелательное явление (да, нет) - Отмечал ли пациент какие-либо нежелательные явления при применении химиотерапии Трабектедин в комбинации с ПЛД? Если да, просьба заполнить бланк НЯ',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Визит 1 – визит включения (демографические, соц-экономические данные, анамнез заболевания и т.д.)';

--
-- Дамп данных таблицы `ovarian_general_data`
--

INSERT INTO `ovarian_general_data` (`id`, `patient_id`, `visit_id`, `visit_date`, `date_birth`, `weight_kg`, `height_sm`, `nationality_id`, `nationality_if_other`, `place_living_id`, `education_id`, `social_economic_status_id`, `diag_cancer_estab_date`, `diag_cancer_tnm_stage_t_id`, `diag_cancer_tnm_stage_n_id`, `diag_cancer_tnm_stage_m_id`, `diag_cancer_clin_stage_id`, `surgical_treat_yes_no_id`, `surgical_treat_ecstir_yes_no_id`, `surgical_treat_ecstir_date`, `surgical_treatment_gister01_yes_no_id`, `surgical_treatment_gister01_date`, `surgical_treatment_gister02_yes_no_id`, `surgical_treatment_gister02_date`, `surgical_treatment_gister03_yes_no_id`, `surgical_treatment_gister03_date`, `surgical_treatment_diag_laparotomia_yes_no_id`, `surgical_treatment_diag_laparotomia_date`, `surgical_treatment_diag_laparoscopia_yes_no_id`, `surgical_treatment_diag_laparoscopia_date`, `surgical_treatment_explorat_laparotomia_yes_no_id`, `surgical_treatment_explorat_laparotomia_date`, `chem_treat_yes_no_id`, `chem_treat_antracyc_yes_no_id`, `chem_treat_platina_yes_no_id`, `chem_treat_taxans_yes_no_id`, `chem_treat_cyclophosph_yes_no_id`, `chem_treat_other_yes_no_id`, `chem_treat_other_descr`, `progress_date`, `progress_ca125_yes_no_id`, `progress_ca125`, `progress_instr_mrt_yes_no_id`, `progress_instr_mrt_date`, `progress_instr_mrt_norm_yes_no_id`, `progress_instr_mrt_descr`, `progress_instr_us_yes_no_id`, `progress_instr_us_date`, `progress_instr_us_norm_yes_no_id`, `progress_instr_us_descr`, `progress_instr_kt_yes_no_id`, `progress_instr_kt_date`, `progress_instr_kt_norm_yes_no_id`, `progress_instr_kt_descr`, `progress_instr_ekg_yes_no_id`, `progress_instr_ekg_date`, `progress_instr_ekg_norm_yes_no_id`, `progress_instr_ekg_descr`, `recidive_yes_no_id`, `metastases_yes_no_id`, `metastases_lung_yes_no_id`, `metastases_lung_date`, `metastases_hepat_yes_no_id`, `metastases_hepat_date`, `metastases_osteo_yes_no_id`, `metastases_osteo_date`, `metastases_renal_yes_no_id`, `metastases_renal_date`, `metastases_lymph_nodes_yes_no_id`, `metastases_lymph_nodes_date`, `metastases_plevra_yes_no_id`, `metastases_plevra_date`, `metastases_other_descr`, `metastases_surgical_treat_yes_no_id`, `metastases_surgical_treat_date`, `metastases_surgical_treat_descr`, `chem_1st_line_treat_yes_no_id`, `chem_1st_karboplatin_yes_no_id`, `chem_1st_cisplatin_yes_no_id`, `chem_1st_ciklofosfan_yes_no_id`, `chem_1st_paklitaksel_yes_no_id`, `chem_1st_doksorubicin_yes_no_id`, `chem_1st_bevacizumab_yes_no_id`, `chem_1st_topotekan_yes_no_id`, `chem_1st_gemcitabin_yes_no_id`, `chem_1st_vinorelbin_yes_no_id`, `chem_1st_irinotekan_yes_no_id`, `chem_1st_etopozid_yes_no_id`, `chem_1st_epirubicin_yes_no_id`, `chem_1st_docetaxel_yes_no_id`, `chem_1st_oksaliplatin_yes_no_id`, `chem_1st_trabektidin_yes_no_id`, `chem_1st_other_yes_no_id`, `chem_1st_other_descr`, `chem_1st_date_start`, `chem_1st_date_finish`, `chem_1st_course_number`, `chem_1st_concomitant_therapy_descr`, `chem_2st_trabectedin_yes_no_id`, `chem_2st_trabectedin_dose`, `chem_2st_pld_yes_no_id`, `chem_2st_pld_dose`, `chem_2st_doxopeg_yes_no_id`, `chem_2st_doxopeg_dose`, `chem_2st_kelix_yes_no_id`, `chem_2st_kelix_dose`, `chem_2st_doksorubicin_yes_no_id`, `chem_2st_doksorubicin_dose`, `chem_2st_other_yes_no_id`, `chem_2st_other_dose`, `chem_2st_concomitant_therapy_descr`, `undesirable_event_yes_no_id`, `checked`, `user`, `insert_date`) VALUES
(3, 22, 1, '2017-03-31', '1965-07-16', 82, 159, 2, NULL, 2, 4, 2, '2014-04-07', 5, 2, 1, 3, 1, 1, '2014-09-17', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 0, 1, 1, 0, 0, '4 нео курса паклитаксел+платина, 4 курса п/о паклитаксел+платина', '2016-03-16', 1, 292.00, 1, '2016-04-04', 0, 'наличие жидкости вдоль листков брюшины, в дуглосовом пространстве, контур брюшины нечеткий с множественными узлами, заключение-канцероматоз брюшины', 1, '2017-01-25', 0, 'Объемное образование малого таза (4,85 х 2,93 см), асцит', 0, NULL, -1, NULL, 1, '2017-03-29', 1, NULL, 1, 0, -1, NULL, -1, NULL, -1, NULL, -1, NULL, -1, NULL, -1, NULL, NULL, -1, NULL, NULL, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'цисплатин, виздоксо', '2016-04-13', '2016-08-12', 6, 'Ондасетрон, гепатопротекторы', 1, 2.00, 0, NULL, 0, NULL, 1, 60.00, 0, NULL, 0, NULL, 'гепатопротекторы', 0, 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:33:11'),
(7, 20, 1, '2017-03-28', '1961-08-16', 85, 162, 6, NULL, 1, 4, 2, '2014-12-05', 4, 1, 1, 3, 1, 1, '2014-11-18', 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, 1, 1, 0, 0, 0, NULL, '2017-02-09', 1, 2429.00, 1, '2017-02-09', 0, 'Мтс поражение большого сальника.Очаговое поражение левой повздошной  кости .МР малого таза  закл: мтс брюшины,небольшое количество жидкости в полости таза.', 1, '2017-01-31', 0, 'Диффузные изменения паренхимы печени, поджелудочной железы.Хрон.холецистит. Мтс в печень? Хр.холецистит.Уплотнение члс с обеих сторон.Состояние после эк4стирпации матки с придатками по поводу заболевания яичников ( 2014г). Убедительных данных за рецидив н', 0, NULL, -1, NULL, 1, '2017-03-24', 1, 'синусовый ритм с ЧСС 72 в 1 мин. Горизонтальное положение ЭОС. Гипертрофия левого желудочка', 1, 1, 0, NULL, 1, '2015-12-30', 0, NULL, 0, NULL, 1, '2017-02-09', 0, NULL, NULL, 0, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 'Эндоксан', '2016-01-05', '2016-05-17', 5, NULL, 1, 2.00, 0, NULL, 1, 40.00, 0, NULL, 0, NULL, 0, NULL, 'атропин, дексаметазон,флунол', 0, 0, 'Esengalieva.roza@mail.ru', '2017-04-11 10:27:03'),
(8, 28, 1, '2017-06-05', '1977-02-06', 98, 174, 2, NULL, 1, 4, 2, '2014-04-09', 4, 5, 2, 3, 1, 1, '2017-01-24', 0, NULL, 0, NULL, 0, NULL, 1, '2016-07-05', 0, NULL, 0, NULL, 1, 0, 1, 1, 1, 0, NULL, '2017-05-04', 1, 22.40, 0, NULL, -1, NULL, 1, '2017-05-04', 1, 'Диффузные изменения паренхимы печени, поджелудочной железы. хронический холецистит. Конкременты обеих почек.Состояние после экстирпации матки с придатками по поводу заболевания яичников. Данные за mts в клетчатке малого таза. (выше культи влагалишща образ', 0, NULL, -1, NULL, 1, '2017-05-04', 1, 'Синусовый ритм 68 ударов в 1 мин. Горизонтальное положение ЭОС. Гипертрофия левого желудочка.', 1, 0, -1, NULL, -1, NULL, -1, NULL, -1, NULL, -1, NULL, -1, NULL, NULL, -1, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, '2016-08-08', '2016-12-06', 6, NULL, 1, 2.00, -1, NULL, 1, 40.00, -1, NULL, -1, NULL, -1, NULL, NULL, 0, 0, 'Esengalieva.roza@mail.ru', '2017-05-16 09:33:59'),
(9, 29, 1, '2017-06-05', '1957-03-04', 84, 167, 2, NULL, 1, 4, 2, '2012-06-08', 4, 5, 1, 2, 1, 1, '2012-05-31', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 0, 1, 1, 0, 0, 'кемокарб, пакситаксел', '2017-05-05', 1, 237.60, 1, '2017-05-05', 0, 'признаки рецидива заболевания, кистозно-солидное образование в полости малого таза 46х31х35с инвазией культи влагалища, прямой и сигмовидной кишки, канцероматоз брюшины с множественными вторичными узловыми образованиямиразмерами 3х3мм до 32х27мм в полости', 1, '2017-04-04', 0, 'образование в малом тазу справа 49х36мм, в паховой области справа обр-е 22х9мм', 0, NULL, -1, NULL, 1, '2017-05-15', 1, 'Ритм синусовый, ЧСС 84 в мин, горизонт ЭОС', 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, '2017-05-05', 0, NULL, NULL, 0, NULL, NULL, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'паклитаксел, цислатин', '2016-03-06', '2016-09-28', 8, 'дексаметазон, ондасетрон, апрепитат', 1, 2.00, 0, NULL, 0, NULL, 1, 60.00, 0, NULL, 0, NULL, 'дексаметазон, ондасетрон, гептрал', 0, 0, 'aiman_bulatova@mail.ru', '2017-06-05 04:07:47'),
(10, 30, 1, '2017-04-11', '1959-04-01', 65, 160, 1, NULL, 2, 3, 2, '2009-09-23', 5, 5, 1, 3, 1, 1, '2009-09-17', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, -1, -1, -1, -1, -1, NULL, '2014-06-03', 1, 197.20, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2014-06-03', -1, 'КТ органов брюшной полости от 03.06.14.г- Заключение: КТ признаки  диффузных изменении  паренхиме печени, гепатомегалия , гепатит.  Умеренная  спленомегалия , очаговое образование  паренхиме селезенки  ( депозиты).  Хронический 2\\х сторонний  пиелонефрит ', 0, NULL, -1, NULL, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 'очаговое образование  паренхиме селезенки  ( депозиты).', 0, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Карбоплати, циклофосфамид', '2014-06-10', '2014-10-10', 4, 'нет', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, NULL, 'нет', 0, 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:19:59'),
(11, 31, 1, '2017-05-12', '1952-11-28', 93, 161, 1, NULL, 1, 3, 2, '2013-10-31', 5, 1, 1, 3, 1, 0, NULL, 0, NULL, 0, NULL, 1, '2013-10-24', 0, NULL, 0, NULL, 0, NULL, 1, 0, 1, 1, 0, 0, 'Цисплатин, Паклитаскел', '2017-04-07', 1, 429.00, 1, '2017-04-07', -1, 'ПЭТ- КТ от 07.04.2017. картина Мтс в брюшину, капсулы печени, селезенки, лимфоузлов ворот печени. Данных за рецидив в операционной зоне, региональное мтс поражения не выявлено.', 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, 1, 0, NULL, 1, '2017-04-07', 0, NULL, 0, NULL, 1, '2017-04-07', 0, NULL, 'Селезенка', 0, NULL, NULL, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'цисплатин, таксол', '2016-06-22', '2016-10-19', 6, 'ондасетрон, квамател, димедрол, дексаметазон', 1, 2.00, 1, 60.00, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 'дексаметазон, ондасетрон', 0, 0, 'simba83-83@mail.ru', '2017-06-16 09:37:11'),
(12, 18, 1, '2017-06-01', '1970-03-20', 77, 165, 1, NULL, 2, 4, 2, '2012-01-05', 5, 2, 1, 3, 1, 0, NULL, 1, '2012-01-05', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, '2016-07-13', 0, -1, -1, -1, -1, -1, NULL, '2017-04-16', 0, NULL, 0, NULL, 0, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2017-05-22', 1, 'Ритм синусовый правильный. ЧСС 75уд. в мин. ЭОС горизонтальная. Признаки гипертрофии ЛЖ. Диффузные изменения миокарда.', 1, 1, 0, NULL, 1, '2017-04-16', 1, '2017-04-22', 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, '2016-08-15', '2016-11-30', 6, NULL, 1, 2.00, 0, NULL, 0, NULL, 1, 20.00, 0, NULL, 0, NULL, 'р-р натрия хлорида 400,0 + ондем 8мг + дексаметазон 8мг №2 в/в,  поляризующая смесь 400,0 №2 в/в кап', 0, 0, 'zarinka.zi@mail.ru', '2017-06-21 07:23:53'),
(13, 32, 1, '2017-05-23', '1955-10-07', 94, 170, 1, NULL, 1, 4, 2, '2013-10-01', 5, 2, 1, 3, 1, 1, '2013-09-25', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 0, 1, 0, 1, 0, 'Цисплатин + Циклофосфамид', '2015-04-13', 1, 832.00, 0, NULL, -1, NULL, 1, '2015-04-21', 0, 'Умеренная гепатоспленомегалия. Диффузные изменения в печени. Хр. холецистит. Деформация ЧЛС обеих почек.', 1, '2015-04-21', 0, 'хр. бронхит. Лимфаденопатия л/узлов парааортальной зоны (Мтс).', 0, '2013-04-21', 1, 'Синусовый ритм. ЧСС 78 в 1 мин. Отклонение ЭОС влево. Признаки гипертрофии ЛЖ.', 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Карбоплатин + Паклитаксел + Авастин', '2015-04-28', '2015-08-28', 6, 'гепатопротекторы', 1, 2.00, 0, NULL, 1, 60.00, 0, NULL, 0, NULL, 0, NULL, 'гепатопротекторы', 0, 0, 'davran_a@mail.ru', '2017-07-29 16:33:55'),
(14, 33, 1, '2017-05-26', '1960-05-13', 75, 164, 1, NULL, 1, 4, 2, '2016-04-08', 5, 2, 2, 4, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, '2016-04-01', 0, NULL, 0, NULL, 1, 0, 1, 1, 0, 0, 'Паклитаксел + Цисплатин', '2017-04-07', 1, 2575.00, 1, '2017-04-24', 0, 'Объемное образование задней стенки матки. Асцит.', 0, NULL, -1, NULL, 1, '2017-04-24', 0, 'хр. бронхит', 0, NULL, -1, NULL, 1, 1, 0, NULL, 1, '2017-04-24', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, NULL, NULL, NULL, NULL, NULL, 1, 2.00, 0, NULL, 1, 60.00, 0, NULL, 0, NULL, 0, NULL, NULL, 0, 0, 'davran_a@mail.ru', '2017-07-29 17:06:43'),
(15, 35, 1, '2017-08-07', '1966-08-01', 53, 153, 1, NULL, 2, 1, 1, '2016-05-19', 5, 1, 1, 3, 1, 1, '2016-05-25', 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, 1, 1, 0, 1, 0, NULL, '2017-03-13', 1, 444.30, 0, NULL, -1, NULL, 1, '2017-06-05', 0, 'МТС в забрюшинные лимфоузлы.Диффузные изменения паренхимы печени,поджелудочной железы.Хронический холецистит.Уплотнение члс с обеих сторон.', 0, NULL, -1, NULL, 1, NULL, 1, 'Ритм синусовый с ЧСС78в/м.Норм.расп.электр ОСС.Умеренная гипертрофия л/ж.', 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, '2017-03-13', 0, NULL, 'Мтс в клечатке малого таза.', 0, NULL, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Эндоксан', '2016-06-22', '2016-11-22', 5, NULL, -1, NULL, -1, NULL, 1, 40.00, -1, NULL, -1, NULL, -1, NULL, 'атропин, дексаметазон,флунол', 0, 0, 'Esengalieva.roza@mail.ru', '2017-08-09 11:20:03'),
(16, 36, 1, '2017-10-10', '1960-02-22', 52, 156, 1, NULL, 1, 4, 2, '2011-09-09', 5, 5, 1, 3, 1, 1, '2012-01-17', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 0, 1, 1, 1, 0, 'Циклофосфан, карбоплатин, цисплатин,паклитаксел', '2017-04-12', 1, 437.04, 1, '2017-04-12', 0, 'Заключение КТ ОБП, ОМТ с внутривенным контрастом:КТ картина перитонеального мтс пораженияпечени,мтс поражения забрюшинных лмфоузлов с признаками конгломератов, ассиметрического распрутолщения стенок слепой кишки с остранением на дистальные отделы подвздош', 0, '2017-04-12', 0, 'Заключение КТ ОБП,ОМТ с внутривенным контрастом:КТ картина перитонеального мтс поражения печени,мтс поражения забрюшинных лмфоузлов с признаками конгломератов, ассиметрического распрутолщения стенок слепой кишки с остранением на дистальные отделы подвздош', 1, '2017-07-13', 0, 'КТ признаки хр бронихта, бронхоэктаза бронхов и обеих легких, лимафоаденопатия  (susp.mits)лимфоузлов надключичной области слева и мягких тканей шеи головы', 1, '2017-09-29', 1, 'Ритм синусовый, тахикардия, ЧСС 110 в мин, нормальное положение ЭОС', 0, 1, 0, NULL, 1, '2017-04-12', 0, NULL, 0, NULL, 1, '2017-04-12', 0, NULL, 'забрюшинные и тазовые лимфоузлы', 0, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Кемокарб, Циклофосфан', '2013-03-26', '2013-09-16', 6, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 1, 0, 'nikki_93@bk.ru', '2017-10-10 07:10:18');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_inclusion`
--

CREATE TABLE `ovarian_inclusion` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `age_18_and_more_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Возраст ≥18 да/нет',
  `histol_confirmed_cr_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Гистологический подтвержденный эпителиальный рак яичника да/нет',
  `ecog01_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: ECOG 0-1 да/нет',
  `recurrent_plat_sensit_cancer_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Пациенты с рецидивирующим платиночувствительным раком яичника (Бесплатиновый интервал от 6 до 12 месяцев)\r\n да/нет',
  `treatment_trabect_after_doxorub_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Пациенты, в процессе лечения трабектедином, получившие 1-2 циклов лечения препаратом трабектедин по поводу рецидива платиночувствительного рака яичника, в дозировке 1,1 мг/м2 в виде 3-часовой внутривенной инфузии после введения пегилированного липосомального доксорубицина в дозировке 30 мг/м2 в виде 60-минутной внутривенной инфузии каждые 3 недели да/нет',
  `received_no_more_one_line_plat_chem_regimes_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Пациенты, получившие не более 1 линии химиотерапии платиносодержащими режимами да/нет',
  `doct_decision_trabectedin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Решение врача о терапии пациента трабектедином  да/нет',
  `signed_consent_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии включения: Подписанное информированное согласие перед включением в исследование  да/нет',
  `age_18_less_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Возраст до 18 лет  да/нет',
  `received_more_two_line_plat_chem_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты, получившие лечение более 2 линии химиотерапии  да/нет',
  `platinum_refractory_ov_cr_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты с платино-рефрактерным типом рака яичника (прогрессирование на фоне химиотерапии 1-й линии) да/нет',
  `platinum_resistant_ov_cr_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты с платино-резистентным типом рака яичника: БПИ <6 месяцев (прогрессирование в течение шести месяцев после первой линии химиотерапии на основе платины) да/нет',
  `refusal_central_venous_catheter_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Отказ пациента от центрального венозного катетера да/нет',
  `impaired_hepatic_function_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты с нарушением функции печени (пациентов с повышенным уровнем билирубина) да/нет',
  `impaired_renal_function_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты с нарушением функции почек (клиренс креатинина >1.5 мг/дл) да/нет',
  `impaired_hematological_parameters_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты с нарушениями гематологических показателей (нейтропенией< 1500/мкл и тромбоцитопенией < 100000/мкл) да/нет',
  `impaired_cardiovascular_function_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Пациенты с серьезными нарушениями ССС (у пациентов с заболеваниями сердца и со снижением фракции левожелудочкового выброса) да/нет',
  `kaposi_sarcoma_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Саркома Капоши у пациентов со СПИДом, которые могут эффективно лечиться локальной терапией или системной терапией альфа-интерфероном  да/нет',
  `pregnancy_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Критерии исключения: Беременность/лактация да/нет',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Критерии включения/исключения';

--
-- Дамп данных таблицы `ovarian_inclusion`
--

INSERT INTO `ovarian_inclusion` (`id`, `patient_id`, `visit_id`, `age_18_and_more_yes_no_id`, `histol_confirmed_cr_yes_no_id`, `ecog01_yes_no_id`, `recurrent_plat_sensit_cancer_yes_no_id`, `treatment_trabect_after_doxorub_yes_no_id`, `received_no_more_one_line_plat_chem_regimes_yes_no_id`, `doct_decision_trabectedin_yes_no_id`, `signed_consent_yes_no_id`, `age_18_less_yes_no_id`, `received_more_two_line_plat_chem_yes_no_id`, `platinum_refractory_ov_cr_yes_no_id`, `platinum_resistant_ov_cr_yes_no_id`, `refusal_central_venous_catheter_yes_no_id`, `impaired_hepatic_function_yes_no_id`, `impaired_renal_function_yes_no_id`, `impaired_hematological_parameters_yes_no_id`, `impaired_cardiovascular_function_yes_no_id`, `kaposi_sarcoma_yes_no_id`, `pregnancy_yes_no_id`, `checked`, `user`, `insert_date`) VALUES
(17, 20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 'Esengalieva.roza@mail.ru', '2017-03-28 11:46:04'),
(18, 21, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'test071@test.kz', '2017-03-29 09:19:26'),
(19, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aiman_bulatova@mail.ru', '2017-03-31 09:26:16'),
(24, 28, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Esengalieva.roza@mail.ru', '2017-05-16 08:54:06'),
(25, 29, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aiman_bulatova@mail.ru', '2017-06-05 03:45:05'),
(26, 30, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:01:56'),
(27, 31, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simba83-83@mail.ru', '2017-06-16 09:20:00'),
(28, 18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'zarinka.zi@mail.ru', '2017-06-21 03:11:55'),
(29, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'davran_a@mail.ru', '2017-07-29 15:33:50'),
(30, 33, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'davran_a@mail.ru', '2017-07-29 16:52:27'),
(31, 34, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'davran_a@mail.ru', '2017-07-29 17:17:29'),
(32, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Esengalieva.roza@mail.ru', '2017-08-03 10:40:04'),
(33, 36, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'nikki_93@bk.ru', '2017-10-10 05:52:44');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_instrument`
--

CREATE TABLE `ovarian_instrument` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `instr_mrt_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: МРТ ОМТ да/нет',
  `instr_mrt_date` date DEFAULT NULL COMMENT 'Инструментальные исследования: МРТ ОМТ дата',
  `instr_mrt_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: МРТ ОМТ норма/патология',
  `instr_mrt_descr` varchar(255) DEFAULT NULL COMMENT 'Инструментальные исследования: МРТ ОМТ Заключение',
  `instr_us_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: УЗИ ОБП да/нет',
  `instr_us_date` date DEFAULT NULL COMMENT 'Инструментальные исследования: УЗИ ОБП дата',
  `instr_us_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: УЗИ ОБП норма/патология',
  `instr_us_descr` varchar(255) DEFAULT NULL COMMENT 'Инструментальные исследования: УЗИ ОБП Заключение',
  `instr_kt_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: КТ ОГК да/нет',
  `instr_kt_date` date DEFAULT NULL COMMENT 'Инструментальные исследования: КТ ОГК дата',
  `instr_kt_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: КТ ОГК норма/патология',
  `instr_kt_descr` varchar(255) DEFAULT NULL COMMENT 'Инструментальные исследования: КТ ОГК Заключение',
  `instr_ekg_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: ЭКГ да/нет',
  `instr_ekg_date` date DEFAULT NULL COMMENT 'Инструментальные исследования: ЭКГ дата',
  `instr_ekg_norm_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Инструментальные исследования: ЭКГ норма/патология',
  `instr_ekg_descr` varchar(255) DEFAULT NULL COMMENT 'Инструментальные исследования: ЭКГ Заключение',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Инструментальные исследования';

--
-- Дамп данных таблицы `ovarian_instrument`
--

INSERT INTO `ovarian_instrument` (`id`, `patient_id`, `visit_id`, `instr_mrt_yes_no_id`, `instr_mrt_date`, `instr_mrt_norm_yes_no_id`, `instr_mrt_descr`, `instr_us_yes_no_id`, `instr_us_date`, `instr_us_norm_yes_no_id`, `instr_us_descr`, `instr_kt_yes_no_id`, `instr_kt_date`, `instr_kt_norm_yes_no_id`, `instr_kt_descr`, `instr_ekg_yes_no_id`, `instr_ekg_date`, `instr_ekg_norm_yes_no_id`, `instr_ekg_descr`, `checked`, `user`, `insert_date`) VALUES
(2, 20, 1, 1, '2017-02-09', 0, 'Мтс поражение брюшины. Очаговое поражение левой подвздошной кости.', 1, '2017-01-31', 0, 'СостоНие после экстирпации матки.Мтс в брюшину?. Контроль через 3 месяца.', 1, '2017-02-24', 1, 'Патологических образований в грудной клетке не обнаружено', 1, '2017-02-24', 1, 'Синусовый ритм с ЧСС 74 в 1 мин. Гипертрофия левого желудочка', 0, 'Esengalieva.roza@mail.ru', '2017-03-28 12:11:02'),
(3, 22, 1, 1, '2017-02-15', 0, 'образование малого таза 42,4х28х26мм  с вовлечением толстой кишки, мтс в париетальную брюшину', 1, '2017-01-25', 0, 'асцит, в малом тазу образвоание 4,85х2,93см', 0, NULL, -1, NULL, 1, '2017-02-24', 1, 'норма', 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:40:39'),
(5, 21, 1, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, 'sanzhar73@mail.ru', '2017-05-16 05:23:17'),
(6, 22, 4, 0, NULL, -1, NULL, 1, '2017-06-05', 0, 'в малом тазу цетнтрально определяется гипоэхогенное образование 6,61х4,24см с признаками инфильтративного роста', 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, 'aiman_bulatova@mail.ru', '2017-06-02 06:38:04'),
(7, 29, 1, 1, '2017-05-05', 0, 'кистозно-солидное образование в полости таза с инвазей кульи влагилища 46х31х35мм, с инвазией прямой и сигмовидной кишки, канцероматоз брюшины с множественными вторичными узловыми образвоаниями в полсоти малого таза и нижнем этаже брюшной полсоти от 3х3мм', 1, '2017-04-04', 1, 'печень, желчный, подж.ж без особенностей', 0, NULL, -1, NULL, 1, '2017-05-15', 1, 'ритм синусовый, б/о', 0, 'aiman_bulatova@mail.ru', '2017-06-05 04:16:05'),
(8, 30, 1, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2017-03-14', 0, 'КТ органов брюшной полости от 14.03.2017.г Заключение:  КТ картина диффузных изменении  паренхиме печени , умеренная гепатомегалия . Зона гиподенсной  плотности  без четких контуров , 4 го сегмента печени  ( депозит) Умеренная спленомегалия , очаговое обр', 1, '2017-03-14', 1, 'Без патологии', 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:22:13'),
(9, 31, 1, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, 'simba83-83@mail.ru', '2017-06-16 09:38:16'),
(10, 18, 1, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2017-05-22', 1, 'Ритм синусовый правильный. ЧСС 75уд. в мин. ЭОС горизонтальная. Признаки гипертрофии ЛЖ. Диффузные изменения миокарда.', 0, 'zarinka.zi@mail.ru', '2017-06-21 07:30:02'),
(11, 20, 4, 1, '2017-06-13', 1, 'МРТ признаков метастатического поражения не определяется. Состояние после экстирпации матки и придатков.', 1, '2017-06-13', 1, 'МРТ ОБП: Картина больше соответсвует хроническому холецистопанкреатиту', 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:21:44'),
(12, 28, 1, 0, NULL, -1, NULL, 1, '2017-05-04', 0, 'Диффузные изменения паренхимы печени, поджелудочной железы. Хронический холецистит. Конкременты обеих почек. Состояние после эктирпации матки с придатками по поводу заболевания яичников ( 2016г). Данные за mts в клетчатке малого таза.', 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:49:35'),
(13, 29, 4, 1, '2017-07-17', 0, 'МРТ 17.07.17 ОБП-мр-признаки содержимого застойного хар-ра в полости умеренно-диформированного желчного пузыря, очагового образования с структкре 4-го  сегмента печени кистозного характера, предположительно солитарная киста, объемного образвоания поддиафр', 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2017-07-19', 1, 'чсс 65, ритм синусовый, гориз.ось', 0, 'aiman_bulatova@mail.ru', '2017-07-20 10:31:14'),
(14, 32, 1, 0, NULL, -1, NULL, 1, '2017-05-20', 0, 'Умеренная гепато-спленомегалия, Хр. холецистит. Деформация ЧЛС с обеих сторон.', 1, '2017-03-13', 0, 'хр. бронхит.', 1, '2017-05-20', 1, 'Синусовый ритм с ЧСС 78 в 1 мин. Нормальное положение ЭОС.Признаки гипертрофии ЛЖ.', 0, 'davran_a@mail.ru', '2017-07-29 16:18:39'),
(15, 33, 1, 1, '2017-04-24', 0, 'объемное образование в задней стенке матки. Асцит.', 0, NULL, -1, NULL, 1, '2017-04-24', 0, 'хр. бронхит', 0, NULL, -1, NULL, 0, 'davran_a@mail.ru', '2017-07-29 17:08:05'),
(16, 35, 1, 0, NULL, -1, NULL, 1, '2017-06-05', 0, 'Мтс забрюшинные лимфоузлы.Диффузные изменения паренхимы печени,поджелудочной железы.Хронический холецистит.Уплотнение члс с обеих сторон.', 0, NULL, -1, NULL, 1, '2017-06-27', 1, 'Синусовый ритм с ЧСС 78 в 1 мин. Умеренная гипертрофия левого желудочка', 0, 'Esengalieva.roza@mail.ru', '2017-08-09 11:26:12'),
(17, 18, 4, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2017-07-12', 1, 'Ритм синусовый правильный. ЧСС 89уд. в мин. ЭОС горизонтальная. Признаки гипертрофии ЛЖ. Диффузные изменения миокарда.', 0, 'zarinka.zi@mail.ru', '2017-08-18 07:12:15'),
(18, 29, 7, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 0, NULL, -1, NULL, 1, '2017-09-22', 1, 'ритм синусовый, горизонюось, чсс 82, синус.тахикардия.', 0, 'aiman_bulatova@mail.ru', '2017-09-24 06:54:30'),
(19, 22, 7, 1, '2017-07-18', 0, 'в полости малогота таза определяются явления спаечного процесса-петли тонокй кишки интимно прилежат к толстой кишке на уровне её ректосигмоидного отдлеле.Объемных образвоаний в малом тазу не определяется. В/тазовые л/у не визуализируются. Паховые не увели', 1, '2017-07-18', 1, 'МРТ ОМТ-признаки состояния после холецистэктомии', 0, NULL, -1, NULL, 1, '2017-08-21', 1, 'ритм синусовый, эос в норме', 0, 'aiman_bulatova@mail.ru', '2017-09-24 10:06:01'),
(20, 22, 8, 1, '2017-09-18', 0, 'в полости малого таза в структуре жировой клетчатки кистозноу образвоание с четкими неровными контурами, тонкими гладкими стенкаи, однородным содержимым размерами 15,3х12,4х9,5мм. В проекиции латеральных маа крестца вытянутой формы очаг с неровными контур', 1, '2017-09-20', 0, 'в брюшной полости свободная жидкость, печень, подж.ж, селенка б/о. Асцит', 1, '2017-09-20', 1, 'легочные поля без видимых мтс', 0, NULL, -1, NULL, 0, 'aiman_bulatova@mail.ru', '2017-09-27 10:14:59'),
(21, 36, 1, 1, '2017-10-06', 0, 'КТ картина  ОБП, ОМТ с в\\в контрастированием от 06.10.17г. Заключение  C-r ovariorum. Состояние после комплексного лечения. КТ-картина мтс поражения печени, мтс поражение забрюшинных и тазовых лимфоузлов с признаками конгломератов, ассимитричного утолщени', 1, '2017-10-06', 0, 'КТ картина  ОБП, ОМТ с в\\в контрастированием от 06.10.17г. Заключение  C-r ovariorum. Состояние после комплексного лечения. КТ-картина мтс поражения печени, мтс поражение забрюшинных и тазовых лимфоузлов с признаками конгломератов, ассимитричного утолщени', 1, '2017-10-06', 0, 'Заключение КТ ОГК с в\\в контрастированием от 06.10.17г.: КТ-признаки хронического бронхита, бронхоэктазов верхних долей обоих легких, лимфоаденопатии (susp.mts) лимфоузлов надключичной области слева и мягких тканей шеи слева. В динамике от 13.07.2017 стаб', 1, '2017-10-06', 1, 'Ритм синусовый, тахикардия, ЧСС 110 в мин, нормальное положение ЭОС', 0, 'nikki_93@bk.ru', '2017-10-10 07:25:48');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_investigation`
--

CREATE TABLE `ovarian_investigation` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Наименование таблицы исследования',
  `descr` varchar(250) NOT NULL DEFAULT '' COMMENT 'Описание на русском'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Исследования';

--
-- Дамп данных таблицы `ovarian_investigation`
--

INSERT INTO `ovarian_investigation` (`id`, `name`, `descr`) VALUES
(0, 'ovarian_inclusion', 'Критерии включения/исключения'),
(1, 'ovarian_general_data', 'Демографические, соц-экономические данные, анамнез заболевания и т.д.'),
(2, 'ovarian_instrument', 'Инструментальные исследования'),
(3, 'ovarian_lab', 'Лабораторные исследования'),
(4, 'ovarian_therapy_continue', 'Информация о продолжении терапии трабектедином в комбинации с ПЛД'),
(5, 'ovarian_tumor_response', 'Объективная оценка эффективности лечения (RECIST)'),
(6, 'ovarian_adverse_event', 'Нежелательные явления'),
(7, 'ovarian_concomitant_therapy', 'Сопутствующая терапия');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_investigation_visit`
--

CREATE TABLE `ovarian_investigation_visit` (
  `id` int(11) NOT NULL,
  `investigation_id` int(11) NOT NULL COMMENT 'Исследование',
  `visit_id` int(11) NOT NULL COMMENT 'Визит',
  `carried` tinyint(1) NOT NULL COMMENT 'Проводится (1-да, 0-нет)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Исследования-визиты';

--
-- Дамп данных таблицы `ovarian_investigation_visit`
--

INSERT INTO `ovarian_investigation_visit` (`id`, `investigation_id`, `visit_id`, `carried`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 1, 1),
(5, 5, 1, 0),
(6, 1, 2, 0),
(7, 2, 2, 0),
(8, 3, 2, 1),
(9, 4, 2, 1),
(10, 5, 2, 0),
(11, 1, 3, 0),
(12, 2, 3, 0),
(13, 3, 3, 1),
(14, 4, 3, 1),
(15, 5, 3, 0),
(16, 1, 4, 0),
(17, 2, 4, 1),
(18, 3, 4, 1),
(19, 4, 4, 1),
(20, 5, 4, 1),
(21, 1, 5, 0),
(22, 2, 5, 0),
(23, 3, 5, 1),
(24, 4, 5, 1),
(25, 5, 5, 0),
(26, 1, 6, 0),
(27, 2, 6, 0),
(28, 3, 6, 1),
(29, 4, 6, 1),
(30, 5, 6, 0),
(31, 1, 7, 0),
(32, 2, 7, 1),
(33, 3, 7, 1),
(34, 4, 7, 1),
(35, 5, 7, 1),
(36, 1, 8, 0),
(37, 2, 8, 1),
(38, 3, 8, 1),
(39, 4, 8, 0),
(40, 5, 8, 1),
(41, 6, 1, 1),
(42, 6, 2, 1),
(43, 6, 3, 1),
(44, 6, 4, 1),
(45, 6, 5, 1),
(46, 6, 6, 1),
(47, 6, 7, 1),
(48, 6, 8, 1),
(49, 0, 1, 1),
(50, 0, 2, 0),
(51, 0, 3, 0),
(52, 0, 4, 0),
(53, 0, 5, 0),
(54, 0, 6, 0),
(55, 0, 7, 0),
(56, 0, 8, 0),
(57, 7, 1, 1),
(58, 7, 2, 1),
(59, 7, 3, 1),
(60, 7, 4, 1),
(61, 7, 5, 1),
(62, 7, 6, 1),
(63, 7, 7, 1),
(64, 7, 8, 1);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ovarian_invest_data`
-- (See below for the actual view)
--
CREATE TABLE `ovarian_invest_data` (
`investigation_id` bigint(20)
,`record_id` int(11)
,`patient_id` int(11)
,`visit_id` int(11)
,`checked` int(11)
,`user` varchar(25)
,`insert_date` timestamp
);

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_lab`
--

CREATE TABLE `ovarian_lab` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `visit_date` date NOT NULL COMMENT 'Дата визита',
  `ca125_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: СА 125 да/нет',
  `ca125` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: СА 125 Ед/мл',
  `ca125_date` date DEFAULT NULL COMMENT 'Лаб.анализы: СА 125 - дата проведения',
  `oak_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: ОАК да/нет',
  `oak_date` date DEFAULT NULL COMMENT 'Лаб.анализы: ОАК - дата проведения',
  `oak_hb` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: ОАК - Гемоглобин г/л',
  `oak_er` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: ОАК - Эритроциты 10Х12',
  `oak_leuc` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: ОАК - Лейкоциты 10Х9',
  `oak_tr` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: ОАК - Тромбоциты 10Х9',
  `oak_netr` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: ОАК - Нейтрофилы 10Х9',
  `bc_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови да/нет',
  `bc_protein_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Общий белок да/нет',
  `bc_protein` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Общий белок мкмоль/л',
  `bc_protein_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Общий белок дата проведения',
  `bc_bilirubin_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин да/нет',
  `bc_bilirubin_total_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин общий да/нет',
  `bc_bilirubin_total` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин общий мкмоль/л',
  `bc_bilirubin_total_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин общий дата проведения',
  `bc_bilirubin_direct_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин прямой да/нет',
  `bc_bilirubin_direct` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин прямой мкмоль/л',
  `bc_bilirubin_direct_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин прямой дата проведения',
  `bc_bilirubin_nondirect_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин непрямой да/нет',
  `bc_bilirubin_nondirect` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин непрямой мкмоль/л',
  `bc_bilirubin_nondirect_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Билирубин непрямой дата проведения',
  `bc_ast_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - АСТ да/нет',
  `bc_ast` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - АСТ ме/л',
  `bc_ast_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - АСТ дата проведения',
  `bc_alt_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - АЛТ да/нет',
  `bc_alt` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - АЛТ ме/л',
  `bc_alt_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - АЛТ дата проведения',
  `bc_creat_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Креатинин да/нет',
  `bc_creat` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Креатинин мг/дл',
  `bc_creat_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Креатинин дата проведения',
  `bc_alk_phosphatase_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Щелочная фосфатаза да/нет',
  `bc_alk_phosphatase` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Щелочная фосфатаза ед/л',
  `bc_alk_phosphatase_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Щелочная фосфатаза дата проведения',
  `bc_mochevina_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Лаб.анализы: Биохимический анализ крови - Мочевина да/нет',
  `bc_mochevina` double(15,2) DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Мочевина мкмоль/л',
  `bc_mochevina_date` date DEFAULT NULL COMMENT 'Лаб.анализы: Биохимический анализ крови - Мочевина дата проведения',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лабораторные исследования';

--
-- Дамп данных таблицы `ovarian_lab`
--

INSERT INTO `ovarian_lab` (`id`, `patient_id`, `visit_id`, `visit_date`, `ca125_yes_no_id`, `ca125`, `ca125_date`, `oak_yes_no_id`, `oak_date`, `oak_hb`, `oak_er`, `oak_leuc`, `oak_tr`, `oak_netr`, `bc_yes_no_id`, `bc_protein_yes_no_id`, `bc_protein`, `bc_protein_date`, `bc_bilirubin_yes_no_id`, `bc_bilirubin_total_yes_no_id`, `bc_bilirubin_total`, `bc_bilirubin_total_date`, `bc_bilirubin_direct_yes_no_id`, `bc_bilirubin_direct`, `bc_bilirubin_direct_date`, `bc_bilirubin_nondirect_yes_no_id`, `bc_bilirubin_nondirect`, `bc_bilirubin_nondirect_date`, `bc_ast_yes_no_id`, `bc_ast`, `bc_ast_date`, `bc_alt_yes_no_id`, `bc_alt`, `bc_alt_date`, `bc_creat_yes_no_id`, `bc_creat`, `bc_creat_date`, `bc_alk_phosphatase_yes_no_id`, `bc_alk_phosphatase`, `bc_alk_phosphatase_date`, `bc_mochevina_yes_no_id`, `bc_mochevina`, `bc_mochevina_date`, `checked`, `user`, `insert_date`) VALUES
(8, 22, 1, '2017-04-02', 1, 271.00, '2017-01-25', 1, '2017-03-29', 133.00, 4.30, 3.70, 220.00, 48.00, 1, 1, 72.50, '2017-03-29', 1, 1, 11.70, '2017-03-29', 0, NULL, NULL, 0, NULL, NULL, 1, 38.70, '2017-03-29', 1, 51.00, '2017-03-29', 1, 85.00, '2017-03-29', 0, NULL, NULL, 1, 4.90, '2017-03-29', 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:45:51'),
(9, 20, 1, '2017-03-28', 1, 2429.00, '2017-02-10', 1, '2017-03-24', 134.00, 4.08, 6.80, 321.00, 88.00, 1, 1, 69.00, '2017-03-24', 1, 1, 12.90, '2017-03-24', 0, NULL, NULL, 1, 12.90, '2017-03-24', 1, 14.00, '2017-03-24', 1, 18.00, '2017-03-24', 1, 89.00, '2017-03-24', 1, 3.00, '2017-03-24', 1, 4.99, '2017-03-24', 0, 'Esengalieva.roza@mail.ru', '2017-04-04 10:33:46'),
(10, 22, 2, '2017-04-21', 0, NULL, NULL, 1, '2017-04-20', 124.00, 3.90, 2.00, 265.00, 41.00, 1, 1, 64.50, '2017-04-20', 1, 1, 11.40, '2017-04-20', 0, NULL, NULL, 0, NULL, NULL, 1, 30.20, '2017-04-20', 1, 48.90, '2017-04-20', 1, 66.50, '2017-04-20', 0, -1.00, NULL, 1, 4.30, '2017-04-20', 0, 'aiman_bulatova@mail.ru', '2017-04-21 06:38:14'),
(11, 21, 3, '2017-05-12', -1, 107.00, '2017-05-10', -1, NULL, NULL, NULL, NULL, NULL, NULL, -1, -1, NULL, NULL, -1, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, -1.00, NULL, -1, NULL, NULL, 0, 'kossanova@synergycro.ru', '2017-05-16 05:53:36'),
(12, 21, 2, '2017-05-12', 1, 107.00, '2017-05-10', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, -1, NULL, NULL, -1, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, -1, -1.00, NULL, -1, NULL, NULL, 0, 'kossanova@synergycro.ru', '2017-05-17 06:04:01'),
(13, 22, 3, '2017-05-12', 1, 21.78, '2017-05-06', 1, '2017-05-11', 126.00, 3.90, 2.40, 262.00, 43.00, 1, 1, 64.60, '2017-05-11', 1, 1, 12.20, '2017-05-11', 0, NULL, NULL, 0, NULL, NULL, 1, 39.10, '2017-05-11', 1, 65.50, '2017-05-11', 1, 73.10, '2017-05-11', -1, -1.00, NULL, 1, 3.80, '2017-05-11', 0, 'aiman_bulatova@mail.ru', '2017-05-22 11:01:49'),
(14, 22, 4, '2017-06-02', 0, NULL, NULL, 1, '2017-06-01', 117.00, 3.60, 2.70, 258.00, 47.00, 1, 1, 60.20, '2017-06-01', 1, 1, 10.10, '2017-06-01', 0, NULL, NULL, 0, NULL, NULL, 1, 24.70, '2017-06-01', 1, 28.50, '2017-06-01', 1, 64.70, '2017-06-01', -1, -1.00, NULL, 1, 2.60, '2017-06-01', 0, 'aiman_bulatova@mail.ru', '2017-06-02 06:44:35'),
(15, 29, 1, '2017-06-05', 1, 237.60, '2017-05-04', 1, '2017-05-30', 114.00, 4.00, 2.90, 325.00, 60.00, 1, 1, 66.10, '2017-05-31', 1, 1, 7.30, '2017-05-31', 0, NULL, NULL, 0, NULL, NULL, 1, 26.10, '2017-05-31', 1, 24.80, '2017-05-31', 1, 80.90, '2107-05-31', -1, -1.00, NULL, 1, 3.70, '2017-05-31', 0, 'aiman_bulatova@mail.ru', '2017-06-05 04:20:23'),
(16, 20, 2, '2017-04-21', 0, NULL, NULL, 1, '2017-04-22', 105.00, 3.50, 15.40, 436.00, 73.00, 1, 1, 69.00, '2017-04-17', 1, 1, 13.30, '2017-04-17', 1, 3.10, '2017-04-17', 1, 10.20, '2017-04-17', 1, 25.00, '2017-04-17', 1, 28.00, '2017-04-17', 1, 81.40, '2017-04-17', -1, -1.00, NULL, 1, 3.30, '2017-04-17', 0, 'Esengalieva.roza@mail.ru', '2017-06-06 09:24:59'),
(17, 20, 3, '2017-05-12', 0, NULL, NULL, 1, '2017-05-13', 112.00, 3.60, 7.50, 490.00, 80.00, 1, 1, 64.00, '2017-05-05', 1, 1, 14.00, '2017-05-05', 1, 3.50, '2017-05-05', 1, 10.50, '2017-05-05', 1, 26.00, '2017-07-05', 1, 37.00, '2017-05-05', 1, 71.20, '2017-05-05', -1, -1.00, NULL, 1, 3.90, '2017-05-05', 0, 'Esengalieva.roza@mail.ru', '2017-06-06 09:55:01'),
(18, 30, 1, '2017-04-11', 1, 117.70, '2017-02-16', 1, '2017-04-11', 95.00, 3.50, 3.40, 320.00, 220.00, 1, 1, 69.00, '2017-04-11', 1, 1, 8.70, '2017-04-11', 0, NULL, NULL, 0, NULL, NULL, 1, 17.00, '2017-04-11', 1, 15.00, '2017-04-11', 1, 85.00, '2017-04-11', -1, -1.00, NULL, 1, 9.60, '2017-04-11', 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:30:21'),
(19, 31, 1, '2017-05-12', 0, NULL, NULL, 1, '2017-05-14', 103.00, 3.45, 7.00, 331.00, 5.30, 1, 1, 10.39, '2017-05-04', 1, 1, 7.80, '2017-05-04', 1, 3.30, '2017-05-04', 0, NULL, NULL, 1, 15.20, '2017-05-04', 1, 20.50, '2017-05-04', 1, 0.86, '2017-05-04', -1, -1.00, NULL, 1, 4.40, '2017-05-04', 0, 'simba83-83@mail.ru', '2017-06-16 09:44:00'),
(20, 18, 1, '2017-05-30', 0, NULL, NULL, 1, '2017-05-22', 107.00, 3.20, 3.00, 217.00, 52.00, 1, 1, 63.10, '2017-05-22', 1, 1, 14.10, '2017-05-22', 0, NULL, NULL, 0, NULL, NULL, 1, 0.40, '2017-05-22', 1, 0.50, '2017-05-22', 1, 0.68, '2017-05-22', -1, -1.00, NULL, 1, 5.20, '2017-05-22', 0, 'zarinka.zi@mail.ru', '2017-06-21 07:43:53'),
(21, 20, 4, '2017-06-02', 0, NULL, NULL, 1, '2017-06-03', 103.00, 3.30, 8.30, 376.00, 78.00, 1, 1, 67.00, '2017-05-29', 1, 1, 12.00, '2017-05-29', 1, 3.00, '2017-05-29', 0, NULL, NULL, 1, 31.00, '2017-05-29', 1, 34.00, '2017-05-29', 1, 81.30, '2017-05-29', -1, -1.00, NULL, 0, NULL, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:30:47'),
(22, 28, 1, '2017-06-05', 1, 22.40, '2017-06-07', 1, '2017-06-07', 134.00, 4.50, 3.40, 263.00, 61.00, 1, 0, NULL, NULL, 1, 1, 13.50, '2017-05-31', 0, NULL, NULL, 0, NULL, NULL, 1, 44.00, '2017-05-31', 1, 59.00, '2017-05-31', 1, 67.00, '2017-05-31', -1, -1.00, NULL, 0, NULL, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:52:51'),
(23, 28, 2, '2017-06-29', 0, NULL, NULL, 1, '2017-07-01', 136.00, 4.50, 5.80, 248.00, 63.00, 1, 0, NULL, NULL, 1, 1, 12.00, '2017-07-22', 0, NULL, NULL, 0, NULL, NULL, 1, 44.00, '2017-07-22', 1, 33.00, '2017-07-22', 1, 67.40, '2017-07-22', -1, -1.00, NULL, 0, NULL, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:55:48'),
(24, 22, 5, '2017-06-28', 0, NULL, NULL, 1, '2017-06-27', 118.00, 3.50, 2.70, 327.00, 46.00, 1, 1, 63.00, '2017-06-27', 1, 1, 10.50, '2017-06-27', 0, NULL, NULL, 0, NULL, NULL, 1, 26.30, '2017-06-27', 1, 24.00, '2017-06-27', 1, 78.30, '2017-06-27', -1, -1.00, NULL, 1, 4.50, '2017-06-27', 0, 'aiman_bulatova@mail.ru', '2017-06-28 07:53:21'),
(25, 29, 2, '2017-06-05', 0, NULL, NULL, 1, '2017-06-01', 112.00, 4.10, 5.60, 323.00, 68.00, 1, 1, 66.10, '2017-05-31', 1, 1, 7.30, '2017-06-01', 0, NULL, NULL, 0, NULL, NULL, 1, 26.10, '2017-06-01', 1, 24.80, '2017-06-01', 1, 80.90, '2017-06-01', -1, -1.00, NULL, 1, 3.70, '2017-06-01', 0, 'aiman_bulatova@mail.ru', '2017-06-30 03:08:15'),
(26, 29, 3, '2017-06-28', 1, 275.80, '2017-06-26', 1, '2017-06-21', 117.00, 4.20, 3.50, 203.00, 61.00, 1, 1, 65.80, '2017-06-21', 1, 1, 12.70, '2017-06-21', 0, NULL, NULL, 0, NULL, NULL, 1, 30.40, '2017-06-21', 1, 52.00, '2017-06-21', 1, 73.10, '2017-06-21', -1, -1.00, NULL, 1, 4.70, '2017-06-21', 0, 'aiman_bulatova@mail.ru', '2017-06-30 03:26:31'),
(27, 18, 2, '2017-06-20', 0, NULL, NULL, 1, '2017-06-15', 106.00, 3.00, 3.60, 0.00, 0.00, 1, 1, 63.00, '2017-06-15', 1, 1, 14.10, '2017-06-15', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0.68, '2017-06-15', -1, -1.00, NULL, 1, 5.10, '2017-06-15', 0, 'zarinka.zi@mail.ru', '2017-07-01 02:38:38'),
(28, 18, 3, '2017-06-21', 0, NULL, NULL, 1, '2017-06-15', 106.00, 3.00, 3.60, 0.00, 0.00, 1, 1, 63.10, '2017-06-15', 1, 1, 14.10, '2017-06-15', 0, NULL, NULL, 0, NULL, NULL, 1, 0.50, '2017-06-15', 1, 0.50, '2017-06-15', 1, 60.10, '2017-06-15', -1, -1.00, NULL, 1, 5.10, '2017-06-15', 0, 'zarinka.zi@mail.ru', '2017-07-15 04:58:37'),
(29, 29, 4, '2017-07-19', 1, 95.50, '2017-07-18', 1, '2017-07-13', 116.00, 4.00, 3.10, 254.00, 59.00, 1, 1, 64.00, '2017-07-13', 1, 1, 10.90, '2017-07-13', 0, NULL, NULL, 0, NULL, NULL, 1, 27.00, '2017-07-13', 1, 38.40, '2017-07-13', 1, 65.20, '2017-07-13', -1, -1.00, NULL, 1, 3.70, '2017-07-13', 0, 'aiman_bulatova@mail.ru', '2017-07-20 10:35:17'),
(30, 22, 6, '2017-07-28', 1, 3.92, '2017-06-30', 1, '2017-07-27', 132.00, 3.80, 3.30, 245.00, 42.00, 1, 1, 66.40, '2017-07-27', 1, 1, 9.40, '2017-07-27', 0, NULL, NULL, 0, NULL, NULL, 1, 34.90, '2017-07-27', 1, 29.40, '2017-07-27', 1, 71.80, '2017-07-27', -1, -1.00, NULL, 1, 3.90, '2017-07-27', 0, 'aiman_bulatova@mail.ru', '2017-07-28 13:00:35'),
(31, 32, 1, '2017-05-23', 1, 2132.00, '2017-05-18', 1, '2017-05-18', 138.00, 4.20, 10.00, 258.00, 61.00, 1, 1, 78.00, '2017-05-18', 1, 1, 10.70, '2017-05-18', 1, 5.50, '2017-05-18', 0, NULL, NULL, 1, 23.00, '2017-05-19', 1, 19.00, '2017-05-18', 1, 71.60, '2017-05-18', -1, -1.00, NULL, 1, 4.00, '2017-05-18', 0, 'davran_a@mail.ru', '2017-07-29 16:40:27'),
(32, 32, 2, '2017-06-14', 1, 4811.00, '2017-06-12', 1, '2017-06-14', 127.00, 4.07, 6.50, 733.00, 60.00, 1, 1, 65.47, '2017-06-14', 1, 1, 5.00, '2017-06-14', 0, NULL, NULL, 0, NULL, NULL, 1, 23.00, '2017-06-14', 1, 20.00, '2017-06-14', 1, 65.60, '2017-06-14', -1, -1.00, NULL, 1, 3.40, '2017-06-14', 0, 'davran_a@mail.ru', '2017-07-29 16:47:34'),
(33, 33, 1, '2017-05-26', 1, 2575.00, '2017-04-26', 1, '2017-05-25', 110.00, 3.70, 12.20, 233.00, 65.00, 1, 1, 62.00, '2017-05-25', 1, 1, 12.00, '2017-05-25', 1, 5.00, '2017-05-25', 0, NULL, NULL, 1, 1.10, '2017-05-25', 1, 0.75, '2017-05-25', 1, 147.00, '2017-05-25', -1, -1.00, NULL, 1, 4.20, '2017-05-25', 0, 'davran_a@mail.ru', '2017-07-29 17:15:22'),
(34, 28, 3, '2017-07-24', 0, NULL, NULL, 1, '2017-07-26', 113.00, 3.70, 9.30, 241.00, 71.00, 1, 0, NULL, NULL, 1, 1, 13.10, '2017-07-17', 0, NULL, NULL, 0, NULL, NULL, 1, 40.00, '2017-07-17', 1, 47.00, '2017-07-17', 1, 69.80, '2017-07-17', -1, -1.00, NULL, 0, NULL, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-08-03 10:04:11'),
(35, 35, 1, '2017-08-07', 1, 444.30, '2017-06-01', 1, '2017-08-02', 101.00, 3.50, 7.70, 180.00, 70.00, 1, 1, 76.00, '2017-08-02', 0, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, 1, 10.50, '2017-08-02', 1, 14.50, '2017-08-02', 0, NULL, NULL, -1, -1.00, NULL, 1, 6.80, '2017-08-02', 0, 'Esengalieva.roza@mail.ru', '2017-08-09 11:39:02'),
(36, 20, 5, '2017-08-04', 1, 1050.00, '2017-07-11', 1, '2017-08-06', 115.00, 3.50, 9.40, 281.00, 85.00, 1, 1, 70.00, '2017-08-04', 0, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, 1, 31.00, '2017-08-04', 1, 35.00, '2017-08-04', 1, 89.50, '2017-08-04', -1, -1.00, NULL, 1, 5.69, '2017-08-04', 0, 'Esengalieva.roza@mail.ru', '2017-08-10 05:04:35'),
(37, 29, 5, '2017-08-10', 1, 31.80, '2017-08-10', 1, '2017-08-04', 118.00, 4.00, 3.20, 200.00, 69.00, 1, 1, 61.00, '2017-08-04', 1, 1, 12.30, '2017-08-04', 0, NULL, NULL, 0, NULL, NULL, 1, 31.40, '2017-08-04', 1, 38.80, '2017-08-04', 1, 67.90, '2017-08-04', -1, -1.00, NULL, 1, 3.90, '2017-08-04', 0, 'aiman_bulatova@mail.ru', '2017-08-11 03:19:48'),
(38, 18, 4, '2017-07-04', 0, NULL, NULL, 1, '2017-07-14', 104.00, 3.14, 4.70, 238.00, 65.00, 1, 1, 63.10, '2017-07-04', 1, 1, 13.00, '2017-07-04', 0, NULL, NULL, 0, NULL, NULL, 1, 0.40, '2017-07-04', 1, 0.60, '2017-07-04', 1, 60.10, '2017-07-04', -1, -1.00, NULL, 1, 5.60, '2017-07-04', 0, 'zarinka.zi@mail.ru', '2017-08-18 07:19:25'),
(39, 35, 2, '2017-08-07', 0, NULL, NULL, 1, '2017-08-10', 111.00, 4.00, 4.30, 153.00, 66.00, 1, 1, 76.00, '2017-08-02', 0, -1, NULL, NULL, -1, NULL, NULL, -1, NULL, NULL, 1, 10.50, '2017-08-02', 1, 14.50, '2017-08-02', 0, NULL, NULL, -1, -1.00, NULL, 1, 6.80, '2017-08-02', 0, 'Esengalieva.roza@mail.ru', '2017-08-22 13:52:48'),
(40, 20, 6, '2017-08-25', 0, NULL, NULL, 1, '2017-08-26', 116.00, 3.50, 14.20, 358.00, 80.00, 1, 1, 66.00, '2017-08-18', 1, 1, 9.80, '2017-08-18', 1, 2.40, '2017-08-18', 0, NULL, NULL, 1, 26.00, '2017-08-18', 1, 28.00, '2017-08-18', 0, NULL, NULL, -1, -1.00, NULL, 0, NULL, NULL, 0, 'Esengalieva.roza@mail.ru', '2017-09-03 11:25:40'),
(41, 29, 6, '2017-08-31', 1, 31.80, '2017-08-10', 1, '2017-08-25', 120.00, 3.90, 3.10, 232.00, 53.00, 1, 1, 65.20, '2017-08-25', 1, 1, 9.90, '2107-08-25', 0, NULL, NULL, 0, NULL, NULL, 1, 5.40, '2017-08-25', 1, 39.70, '2017-09-25', 1, 70.20, '2017-09-25', -1, -1.00, NULL, 1, 5.00, '2017-08-25', 0, 'aiman_bulatova@mail.ru', '2017-09-04 06:05:30'),
(42, 29, 7, '2017-09-24', 1, 18.50, '2017-09-18', 1, '2017-09-21', 113.00, 3.60, 4.30, 291.00, 51.00, 1, 1, 62.90, '2017-09-19', 1, 1, 11.80, '2017-09-19', 0, NULL, NULL, 0, NULL, NULL, 1, 19.90, '2017-09-19', 1, 35.90, '2017-09-19', 1, 62.40, '2017-09-19', -1, -1.00, NULL, 1, 3.20, '2017-09-19', 0, 'aiman_bulatova@mail.ru', '2017-09-24 07:00:49'),
(43, 22, 7, '2017-08-21', 0, NULL, NULL, 1, '2017-08-21', 121.00, 3.50, 4.40, 352.00, 58.00, 1, 1, 61.80, '2017-08-17', 1, 1, 13.80, '2017-08-17', 0, NULL, NULL, 0, NULL, NULL, 1, 21.80, '2017-08-17', 1, 17.20, '2017-08-17', 1, 67.20, '2017-08-17', -1, -1.00, NULL, 1, 3.80, '2017-08-17', 0, 'aiman_bulatova@mail.ru', '2017-09-24 10:10:23'),
(44, 18, 5, '2017-09-07', 0, NULL, NULL, 1, '2017-09-05', 90.00, 3.10, 2.20, 0.00, 0.00, 1, 1, 68.10, '2017-09-05', 1, 1, 10.10, '2017-09-05', 0, NULL, NULL, 0, NULL, NULL, 1, 0.30, '2017-09-05', 1, 0.40, '2017-09-05', 1, 60.10, '2017-09-05', -1, -1.00, NULL, 1, 3.44, '2017-09-05', 0, 'zarinka.zi@mail.ru', '2017-09-27 01:17:15'),
(45, 22, 8, '2017-09-27', 1, 180.00, '2017-09-18', 1, '2017-09-18', 126.00, 3.80, 5.10, 294.00, 63.00, 1, 1, 67.60, '2017-09-18', 1, 1, 9.80, '2017-09-18', 0, NULL, NULL, 0, NULL, NULL, 1, 23.40, '2017-09-18', 1, 17.50, '2017-09-18', 1, 69.10, '2017-09-18', -1, -1.00, NULL, 1, 3.40, '2017-09-18', 0, 'aiman_bulatova@mail.ru', '2017-09-27 10:18:17'),
(46, 36, 1, '2017-10-06', 1, 214.06, '2017-10-06', 1, '2017-10-06', 72.00, 2.55, 12.10, 508.00, 81.00, 1, 1, 54.20, '2017-10-06', 1, 1, 9.60, '2017-10-06', 0, NULL, NULL, 0, NULL, NULL, 1, 13.50, '2017-10-06', 1, 17.10, '2017-10-06', 1, 48.70, '2017-10-06', -1, -1.00, NULL, 1, 5.30, '2017-10-06', 0, 'nikki_93@bk.ru', '2017-10-10 07:46:59');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_patient`
--

CREATE TABLE `ovarian_patient` (
  `id` int(11) NOT NULL,
  `doctor` varchar(100) NOT NULL DEFAULT '' COMMENT 'ФИО исследователя',
  `hospital_id` int(11) NOT NULL COMMENT 'Номер сайта (мед. центра)',
  `patient_number` varchar(10) NOT NULL DEFAULT '' COMMENT 'Номер пациента',
  `status_include` int(11) NOT NULL DEFAULT '-1' COMMENT 'Статус включения: 1 - включен; 0 - не включен; -1 - не заполняли критерии включения (по умолчанию)',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пациенты';

--
-- Дамп данных таблицы `ovarian_patient`
--

INSERT INTO `ovarian_patient` (`id`, `doctor`, `hospital_id`, `patient_number`, `status_include`, `user`, `insert_date`) VALUES
(18, 'Пазилов Ш.Т.', 1, '00101', 1, 'zarinka.zi@mail.ru', '2017-03-11 00:34:09'),
(20, 'Есенгалиева Р.Б.', 5, '00501', 1, 'Esengalieva.roza@mail.ru', '2017-03-28 11:41:47'),
(21, 'Булатова', 7, 'test_001', 1, 'sanzhar73@mail.ru', '2017-03-29 09:17:41'),
(22, 'Булатова', 8, '00801', 1, 'kossanova@synergycro.ru', '2017-03-31 09:24:14'),
(28, 'Есенгалиева Р.Б.', 5, '00502', 1, 'kossanova@synergycro.ru', '2017-05-16 08:51:51'),
(29, 'Булатова', 8, '00802', 1, 'kossanova@synergycro.ru', '2017-06-05 03:43:49'),
(30, 'Ниязбекова К.И.', 9, '00901', 1, 'ahmentayeva.kaldykyz@mail', '2017-06-06 07:29:08'),
(31, 'Сембаев Даурен Рахметолович', 4, '00401', 1, 'simba83-83@mail.ru', '2017-06-08 11:35:35'),
(32, 'Арыбжанов Д.Т.', 3, '00301', 1, 'davran_a@mail.ru', '2017-07-29 15:29:25'),
(33, 'Арыбжанов Д.Т.', 3, '00302', 1, 'davran_a@mail.ru', '2017-07-29 16:49:27'),
(34, 'Арыбжанов Д.Т.', 3, '00303', 1, 'davran_a@mail.ru', '2017-07-29 17:17:02'),
(35, 'Есенгалиева Р.Б.', 5, '00503', 1, 'Esengalieva.roza@mail.ru', '2017-08-03 10:37:04'),
(36, 'Мусаханова Ж.С.', 2, '00201', 1, 'nikki_93@bk.ru', '2017-10-10 05:41:25');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_query`
--

CREATE TABLE `ovarian_query` (
  `id` int(11) NOT NULL,
  `investigation_id` int(11) DEFAULT NULL COMMENT 'Номер типа исследования',
  `record_id` int(11) DEFAULT NULL COMMENT 'Id записи исследования',
  `description` text COMMENT 'Описательная часть запроса',
  `open_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `query_status_id` int(11) NOT NULL COMMENT 'Статус запроса (1-Открыт, 2-Разрешено, 3-Закрыто)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_query`
--

INSERT INTO `ovarian_query` (`id`, `investigation_id`, `record_id`, `description`, `open_date`, `close_date`, `query_status_id`) VALUES
(1, 6, 21, 'Необходимо заполнить список нежелательных явлений и описать НЯ', '2017-06-02 10:27:54', '2017-06-09 08:48:20', 3),
(2, 6, 22, 'Необходимо заполнить список нежелательных явлений и описать НЯ', '2017-06-02 10:28:15', '2017-06-12 07:11:27', 3),
(3, 0, 18, '123123123', '2017-06-10 12:29:52', '0000-00-00 00:00:00', 1),
(4, 0, 18, 'dfgdf', '2017-06-10 12:30:33', '0000-00-00 00:00:00', 1),
(5, 0, 18, 'проверка работы уведомления', '2017-06-10 12:52:47', '0000-00-00 00:00:00', 1),
(6, 0, 18, 'проверка работы уведомления 2', '2017-06-10 12:53:51', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_role`
--

CREATE TABLE `ovarian_role` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT 'Описание роли',
  `descr` varchar(100) NOT NULL DEFAULT '' COMMENT 'Описание роли'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_role`
--

INSERT INTO `ovarian_role` (`id`, `descr`) VALUES
('admin', 'Админиситратор, видит все записи пациентов'),
('investigator', 'Исследователь, видит пациентов только своего сайта'),
('monitor', 'Монитор исследования'),
('supervisor', 'Супервизор');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_therapy_continue`
--

CREATE TABLE `ovarian_therapy_continue` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `therap_trab_continue_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Продолжена терапия трабектедином в комбинации с ПЛД: Лечение продолжается без изменений да/нет',
  `therap_trab_continue_no_cause_id` int(11) DEFAULT '-1' COMMENT 'Продолжена терапия трабектедином в комбинации с ПЛД: Если нет, укажите причину',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Продолжение терапии трабектедином в комбинации с ПЛД';

--
-- Дамп данных таблицы `ovarian_therapy_continue`
--

INSERT INTO `ovarian_therapy_continue` (`id`, `patient_id`, `visit_id`, `therap_trab_continue_yes_no_id`, `therap_trab_continue_no_cause_id`, `checked`, `user`, `insert_date`) VALUES
(6, 20, 1, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-03-28 12:18:37'),
(7, 22, 1, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:46:15'),
(8, 22, 2, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-04-21 06:39:04'),
(9, 20, 2, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-05-16 08:37:24'),
(10, 22, 3, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-05-22 11:03:10'),
(11, 22, 4, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-06-02 06:44:54'),
(12, 29, 1, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-06-05 04:25:48'),
(13, 20, 3, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-06-06 09:55:22'),
(14, 30, 1, 1, -1, 0, 'ahmentayeva.kaldykyz@mail', '2017-06-12 09:30:43'),
(15, 31, 1, 1, -1, 0, 'simba83-83@mail.ru', '2017-06-16 09:44:38'),
(16, 18, 1, 1, -1, 0, 'zarinka.zi@mail.ru', '2017-06-21 07:44:12'),
(17, 20, 4, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:31:22'),
(18, 28, 1, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:35:04'),
(19, 28, 2, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:37:28'),
(20, 22, 5, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-06-28 07:54:06'),
(21, 29, 2, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-06-28 10:16:17'),
(22, 29, 3, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-06-30 03:26:41'),
(23, 18, 2, 1, -1, 0, 'zarinka.zi@mail.ru', '2017-07-01 02:38:55'),
(24, 18, 3, 1, -1, 0, 'zarinka.zi@mail.ru', '2017-07-15 04:58:57'),
(25, 29, 4, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-07-20 10:35:35'),
(26, 22, 6, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-07-28 13:00:51'),
(27, 32, 1, 1, -1, 0, 'davran_a@mail.ru', '2017-07-29 16:40:55'),
(28, 32, 2, 1, -1, 0, 'davran_a@mail.ru', '2017-07-29 16:47:49'),
(29, 33, 1, 1, -1, 0, 'davran_a@mail.ru', '2017-07-29 17:15:33'),
(30, 28, 3, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-08-03 10:05:34'),
(31, 35, 1, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-08-09 11:40:00'),
(32, 20, 5, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-08-10 05:05:27'),
(33, 29, 5, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-08-11 03:20:14'),
(34, 18, 4, 0, -1, 0, 'zarinka.zi@mail.ru', '2017-08-18 07:19:43'),
(35, 35, 2, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-08-22 14:05:06'),
(36, 20, 6, 1, -1, 0, 'Esengalieva.roza@mail.ru', '2017-09-03 11:25:51'),
(37, 29, 6, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-09-04 06:05:41'),
(38, 29, 7, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-09-24 07:01:01'),
(39, 22, 7, 1, -1, 0, 'aiman_bulatova@mail.ru', '2017-09-24 10:10:33'),
(40, 18, 5, 1, -1, 0, 'zarinka.zi@mail.ru', '2017-09-27 01:17:41'),
(41, 36, 1, 1, -1, 0, 'nikki_93@bk.ru', '2017-10-10 07:47:46');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_tumor_response`
--

CREATE TABLE `ovarian_tumor_response` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` int(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `full_response_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Объективная оценка эффективности лечения (RECIST*) Полный ответ (да, нет)',
  `partial_response_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Объективная оценка эффективности лечения (RECIST*) Частичный ответ (да, нет)',
  `progress_desease_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Объективная оценка эффективности лечения (RECIST*) Прогрессирование заболевания (да, нет)',
  `stabilization_desease_yes_no_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Объективная оценка эффективности лечения (RECIST*) Стабилизация заболевания (да, нет)',
  `checked` int(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Объективная оценка эффективности лечения (RECIST)';

--
-- Дамп данных таблицы `ovarian_tumor_response`
--

INSERT INTO `ovarian_tumor_response` (`id`, `patient_id`, `visit_id`, `full_response_yes_no_id`, `partial_response_yes_no_id`, `progress_desease_yes_no_id`, `stabilization_desease_yes_no_id`, `checked`, `user`, `insert_date`) VALUES
(1, 20, 4, 1, 0, 0, 0, 0, 'Esengalieva.roza@mail.ru', '2017-06-22 11:31:52'),
(2, 29, 4, 0, 1, 0, 0, 0, 'aiman_bulatova@mail.ru', '2017-07-20 10:48:24'),
(3, 18, 4, 0, 0, 0, 1, 0, 'zarinka.zi@mail.ru', '2017-08-18 07:20:02'),
(4, 29, 7, 0, 1, 0, 0, 0, 'aiman_bulatova@mail.ru', '2017-09-24 07:01:51'),
(5, 22, 7, 1, 0, 0, 0, 0, 'aiman_bulatova@mail.ru', '2017-09-24 10:10:59'),
(6, 22, 8, 0, 0, 1, 0, 0, 'aiman_bulatova@mail.ru', '2017-09-27 10:18:32');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_user`
--

CREATE TABLE `ovarian_user` (
  `id` int(11) NOT NULL,
  `username_email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `patronymic_name` varchar(50) DEFAULT NULL,
  `sex_id` int(11) DEFAULT '-1' COMMENT 'Пол',
  `date_birth` date DEFAULT NULL COMMENT 'Дата рождения',
  `project` varchar(50) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL COMMENT 'Примечание',
  `role_id` varchar(20) DEFAULT NULL COMMENT 'Роль (admin, investigator)',
  `hospital_id` int(11) DEFAULT NULL COMMENT 'Мед центр (сайт), к которому относится пользователь (в случае, если роль investigator)',
  `phone` varchar(30) DEFAULT 'нет данных',
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_user`
--

INSERT INTO `ovarian_user` (`id`, `username_email`, `password`, `active`, `last_name`, `first_name`, `patronymic_name`, `sex_id`, `date_birth`, `project`, `comments`, `role_id`, `hospital_id`, `phone`, `user`, `insert_date`) VALUES
(30, 'sanzhar73@mail.ru', 'd8578edf8458ce06fbc5bb76a58c5ca4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 2, 'нет данных', NULL, '2014-05-07 06:37:11'),
(39, 'sanzhar73@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'нет данных', NULL, '2014-06-05 13:54:50'),
(40, 'surya_esentay@mail.ru', '72d6d4d89e50f20bf6aa3ecc6a01532b', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'supervisor', NULL, 'нет данных', NULL, '2014-06-06 00:13:08'),
(41, 'gulsum_smagulova@mail.ru', '3e1fcaf6d5289b672b2cf4550c47143c', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'нет данных', NULL, '2014-09-19 17:33:38'),
(42, 'test@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 1, 'нет данных', '', '2017-01-14 08:01:01'),
(43, 'test2@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 2, 'нет данных', '', '2017-01-31 08:01:01'),
(46, 'test011@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 1, 'нет данных', '', '2017-03-08 01:35:38'),
(47, 'test012@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 1, 'нет данных', '', '2017-03-08 01:35:38'),
(48, 'test013@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 1, 'нет данных', '', '2017-03-08 01:35:38'),
(49, 'test021@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 2, 'нет данных', '', '2017-03-08 01:35:38'),
(50, 'test022@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 2, 'нет данных', '', '2017-03-08 01:35:38'),
(51, 'test023@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 2, 'нет данных', '', '2017-03-08 01:35:38'),
(52, 'test031@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 3, 'нет данных', '', '2017-03-08 01:35:38'),
(53, 'test032@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 3, 'нет данных', '', '2017-03-08 01:35:38'),
(54, 'test033@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 3, 'нет данных', '', '2017-03-08 01:35:38'),
(55, 'test041@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 4, 'нет данных', '', '2017-03-08 01:35:38'),
(56, 'test042@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 4, 'нет данных', '', '2017-03-08 01:35:38'),
(57, 'test043@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 4, 'нет данных', '', '2017-03-08 01:35:38'),
(58, 'test051@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 5, 'нет данных', '', '2017-03-08 01:35:38'),
(59, 'test052@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 5, 'нет данных', '', '2017-03-08 01:35:38'),
(60, 'test053@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 5, 'нет данных', '', '2017-03-08 01:35:38'),
(61, 'test061@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 6, 'нет данных', '', '2017-03-08 01:35:38'),
(62, 'test062@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 6, 'нет данных', '', '2017-03-08 01:35:38'),
(63, 'test063@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 6, 'нет данных', '', '2017-03-08 01:35:38'),
(64, 'test071@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 7, 'нет данных', '', '2017-03-08 01:35:38'),
(65, 'test072@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 7, 'нет данных', '', '2017-03-08 01:35:38'),
(66, 'test073@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 7, 'нет данных', '', '2017-03-08 01:35:38'),
(67, 'test081@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 8, 'нет данных', '', '2017-03-08 01:35:38'),
(68, 'test082@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 8, 'нет данных', '', '2017-03-08 01:35:38'),
(69, 'test083@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 8, 'нет данных', '', '2017-03-08 01:35:38'),
(70, 'test091@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 9, 'нет данных', '', '2017-03-08 01:35:38'),
(71, 'test092@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 9, 'нет данных', '', '2017-03-08 01:35:38'),
(72, 'test093@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 9, 'нет данных', '', '2017-03-08 01:35:38'),
(73, 'test101@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 10, 'нет данных', '', '2017-03-08 01:35:38'),
(74, 'test102@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 10, 'нет данных', '', '2017-03-08 01:35:38'),
(75, 'test103@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 10, 'нет данных', '', '2017-03-08 01:35:38'),
(76, 'kossanova@synergycro.ru', '7f6cc55e2d66b58f0d8b8348686642e6', 1, 'Косанова', 'Асель', NULL, 2, NULL, 'Renaissance', 'Монитор, специалист по клиническим исследованиям в «Синерджи Ресерч Групп Казахстан»', 'monitor', NULL, 'нет данных', 'admin', '2017-03-08 01:35:38'),
(78, 'nikki_93@bk.ru', '095dd7ebc91575545c1541105e5e43a8', 1, 'Мусаханова', 'Жанна', 'Сапарбаевна', 2, NULL, 'ovarian', 'заведующий дневного стационара', 'investigator', 2, '8 701 726 81 58', NULL, '2017-03-20 05:20:08'),
(79, 'davran_a@mail.ru', '85e504e5aebd8911f6aa6e9c6787a0aa', 1, 'Арыбжанов', 'Дауранбек', 'Турсынкулович', 1, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 3, '8 701 357 71 28', NULL, '2017-03-20 05:20:08'),
(80, 'simba83-83@mail.ru', '2dde8fddef2d3724d6430b8129d13a0a', 1, 'Сембаев', 'Даурен', 'Рахметоллаевич', 1, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 4, '8 707 993 54 42', NULL, '2017-03-20 05:20:08'),
(81, 'Esengalieva.roza@mail.ru', '0d78677fd858f7ed8910c2e0a70a0751', 1, 'Есенгалиева', 'Роза', 'Бериковна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 5, '8 702 111 22 58', NULL, '2017-03-20 05:20:08'),
(82, 'pavlodarec99@mail.ru', 'bce84c1e45ca88d447a3e7d20446eb03', 1, 'Денчик', 'Светлана ', 'Алиевна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 6, '8 701 435 80 74', NULL, '2017-03-20 05:20:08'),
(83, 'kuhareva007@mail.ru', 'b63d21f8a4edd932571f7fc75c5ff391', 0, 'Кухарева', 'Анна', 'Александровна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 7, '8 705 505 17 34', NULL, '2017-03-20 05:20:08'),
(84, 'aiman_bulatova@mail.ru', '519ca99dde519b6a357f26f216ddd531', 1, 'Булатова', 'Айман', 'Булатовна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 8, '8 701 398 06 24, 8 705 101 85 ', NULL, '2017-03-20 05:20:08'),
(85, 'ahmentayeva.kaldykyz@mail.ru', '3f90d4fb297aef19ece3159be577c273', 1, 'Ниязбекова', 'Калдыкыз', 'Исмаиловна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 9, '87015038840', NULL, '2017-03-20 05:20:08'),
(86, 'victoria-yun@mail.ru', '0bba4141834066b9b4118440935fc7cc', 1, 'Юн', 'Виктория', 'Викторовна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 10, '8 747 982 09 35, 8 702 369 46 ', NULL, '2017-03-20 05:20:08'),
(87, 'shuha_onco@mail.ru', '2365fb625da9a882f64dd34b7731da88', 1, 'Пазылов', 'Шухрат', 'Талгатович', 1, NULL, 'ovarian', 'врач-химиотерапевт', 'investigator', 1, '8 701 227 08 77', NULL, '2017-03-29 04:42:09'),
(88, 'onco_2009@mail.ru', 'ab2fb2500d79e96f89be701190b132ac', 1, 'Сагидуллина ', 'Гульмира', 'Габдулловна', 2, NULL, 'ovarian', 'Главный врач', 'investigator', 7, '', NULL, '2017-05-15 17:42:24'),
(89, 'kk_nurgul@mail.ru', '58447d4194e37a7ee94f9579c9f0f6a9', 1, 'Калиолдина', 'Нургуль', 'Кайсаровна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 7, '8 705 277 93 15', NULL, '2017-05-15 17:42:24'),
(90, 'zarinka.zi@mail.ru', 'f38ff10410e408ae62daf5e54e2b46bc', 1, 'Ильянова', 'Зарина', 'Тимуровна', 2, NULL, 'ovarian', 'врач-химиотерапевт отделения «Дневной стационар химиотерапии»', 'investigator', 1, '+7 701 7237527', NULL, '2017-06-16 05:36:51'),
(91, 'rutzhanovaz@mail.ru', '70ed2ad486db9391711ffc0f65bcbf8a', 1, 'Рутжанова', 'Жанна', 'Юрьевна', 2, NULL, 'ovarian', 'врач-химиотерапевт отделения химиотерапии', 'investigator', 4, '8 701 993 55 37', NULL, '2017-07-05 06:03:55');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_user_visit`
--

CREATE TABLE `ovarian_user_visit` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL DEFAULT '',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_user_visit`
--

INSERT INTO `ovarian_user_visit` (`id`, `username`, `date_time`) VALUES
(363, 'kossanova@synergycro.ru', '2017-03-24 08:29:51'),
(364, 'kossanova@synergycro.ru', '2017-03-24 08:36:15'),
(365, 'sanzhar73@mail.ru', '2017-03-26 05:13:51'),
(366, 'Esengalieva.roza@mail.ru', '2017-03-28 11:40:23'),
(367, 'Esengalieva.roza@mail.ru', '2017-03-28 15:35:40'),
(369, 'kossanova@synergycro.ru', '2017-03-29 05:05:38'),
(370, 'Esengalieva.roza@mail.ru', '2017-03-29 05:13:03'),
(371, 'test@test.kz', '2017-03-29 05:13:41'),
(372, 'kossanova@synergycro.ru', '2017-03-29 05:16:40'),
(373, 'test071@test.kz', '2017-03-29 09:16:48'),
(374, 'aiman_bulatova@mail.ru', '2017-03-31 09:21:25'),
(375, 'aiman_bulatova@mail.ru', '2017-03-31 10:04:03'),
(376, 'kossanova@synergycro.ru', '2017-03-31 10:38:04'),
(377, 'aiman_bulatova@mail.ru', '2017-03-31 10:39:56'),
(378, 'aiman_bulatova@mail.ru', '2017-04-02 03:14:49'),
(379, 'kossanova@synergycro.ru', '2017-04-03 04:41:18'),
(380, 'kossanova@synergycro.ru', '2017-04-03 08:43:03'),
(381, 'Esengalieva.roza@mail.ru', '2017-04-03 10:05:31'),
(382, 'kossanova@synergycro.ru', '2017-04-04 06:15:26'),
(383, 'test@test.kz', '2017-04-04 06:19:39'),
(384, 'aiman_bulatova@mail.ru', '2017-04-04 09:32:05'),
(385, 'Esengalieva.roza@mail.ru', '2017-04-04 10:23:44'),
(386, 'sanzhar73@mail.ru', '2017-04-05 06:17:18'),
(387, 'sanzhar73@mail.ru', '2017-04-05 06:52:04'),
(388, 'test@test.kz', '2017-04-05 10:35:02'),
(389, 'sanzhar73@mail.ru', '2017-04-05 19:14:06'),
(390, 'sanzhar73@mail.ru', '2017-04-06 02:29:56'),
(391, 'sanzhar73@mail.ru', '2017-04-06 03:13:17'),
(392, 'test@test.kz', '2017-04-10 04:31:51'),
(393, 'kossanova@synergycro.ru', '2017-04-10 05:40:33'),
(394, 'nikki_93@bk.ru', '2017-04-10 05:46:41'),
(395, 'Esengalieva.roza@mail.ru', '2017-04-11 09:50:21'),
(396, 'kossanova@synergycro.ru', '2017-04-11 10:22:05'),
(397, 'Esengalieva.roza@mail.ru', '2017-04-11 10:28:44'),
(398, 'sanzhar73@mail.ru', '2017-04-13 04:26:49'),
(399, 'sanzhar73@mail.ru', '2017-04-13 05:09:42'),
(400, 'sanzhar73@mail.ru', '2017-04-18 03:31:17'),
(401, 'test@test.kz', '2017-04-18 05:25:27'),
(402, 'test@test.kz', '2017-04-18 06:32:36'),
(403, 'test@test.kz', '2017-04-18 07:09:08'),
(404, 'kossanova@synergycro.ru', '2017-04-18 08:16:46'),
(405, 'test@test.kz', '2017-04-18 11:32:06'),
(406, 'sanzhar73@mail.ru', '2017-04-20 03:45:03'),
(407, 'sanzhar73@mail.ru', '2017-04-20 04:25:02'),
(408, 'aiman_bulatova@mail.ru', '2017-04-21 06:20:09'),
(409, 'test@test.kz', '2017-04-24 05:43:49'),
(410, 'kossanova@synergycro.ru', '2017-04-27 05:43:36'),
(411, 'test@test.kz', '2017-05-01 06:09:48'),
(412, 'test032@test.kz', '2017-05-01 06:19:33'),
(413, 'sanzhar73@mail.ru', '2017-05-01 06:20:27'),
(414, 'sanzhar73@mail.ru', '2017-05-01 07:57:06'),
(415, 'kossanova@synergycro.ru', '2017-05-10 05:10:11'),
(416, 'kossanova@synergycro.ru', '2017-05-10 06:09:16'),
(417, 'sanzhar73@mail.ru', '2017-05-10 06:46:55'),
(418, 'sanzhar73@mail.ru', '2017-05-12 04:27:47'),
(419, 'aiman_bulatova@mail.ru', '2017-05-12 10:04:52'),
(420, 'sanzhar73@mail.ru', '2017-05-14 07:36:56'),
(421, 'sanzhar73@mail.ru', '2017-05-14 07:37:54'),
(422, 'sanzhar73@mail.ru', '2017-05-14 07:57:33'),
(423, 'sanzhar73@mail.ru', '2017-05-14 19:04:37'),
(424, 'sanzhar73@mail.ru', '2017-05-14 19:37:05'),
(425, 'test071@test.kz', '2017-05-14 19:47:32'),
(426, 'sanzhar73@mail.ru', '2017-05-15 03:57:51'),
(427, 'test071@test.kz', '2017-05-15 04:03:32'),
(428, 'kossanova@synergycro.ru', '2017-05-15 08:15:23'),
(429, 'aiman_bulatova@mail.ru', '2017-05-15 10:46:44'),
(430, 'aiman_bulatova@mail.ru', '2017-05-16 02:00:59'),
(431, 'kossanova@synergycro.ru', '2017-05-16 05:03:34'),
(432, 'sanzhar73@mail.ru', '2017-05-16 05:22:04'),
(433, 'kossanova@synergycro.ru', '2017-05-16 05:48:54'),
(434, 'Esengalieva.roza@mail.ru', '2017-05-16 07:50:42'),
(435, 'Esengalieva.roza@mail.ru', '2017-05-16 08:30:03'),
(436, 'kossanova@synergycro.ru', '2017-05-16 09:25:24'),
(437, 'Esengalieva.roza@mail.ru', '2017-05-16 09:34:48'),
(438, 'sanzhar73@mail.ru', '2017-05-17 05:02:01'),
(439, 'kossanova@synergycro.ru', '2017-05-17 06:03:05'),
(440, 'kossanova@synergycro.ru', '2017-05-17 09:14:52'),
(441, 'kossanova@synergycro.ru', '2017-05-18 10:15:30'),
(442, 'sanzhar73@mail.ru', '2017-05-21 16:15:45'),
(443, 'kossanova@synergycro.ru', '2017-05-22 08:51:15'),
(444, 'aiman_bulatova@mail.ru', '2017-05-22 10:52:04'),
(445, 'kossanova@synergycro.ru', '2017-05-23 08:22:37'),
(446, 'sanzhar73@mail.ru', '2017-05-24 21:41:23'),
(447, 'kossanova@synergycro.ru', '2017-05-26 07:29:50'),
(448, 'kossanova@synergycro.ru', '2017-05-26 08:01:04'),
(449, 'kossanova@synergycro.ru', '2017-05-29 07:06:46'),
(450, 'kossanova@synergycro.ru', '2017-05-30 06:45:23'),
(451, 'kossanova@synergycro.ru', '2017-05-31 11:27:47'),
(452, 'sanzhar73@mail.ru', '2017-06-01 07:42:34'),
(453, 'kossanova@synergycro.ru', '2017-06-01 10:00:39'),
(454, 'aiman_bulatova@mail.ru', '2017-06-02 06:35:26'),
(455, 'kossanova@synergycro.ru', '2017-06-02 10:26:02'),
(456, 'aiman_bulatova@mail.ru', '2017-06-05 03:42:37'),
(457, 'kossanova@synergycro.ru', '2017-06-05 05:01:09'),
(458, 'aiman_bulatova@mail.ru', '2017-06-05 05:19:08'),
(459, 'kossanova@synergycro.ru', '2017-06-05 06:26:07'),
(460, 'kossanova@synergycro.ru', '2017-06-05 11:15:50'),
(461, 'kossanova@synergycro.ru', '2017-06-06 04:34:36'),
(462, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-06 05:09:35'),
(463, 'kossanova@synergycro.ru', '2017-06-06 06:25:09'),
(464, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-06 06:27:29'),
(465, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-06 06:31:10'),
(466, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-06 06:37:08'),
(467, 'kossanova@synergycro.ru', '2017-06-06 06:44:42'),
(468, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-06 07:19:06'),
(469, 'sanzhar73@mail.ru', '2017-06-06 07:19:29'),
(470, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-06 07:28:44'),
(471, 'Esengalieva.roza@mail.ru', '2017-06-06 09:14:21'),
(472, 'kossanova@synergycro.ru', '2017-06-06 10:16:52'),
(473, 'kossanova@synergycro.ru', '2017-06-06 10:25:33'),
(474, 'kossanova@synergycro.ru', '2017-06-06 10:33:11'),
(475, 'kossanova@synergycro.ru', '2017-06-06 10:50:33'),
(476, 'Esengalieva.roza@mail.ru', '2017-06-06 11:04:21'),
(477, 'kossanova@synergycro.ru', '2017-06-06 11:43:57'),
(478, 'kossanova@synergycro.ru', '2017-06-07 04:27:35'),
(479, 'sanzhar73@mail.ru', '2017-06-07 04:40:46'),
(480, 'kossanova@synergycro.ru', '2017-06-07 05:02:26'),
(481, 'sanzhar73@mail.ru', '2017-06-08 03:38:40'),
(482, 'sanzhar73@mail.ru', '2017-06-08 04:59:34'),
(483, 'sanzhar73@mail.ru', '2017-06-08 05:31:12'),
(484, 'kossanova@synergycro.ru', '2017-06-08 07:19:36'),
(485, 'kossanova@synergycro.ru', '2017-06-08 09:52:38'),
(486, 'simba83-83@mail.ru', '2017-06-08 11:33:20'),
(487, 'Esengalieva.roza@mail.ru', '2017-06-08 12:31:05'),
(488, 'kossanova@synergycro.ru', '2017-06-09 08:04:02'),
(489, 'kossanova@synergycro.ru', '2017-06-09 08:44:38'),
(490, 'sanzhar73@mail.ru', '2017-06-10 03:42:37'),
(491, 'kossanova@synergycro.ru', '2017-06-10 03:46:28'),
(492, 'Esengalieva.roza@mail.ru', '2017-06-10 03:48:44'),
(493, 'sanzhar73@mail.ru', '2017-06-10 12:06:51'),
(494, 'Esengalieva.roza@mail.ru', '2017-06-10 12:07:38'),
(495, 'kossanova@synergycro.ru', '2017-06-10 12:29:38'),
(496, 'sanzhar73@mail.ru', '2017-06-10 12:59:34'),
(497, 'Esengalieva.roza@mail.ru', '2017-06-12 07:09:31'),
(498, 'kossanova@synergycro.ru', '2017-06-12 07:11:05'),
(499, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-12 08:58:39'),
(500, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-12 09:35:09'),
(501, 'ahmentayeva.kaldykyz@mail.ru', '2017-06-12 09:35:39'),
(502, 'kossanova@synergycro.ru', '2017-06-13 08:03:30'),
(503, 'kossanova@synergycro.ru', '2017-06-14 08:48:02'),
(504, 'kossanova@synergycro.ru', '2017-06-15 05:13:08'),
(505, 'kossanova@synergycro.ru', '2017-06-15 06:39:11'),
(506, 'kossanova@synergycro.ru', '2017-06-16 05:28:19'),
(507, 'sanzhar73@mail.ru', '2017-06-16 05:37:10'),
(509, 'simba83-83@mail.ru', '2017-06-16 09:18:35'),
(510, 'kossanova@synergycro.ru', '2017-06-16 09:19:32'),
(511, 'sanzhar73@mail.ru', '2017-06-16 22:43:14'),
(512, 'kossanova@synergycro.ru', '2017-06-19 06:47:49'),
(513, 'kossanova@synergycro.ru', '2017-06-19 08:56:12'),
(514, 'kossanova@synergycro.ru', '2017-06-20 08:31:43'),
(515, 'zarinka.zi@mail.ru', '2017-06-21 02:07:43'),
(516, 'zarinka.zi@mail.ru', '2017-06-21 03:10:19'),
(517, 'kossanova@synergycro.ru', '2017-06-21 05:07:53'),
(518, 'kossanova@synergycro.ru', '2017-06-21 07:19:16'),
(519, 'sanzhar73@mail.ru', '2017-06-21 07:23:40'),
(520, 'zarinka.zi@mail.ru', '2017-06-21 07:26:48'),
(521, 'Esengalieva.roza@mail.ru', '2017-06-22 11:04:51'),
(522, 'Esengalieva.roza@mail.ru', '2017-06-22 11:08:55'),
(523, 'Esengalieva.roza@mail.ru', '2017-06-22 11:40:35'),
(524, 'kossanova@synergycro.ru', '2017-06-27 05:19:42'),
(525, 'kossanova@synergycro.ru', '2017-06-27 06:23:30'),
(526, 'kossanova@synergycro.ru', '2017-06-28 03:58:13'),
(527, 'kossanova@synergycro.ru', '2017-06-28 04:35:47'),
(528, 'simba83-83@mail.ru', '2017-06-28 07:04:46'),
(529, 'aiman_bulatova@mail.ru', '2017-06-28 07:48:05'),
(530, 'aiman_bulatova@mail.ru', '2017-06-28 10:14:30'),
(531, 'aiman_bulatova@mail.ru', '2017-06-29 04:42:19'),
(532, 'kossanova@synergycro.ru', '2017-06-29 07:37:06'),
(533, 'kossanova@synergycro.ru', '2017-06-29 08:37:47'),
(534, 'kossanova@synergycro.ru', '2017-06-29 10:35:49'),
(535, 'aiman_bulatova@mail.ru', '2017-06-29 10:51:23'),
(536, 'aiman_bulatova@mail.ru', '2017-06-29 10:52:05'),
(537, 'aiman_bulatova@mail.ru', '2017-06-30 03:03:56'),
(538, 'zarinka.zi@mail.ru', '2017-07-01 02:22:46'),
(539, 'ahmentayeva.kaldykyz@mail.ru', '2017-07-03 06:00:57'),
(540, 'kossanova@synergycro.ru', '2017-07-03 08:15:58'),
(541, 'kossanova@synergycro.ru', '2017-07-03 09:42:09'),
(542, 'kossanova@synergycro.ru', '2017-07-03 11:06:57'),
(543, 'kossanova@synergycro.ru', '2017-07-04 05:18:57'),
(544, 'kossanova@synergycro.ru', '2017-07-04 10:16:53'),
(545, 'kossanova@synergycro.ru', '2017-07-05 04:17:30'),
(546, 'kossanova@synergycro.ru', '2017-07-05 07:57:01'),
(547, 'ahmentayeva.kaldykyz@mail.ru', '2017-07-05 08:51:44'),
(548, 'kossanova@synergycro.ru', '2017-07-10 06:01:58'),
(549, 'kossanova@synergycro.ru', '2017-07-11 05:31:53'),
(550, 'kossanova@synergycro.ru', '2017-07-12 05:26:24'),
(551, 'kossanova@synergycro.ru', '2017-07-12 08:05:37'),
(552, 'kossanova@synergycro.ru', '2017-07-13 05:36:17'),
(553, 'kossanova@synergycro.ru', '2017-07-13 06:25:25'),
(554, 'kossanova@synergycro.ru', '2017-07-13 11:58:30'),
(555, 'kossanova@synergycro.ru', '2017-07-14 09:44:59'),
(556, 'zarinka.zi@mail.ru', '2017-07-15 04:46:09'),
(557, 'kossanova@synergycro.ru', '2017-07-18 04:35:10'),
(558, 'kossanova@synergycro.ru', '2017-07-18 06:02:51'),
(559, 'aiman_bulatova@mail.ru', '2017-07-20 10:27:08'),
(560, 'kossanova@synergycro.ru', '2017-07-20 11:19:09'),
(561, 'aiman_bulatova@mail.ru', '2017-07-21 11:08:48'),
(562, 'Esengalieva.roza@mail.ru', '2017-07-22 05:27:02'),
(563, 'Esengalieva.roza@mail.ru', '2017-07-22 06:02:19'),
(564, 'kossanova@synergycro.ru', '2017-07-24 10:07:22'),
(565, 'kossanova@synergycro.ru', '2017-07-25 04:46:10'),
(566, 'kossanova@synergycro.ru', '2017-07-26 05:12:01'),
(567, 'aiman_bulatova@mail.ru', '2017-07-26 09:38:45'),
(568, 'aiman_bulatova@mail.ru', '2017-07-28 12:56:03'),
(569, 'davran_a@mail.ru', '2017-07-29 15:28:11'),
(570, 'davran_a@mail.ru', '2017-07-29 16:10:12'),
(571, 'kossanova@synergycro.ru', '2017-07-31 05:59:49'),
(572, 'Esengalieva.roza@mail.ru', '2017-08-03 09:48:16'),
(573, 'kossanova@synergycro.ru', '2017-08-08 10:23:19'),
(574, 'kossanova@synergycro.ru', '2017-08-08 10:50:47'),
(575, 'kossanova@synergycro.ru', '2017-08-08 10:55:56'),
(576, 'sanzhar73@mail.ru', '2017-08-08 17:20:38'),
(577, 'sanzhar73@mail.ru', '2017-08-08 19:42:24'),
(578, 'kossanova@synergycro.ru', '2017-08-09 04:54:19'),
(579, 'kossanova@synergycro.ru', '2017-08-09 06:17:30'),
(580, 'Esengalieva.roza@mail.ru', '2017-08-09 06:58:51'),
(581, 'Esengalieva.roza@mail.ru', '2017-08-09 08:18:35'),
(582, 'Esengalieva.roza@mail.ru', '2017-08-09 09:43:46'),
(583, 'Esengalieva.roza@mail.ru', '2017-08-09 10:21:28'),
(584, 'Esengalieva.roza@mail.ru', '2017-08-09 11:21:14'),
(585, 'Esengalieva.roza@mail.ru', '2017-08-09 13:52:10'),
(586, 'Esengalieva.roza@mail.ru', '2017-08-10 03:18:16'),
(587, 'Esengalieva.roza@mail.ru', '2017-08-10 03:55:01'),
(588, 'Esengalieva.roza@mail.ru', '2017-08-10 05:05:11'),
(589, 'aiman_bulatova@mail.ru', '2017-08-11 03:16:01'),
(590, 'aiman_bulatova@mail.ru', '2017-08-13 05:25:16'),
(591, 'aiman_bulatova@mail.ru', '2017-08-13 11:55:20'),
(592, 'kossanova@synergycro.ru', '2017-08-15 06:12:18'),
(593, 'kossanova@synergycro.ru', '2017-08-16 05:26:58'),
(594, 'Esengalieva.roza@mail.ru', '2017-08-17 07:28:55'),
(595, 'zarinka.zi@mail.ru', '2017-08-18 07:06:44'),
(596, 'davran_a@mail.ru', '2017-08-20 09:24:11'),
(597, 'davran_a@mail.ru', '2017-08-21 04:05:48'),
(598, 'sanzhar73@mail.ru', '2017-08-21 06:14:00'),
(599, 'kossanova@synergycro.ru', '2017-08-21 07:19:03'),
(600, 'aiman_bulatova@mail.ru', '2017-08-21 07:27:52'),
(601, 'kossanova@synergycro.ru', '2017-08-21 08:15:12'),
(602, 'kossanova@synergycro.ru', '2017-08-21 09:06:17'),
(603, 'Esengalieva.roza@mail.ru', '2017-08-22 06:12:41'),
(604, 'Esengalieva.roza@mail.ru', '2017-08-22 13:52:55'),
(605, 'Esengalieva.roza@mail.ru', '2017-08-22 14:55:58'),
(606, 'kossanova@synergycro.ru', '2017-08-23 07:59:10'),
(607, 'kossanova@synergycro.ru', '2017-08-31 05:54:25'),
(608, 'kossanova@synergycro.ru', '2017-08-31 07:41:57'),
(609, 'kossanova@synergycro.ru', '2017-08-31 11:58:51'),
(610, 'Esengalieva.roza@mail.ru', '2017-09-03 11:20:51'),
(611, 'aiman_bulatova@mail.ru', '2017-09-04 05:56:43'),
(612, 'aiman_bulatova@mail.ru', '2017-09-07 05:09:47'),
(613, 'Esengalieva.roza@mail.ru', '2017-09-18 07:35:18'),
(614, 'kossanova@synergycro.ru', '2017-09-18 09:10:25'),
(615, 'kossanova@synergycro.ru', '2017-09-18 10:08:36'),
(616, 'kossanova@synergycro.ru', '2017-09-19 09:14:51'),
(617, 'kossanova@synergycro.ru', '2017-09-19 10:10:03'),
(618, 'kossanova@synergycro.ru', '2017-09-19 11:54:27'),
(619, 'kossanova@synergycro.ru', '2017-09-20 12:04:22'),
(620, 'Esengalieva.roza@mail.ru', '2017-09-21 11:01:38'),
(621, 'kossanova@synergycro.ru', '2017-09-22 06:25:46'),
(622, 'kossanova@synergycro.ru', '2017-09-22 08:22:58'),
(623, 'kossanova@synergycro.ru', '2017-09-22 09:47:58'),
(624, 'aiman_bulatova@mail.ru', '2017-09-24 06:51:27'),
(625, 'aiman_bulatova@mail.ru', '2017-09-24 09:54:37'),
(626, 'kossanova@synergycro.ru', '2017-09-26 04:56:23'),
(627, 'kossanova@synergycro.ru', '2017-09-26 07:17:57'),
(628, 'kossanova@synergycro.ru', '2017-09-26 12:58:40'),
(629, 'kossanova@synergycro.ru', '2017-09-26 13:48:37'),
(630, 'kossanova@synergycro.ru', '2017-09-26 14:24:53'),
(631, 'zarinka.zi@mail.ru', '2017-09-27 01:06:40'),
(632, 'sanzhar73@mail.ru', '2017-09-27 03:27:10'),
(633, 'kossanova@synergycro.ru', '2017-09-27 05:30:35'),
(634, 'aiman_bulatova@mail.ru', '2017-09-27 10:07:28'),
(635, 'kossanova@synergycro.ru', '2017-09-28 07:17:41'),
(636, 'sanzhar73@mail.ru', '2017-09-29 03:56:26'),
(637, 'kossanova@synergycro.ru', '2017-09-29 05:15:35'),
(638, 'kossanova@synergycro.ru', '2017-09-29 08:25:06'),
(639, 'kossanova@synergycro.ru', '2017-10-02 10:28:10'),
(640, 'zarinka.zi@mail.ru', '2017-10-02 11:31:21'),
(641, 'kossanova@synergycro.ru', '2017-10-03 10:34:22'),
(642, 'sanzhar73@mail.ru', '2017-10-04 04:40:50'),
(643, 'kossanova@synergycro.ru', '2017-10-04 05:46:21'),
(644, 'kossanova@synergycro.ru', '2017-10-04 08:15:50'),
(645, 'kossanova@synergycro.ru', '2017-10-06 04:54:23'),
(646, 'kossanova@synergycro.ru', '2017-10-06 05:30:48'),
(647, 'sanzhar73@mail.ru', '2017-10-08 09:25:38'),
(648, 'kossanova@synergycro.ru', '2017-10-09 08:45:24'),
(649, 'nikki_93@bk.ru', '2017-10-10 05:40:41'),
(650, 'kossanova@synergycro.ru', '2017-10-10 05:42:52'),
(651, 'sanzhar73@mail.ru', '2017-10-10 05:45:04'),
(652, 'sanzhar73@mail.ru', '2017-10-10 06:31:22'),
(653, 'kossanova@synergycro.ru', '2017-10-10 06:39:19'),
(654, 'nikki_93@bk.ru', '2017-10-10 07:13:02'),
(655, 'kossanova@synergycro.ru', '2017-10-10 08:31:15'),
(656, 'kossanova@synergycro.ru', '2017-10-10 09:15:38'),
(657, 'nikki_93@bk.ru', '2017-10-10 09:16:23'),
(658, 'kossanova@synergycro.ru', '2017-10-11 08:40:25'),
(659, 'kossanova@synergycro.ru', '2017-10-12 05:29:09'),
(660, 'kossanova@synergycro.ru', '2017-10-12 08:32:12'),
(661, 'kossanova@synergycro.ru', '2017-10-13 08:45:28'),
(662, 'kossanova@synergycro.ru', '2017-10-13 10:22:41'),
(663, 'kossanova@synergycro.ru', '2017-10-16 05:24:57'),
(664, 'kossanova@synergycro.ru', '2017-10-16 06:04:39'),
(665, 'kossanova@synergycro.ru', '2017-10-16 09:04:35'),
(666, 'kossanova@synergycro.ru', '2017-10-16 11:19:52'),
(667, 'kossanova@synergycro.ru', '2017-10-16 11:20:03');

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_visit`
--

CREATE TABLE `ovarian_visit` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT 'Краткое наименование визита',
  `descr` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ovarian_visit`
--

INSERT INTO `ovarian_visit` (`id`, `name`, `descr`) VALUES
(1, 'Визит 1 (включение)', 'Визит 1 – визит включения'),
(2, 'Визит 2', 'Визит 2 – 1 цикл терапии после включения пациента в исследование'),
(3, 'Визит 3', 'Визит 3 – 2 цикл терапии после включения пациента в исследование'),
(4, 'Визит 4', 'Визит 4 – 3 цикл терапии после включения пациента в исследование'),
(5, 'Визит 5', 'Визит 5 – 4 цикл терапии после включения пациента в исследование'),
(6, 'Визит 6', 'Визит 6 – 5 цикл терапии после включения пациента в исследование'),
(7, 'Визит 7', 'Визит 7 – 6 цикл терапии после включения пациента в исследование'),
(8, 'Визит 8 (заключит.)', 'Визит 8 – заключительный визит (через 4 месяца после завершения лечения)');

-- --------------------------------------------------------

--
-- Структура для представления `ovarian_invest_data`
--
DROP TABLE IF EXISTS `ovarian_invest_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`p-508_root`@`localhost` SQL SECURITY DEFINER VIEW `ovarian_invest_data`  AS  select 0 AS `investigation_id`,`ovarian_inclusion`.`id` AS `record_id`,`ovarian_inclusion`.`patient_id` AS `patient_id`,`ovarian_inclusion`.`visit_id` AS `visit_id`,`ovarian_inclusion`.`checked` AS `checked`,`ovarian_inclusion`.`user` AS `user`,`ovarian_inclusion`.`insert_date` AS `insert_date` from `ovarian_inclusion` union select 1 AS `investigation_id`,`ovarian_general_data`.`id` AS `record_id`,`ovarian_general_data`.`patient_id` AS `patient_id`,`ovarian_general_data`.`visit_id` AS `visit_id`,`ovarian_general_data`.`checked` AS `checked`,`ovarian_general_data`.`user` AS `user`,`ovarian_general_data`.`insert_date` AS `insert_date` from `ovarian_general_data` union select 2 AS `investigation_id`,`ovarian_instrument`.`id` AS `record_id`,`ovarian_instrument`.`patient_id` AS `patient_id`,`ovarian_instrument`.`visit_id` AS `visit_id`,`ovarian_instrument`.`checked` AS `checked`,`ovarian_instrument`.`user` AS `user`,`ovarian_instrument`.`insert_date` AS `insert_date` from `ovarian_instrument` union select 3 AS `investigation_id`,`ovarian_lab`.`id` AS `record_id`,`ovarian_lab`.`patient_id` AS `patient_id`,`ovarian_lab`.`visit_id` AS `visit_id`,`ovarian_lab`.`checked` AS `checked`,`ovarian_lab`.`user` AS `user`,`ovarian_lab`.`insert_date` AS `insert_date` from `ovarian_lab` union select 4 AS `investigation_id`,`ovarian_therapy_continue`.`id` AS `record_id`,`ovarian_therapy_continue`.`patient_id` AS `patient_id`,`ovarian_therapy_continue`.`visit_id` AS `visit_id`,`ovarian_therapy_continue`.`checked` AS `checked`,`ovarian_therapy_continue`.`user` AS `user`,`ovarian_therapy_continue`.`insert_date` AS `insert_date` from `ovarian_therapy_continue` union select 5 AS `investigation_id`,`ovarian_tumor_response`.`id` AS `record_id`,`ovarian_tumor_response`.`patient_id` AS `patient_id`,`ovarian_tumor_response`.`visit_id` AS `visit_id`,`ovarian_tumor_response`.`checked` AS `checked`,`ovarian_tumor_response`.`user` AS `user`,`ovarian_tumor_response`.`insert_date` AS `insert_date` from `ovarian_tumor_response` union select 6 AS `investigation_id`,`ovarian_adverse_event`.`id` AS `record_id`,`ovarian_adverse_event`.`patient_id` AS `patient_id`,`ovarian_adverse_event`.`visit_id` AS `visit_id`,`ovarian_adverse_event`.`checked` AS `checked`,`ovarian_adverse_event`.`user` AS `user`,`ovarian_adverse_event`.`insert_date` AS `insert_date` from `ovarian_adverse_event` union select 7 AS `investigation_id`,`ovarian_concomitant_therapy`.`id` AS `record_id`,`ovarian_concomitant_therapy`.`patient_id` AS `patient_id`,`ovarian_concomitant_therapy`.`visit_id` AS `visit_id`,`ovarian_concomitant_therapy`.`checked` AS `checked`,`ovarian_concomitant_therapy`.`user` AS `user`,`ovarian_concomitant_therapy`.`insert_date` AS `insert_date` from `ovarian_concomitant_therapy` order by `investigation_id`,`record_id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ovarian_adverse_event`
--
ALTER TABLE `ovarian_adverse_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_visit_uniq` (`patient_id`,`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`);

--
-- Индексы таблицы `ovarian_adverse_event_detail`
--
ALTER TABLE `ovarian_adverse_event_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adverse_event_id` (`adverse_event_id`);

--
-- Индексы таблицы `ovarian_concomitant_therapy`
--
ALTER TABLE `ovarian_concomitant_therapy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_visit123_uniq` (`patient_id`,`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`);

--
-- Индексы таблицы `ovarian_dic_list`
--
ALTER TABLE `ovarian_dic_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `rownum` (`rownum`);

--
-- Индексы таблицы `ovarian_dic_val`
--
ALTER TABLE `ovarian_dic_val`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dic_list_value_id` (`dic_list_id`,`value_id`),
  ADD KEY `dic_list_id` (`dic_list_id`),
  ADD KEY `value_id` (`value_id`);

--
-- Индексы таблицы `ovarian_general_data`
--
ALTER TABLE `ovarian_general_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_id_gen_data` (`patient_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`);

--
-- Индексы таблицы `ovarian_inclusion`
--
ALTER TABLE `ovarian_inclusion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_visit_uniq` (`patient_id`,`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`);

--
-- Индексы таблицы `ovarian_instrument`
--
ALTER TABLE `ovarian_instrument`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_visit_uniq` (`patient_id`,`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`);

--
-- Индексы таблицы `ovarian_investigation`
--
ALTER TABLE `ovarian_investigation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ovarian_investigation_visit`
--
ALTER TABLE `ovarian_investigation_visit`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ovarian_lab`
--
ALTER TABLE `ovarian_lab`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_visit_uniq` (`patient_id`,`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`);

--
-- Индексы таблицы `ovarian_patient`
--
ALTER TABLE `ovarian_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_number` (`patient_number`);

--
-- Индексы таблицы `ovarian_query`
--
ALTER TABLE `ovarian_query`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ovarian_role`
--
ALTER TABLE `ovarian_role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ovarian_therapy_continue`
--
ALTER TABLE `ovarian_therapy_continue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_visit_uniq` (`patient_id`,`visit_id`);

--
-- Индексы таблицы `ovarian_tumor_response`
--
ALTER TABLE `ovarian_tumor_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`patient_id`),
  ADD KEY `patient_visit_uniq` (`patient_id`,`visit_id`);

--
-- Индексы таблицы `ovarian_user`
--
ALTER TABLE `ovarian_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_email` (`username_email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Индексы таблицы `ovarian_user_visit`
--
ALTER TABLE `ovarian_user_visit`
  ADD PRIMARY KEY (`id`,`date_time`);

--
-- Индексы таблицы `ovarian_visit`
--
ALTER TABLE `ovarian_visit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ovarian_adverse_event`
--
ALTER TABLE `ovarian_adverse_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT для таблицы `ovarian_adverse_event_detail`
--
ALTER TABLE `ovarian_adverse_event_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `ovarian_concomitant_therapy`
--
ALTER TABLE `ovarian_concomitant_therapy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT для таблицы `ovarian_dic_list`
--
ALTER TABLE `ovarian_dic_list`
  MODIFY `rownum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'счетчик', AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `ovarian_dic_val`
--
ALTER TABLE `ovarian_dic_val`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT для таблицы `ovarian_general_data`
--
ALTER TABLE `ovarian_general_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `ovarian_inclusion`
--
ALTER TABLE `ovarian_inclusion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT для таблицы `ovarian_instrument`
--
ALTER TABLE `ovarian_instrument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `ovarian_investigation_visit`
--
ALTER TABLE `ovarian_investigation_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT для таблицы `ovarian_lab`
--
ALTER TABLE `ovarian_lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT для таблицы `ovarian_patient`
--
ALTER TABLE `ovarian_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT для таблицы `ovarian_query`
--
ALTER TABLE `ovarian_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `ovarian_therapy_continue`
--
ALTER TABLE `ovarian_therapy_continue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT для таблицы `ovarian_tumor_response`
--
ALTER TABLE `ovarian_tumor_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `ovarian_user`
--
ALTER TABLE `ovarian_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT для таблицы `ovarian_user_visit`
--
ALTER TABLE `ovarian_user_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=668;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ovarian_adverse_event`
--
ALTER TABLE `ovarian_adverse_event`
  ADD CONSTRAINT `ovarian_adverse_event_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_adverse_event_detail`
--
ALTER TABLE `ovarian_adverse_event_detail`
  ADD CONSTRAINT `ovarian_adverse_event_detail_fk` FOREIGN KEY (`adverse_event_id`) REFERENCES `ovarian_adverse_event` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_concomitant_therapy`
--
ALTER TABLE `ovarian_concomitant_therapy`
  ADD CONSTRAINT `ovarian_con_ther_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_dic_val`
--
ALTER TABLE `ovarian_dic_val`
  ADD CONSTRAINT `ovarian_dic_val_ibfk_1` FOREIGN KEY (`dic_list_id`) REFERENCES `ovarian_dic_list` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_inclusion`
--
ALTER TABLE `ovarian_inclusion`
  ADD CONSTRAINT `ovarian_inclusion_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_instrument`
--
ALTER TABLE `ovarian_instrument`
  ADD CONSTRAINT `ovarian_instrument_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_lab`
--
ALTER TABLE `ovarian_lab`
  ADD CONSTRAINT `ovarian_lab_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_therapy_continue`
--
ALTER TABLE `ovarian_therapy_continue`
  ADD CONSTRAINT `ovarian_therapy_continue_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_tumor_response`
--
ALTER TABLE `ovarian_tumor_response`
  ADD CONSTRAINT `ovarian_tumor_response_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `ovarian_user`
--
ALTER TABLE `ovarian_user`
  ADD CONSTRAINT `ovarian_user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `ovarian_role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
