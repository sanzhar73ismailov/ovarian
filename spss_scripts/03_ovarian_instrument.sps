GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\03_ovarian_instrument.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME Наборданных1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "Пациент (внеш.ключ)",
visit_id "Визит",
instr_mrt_yes_no_id "Инструментальные исследования: МРТ ОМТ да/нет",
instr_mrt_date "Инструментальные исследования: МРТ ОМТ дата",
instr_mrt_norm_yes_no_id "Инструментальные исследования: МРТ ОМТ норма/патология",
instr_mrt_descr "Инструментальные исследования: МРТ ОМТ Заключение",
instr_us_yes_no_id "Инструментальные исследования: УЗИ ОБП да/нет",
instr_us_date "Инструментальные исследования: УЗИ ОБП дата",
instr_us_norm_yes_no_id "Инструментальные исследования: УЗИ ОБП норма/патология",
instr_us_descr "Инструментальные исследования: УЗИ ОБП Заключение",
instr_kt_yes_no_id "Инструментальные исследования: КТ ОГК да/нет",
instr_kt_date "Инструментальные исследования: КТ ОГК дата",
instr_kt_norm_yes_no_id "Инструментальные исследования: КТ ОГК норма/патология",
instr_kt_descr "Инструментальные исследования: КТ ОГК Заключение",
instr_ekg_yes_no_id "Инструментальные исследования: ЭКГ да/нет",
instr_ekg_date "Инструментальные исследования: ЭКГ дата",
instr_ekg_norm_yes_no_id "Инструментальные исследования: ЭКГ норма/патология",
instr_ekg_descr "Инструментальные исследования: ЭКГ Заключение",
checked "Проверено монитором",
user "Пользователь",
insert_date "Дата регистрации".
VALUE LABELS
instr_mrt_yes_no_id
1 "да",
0 "нет"
/instr_mrt_norm_yes_no_id
1 "да",
0 "нет"
/instr_us_yes_no_id
1 "да",
0 "нет"
/instr_us_norm_yes_no_id
1 "да",
0 "нет"
/instr_kt_yes_no_id
1 "да",
0 "нет"
/instr_kt_norm_yes_no_id
1 "да",
0 "нет"
/instr_ekg_yes_no_id
1 "да",
0 "нет"
/instr_ekg_norm_yes_no_id
1 "да",
0 "нет".

MISSING VALUES
patient_id
visit_id
instr_mrt_yes_no_id
instr_mrt_norm_yes_no_id
instr_us_yes_no_id
instr_us_norm_yes_no_id
instr_kt_yes_no_id
instr_kt_norm_yes_no_id
instr_ekg_yes_no_id
instr_ekg_norm_yes_no_id (-1).

SORT CASES BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=
instr_mrt_yes_no_id
instr_mrt_norm_yes_no_id
instr_us_yes_no_id
instr_us_norm_yes_no_id
instr_kt_yes_no_id
instr_kt_norm_yes_no_id
instr_ekg_yes_no_id
instr_ekg_norm_yes_no_id
/ORDER=ANALYSIS.

*DESCRIPTIVES VARIABLES - No parameters.

*Kolmogor-Smirnov NPAR TESTS - No parameters.
SPLIT FILE OFF.

CROSSTABS
/TABLES=instr_mrt_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_mrt_norm_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_us_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_us_norm_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_kt_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_kt_norm_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_ekg_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=instr_ekg_norm_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.