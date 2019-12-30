GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\05_ovarian_therapy_continue.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME Наборданных1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "Пациент (внеш.ключ)",
visit_id "Визит",
therap_trab_continue_yes_no_id "Продолжена терапия трабектедином в комбинации с ПЛД: Лечение продолжается без изменений да/нет",
therap_trab_continue_no_cause_id "Продолжена терапия трабектедином в комбинации с ПЛД: Если нет, укажите причину",
checked "Проверено монитором",
user "Пользователь",
insert_date "Дата регистрации".

VALUE LABELS
therap_trab_continue_yes_no_id
1 "да",
0 "нет"
/therap_trab_continue_no_cause_id
-1 "нет данных",
1 "Пациент отказался от лечения ",
2 "Лечение остановлено по причине переезда пациента",
3 "Лечение остановлено по решению исследователя".

MISSING VALUES
patient_id
visit_id
therap_trab_continue_yes_no_id
therap_trab_continue_no_cause_id (-1).

SORT CASES BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=
therap_trab_continue_yes_no_id
therap_trab_continue_no_cause_id
/ORDER=ANALYSIS.

*DESCRIPTIVES VARIABLES - No parameters.

*Kolmogor-Smirnov NPAR TESTS - No parameters.
SPLIT FILE OFF.

CROSSTABS
/TABLES=therap_trab_continue_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=therap_trab_continue_no_cause_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.