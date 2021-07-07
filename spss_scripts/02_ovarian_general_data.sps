GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\02_ovarian_general_data.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
  
* ovarian_general_data.
VARIABLE LABELS
age_diag "Возраст на момент постановления диагноза",
age_visit "Возраст на момент включения в исследование",
id "",
patient_id "Пациент (внеш.ключ)",
visit_id "Визит",
visit_date "Дата визита",
date_birth "Дата рождения",
weight_kg "Масса тела в килограммах",
height_sm "Рост в сантиметрах",
nationality_id "Этническая принадлежность",
nationality_if_other "Этническая принадлежность (если нет в списке)",
place_living_id "Место жительства",
education_id "Образование",
social_economic_status_id "Социально-экономическое положение",
diag_cancer_estab_date "Дата постановки диагноза рак яичников",
diag_cancer_tnm_stage_t_id "TNM стадия на момент постановки диагноза - T",
diag_cancer_tnm_stage_n_id "TNM стадия на момент постановки диагноза - N",
diag_cancer_tnm_stage_m_id "TNM стадия на момент постановки диагноза - M",
diag_cancer_clin_stage_id "Клиническая стадия заболевания на момент постановки диагноза",
surgical_treat_yes_no_id "Хирургическое лечение: да/нет",
surgical_treat_ecstir_yes_no_id "Хирургическое лечение: 1. Экстирпация матки с придатками",
surgical_treat_ecstir_date "Хирургическое лечение: 1. Экстирпация матки с придатками дата",
surgical_treatment_gister01_yes_no_id "Хирургическое лечение: 2. Гистероскопия I",
surgical_treatment_gister01_date "Хирургическое лечение: 2. Гистероскопия I дата",
surgical_treatment_gister02_yes_no_id "Хирургическое лечение: 3. Гистероскопия II",
surgical_treatment_gister02_date "Хирургическое лечение: 3. Гистероскопия II дата",
surgical_treatment_gister03_yes_no_id "Хирургическое лечение: 4. Гистероскопия III",
surgical_treatment_gister03_date "Хирургическое лечение: 4. Гистероскопия III дата",
surgical_treatment_diag_laparotomia_yes_no_id "Хирургическое лечение: 5. Диагностическая лапаротомия",
surgical_treatment_diag_laparotomia_date "Хирургическое лечение: 5. Диагностическая лапаротомия дата",
surgical_treatment_diag_laparoscopia_yes_no_id "Хирургическое лечение: 6. Диагностическая лапароскопия",
surgical_treatment_diag_laparoscopia_date "Хирургическое лечение: 6. Диагностическая лапароскопия дата",
surgical_treatment_explorat_laparotomia_yes_no_id "Хирургическое лечение: 7. Эксплоративная лапаротомия",
surgical_treatment_explorat_laparotomia_date "Хирургическое лечение: 7. Эксплоративная лапаротомия дата",
chem_treat_yes_no_id "Неадъювантная/Адъювантная химиотерапия: да/нет",
chem_treat_antracyc_yes_no_id "Неадъювантная/Адъювантная химиотерапия: Антрациклины",
chem_treat_platina_yes_no_id "Неадъювантная/Адъювантная химиотерапия: Препараты платины",
chem_treat_taxans_yes_no_id "Неадъювантная/Адъювантная химиотерапия: Таксаны",
chem_treat_cyclophosph_yes_no_id "Неадъювантная/Адъювантная химиотерапия: Циклофосфамид",
chem_treat_other_yes_no_id "Неадъювантная/Адъювантная химиотерапия: Другая химиотерапия",
chem_treat_other_descr "Неадъювантная/Адъювантная химиотерапия: Если да, перечислите все препараты:",
progress_date "Дата регистрации прогрессирования заболевания",
progress_ca125_yes_no_id "Прогрессирование заболевания, лаб.анализы: СА 125 да/нет",
progress_ca125 "Прогрессирование заболевания, лаб.анализы: СА 125 Ед/мл",
progress_instr_mrt_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ да/нет",
progress_instr_mrt_date "Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ дата",
progress_instr_mrt_norm_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ норма/патология",
progress_instr_mrt_descr "Прогрессирование заболевания, Инструментальные исследования: МРТ ОМТ Заключение",
progress_instr_us_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП да/нет",
progress_instr_us_date "Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП дата",
progress_instr_us_norm_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП норма/патология",
progress_instr_us_descr "Прогрессирование заболевания, Инструментальные исследования: УЗИ ОБП Заключение",
progress_instr_kt_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: КТ ОГК да/нет",
progress_instr_kt_date "Прогрессирование заболевания, Инструментальные исследования: КТ ОГК дата",
progress_instr_kt_norm_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: КТ ОГК норма/патология",
progress_instr_kt_descr "Прогрессирование заболевания, Инструментальные исследования: КТ ОГК Заключение",
progress_instr_ekg_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: ЭКГ да/нет",
progress_instr_ekg_date "Прогрессирование заболевания, Инструментальные исследования: ЭКГ дата",
progress_instr_ekg_norm_yes_no_id "Прогрессирование заболевания, Инструментальные исследования: ЭКГ норма/патология",
progress_instr_ekg_descr "Прогрессирование заболевания, Инструментальные исследования: ЭКГ Заключение",
recidive_yes_no_id "Рецидив заболевания: да/нет",
metastases_yes_no_id "Метастазы: да/нет",
metastases_lung_yes_no_id "Метастазы: лёгкие",
metastases_lung_date "Метастазы: лёгкие дата",
metastases_hepat_yes_no_id "Метастазы: Печень",
metastases_hepat_date "Метастазы: Печень дата",
metastases_osteo_yes_no_id "Метастазы: Кости",
metastases_osteo_date "Метастазы: Кости дата",
metastases_renal_yes_no_id "Метастазы: Почки",
metastases_renal_date "Метастазы: Почки дата",
metastases_lymph_nodes_yes_no_id "Метастазы: Л/узлы",
metastases_lymph_nodes_date "Метастазы: Л/узлы дата",
metastases_plevra_yes_no_id "Метастазы: Плевра",
metastases_plevra_date "Метастазы: Плевра дата",
metastases_other_descr "Метастазы: Иное",
metastases_surgical_treat_yes_no_id "Метастазы: Было проведено хирургическое вмешательство",
metastases_surgical_treat_date "Метастазы: Дата проведения хирургического вмешательства",
metastases_surgical_treat_descr "Метастазы: Объем оперативного вмешательства",
chem_1st_line_treat_yes_no_id "1-ая линия ХТ рецидив. рака яичников: да/нет",
chem_1st_karboplatin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Карбоплатин (да, нет)",
chem_1st_cisplatin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Цисплатин (да, нет)",
chem_1st_ciklofosfan_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Циклофосфан (да, нет)",
chem_1st_paklitaksel_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Паклитаксел (да, нет)",
chem_1st_doksorubicin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Доксорубицин (да, нет)",
chem_1st_bevacizumab_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Бевацизумаб (да, нет)",
chem_1st_topotekan_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Топотекан (да, нет)",
chem_1st_gemcitabin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Гемцитабин (да, нет)",
chem_1st_vinorelbin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Винорельбин (да, нет)",
chem_1st_irinotekan_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Иринотекан (да, нет)",
chem_1st_etopozid_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Этопозид (да, нет)",
chem_1st_epirubicin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Эпирубицин (да, нет)",
chem_1st_docetaxel_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Доцетаксел (да, нет)",
chem_1st_oksaliplatin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Оксалиплатин (да, нет)",
chem_1st_trabektidin_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Трабектедин (да, нет)",
chem_1st_other_yes_no_id "1-ая линия ХТ рецидив. рака яичников: Другое (да, нет)",
chem_1st_other_descr "1-ая линия ХТ рецидив. рака яичников: Если да, просьба указать торговое название препарата",
chem_1st_date_start "1-ая линия ХТ рецидив. рака яичников: Дата начала терапии",
chem_1st_date_finish "1-ая линия ХТ рецидив. рака яичников: Дата окончания терапии",
chem_1st_course_number "1-ая линия ХТ рецидив. рака яичников: Число курсов",
chem_1st_concomitant_therapy_descr "1-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия",
chem_2st_trabectedin_yes_no_id "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Трабектедин (да, нет)",
chem_2st_trabectedin_dose "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Трабектедин, доза",
chem_2st_pld_yes_no_id "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД (да, нет)",
chem_2st_pld_dose "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД, доза",
chem_2st_doxopeg_yes_no_id "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг (да, нет)",
chem_2st_doxopeg_dose "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксопэг, доза",
chem_2st_kelix_yes_no_id "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс (да, нет)",
chem_2st_kelix_dose "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Келикс , доза",
chem_2st_doksorubicin_yes_no_id "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксорубицин (да, нет)",
chem_2st_doksorubicin_dose "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Доксорубицин , доза",
chem_2st_other_yes_no_id "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное (да, нет)",
chem_2st_other_dose "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): Иное, доза",
chem_2st_concomitant_therapy_descr "2-ая линия ХТ рецидив. рака яичников: Сопутствующая терапия",
pld_or_doxopeg_or_kelix_sum "2-ая линия ХТ рецидив. рака яичников (1 курс лечения): ПЛД (Доксопэг/Келикс), доза",
undesirable_event_yes_no_id "Нежелательное явление (да, нет) - Отмечал ли пациент какие-либо нежелательные явления при применении химиотерапии Трабектедин в комбинации с ПЛД? Если да, просьба заполнить бланк НЯ",
checked "Проверено монитором",
user "",
insert_date "Дата регистрации".
VALUE LABELS
nationality_id
1 "казахи",
2 "русские",
3 "уйгуры",
4 "татары",
5 "корейцы ",
6 "другие"
/place_living_id
1 "город",
2 "село"
/education_id
1 "Нет официального образования",
2 "Начальная школа",
3 "Средняя школа",
4 "Колледж/Университет/Высшее образование "
/social_economic_status_id
1 "Низкое",
2 "Среднее",
3 "Высокое"
/diag_cancer_tnm_stage_t_id
-1 "нет данных",
1 "T0",
2 "Tis",
3 "T1",
4 "T2",
5 "T3",
6 "T4",
7 "Tx"
/diag_cancer_tnm_stage_n_id
-1 "нет данных",
1 "N0",
2 "N1",
3 "N2",
4 "N3",
5 "Nx"
/diag_cancer_tnm_stage_m_id
-1 "нет данных",
1 "M0",
2 "M1",
3 "Mx"
/diag_cancer_clin_stage_id
-1 "нет данных",
1 "I",
2 "II",
3 "III",
4 "IV"
/surgical_treat_yes_no_id
1 "да",
0 "нет"
/surgical_treat_ecstir_yes_no_id
1 "да",
0 "нет"
/surgical_treatment_gister01_yes_no_id
1 "да",
0 "нет"
/surgical_treatment_gister02_yes_no_id
1 "да",
0 "нет"
/surgical_treatment_gister03_yes_no_id
1 "да",
0 "нет"
/surgical_treatment_diag_laparotomia_yes_no_id
1 "да",
0 "нет"
/surgical_treatment_diag_laparoscopia_yes_no_id
1 "да",
0 "нет"
/surgical_treatment_explorat_laparotomia_yes_no_id
1 "да",
0 "нет"
/chem_treat_yes_no_id
1 "да",
0 "нет"
/chem_treat_antracyc_yes_no_id
1 "да",
0 "нет"
/chem_treat_platina_yes_no_id
1 "да",
0 "нет"
/chem_treat_taxans_yes_no_id
1 "да",
0 "нет"
/chem_treat_cyclophosph_yes_no_id
1 "да",
0 "нет"
/chem_treat_other_yes_no_id
1 "да",
0 "нет"
/progress_ca125_yes_no_id
1 "да",
0 "нет"
/progress_instr_mrt_yes_no_id
1 "да",
0 "нет"
/progress_instr_mrt_norm_yes_no_id
1 "да",
0 "нет"
/progress_instr_us_yes_no_id
1 "да",
0 "нет"
/progress_instr_us_norm_yes_no_id
1 "да",
0 "нет"
/progress_instr_kt_yes_no_id
1 "да",
0 "нет"
/progress_instr_kt_norm_yes_no_id
1 "да",
0 "нет"
/progress_instr_ekg_yes_no_id
1 "да",
0 "нет"
/progress_instr_ekg_norm_yes_no_id
1 "да",
0 "нет"
/recidive_yes_no_id
1 "да",
0 "нет"
/metastases_yes_no_id
1 "да",
0 "нет"
/metastases_lung_yes_no_id
1 "да",
0 "нет"
/metastases_hepat_yes_no_id
1 "да",
0 "нет"
/metastases_osteo_yes_no_id
1 "да",
0 "нет"
/metastases_renal_yes_no_id
1 "да",
0 "нет"
/metastases_lymph_nodes_yes_no_id
1 "да",
0 "нет"
/metastases_plevra_yes_no_id
1 "да",
0 "нет"
/metastases_surgical_treat_yes_no_id
1 "да",
0 "нет"
/chem_1st_line_treat_yes_no_id
1 "да",
0 "нет"
/chem_1st_karboplatin_yes_no_id
1 "да",
0 "нет"
/chem_1st_cisplatin_yes_no_id
1 "да",
0 "нет"
/chem_1st_ciklofosfan_yes_no_id
1 "да",
0 "нет"
/chem_1st_paklitaksel_yes_no_id
1 "да",
0 "нет"
/chem_1st_doksorubicin_yes_no_id
1 "да",
0 "нет"
/chem_1st_bevacizumab_yes_no_id
1 "да",
0 "нет"
/chem_1st_topotekan_yes_no_id
1 "да",
0 "нет"
/chem_1st_gemcitabin_yes_no_id
1 "да",
0 "нет"
/chem_1st_vinorelbin_yes_no_id
1 "да",
0 "нет"
/chem_1st_irinotekan_yes_no_id
1 "да",
0 "нет"
/chem_1st_etopozid_yes_no_id
1 "да",
0 "нет"
/chem_1st_epirubicin_yes_no_id
1 "да",
0 "нет"
/chem_1st_docetaxel_yes_no_id
1 "да",
0 "нет"
/chem_1st_oksaliplatin_yes_no_id
1 "да",
0 "нет"
/chem_1st_trabektidin_yes_no_id
1 "да",
0 "нет"
/chem_1st_other_yes_no_id
1 "да",
0 "нет"
/chem_2st_trabectedin_yes_no_id
1 "да",
0 "нет"
/chem_2st_pld_yes_no_id
1 "да",
0 "нет"
/chem_2st_doxopeg_yes_no_id
1 "да",
0 "нет"
/chem_2st_kelix_yes_no_id
1 "да",
0 "нет"
/chem_2st_doksorubicin_yes_no_id
1 "да",
0 "нет"
/chem_2st_other_yes_no_id
1 "да",
0 "нет"
/undesirable_event_yes_no_id
1 "да",
0 "нет".

