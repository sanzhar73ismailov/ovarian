GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\07a_ovarian_adverse_event_details.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME Наборданных1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "Пациент (внеш.ключ)",
visit_id "Визит",
hospital_id  "Номер сайта (мед. центра)",
patient_number "Номер пациента",
adverse_event_yes_no_id "Отмечались неблагоприятные явления да/нет",
user "Пользователь",
insert_date "Дата регистрации",
name "Наименование явления (строковое описание)",
serious_yes_no_id "Это серьезное явление? Да/Нет",
start_date "Дата начала",
resolved_yes_no_id "Явление разрешилось? Да/Нет",
resolved_date "Дата разрешения явления",
event_intensity_decreased_yes_no_id "Выраженность явления снизилась после прекращения приема препарата или уменьшения его дозы?",
event_occurred_again_yes_no_id "Явление возникло повторно после возобновления приема препарата?",
event_associated_with_drug_yes_no_id "Явление связано с приемом препарата компании J&J?".

VALUE LABELS
hospital_id
1 "Сайт 001 - Казахский научно-исследовательский институт онкологии и радиологии (КазНИИОиР)",
2 "Сайт 002 - Городской онкологический диспансер г.Алматы",
3 "Сайт 003 - Южно-Казахстанский областной онкологический диспансер",
4 "Сайт 004 - Онкологический центр г. Астана",
5 "Сайт 005 - Областной онкологический диспансер ЗКО",
6 "Сайт 006 - Павлодарский областной онкологический диспансер",
7 "Сайт 007 - Восточно-Казахстанский областной онкологический диспансер",
8 "Сайт 008 - Областной онкологический диспансер СКО",
9 "Сайт 009 - Жамбылский областной онкологический диспансер",
10 "Сайт 010 - Кызылординский областной онкологический диспансер",
11 "Сайт 011 - Областной онкологический диспансер г. Семей",
/adverse_event_yes_no_id
serious_yes_no_id
resolved_yes_no_id
event_intensity_decreased_yes_no_id
event_occurred_again_yes_no_id
event_associated_with_drug_yes_no_id
1 "да",
0 "нет".

MISSING VALUES
patient_id
visit_id
adverse_event_yes_no_id (-1).

USE ALL.
COMPUTE filter_$=(adverse_event_yes_no_id=1).
VARIABLE LABEL filter_$ 'adverse_event_yes_no_id=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=
name serious_yes_no_id 
resolved_yes_no_id 
event_intensity_decreased_yes_no_id 
event_occurred_again_yes_no_id 
event_associated_with_drug_yes_no_id
  /ORDER=ANALYSIS.


SORT CASES  BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=name serious_yes_no_id resolved_yes_no_id event_intensity_decreased_yes_no_id 
    event_occurred_again_yes_no_id event_associated_with_drug_yes_no_id
  /ORDER=ANALYSIS.
