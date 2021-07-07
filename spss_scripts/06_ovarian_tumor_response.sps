GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\06_ovarian_tumor_response.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME Наборданных1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "Пациент (внеш.ключ)",
visit_id "Визит",
full_response_yes_no_id "Объективная оценка эффективности лечения (RECIST*) Полный ответ (да, нет)",
partial_response_yes_no_id "Объективная оценка эффективности лечения (RECIST*) Частичный ответ (да, нет)",
progress_desease_yes_no_id "Объективная оценка эффективности лечения (RECIST*) Прогрессирование заболевания (да, нет)",
stabilization_desease_yes_no_id "Объективная оценка эффективности лечения (RECIST*) Стабилизация заболевания (да, нет)",
response "эффективность лечения", 
checked "Проверено монитором",
user "Пользователь",
insert_date "Дата регистрации".
VALUE LABELS
full_response_yes_no_id
1 "да",
0 "нет"
/partial_response_yes_no_id
1 "да",
0 "нет"
/progress_desease_yes_no_id
1 "да",
0 "нет"
/stabilization_desease_yes_no_id
1 "да",
0 "нет"
/response
1 "Прогрессирование заболевания",
2 "Стабилизация заболевания",
3 "Частичный ответ",
4 "Полный ответ"
.

MISSING VALUES
patient_id
visit_id
full_response_yes_no_id
partial_response_yes_no_id
progress_desease_yes_no_id
stabilization_desease_yes_no_id (-1).

SORT CASES BY visit_id.
SPLIT FILE LAYERED BY visit_id.

 * FREQUENCIES VARIABLES=
full_response_yes_no_id
partial_response_yes_no_id
progress_desease_yes_no_id
stabilization_desease_yes_no_id
/ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
response
/ORDER=ANALYSIS.

*DESCRIPTIVES VARIABLES - No parameters.

*Kolmogor-Smirnov NPAR TESTS - No parameters.
SPLIT FILE OFF.

CROSSTABS
/TABLES=full_response_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=partial_response_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=progress_desease_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=stabilization_desease_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=response BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.