MISSING VALUES
id
patient_id
visit_id
weight_kg
height_sm
nationality_id
place_living_id
education_id
social_economic_status_id
diag_cancer_tnm_stage_t_id
diag_cancer_tnm_stage_n_id
diag_cancer_tnm_stage_m_id
diag_cancer_clin_stage_id
surgical_treat_yes_no_id
surgical_treat_ecstir_yes_no_id
surgical_treatment_gister01_yes_no_id
surgical_treatment_gister02_yes_no_id
surgical_treatment_gister03_yes_no_id
surgical_treatment_diag_laparotomia_yes_no_id
surgical_treatment_diag_laparoscopia_yes_no_id
surgical_treatment_explorat_laparotomia_yes_no_id
chem_treat_yes_no_id
chem_treat_antracyc_yes_no_id
chem_treat_platina_yes_no_id
chem_treat_taxans_yes_no_id
chem_treat_cyclophosph_yes_no_id
chem_treat_other_yes_no_id
progress_ca125_yes_no_id
progress_ca125
progress_instr_mrt_yes_no_id
progress_instr_mrt_norm_yes_no_id
progress_instr_us_yes_no_id
progress_instr_us_norm_yes_no_id
progress_instr_kt_yes_no_id
progress_instr_kt_norm_yes_no_id
progress_instr_ekg_yes_no_id
progress_instr_ekg_norm_yes_no_id
recidive_yes_no_id
metastases_yes_no_id
metastases_lung_yes_no_id
metastases_hepat_yes_no_id
metastases_osteo_yes_no_id
metastases_renal_yes_no_id
metastases_lymph_nodes_yes_no_id
metastases_plevra_yes_no_id
metastases_surgical_treat_yes_no_id
chem_1st_line_treat_yes_no_id
chem_1st_karboplatin_yes_no_id
chem_1st_cisplatin_yes_no_id
chem_1st_ciklofosfan_yes_no_id
chem_1st_paklitaksel_yes_no_id
chem_1st_doksorubicin_yes_no_id
chem_1st_bevacizumab_yes_no_id
chem_1st_topotekan_yes_no_id
chem_1st_gemcitabin_yes_no_id
chem_1st_vinorelbin_yes_no_id
chem_1st_irinotekan_yes_no_id
chem_1st_etopozid_yes_no_id
chem_1st_epirubicin_yes_no_id
chem_1st_docetaxel_yes_no_id
chem_1st_oksaliplatin_yes_no_id
chem_1st_trabektidin_yes_no_id
chem_1st_other_yes_no_id
chem_1st_course_number
chem_2st_trabectedin_yes_no_id
chem_2st_trabectedin_dose
chem_2st_pld_yes_no_id
chem_2st_pld_dose
chem_2st_doxopeg_yes_no_id
chem_2st_doxopeg_dose
chem_2st_kelix_yes_no_id
chem_2st_kelix_dose
chem_2st_doksorubicin_yes_no_id
chem_2st_doksorubicin_dose
chem_2st_other_yes_no_id
chem_2st_other_dose
undesirable_event_yes_no_id
checked (-1).

