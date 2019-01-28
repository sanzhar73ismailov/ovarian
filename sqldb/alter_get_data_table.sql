ALTER TABLE ovarian_general_data MODIFY chem_treat_other_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Неадъювантная/Адъювантная химиотерапия: Если да, перечислите все препараты:';
ALTER TABLE ovarian_general_data MODIFY progress_instr_mrt_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ Заключение';
ALTER TABLE ovarian_general_data MODIFY progress_instr_us_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП Заключение';
ALTER TABLE ovarian_general_data MODIFY  progress_instr_kt_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: КТ ОГК Заключение';
ALTER TABLE ovarian_general_data MODIFY  progress_instr_ekg_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Прогрессирование заболевания, Инструментальные исследования: ЭКГ Заключение';
ALTER TABLE ovarian_general_data MODIFY  metastases_other_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Метастазы: Иное';
ALTER TABLE ovarian_general_data MODIFY  metastases_surgical_treat_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Метастазы: Объем оперативного вмешательства';
ALTER TABLE ovarian_general_data MODIFY  chem_1st_other_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Если да, просьба указать торговое название препарата';
ALTER TABLE ovarian_general_data MODIFY  chem_1st_concomitant_therapy_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT '1-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия';
ALTER TABLE ovarian_general_data MODIFY  chem_2st_concomitant_therapy_descr TEXT COLLATE utf8_general_ci DEFAULT NULL COMMENT '2-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия';
