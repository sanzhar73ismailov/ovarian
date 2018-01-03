-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Янв 03 2018 г., 06:45
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

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_investigation`
--

CREATE TABLE `ovarian_investigation` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Наименование таблицы исследования',
  `descr` varchar(250) NOT NULL DEFAULT '' COMMENT 'Описание на русском'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Исследования';

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

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_role`
--

CREATE TABLE `ovarian_role` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT 'Описание роли',
  `descr` varchar(100) NOT NULL DEFAULT '' COMMENT 'Описание роли'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_user_visit`
--

CREATE TABLE `ovarian_user_visit` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL DEFAULT '',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ovarian_visit`
--

CREATE TABLE `ovarian_visit` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT 'Краткое наименование визита',
  `descr` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT для таблицы `ovarian_adverse_event_detail`
--
ALTER TABLE `ovarian_adverse_event_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT для таблицы `ovarian_concomitant_therapy`
--
ALTER TABLE `ovarian_concomitant_therapy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `ovarian_inclusion`
--
ALTER TABLE `ovarian_inclusion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `ovarian_instrument`
--
ALTER TABLE `ovarian_instrument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `ovarian_investigation_visit`
--
ALTER TABLE `ovarian_investigation_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT для таблицы `ovarian_lab`
--
ALTER TABLE `ovarian_lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `ovarian_patient`
--
ALTER TABLE `ovarian_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT для таблицы `ovarian_query`
--
ALTER TABLE `ovarian_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `ovarian_therapy_continue`
--
ALTER TABLE `ovarian_therapy_continue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT для таблицы `ovarian_tumor_response`
--
ALTER TABLE `ovarian_tumor_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `ovarian_user`
--
ALTER TABLE `ovarian_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT для таблицы `ovarian_user_visit`
--
ALTER TABLE `ovarian_user_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=725;
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