FREQUENCIES VARIABLES=
nationality_id
place_living_id
education_id
social_economic_status_id
diag_cancer_tnm_stage_t_id
diag_cancer_tnm_stage_n_id
diag_cancer_tnm_stage_m_id
diag_cancer_clin_stage_id
surgical_treat_yes_no_id
surgical_treat_ecstir_yes_no_id
surgical_treatment_gister01_yes_no_id
surgical_treatment_gister02_yes_no_id
surgical_treatment_gister03_yes_no_id
surgical_treatment_diag_laparotomia_yes_no_id
surgical_treatment_diag_laparoscopia_yes_no_id
surgical_treatment_explorat_laparotomia_yes_no_id
chem_treat_yes_no_id
chem_treat_antracyc_yes_no_id
chem_treat_platina_yes_no_id
chem_treat_taxans_yes_no_id
chem_treat_cyclophosph_yes_no_id
chem_treat_other_yes_no_id
progress_ca125_yes_no_id
progress_instr_mrt_yes_no_id
progress_instr_mrt_norm_yes_no_id
progress_instr_us_yes_no_id
progress_instr_us_norm_yes_no_id
progress_instr_kt_yes_no_id
progress_instr_kt_norm_yes_no_id
progress_instr_ekg_yes_no_id
progress_instr_ekg_norm_yes_no_id
recidive_yes_no_id
metastases_yes_no_id
metastases_lung_yes_no_id
metastases_hepat_yes_no_id
metastases_osteo_yes_no_id
metastases_renal_yes_no_id
metastases_lymph_nodes_yes_no_id
metastases_plevra_yes_no_id
metastases_surgical_treat_yes_no_id
chem_1st_line_treat_yes_no_id
chem_1st_karboplatin_yes_no_id
chem_1st_cisplatin_yes_no_id
chem_1st_ciklofosfan_yes_no_id
chem_1st_paklitaksel_yes_no_id
chem_1st_doksorubicin_yes_no_id
chem_1st_bevacizumab_yes_no_id
chem_1st_topotekan_yes_no_id
chem_1st_gemcitabin_yes_no_id
chem_1st_vinorelbin_yes_no_id
chem_1st_irinotekan_yes_no_id
chem_1st_etopozid_yes_no_id
chem_1st_epirubicin_yes_no_id
chem_1st_docetaxel_yes_no_id
chem_1st_oksaliplatin_yes_no_id
chem_1st_trabektidin_yes_no_id
chem_1st_other_yes_no_id
chem_2st_trabectedin_yes_no_id
chem_2st_pld_yes_no_id
chem_2st_doxopeg_yes_no_id
chem_2st_kelix_yes_no_id
chem_2st_doksorubicin_yes_no_id
chem_2st_other_yes_no_id
undesirable_event_yes_no_id
/ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=
age_diag
age_visit
weight_kg
height_sm
progress_ca125
chem_1st_course_number
chem_2st_trabectedin_dose
pld_or_doxopeg_or_kelix_sum
chem_2st_doksorubicin_dose
chem_2st_other_dose
checked
/STATISTICS=MEAN STDDEV VARIANCE RANGE MIN MAX SEMEAN.

 * chem_2st_pld_dose
chem_2st_doxopeg_dose
chem_2st_kelix_dose

NPAR TESTS
K-S(NORMAL)=
weight_kg
height_sm
progress_ca125
chem_1st_course_number
chem_2st_trabectedin_dose
chem_2st_pld_dose
chem_2st_doxopeg_dose
chem_2st_kelix_dose
chem_2st_doksorubicin_dose
chem_2st_other_dose
pld_or_doxopeg_or_kelix_sum
/MISSING ANALYSIS.

* Экспортировать вывод.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /XLS  DOCUMENTFILE='C:\temp\ovarian_stat_20190910\report\02_ovarian_general_data.xls'
     OPERATION=CREATEFILE
     LOCATION=LASTCOLUMN  NOTESCAPTIONS=YES.
