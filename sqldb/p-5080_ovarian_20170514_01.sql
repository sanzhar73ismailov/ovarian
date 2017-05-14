-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 14 2017 г., 07:11
-- Версия сервера: 5.5.52-MariaDB-cll-lve
-- Версия PHP: 5.6.27

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Неблагоприятные явления';

--
-- Дамп данных таблицы `ovarian_adverse_event`
--

INSERT INTO `ovarian_adverse_event` (`id`, `patient_id`, `visit_id`, `adverse_event_yes_no_id`, `user`, `insert_date`) VALUES
(16, 20, 1, 0, 'Esengalieva.roza@mail.ru', '2017-03-28 12:20:12'),
(17, 21, 1, 1, 'test071@test.kz', '2017-03-29 09:27:59'),
(18, 22, 1, 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:46:27'),
(19, 22, 2, 0, 'aiman_bulatova@mail.ru', '2017-04-21 06:42:33');

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
(22, 'диарея', 17, 0, '2017-12-12', 1, '2017-12-23', 0, 1, 0);

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
('diag_cancer_clin_stage_id', 'Клиническая стадия заболевания', 0, 11),
('diag_cancer_tnm_stage_m_id', 'TNM стадия на момент постановки диагноза - M', 0, 10),
('diag_cancer_tnm_stage_n_id', 'TNM стадия на момент постановки диагноза - N', 0, 9),
('diag_cancer_tnm_stage_t_id', 'TNM стадия на момент постановки диагноза - T', 0, 8),
('education_id', 'Образование', 0, 6),
('hospital_id', 'Медицинский центр', 0, 3),
('nationality_id', 'Этническая принадлежность', 0, 4),
('no_data_id', 'Нет данных', 0, 13),
('place_living_id', 'Место жительства', 0, 5),
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
(9, 'hospital_id', 9, 'Сайт 009 - Жамбылский областной онкологический диспансер'),
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
(52, 'therap_trab_continue_no_cause_id', 3, 'Лечение остановлено по решению исследователя');

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Визит 1 – визит включения (демографические, соц-экономические данные, анамнез заболевания и т.д.)';

--
-- Дамп данных таблицы `ovarian_general_data`
--

INSERT INTO `ovarian_general_data` (`id`, `patient_id`, `visit_id`, `visit_date`, `date_birth`, `weight_kg`, `height_sm`, `nationality_id`, `nationality_if_other`, `place_living_id`, `education_id`, `social_economic_status_id`, `diag_cancer_estab_date`, `diag_cancer_tnm_stage_t_id`, `diag_cancer_tnm_stage_n_id`, `diag_cancer_tnm_stage_m_id`, `diag_cancer_clin_stage_id`, `surgical_treat_yes_no_id`, `surgical_treat_ecstir_yes_no_id`, `surgical_treat_ecstir_date`, `surgical_treatment_gister01_yes_no_id`, `surgical_treatment_gister01_date`, `surgical_treatment_gister02_yes_no_id`, `surgical_treatment_gister02_date`, `surgical_treatment_gister03_yes_no_id`, `surgical_treatment_gister03_date`, `surgical_treatment_diag_laparotomia_yes_no_id`, `surgical_treatment_diag_laparotomia_date`, `surgical_treatment_diag_laparoscopia_yes_no_id`, `surgical_treatment_diag_laparoscopia_date`, `surgical_treatment_explorat_laparotomia_yes_no_id`, `surgical_treatment_explorat_laparotomia_date`, `chem_treat_yes_no_id`, `chem_treat_antracyc_yes_no_id`, `chem_treat_platina_yes_no_id`, `chem_treat_taxans_yes_no_id`, `chem_treat_cyclophosph_yes_no_id`, `chem_treat_other_yes_no_id`, `chem_treat_other_descr`, `progress_date`, `progress_ca125_yes_no_id`, `progress_ca125`, `progress_instr_mrt_yes_no_id`, `progress_instr_mrt_date`, `progress_instr_mrt_norm_yes_no_id`, `progress_instr_mrt_descr`, `progress_instr_us_yes_no_id`, `progress_instr_us_date`, `progress_instr_us_norm_yes_no_id`, `progress_instr_us_descr`, `progress_instr_kt_yes_no_id`, `progress_instr_kt_date`, `progress_instr_kt_norm_yes_no_id`, `progress_instr_kt_descr`, `progress_instr_ekg_yes_no_id`, `progress_instr_ekg_date`, `progress_instr_ekg_norm_yes_no_id`, `progress_instr_ekg_descr`, `recidive_yes_no_id`, `metastases_yes_no_id`, `metastases_lung_yes_no_id`, `metastases_lung_date`, `metastases_hepat_yes_no_id`, `metastases_hepat_date`, `metastases_osteo_yes_no_id`, `metastases_osteo_date`, `metastases_renal_yes_no_id`, `metastases_renal_date`, `metastases_lymph_nodes_yes_no_id`, `metastases_lymph_nodes_date`, `metastases_plevra_yes_no_id`, `metastases_plevra_date`, `metastases_other_descr`, `metastases_surgical_treat_yes_no_id`, `metastases_surgical_treat_date`, `metastases_surgical_treat_descr`, `chem_1st_line_treat_yes_no_id`, `chem_1st_karboplatin_yes_no_id`, `chem_1st_cisplatin_yes_no_id`, `chem_1st_ciklofosfan_yes_no_id`, `chem_1st_paklitaksel_yes_no_id`, `chem_1st_doksorubicin_yes_no_id`, `chem_1st_bevacizumab_yes_no_id`, `chem_1st_topotekan_yes_no_id`, `chem_1st_gemcitabin_yes_no_id`, `chem_1st_vinorelbin_yes_no_id`, `chem_1st_irinotekan_yes_no_id`, `chem_1st_etopozid_yes_no_id`, `chem_1st_epirubicin_yes_no_id`, `chem_1st_docetaxel_yes_no_id`, `chem_1st_oksaliplatin_yes_no_id`, `chem_1st_trabektidin_yes_no_id`, `chem_1st_other_yes_no_id`, `chem_1st_other_descr`, `chem_1st_date_start`, `chem_1st_date_finish`, `chem_1st_course_number`, `chem_1st_concomitant_therapy_descr`, `chem_2st_trabectedin_yes_no_id`, `chem_2st_trabectedin_dose`, `chem_2st_pld_yes_no_id`, `chem_2st_pld_dose`, `chem_2st_doxopeg_yes_no_id`, `chem_2st_doxopeg_dose`, `chem_2st_kelix_yes_no_id`, `chem_2st_kelix_dose`, `chem_2st_doksorubicin_yes_no_id`, `chem_2st_doksorubicin_dose`, `chem_2st_other_yes_no_id`, `chem_2st_other_dose`, `chem_2st_concomitant_therapy_descr`, `undesirable_event_yes_no_id`, `user`, `insert_date`) VALUES
(3, 22, 1, '2017-04-02', '1965-07-16', 82, 159, 2, NULL, 2, 4, 2, '2014-04-07', 5, 5, 1, 3, 1, 1, '2014-09-17', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 0, 1, 1, 0, 0, '4 нео курса паклитаксел+платина, 4 курса п/о паклитаксел+платина', '2016-03-16', 1, 292.00, 1, '2016-04-04', 0, 'наличие жидкости вдоль листков брюшины, в дуглосовом пространстве, контур брюшины нечеткий с множественными узлами, заключение-канцероматоз брюшины', 1, '2017-03-18', 1, NULL, 0, NULL, -1, NULL, 1, '2016-04-13', 1, NULL, 1, 0, -1, NULL, -1, NULL, -1, NULL, -1, NULL, -1, NULL, -1, NULL, NULL, -1, NULL, NULL, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'цисплатин, виздоксо', '2016-04-13', '2016-08-12', 4, 'антиэметогенная, гепатопротекторы', 1, 2.00, 0, NULL, 0, NULL, 1, 60.00, 0, NULL, 0, NULL, 'гепатопротекторы', 0, 'aiman_bulatova@mail.ru', '2017-04-02 03:33:11'),
(7, 20, 1, '2017-03-28', '1961-08-16', 85, 162, 6, NULL, 1, 4, 2, '2014-12-05', 4, 1, 1, 3, 1, 1, '2014-11-18', 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, 1, 1, 0, 0, 0, NULL, '2017-02-09', 1, 2429.00, 1, '2017-02-09', 0, 'Мтс поражение большого сальника.Очаговое поражение левой повздошной  кости .МР малого таза  закл: мтс брюшины,небольшое количество жидкости в полости таза.', 1, '2017-01-31', 0, 'Диффузные изменения паренхимы печени, поджелудочной железы.Хрон.холецистит. Мтс в печень? Хр.холецистит.Уплотнение члс с обеих сторон.Состояние после эк4стирпации матки с придатками по поводу заболевания яичников ( 2014г). Убедительных данных за рецидив н', 0, NULL, -1, NULL, 1, '2017-03-24', 1, 'синусовый ритм с ЧСС 72 в 1 мин. Горизонтальное положение ЭОС. Гипертрофия левого желудочка', 1, 1, 0, NULL, 1, '2015-12-30', 0, NULL, 0, NULL, 1, '2017-02-09', 0, NULL, NULL, 0, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 'Эндоксан', '2016-01-05', '2016-05-17', 5, NULL, 1, 2.00, 0, NULL, 1, 40.00, 0, NULL, 0, NULL, 0, NULL, 'атропин, дексаметазон,флунол', 0, 'Esengalieva.roza@mail.ru', '2017-04-11 10:27:03');

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Критерии включения/исключения';

--
-- Дамп данных таблицы `ovarian_inclusion`
--

INSERT INTO `ovarian_inclusion` (`id`, `patient_id`, `visit_id`, `age_18_and_more_yes_no_id`, `histol_confirmed_cr_yes_no_id`, `ecog01_yes_no_id`, `recurrent_plat_sensit_cancer_yes_no_id`, `treatment_trabect_after_doxorub_yes_no_id`, `received_no_more_one_line_plat_chem_regimes_yes_no_id`, `doct_decision_trabectedin_yes_no_id`, `signed_consent_yes_no_id`, `age_18_less_yes_no_id`, `received_more_two_line_plat_chem_yes_no_id`, `platinum_refractory_ov_cr_yes_no_id`, `platinum_resistant_ov_cr_yes_no_id`, `refusal_central_venous_catheter_yes_no_id`, `impaired_hepatic_function_yes_no_id`, `impaired_renal_function_yes_no_id`, `impaired_hematological_parameters_yes_no_id`, `impaired_cardiovascular_function_yes_no_id`, `kaposi_sarcoma_yes_no_id`, `user`, `insert_date`) VALUES
(17, 20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Esengalieva.roza@mail.ru', '2017-03-28 11:46:04'),
(18, 21, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'test071@test.kz', '2017-03-29 09:19:26'),
(19, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aiman_bulatova@mail.ru', '2017-03-31 09:26:16');

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Инструментальные исследования';

--
-- Дамп данных таблицы `ovarian_instrument`
--

INSERT INTO `ovarian_instrument` (`id`, `patient_id`, `visit_id`, `instr_mrt_yes_no_id`, `instr_mrt_date`, `instr_mrt_norm_yes_no_id`, `instr_mrt_descr`, `instr_us_yes_no_id`, `instr_us_date`, `instr_us_norm_yes_no_id`, `instr_us_descr`, `instr_kt_yes_no_id`, `instr_kt_date`, `instr_kt_norm_yes_no_id`, `instr_kt_descr`, `instr_ekg_yes_no_id`, `instr_ekg_date`, `instr_ekg_norm_yes_no_id`, `instr_ekg_descr`, `user`, `insert_date`) VALUES
(2, 20, 1, 1, '2017-02-09', 0, 'Мтс поражение брюшины. Очаговое поражение левой подвздошной кости.', 1, '2017-01-31', 0, 'СостоНие после экстирпации матки.Мтс в брюшину?. Контроль через 3 месяца.', 1, '2017-02-24', 1, 'Патологических образований в грудной клетке не обнаружено', 1, '2017-02-24', 1, 'Синусовый ритм с ЧСС 74 в 1 мин. Гипертрофия левого желудочка', 'Esengalieva.roza@mail.ru', '2017-03-28 12:11:02'),
(3, 22, 1, 1, '2017-02-15', 0, 'образование малого таза 42,4х28х26мм  с вовлечением толстой кишки, мтс в париетальную брюшину', 1, '2017-01-25', 0, 'асцит, в малом тазу образвоание 4,85х2,93см', 0, NULL, -1, NULL, 1, '2017-02-24', 1, 'норма', 'aiman_bulatova@mail.ru', '2017-04-02 03:40:39');

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
(6, 'ovarian_adverse_event', 'Неблагоприятные явления');

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
(32, 2, 7, 0),
(33, 3, 7, 1),
(34, 4, 7, 1),
(35, 5, 7, 0),
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
(56, 0, 8, 0);

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лабораторные исследования';

--
-- Дамп данных таблицы `ovarian_lab`
--

INSERT INTO `ovarian_lab` (`id`, `patient_id`, `visit_id`, `visit_date`, `ca125_yes_no_id`, `ca125`, `ca125_date`, `oak_yes_no_id`, `oak_date`, `oak_hb`, `oak_er`, `oak_leuc`, `oak_tr`, `oak_netr`, `bc_yes_no_id`, `bc_protein_yes_no_id`, `bc_protein`, `bc_protein_date`, `bc_bilirubin_yes_no_id`, `bc_bilirubin_total_yes_no_id`, `bc_bilirubin_total`, `bc_bilirubin_total_date`, `bc_bilirubin_direct_yes_no_id`, `bc_bilirubin_direct`, `bc_bilirubin_direct_date`, `bc_bilirubin_nondirect_yes_no_id`, `bc_bilirubin_nondirect`, `bc_bilirubin_nondirect_date`, `bc_ast_yes_no_id`, `bc_ast`, `bc_ast_date`, `bc_alt_yes_no_id`, `bc_alt`, `bc_alt_date`, `bc_creat_yes_no_id`, `bc_creat`, `bc_creat_date`, `bc_alk_phosphatase_yes_no_id`, `bc_alk_phosphatase`, `bc_alk_phosphatase_date`, `bc_mochevina_yes_no_id`, `bc_mochevina`, `bc_mochevina_date`, `user`, `insert_date`) VALUES
(8, 22, 1, '2017-04-02', 1, 271.00, '2017-01-25', 1, '2017-03-29', 133.00, 4.30, 3.70, 220.00, 48.00, 1, 1, 72.50, '2017-03-29', 1, 1, 11.70, '2017-03-29', 0, NULL, NULL, 0, NULL, NULL, 1, 38.70, '2017-03-29', 1, 51.00, '2017-03-29', 1, 85.00, '2017-03-29', 0, NULL, NULL, 1, 4.90, '2017-03-29', 'aiman_bulatova@mail.ru', '2017-04-02 03:45:51'),
(9, 20, 1, '2017-03-28', 1, 2429.00, '2017-02-10', 1, '2017-03-24', 134.00, 4.08, 6.80, 321.00, 88.00, 1, 1, 69.00, '2017-03-24', 1, 1, 12.90, '2017-03-24', 0, NULL, NULL, 1, 12.90, '2017-03-24', 1, 14.00, '2017-03-24', 1, 18.00, '2017-03-24', 1, 89.00, '2017-03-24', 1, 3.00, '2017-03-24', 1, 4.99, '2017-03-24', 'Esengalieva.roza@mail.ru', '2017-04-04 10:33:46'),
(10, 22, 2, '2017-04-21', 0, NULL, NULL, 1, '2017-04-20', 124.00, 3.90, 2.00, 265.00, 42.00, 1, 1, 64.50, '2017-04-20', 1, 1, 11.40, '2017-04-20', 0, NULL, NULL, 0, NULL, NULL, 1, 48.90, '2017-04-20', 1, 30.20, '2017-04-20', 1, 66.50, '2017-04-20', 0, NULL, NULL, 1, 4.30, '2017-04-20', 'aiman_bulatova@mail.ru', '2017-04-21 06:38:14');

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
(18, 'Пазилов Ш.Т.', 1, '00101', -1, 'kossanova@synergycro.ru', '2017-03-11 00:34:09'),
(20, 'Есенгалиева Р.Б.', 5, '00501', 1, 'Esengalieva.roza@mail.ru', '2017-03-28 11:41:47'),
(21, 'Булатова', 7, 'test_001', 1, 'sanzhar73@mail.ru', '2017-03-29 09:17:41'),
(22, 'Булатова', 8, '00801', 1, 'kossanova@synergycro.ru', '2017-03-31 09:24:14');

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Продолжение терапии трабектедином в комбинации с ПЛД';

--
-- Дамп данных таблицы `ovarian_therapy_continue`
--

INSERT INTO `ovarian_therapy_continue` (`id`, `patient_id`, `visit_id`, `therap_trab_continue_yes_no_id`, `therap_trab_continue_no_cause_id`, `user`, `insert_date`) VALUES
(6, 20, 1, 1, -1, 'Esengalieva.roza@mail.ru', '2017-03-28 12:18:37'),
(7, 22, 1, 1, -1, 'aiman_bulatova@mail.ru', '2017-04-02 03:46:15'),
(8, 22, 2, 1, -1, 'aiman_bulatova@mail.ru', '2017-04-21 06:39:04');

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
  `user` varchar(25) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Объективная оценка эффективности лечения (RECIST)';

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
(64, 'test071@test.kz', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'investigator', 7, 'нет данных', '', '2017-03-08 01:35:38'),
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
(83, 'kuhareva007@mail.ru', 'b63d21f8a4edd932571f7fc75c5ff391', 1, 'Кухарева', 'Анна', 'Александровна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 7, '8 705 505 17 34', NULL, '2017-03-20 05:20:08'),
(84, 'aiman_bulatova@mail.ru', '519ca99dde519b6a357f26f216ddd531', 1, 'Булатова', 'Айман', 'Булатовна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 8, '8 701 398 06 24, 8 705 101 85 ', NULL, '2017-03-20 05:20:08'),
(85, 'ahmentayeva.kaldykyz@mail.ru', '3f90d4fb297aef19ece3159be577c273', 1, 'Ниязбекова', 'Калдыкыз', 'Исмаиловна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 11, '87015038840', NULL, '2017-03-20 05:20:08'),
(86, 'victoria-yun@mail.ru', '0bba4141834066b9b4118440935fc7cc', 1, 'Юн', 'Виктория', 'Викторовна', 2, NULL, 'ovarian', 'заведующий отделением химиотерапии', 'investigator', 10, '8 747 982 09 35, 8 702 369 46 ', NULL, '2017-03-20 05:20:08'),
(87, 'shuha_onco@mail.ru', '2365fb625da9a882f64dd34b7731da88', 1, 'Пазылов', 'Шухрат', 'Талгатович', 1, NULL, 'ovarian', 'врач-химиотерапевт', 'investigator', 1, '8 701 227 08 77', NULL, '2017-03-29 04:42:09');

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
(419, 'aiman_bulatova@mail.ru', '2017-05-12 10:04:52');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `ovarian_adverse_event_detail`
--
ALTER TABLE `ovarian_adverse_event_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `ovarian_dic_list`
--
ALTER TABLE `ovarian_dic_list`
  MODIFY `rownum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'счетчик', AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `ovarian_dic_val`
--
ALTER TABLE `ovarian_dic_val`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT для таблицы `ovarian_general_data`
--
ALTER TABLE `ovarian_general_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `ovarian_inclusion`
--
ALTER TABLE `ovarian_inclusion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `ovarian_instrument`
--
ALTER TABLE `ovarian_instrument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `ovarian_investigation_visit`
--
ALTER TABLE `ovarian_investigation_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT для таблицы `ovarian_lab`
--
ALTER TABLE `ovarian_lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `ovarian_patient`
--
ALTER TABLE `ovarian_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `ovarian_therapy_continue`
--
ALTER TABLE `ovarian_therapy_continue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `ovarian_tumor_response`
--
ALTER TABLE `ovarian_tumor_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `ovarian_user`
--
ALTER TABLE `ovarian_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT для таблицы `ovarian_user_visit`
--
ALTER TABLE `ovarian_user_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;
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
