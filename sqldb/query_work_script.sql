/*1. Создаем таблицу для Query*/
CREATE TABLE `ovarian_query` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `investigation_id` INTEGER(11) DEFAULT NULL COMMENT 'Номер типа исследования',
  `record_id` INTEGER(11) DEFAULT NULL COMMENT 'Id записи исследования',
  `description` TEXT COLLATE utf8_general_ci COMMENT 'Описательная часть запроса',
  `open_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `query_status_id` INTEGER(11) NOT NULL COMMENT 'Статус запроса (1-Открыт, 2-Разрешено, 3-Закрыто)',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

/*2. Вносим значения по Query в таблицы ovarian_dic_list и ovarian_dic_val*/
INSERT INTO `ovarian_dic_list` (`id`,`name`,`is_no_data`,`rownum`) VALUE ('query_status_id','Статус Query',0, null);
INSERT INTO   `ovarian_dic_val` (`id`,  `dic_list_id`,  `value_id`,  `value_name`) VALUE (null, 'query_status_id','1', 'Открыт');
INSERT INTO   `ovarian_dic_val` (`id`,  `dic_list_id`,  `value_id`,  `value_name`) VALUE (null, 'query_status_id','2', 'Разрешено');
INSERT INTO   `ovarian_dic_val` (`id`,  `dic_list_id`,  `value_id`,  `value_name`) VALUE (null, 'query_status_id','3', 'Закрыто');

/*3. Добавляем колонку checked во все исследования*/
ALTER TABLE ovarian_inclusion ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER kaposi_sarcoma_yes_no_id;
ALTER TABLE ovarian_general_data ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER undesirable_event_yes_no_id;
ALTER TABLE ovarian_instrument ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER instr_ekg_descr;
ALTER TABLE ovarian_lab ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER bc_mochevina_date;
ALTER TABLE ovarian_therapy_continue ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER therap_trab_continue_no_cause_id;
ALTER TABLE ovarian_tumor_response ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER stabilization_desease_yes_no_id;
ALTER TABLE ovarian_adverse_event ADD COLUMN checked INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором' AFTER adverse_event_yes_no_id;

/*4. Создаем view - см пункт 10*/

/*5. чтобы варинат "Неизвестно" в вариантах:*/
  update `ovarian_dic_list` t set t.`is_no_data`=1 where t.`id` in (
  'diag_cancer_clin_stage_id',
  'diag_cancer_tnm_stage_m_id', 
  'diag_cancer_tnm_stage_n_id',
  'diag_cancer_tnm_stage_t_id'
  ); 
  
/*6. Добавлено на 7 визит -   оценка по шкале RECIST*/
UPDATE `ovarian_investigation_visit` SET `carried`=1 WHERE `investigation_id`=5 and `visit_id`=7;

/*7. Добавляем колонку для Беременность/лактация  в критерии Критерии исключения*/
 ALTER TABLE `ovarian_inclusion` ADD COLUMN `pregnancy_yes_no_id` INTEGER(11) NOT NULL
DEFAULT '-1' COMMENT 'Критерии исключения: Беременность/лактация да/нет' AFTER `kaposi_sarcoma_yes_no_id`;

/*8.*/
UPDATE `ovarian_investigation` SET `descr`= 'Нежелательные явления' WHERE `id`=6;

/*9. chem_2st_concomitant_therapy_descr*/
     /*2-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия*/
INSERT INTO `ovarian_investigation` (`id`, `name`, `descr`) VALUES (7, 'ovarian_concomitant_therapy', 'Сопутствующая терапия');

INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,1,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,2,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,3,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,4,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,5,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,6,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,7,1);
INSERT INTO `ovarian_investigation_visit`(`id`, `investigation_id`, `visit_id`, `carried`) VALUE (null,7,8,1);

CREATE TABLE `ovarian_concomitant_therapy` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `patient_id` INTEGER(11) NOT NULL COMMENT 'Пациент (внеш.ключ)',
  `visit_id` INTEGER(11) NOT NULL COMMENT 'Визит (внеш.ключ)',
  `chem_2st_concomitant_therapy_descr` TEXT COMMENT 'Сопутствующая терапия: описание',
  `checked` INTEGER(1) NOT NULL DEFAULT '0' COMMENT 'Проверено монитором',
  `user` VARCHAR(25) COLLATE utf8_general_ci DEFAULT NULL,
  `insert_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_visit123_uniq` (`patient_id`, `visit_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_id` (`patient_id`),
  CONSTRAINT `ovarian_con_ther_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `ovarian_patient` (`id`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='Сопутствующая терапия';

/*10. See 4.*/
create view ovarian_invest_data as 
select 0 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_inclusion
union 
select 1 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_general_data
union 
select 2 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_instrument
union 
select 3 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_lab
union 
select 4 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_therapy_continue
union 
select 5 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_tumor_response
union 
select 6 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_adverse_event
union 
select 7 as investigation_id, id as record_id, patient_id, visit_id, checked, user, insert_date from ovarian_concomitant_therapy
order by investigation_id, record_id
;
