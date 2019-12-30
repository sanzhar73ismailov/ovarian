GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\04_ovarian_lab.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME Наборданных1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "Пациент (внеш.ключ)",
visit_id "Визит",
visit_date "Дата визита",
ca125_yes_no_id "СА 125 да/нет",
ca125 "СА 125 Ед/мл",
ca125_date "СА 125 - дата проведения",
oak_yes_no_id "ОАК да/нет",
oak_date "ОАК - дата проведения",
oak_hb "ОАК - Гемоглобин г/л",
oak_er "ОАК - Эритроциты 10Х12",
oak_leuc "ОАК - Лейкоциты 10Х9",
oak_tr "ОАК - Тромбоциты 10Х9",
oak_netr "ОАК - Нейтрофилы 10Х9",
bc_yes_no_id "БАК да/нет",
bc_protein_yes_no_id "БАК - Общий белок да/нет",
bc_protein "БАК - Общий белок мкмоль/л",
bc_protein_date "БАК - Общий белок дата проведения",
bc_bilirubin_yes_no_id "БАК - Билирубин да/нет",
bc_bilirubin_total_yes_no_id "БАК - Билирубин общий да/нет",
bc_bilirubin_total "БАК - Билирубин общий мкмоль/л",
bc_bilirubin_total_date "БАК - Билирубин общий дата проведения",
bc_bilirubin_direct_yes_no_id "БАК - Билирубин прямой да/нет",
bc_bilirubin_direct "БАК - Билирубин прямой мкмоль/л",
bc_bilirubin_direct_date "БАК - Билирубин прямой дата проведения",
bc_bilirubin_nondirect_yes_no_id "БАК - Билирубин непрямой да/нет",
bc_bilirubin_nondirect "БАК - Билирубин непрямой мкмоль/л",
bc_bilirubin_nondirect_date "БАК - Билирубин непрямой дата проведения",
bc_ast_yes_no_id "БАК - АСТ да/нет",
bc_ast "БАК - АСТ ме/л",
bc_ast_date "БАК - АСТ дата проведения",
bc_alt_yes_no_id "БАК - АЛТ да/нет",
bc_alt "БАК - АЛТ ме/л",
bc_alt_date "БАК - АЛТ дата проведения",
bc_creat_yes_no_id "БАК - Креатинин да/нет",
bc_creat "БАК - Креатинин мг/дл",
bc_creat_date "БАК - Креатинин дата проведения",
bc_alk_phosphatase_yes_no_id "БАК - Щелочная фосфатаза да/нет",
bc_alk_phosphatase "БАК - Щелочная фосфатаза ед/л",
bc_alk_phosphatase_date "БАК - Щелочная фосфатаза дата проведения",
bc_mochevina_yes_no_id "БАК - Мочевина да/нет",
bc_mochevina "БАК - Мочевина мкмоль/л",
bc_mochevina_date "БАК - Мочевина дата проведения",
checked "Проверено монитором",
user "Пользователь",
insert_date "Дата регистрации".

VALUE LABELS
ca125_yes_no_id
1 "да",
0 "нет"
/oak_yes_no_id
1 "да",
0 "нет"
/bc_yes_no_id
1 "да",
0 "нет"
/bc_protein_yes_no_id
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id
1 "да",
0 "нет"
/bc_ast_yes_no_id
1 "да",
0 "нет"
/bc_alt_yes_no_id
1 "да",
0 "нет"
/bc_creat_yes_no_id
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id
1 "да",
0 "нет"
/bc_mochevina_yes_no_id
1 "да",
0 "нет".

MISSING VALUES
patient_id
visit_id
ca125_yes_no_id
ca125
oak_yes_no_id
oak_hb
oak_er
oak_leuc
oak_tr
oak_netr
bc_yes_no_id
bc_protein_yes_no_id
bc_protein
bc_bilirubin_yes_no_id
bc_bilirubin_total_yes_no_id
bc_bilirubin_total
bc_bilirubin_direct_yes_no_id
bc_bilirubin_direct
bc_bilirubin_nondirect_yes_no_id
bc_bilirubin_nondirect
bc_ast_yes_no_id
bc_ast
bc_alt_yes_no_id
bc_alt
bc_creat_yes_no_id
bc_creat
bc_alk_phosphatase_yes_no_id
bc_alk_phosphatase
bc_mochevina_yes_no_id
bc_mochevina (-1).

SORT CASES BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=
ca125_yes_no_id
oak_yes_no_id
bc_yes_no_id
bc_protein_yes_no_id
bc_bilirubin_yes_no_id
bc_bilirubin_total_yes_no_id
bc_bilirubin_direct_yes_no_id
bc_bilirubin_nondirect_yes_no_id
bc_ast_yes_no_id
bc_alt_yes_no_id
bc_creat_yes_no_id
bc_alk_phosphatase_yes_no_id
bc_mochevina_yes_no_id
/ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=
ca125
oak_hb
oak_er
oak_leuc
oak_tr
oak_netr
bc_protein
bc_bilirubin_total
bc_bilirubin_direct
bc_bilirubin_nondirect
bc_ast
bc_alt
bc_creat
bc_alk_phosphatase
bc_mochevina
/STATISTICS=MEAN STDDEV VARIANCE RANGE MIN MAX SEMEAN.

NPAR TESTS
K-S(NORMAL)=
ca125
oak_hb
oak_er
oak_leuc
oak_tr
oak_netr
bc_protein
bc_bilirubin_total
bc_bilirubin_direct
bc_bilirubin_nondirect
bc_ast
bc_alt
bc_creat
bc_alk_phosphatase
bc_mochevina
/MISSING ANALYSIS.

SPLIT FILE OFF.

CROSSTABS
/TABLES=ca125_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=oak_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_protein_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_bilirubin_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_bilirubin_total_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_bilirubin_direct_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_bilirubin_nondirect_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_ast_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_alt_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_creat_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_alk_phosphatase_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.

CROSSTABS
/TABLES=bc_mochevina_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.