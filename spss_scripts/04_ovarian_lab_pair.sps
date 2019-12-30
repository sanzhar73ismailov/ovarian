GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\04_ovarian_lab.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME Наборданных1 WINDOW=FRONT. 

SORT CASES BY patient_id visit_id. 
CASESTOVARS 
  /ID=patient_id 
  /INDEX=visit_id 
  /GROUPBY=VARIABLE.

VARIABLE LABELS
ca125_yes_no_id.1 "СА 125 да/нет. Визит 1",
ca125_yes_no_id.2 "СА 125 да/нет. Визит 2",
ca125_yes_no_id.3 "СА 125 да/нет. Визит 3",
ca125_yes_no_id.4 "СА 125 да/нет. Визит 4",
ca125_yes_no_id.5 "СА 125 да/нет. Визит 5",
ca125_yes_no_id.6 "СА 125 да/нет. Визит 6",
ca125_yes_no_id.7 "СА 125 да/нет. Визит 7",
ca125_yes_no_id.8 "СА 125 да/нет. Визит 8",
ca125.1 "СА 125 Ед/мл. Визит 1",
ca125.2 "СА 125 Ед/мл. Визит 2",
ca125.3 "СА 125 Ед/мл. Визит 3",
ca125.4 "СА 125 Ед/мл. Визит 4",
ca125.5 "СА 125 Ед/мл. Визит 5",
ca125.6 "СА 125 Ед/мл. Визит 6",
ca125.7 "СА 125 Ед/мл. Визит 7",
ca125.8 "СА 125 Ед/мл. Визит 8",
oak_yes_no_id.1 "ОАК да/нет. Визит 1",
oak_yes_no_id.2 "ОАК да/нет. Визит 2",
oak_yes_no_id.3 "ОАК да/нет. Визит 3",
oak_yes_no_id.4 "ОАК да/нет. Визит 4",
oak_yes_no_id.5 "ОАК да/нет. Визит 5",
oak_yes_no_id.6 "ОАК да/нет. Визит 6",
oak_yes_no_id.7 "ОАК да/нет. Визит 7",
oak_yes_no_id.8 "ОАК да/нет. Визит 8",
oak_hb.1 "ОАК - Гемоглобин г/л. Визит 1",
oak_hb.2 "ОАК - Гемоглобин г/л. Визит 2",
oak_hb.3 "ОАК - Гемоглобин г/л. Визит 3",
oak_hb.4 "ОАК - Гемоглобин г/л. Визит 4",
oak_hb.5 "ОАК - Гемоглобин г/л. Визит 5",
oak_hb.6 "ОАК - Гемоглобин г/л. Визит 6",
oak_hb.7 "ОАК - Гемоглобин г/л. Визит 7",
oak_hb.8 "ОАК - Гемоглобин г/л. Визит 8",
oak_er.1 "ОАК - Эритроциты 10Х12. Визит 1",
oak_er.2 "ОАК - Эритроциты 10Х12. Визит 2",
oak_er.3 "ОАК - Эритроциты 10Х12. Визит 3",
oak_er.4 "ОАК - Эритроциты 10Х12. Визит 4",
oak_er.5 "ОАК - Эритроциты 10Х12. Визит 5",
oak_er.6 "ОАК - Эритроциты 10Х12. Визит 6",
oak_er.7 "ОАК - Эритроциты 10Х12. Визит 7",
oak_er.8 "ОАК - Эритроциты 10Х12. Визит 8",
oak_leuc.1 "ОАК - Лейкоциты 10Х9. Визит 1",
oak_leuc.2 "ОАК - Лейкоциты 10Х9. Визит 2",
oak_leuc.3 "ОАК - Лейкоциты 10Х9. Визит 3",
oak_leuc.4 "ОАК - Лейкоциты 10Х9. Визит 4",
oak_leuc.5 "ОАК - Лейкоциты 10Х9. Визит 5",
oak_leuc.6 "ОАК - Лейкоциты 10Х9. Визит 6",
oak_leuc.7 "ОАК - Лейкоциты 10Х9. Визит 7",
oak_leuc.8 "ОАК - Лейкоциты 10Х9. Визит 8",
oak_tr.1 "ОАК - Тромбоциты 10Х9. Визит 1",
oak_tr.2 "ОАК - Тромбоциты 10Х9. Визит 2",
oak_tr.3 "ОАК - Тромбоциты 10Х9. Визит 3",
oak_tr.4 "ОАК - Тромбоциты 10Х9. Визит 4",
oak_tr.5 "ОАК - Тромбоциты 10Х9. Визит 5",
oak_tr.6 "ОАК - Тромбоциты 10Х9. Визит 6",
oak_tr.7 "ОАК - Тромбоциты 10Х9. Визит 7",
oak_tr.8 "ОАК - Тромбоциты 10Х9. Визит 8",
oak_netr.1 "ОАК - Нейтрофилы 10Х9. Визит 1",
oak_netr.2 "ОАК - Нейтрофилы 10Х9. Визит 2",
oak_netr.3 "ОАК - Нейтрофилы 10Х9. Визит 3",
oak_netr.4 "ОАК - Нейтрофилы 10Х9. Визит 4",
oak_netr.5 "ОАК - Нейтрофилы 10Х9. Визит 5",
oak_netr.6 "ОАК - Нейтрофилы 10Х9. Визит 6",
oak_netr.7 "ОАК - Нейтрофилы 10Х9. Визит 7",
oak_netr.8 "ОАК - Нейтрофилы 10Х9. Визит 8",
bc_yes_no_id.1 "БАК да/нет. Визит 1",
bc_yes_no_id.2 "БАК да/нет. Визит 2",
bc_yes_no_id.3 "БАК да/нет. Визит 3",
bc_yes_no_id.4 "БАК да/нет. Визит 4",
bc_yes_no_id.5 "БАК да/нет. Визит 5",
bc_yes_no_id.6 "БАК да/нет. Визит 6",
bc_yes_no_id.7 "БАК да/нет. Визит 7",
bc_yes_no_id.8 "БАК да/нет. Визит 8",
bc_protein_yes_no_id.1 "БАК - Общий белок да/нет. Визит 1",
bc_protein_yes_no_id.2 "БАК - Общий белок да/нет. Визит 2",
bc_protein_yes_no_id.3 "БАК - Общий белок да/нет. Визит 3",
bc_protein_yes_no_id.4 "БАК - Общий белок да/нет. Визит 4",
bc_protein_yes_no_id.5 "БАК - Общий белок да/нет. Визит 5",
bc_protein_yes_no_id.6 "БАК - Общий белок да/нет. Визит 6",
bc_protein_yes_no_id.7 "БАК - Общий белок да/нет. Визит 7",
bc_protein_yes_no_id.8 "БАК - Общий белок да/нет. Визит 8",
bc_protein.1 "БАК - Общий белок мкмоль/л. Визит 1",
bc_protein.2 "БАК - Общий белок мкмоль/л. Визит 2",
bc_protein.3 "БАК - Общий белок мкмоль/л. Визит 3",
bc_protein.4 "БАК - Общий белок мкмоль/л. Визит 4",
bc_protein.5 "БАК - Общий белок мкмоль/л. Визит 5",
bc_protein.6 "БАК - Общий белок мкмоль/л. Визит 6",
bc_protein.7 "БАК - Общий белок мкмоль/л. Визит 7",
bc_protein.8 "БАК - Общий белок мкмоль/л. Визит 8",
bc_bilirubin_yes_no_id.1 "БАК - Билирубин да/нет. Визит 1",
bc_bilirubin_yes_no_id.2 "БАК - Билирубин да/нет. Визит 2",
bc_bilirubin_yes_no_id.3 "БАК - Билирубин да/нет. Визит 3",
bc_bilirubin_yes_no_id.4 "БАК - Билирубин да/нет. Визит 4",
bc_bilirubin_yes_no_id.5 "БАК - Билирубин да/нет. Визит 5",
bc_bilirubin_yes_no_id.6 "БАК - Билирубин да/нет. Визит 6",
bc_bilirubin_yes_no_id.7 "БАК - Билирубин да/нет. Визит 7",
bc_bilirubin_yes_no_id.8 "БАК - Билирубин да/нет. Визит 8",
bc_bilirubin_total_yes_no_id.1 "БАК - Билирубин общий да/нет. Визит 1",
bc_bilirubin_total_yes_no_id.2 "БАК - Билирубин общий да/нет. Визит 2",
bc_bilirubin_total_yes_no_id.3 "БАК - Билирубин общий да/нет. Визит 3",
bc_bilirubin_total_yes_no_id.4 "БАК - Билирубин общий да/нет. Визит 4",
bc_bilirubin_total_yes_no_id.5 "БАК - Билирубин общий да/нет. Визит 5",
bc_bilirubin_total_yes_no_id.6 "БАК - Билирубин общий да/нет. Визит 6",
bc_bilirubin_total_yes_no_id.7 "БАК - Билирубин общий да/нет. Визит 7",
bc_bilirubin_total_yes_no_id.8 "БАК - Билирубин общий да/нет. Визит 8",
bc_bilirubin_total.1 "БАК - Билирубин общий мкмоль/л. Визит 1",
bc_bilirubin_total.2 "БАК - Билирубин общий мкмоль/л. Визит 2",
bc_bilirubin_total.3 "БАК - Билирубин общий мкмоль/л. Визит 3",
bc_bilirubin_total.4 "БАК - Билирубин общий мкмоль/л. Визит 4",
bc_bilirubin_total.5 "БАК - Билирубин общий мкмоль/л. Визит 5",
bc_bilirubin_total.6 "БАК - Билирубин общий мкмоль/л. Визит 6",
bc_bilirubin_total.7 "БАК - Билирубин общий мкмоль/л. Визит 7",
bc_bilirubin_total.8 "БАК - Билирубин общий мкмоль/л. Визит 8",
bc_bilirubin_direct_yes_no_id.1 "БАК - Билирубин прямой да/нет. Визит 1",
bc_bilirubin_direct_yes_no_id.2 "БАК - Билирубин прямой да/нет. Визит 2",
bc_bilirubin_direct_yes_no_id.3 "БАК - Билирубин прямой да/нет. Визит 3",
bc_bilirubin_direct_yes_no_id.4 "БАК - Билирубин прямой да/нет. Визит 4",
bc_bilirubin_direct_yes_no_id.5 "БАК - Билирубин прямой да/нет. Визит 5",
bc_bilirubin_direct_yes_no_id.6 "БАК - Билирубин прямой да/нет. Визит 6",
bc_bilirubin_direct_yes_no_id.7 "БАК - Билирубин прямой да/нет. Визит 7",
bc_bilirubin_direct_yes_no_id.8 "БАК - Билирубин прямой да/нет. Визит 8",
bc_bilirubin_direct.1 "БАК - Билирубин прямой мкмоль/л. Визит 1",
bc_bilirubin_direct.2 "БАК - Билирубин прямой мкмоль/л. Визит 2",
bc_bilirubin_direct.3 "БАК - Билирубин прямой мкмоль/л. Визит 3",
bc_bilirubin_direct.4 "БАК - Билирубин прямой мкмоль/л. Визит 4",
bc_bilirubin_direct.5 "БАК - Билирубин прямой мкмоль/л. Визит 5",
bc_bilirubin_direct.6 "БАК - Билирубин прямой мкмоль/л. Визит 6",
bc_bilirubin_direct.7 "БАК - Билирубин прямой мкмоль/л. Визит 7",
bc_bilirubin_direct.8 "БАК - Билирубин прямой мкмоль/л. Визит 8",
bc_bilirubin_nondirect_yes_no_id.1 "БАК - Билирубин непрямой да/нет. Визит 1",
bc_bilirubin_nondirect_yes_no_id.2 "БАК - Билирубин непрямой да/нет. Визит 2",
bc_bilirubin_nondirect_yes_no_id.3 "БАК - Билирубин непрямой да/нет. Визит 3",
bc_bilirubin_nondirect_yes_no_id.4 "БАК - Билирубин непрямой да/нет. Визит 4",
bc_bilirubin_nondirect_yes_no_id.5 "БАК - Билирубин непрямой да/нет. Визит 5",
bc_bilirubin_nondirect_yes_no_id.6 "БАК - Билирубин непрямой да/нет. Визит 6",
bc_bilirubin_nondirect_yes_no_id.7 "БАК - Билирубин непрямой да/нет. Визит 7",
bc_bilirubin_nondirect_yes_no_id.8 "БАК - Билирубин непрямой да/нет. Визит 8",
bc_bilirubin_nondirect.1 "БАК - Билирубин непрямой мкмоль/л. Визит 1",
bc_bilirubin_nondirect.2 "БАК - Билирубин непрямой мкмоль/л. Визит 2",
bc_bilirubin_nondirect.3 "БАК - Билирубин непрямой мкмоль/л. Визит 3",
bc_bilirubin_nondirect.4 "БАК - Билирубин непрямой мкмоль/л. Визит 4",
bc_bilirubin_nondirect.5 "БАК - Билирубин непрямой мкмоль/л. Визит 5",
bc_bilirubin_nondirect.6 "БАК - Билирубин непрямой мкмоль/л. Визит 6",
bc_bilirubin_nondirect.7 "БАК - Билирубин непрямой мкмоль/л. Визит 7",
bc_bilirubin_nondirect.8 "БАК - Билирубин непрямой мкмоль/л. Визит 8",
bc_ast_yes_no_id.1 "БАК - АСТ да/нет. Визит 1",
bc_ast_yes_no_id.2 "БАК - АСТ да/нет. Визит 2",
bc_ast_yes_no_id.3 "БАК - АСТ да/нет. Визит 3",
bc_ast_yes_no_id.4 "БАК - АСТ да/нет. Визит 4",
bc_ast_yes_no_id.5 "БАК - АСТ да/нет. Визит 5",
bc_ast_yes_no_id.6 "БАК - АСТ да/нет. Визит 6",
bc_ast_yes_no_id.7 "БАК - АСТ да/нет. Визит 7",
bc_ast_yes_no_id.8 "БАК - АСТ да/нет. Визит 8",
bc_ast.1 "БАК - АСТ ме/л. Визит 1",
bc_ast.2 "БАК - АСТ ме/л. Визит 2",
bc_ast.3 "БАК - АСТ ме/л. Визит 3",
bc_ast.4 "БАК - АСТ ме/л. Визит 4",
bc_ast.5 "БАК - АСТ ме/л. Визит 5",
bc_ast.6 "БАК - АСТ ме/л. Визит 6",
bc_ast.7 "БАК - АСТ ме/л. Визит 7",
bc_ast.8 "БАК - АСТ ме/л. Визит 8",
bc_alt_yes_no_id.1 "БАК - АЛТ да/нет. Визит 1",
bc_alt_yes_no_id.2 "БАК - АЛТ да/нет. Визит 2",
bc_alt_yes_no_id.3 "БАК - АЛТ да/нет. Визит 3",
bc_alt_yes_no_id.4 "БАК - АЛТ да/нет. Визит 4",
bc_alt_yes_no_id.5 "БАК - АЛТ да/нет. Визит 5",
bc_alt_yes_no_id.6 "БАК - АЛТ да/нет. Визит 6",
bc_alt_yes_no_id.7 "БАК - АЛТ да/нет. Визит 7",
bc_alt_yes_no_id.8 "БАК - АЛТ да/нет. Визит 8",
bc_alt.1 "БАК - АЛТ ме/л. Визит 1",
bc_alt.2 "БАК - АЛТ ме/л. Визит 2",
bc_alt.3 "БАК - АЛТ ме/л. Визит 3",
bc_alt.4 "БАК - АЛТ ме/л. Визит 4",
bc_alt.5 "БАК - АЛТ ме/л. Визит 5",
bc_alt.6 "БАК - АЛТ ме/л. Визит 6",
bc_alt.7 "БАК - АЛТ ме/л. Визит 7",
bc_alt.8 "БАК - АЛТ ме/л. Визит 8",
bc_creat_yes_no_id.1 "БАК - Креатинин да/нет. Визит 1",
bc_creat_yes_no_id.2 "БАК - Креатинин да/нет. Визит 2",
bc_creat_yes_no_id.3 "БАК - Креатинин да/нет. Визит 3",
bc_creat_yes_no_id.4 "БАК - Креатинин да/нет. Визит 4",
bc_creat_yes_no_id.5 "БАК - Креатинин да/нет. Визит 5",
bc_creat_yes_no_id.6 "БАК - Креатинин да/нет. Визит 6",
bc_creat_yes_no_id.7 "БАК - Креатинин да/нет. Визит 7",
bc_creat_yes_no_id.8 "БАК - Креатинин да/нет. Визит 8",
bc_creat.1 "БАК - Креатинин мг/дл. Визит 1",
bc_creat.2 "БАК - Креатинин мг/дл. Визит 2",
bc_creat.3 "БАК - Креатинин мг/дл. Визит 3",
bc_creat.4 "БАК - Креатинин мг/дл. Визит 4",
bc_creat.5 "БАК - Креатинин мг/дл. Визит 5",
bc_creat.6 "БАК - Креатинин мг/дл. Визит 6",
bc_creat.7 "БАК - Креатинин мг/дл. Визит 7",
bc_creat.8 "БАК - Креатинин мг/дл. Визит 8",
bc_alk_phosphatase_yes_no_id.1 "БАК - Щелочная фосфатаза да/нет. Визит 1",
bc_alk_phosphatase_yes_no_id.2 "БАК - Щелочная фосфатаза да/нет. Визит 2",
bc_alk_phosphatase_yes_no_id.3 "БАК - Щелочная фосфатаза да/нет. Визит 3",
bc_alk_phosphatase_yes_no_id.4 "БАК - Щелочная фосфатаза да/нет. Визит 4",
bc_alk_phosphatase_yes_no_id.5 "БАК - Щелочная фосфатаза да/нет. Визит 5",
bc_alk_phosphatase_yes_no_id.6 "БАК - Щелочная фосфатаза да/нет. Визит 6",
bc_alk_phosphatase_yes_no_id.7 "БАК - Щелочная фосфатаза да/нет. Визит 7",
bc_alk_phosphatase_yes_no_id.8 "БАК - Щелочная фосфатаза да/нет. Визит 8",
bc_alk_phosphatase.1 "БАК - Щелочная фосфатаза ед/л. Визит 1",
bc_alk_phosphatase.2 "БАК - Щелочная фосфатаза ед/л. Визит 2",
bc_alk_phosphatase.3 "БАК - Щелочная фосфатаза ед/л. Визит 3",
bc_alk_phosphatase.4 "БАК - Щелочная фосфатаза ед/л. Визит 4",
bc_alk_phosphatase.5 "БАК - Щелочная фосфатаза ед/л. Визит 5",
bc_alk_phosphatase.6 "БАК - Щелочная фосфатаза ед/л. Визит 6",
bc_alk_phosphatase.7 "БАК - Щелочная фосфатаза ед/л. Визит 7",
bc_alk_phosphatase.8 "БАК - Щелочная фосфатаза ед/л. Визит 8",
bc_mochevina_yes_no_id.1 "БАК - Мочевина да/нет. Визит 1",
bc_mochevina_yes_no_id.2 "БАК - Мочевина да/нет. Визит 2",
bc_mochevina_yes_no_id.3 "БАК - Мочевина да/нет. Визит 3",
bc_mochevina_yes_no_id.4 "БАК - Мочевина да/нет. Визит 4",
bc_mochevina_yes_no_id.5 "БАК - Мочевина да/нет. Визит 5",
bc_mochevina_yes_no_id.6 "БАК - Мочевина да/нет. Визит 6",
bc_mochevina_yes_no_id.7 "БАК - Мочевина да/нет. Визит 7",
bc_mochevina_yes_no_id.8 "БАК - Мочевина да/нет. Визит 8",
bc_mochevina.1 "БАК - Мочевина мкмоль/л. Визит 1",
bc_mochevina.2 "БАК - Мочевина мкмоль/л. Визит 2",
bc_mochevina.3 "БАК - Мочевина мкмоль/л. Визит 3",
bc_mochevina.4 "БАК - Мочевина мкмоль/л. Визит 4",
bc_mochevina.5 "БАК - Мочевина мкмоль/л. Визит 5",
bc_mochevina.6 "БАК - Мочевина мкмоль/л. Визит 6",
bc_mochevina.7 "БАК - Мочевина мкмоль/л. Визит 7",
bc_mochevina.8 "БАК - Мочевина мкмоль/л. Визит 8".

VALUE LABELS
ca125_yes_no_id.1
1 "да",
0 "нет"
/ca125_yes_no_id.2
1 "да",
0 "нет"
/ca125_yes_no_id.3
1 "да",
0 "нет"
/ca125_yes_no_id.4
1 "да",
0 "нет"
/ca125_yes_no_id.5
1 "да",
0 "нет"
/ca125_yes_no_id.6
1 "да",
0 "нет"
/ca125_yes_no_id.7
1 "да",
0 "нет"
/ca125_yes_no_id.8
1 "да",
0 "нет"
/oak_yes_no_id.1
1 "да",
0 "нет"
/oak_yes_no_id.2
1 "да",
0 "нет"
/oak_yes_no_id.3
1 "да",
0 "нет"
/oak_yes_no_id.4
1 "да",
0 "нет"
/oak_yes_no_id.5
1 "да",
0 "нет"
/oak_yes_no_id.6
1 "да",
0 "нет"
/oak_yes_no_id.7
1 "да",
0 "нет"
/oak_yes_no_id.8
1 "да",
0 "нет"
/bc_yes_no_id.1
1 "да",
0 "нет"
/bc_yes_no_id.2
1 "да",
0 "нет"
/bc_yes_no_id.3
1 "да",
0 "нет"
/bc_yes_no_id.4
1 "да",
0 "нет"
/bc_yes_no_id.5
1 "да",
0 "нет"
/bc_yes_no_id.6
1 "да",
0 "нет"
/bc_yes_no_id.7
1 "да",
0 "нет"
/bc_yes_no_id.8
1 "да",
0 "нет"
/bc_protein_yes_no_id.1
1 "да",
0 "нет"
/bc_protein_yes_no_id.2
1 "да",
0 "нет"
/bc_protein_yes_no_id.3
1 "да",
0 "нет"
/bc_protein_yes_no_id.4
1 "да",
0 "нет"
/bc_protein_yes_no_id.5
1 "да",
0 "нет"
/bc_protein_yes_no_id.6
1 "да",
0 "нет"
/bc_protein_yes_no_id.7
1 "да",
0 "нет"
/bc_protein_yes_no_id.8
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.1
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.2
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.3
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.4
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.5
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.6
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.7
1 "да",
0 "нет"
/bc_bilirubin_yes_no_id.8
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.1
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.2
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.3
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.4
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.5
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.6
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.7
1 "да",
0 "нет"
/bc_bilirubin_total_yes_no_id.8
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.1
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.2
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.3
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.4
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.5
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.6
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.7
1 "да",
0 "нет"
/bc_bilirubin_direct_yes_no_id.8
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.1
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.2
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.3
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.4
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.5
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.6
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.7
1 "да",
0 "нет"
/bc_bilirubin_nondirect_yes_no_id.8
1 "да",
0 "нет"
/bc_ast_yes_no_id.1
1 "да",
0 "нет"
/bc_ast_yes_no_id.2
1 "да",
0 "нет"
/bc_ast_yes_no_id.3
1 "да",
0 "нет"
/bc_ast_yes_no_id.4
1 "да",
0 "нет"
/bc_ast_yes_no_id.5
1 "да",
0 "нет"
/bc_ast_yes_no_id.6
1 "да",
0 "нет"
/bc_ast_yes_no_id.7
1 "да",
0 "нет"
/bc_ast_yes_no_id.8
1 "да",
0 "нет"
/bc_alt_yes_no_id.1
1 "да",
0 "нет"
/bc_alt_yes_no_id.2
1 "да",
0 "нет"
/bc_alt_yes_no_id.3
1 "да",
0 "нет"
/bc_alt_yes_no_id.4
1 "да",
0 "нет"
/bc_alt_yes_no_id.5
1 "да",
0 "нет"
/bc_alt_yes_no_id.6
1 "да",
0 "нет"
/bc_alt_yes_no_id.7
1 "да",
0 "нет"
/bc_alt_yes_no_id.8
1 "да",
0 "нет"
/bc_creat_yes_no_id.1
1 "да",
0 "нет"
/bc_creat_yes_no_id.2
1 "да",
0 "нет"
/bc_creat_yes_no_id.3
1 "да",
0 "нет"
/bc_creat_yes_no_id.4
1 "да",
0 "нет"
/bc_creat_yes_no_id.5
1 "да",
0 "нет"
/bc_creat_yes_no_id.6
1 "да",
0 "нет"
/bc_creat_yes_no_id.7
1 "да",
0 "нет"
/bc_creat_yes_no_id.8
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.1
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.2
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.3
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.4
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.5
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.6
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.7
1 "да",
0 "нет"
/bc_alk_phosphatase_yes_no_id.8
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.1
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.2
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.3
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.4
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.5
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.6
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.7
1 "да",
0 "нет"
/bc_mochevina_yes_no_id.8
1 "да",
0 "нет".

MISSING VALUES
ca125_yes_no_id.1
ca125_yes_no_id.2
ca125_yes_no_id.3
ca125_yes_no_id.4
ca125_yes_no_id.5
ca125_yes_no_id.6
ca125_yes_no_id.7
ca125_yes_no_id.8
ca125.1
ca125.2
ca125.3
ca125.4
ca125.5
ca125.6
ca125.7
ca125.8
oak_yes_no_id.1
oak_yes_no_id.2
oak_yes_no_id.3
oak_yes_no_id.4
oak_yes_no_id.5
oak_yes_no_id.6
oak_yes_no_id.7
oak_yes_no_id.8
oak_hb.1
oak_hb.2
oak_hb.3
oak_hb.4
oak_hb.5
oak_hb.6
oak_hb.7
oak_hb.8
oak_er.1
oak_er.2
oak_er.3
oak_er.4
oak_er.5
oak_er.6
oak_er.7
oak_er.8
oak_leuc.1
oak_leuc.2
oak_leuc.3
oak_leuc.4
oak_leuc.5
oak_leuc.6
oak_leuc.7
oak_leuc.8
oak_tr.1
oak_tr.2
oak_tr.3
oak_tr.4
oak_tr.5
oak_tr.6
oak_tr.7
oak_tr.8
oak_netr.1
oak_netr.2
oak_netr.3
oak_netr.4
oak_netr.5
oak_netr.6
oak_netr.7
oak_netr.8
bc_yes_no_id.1
bc_yes_no_id.2
bc_yes_no_id.3
bc_yes_no_id.4
bc_yes_no_id.5
bc_yes_no_id.6
bc_yes_no_id.7
bc_yes_no_id.8
bc_protein_yes_no_id.1
bc_protein_yes_no_id.2
bc_protein_yes_no_id.3
bc_protein_yes_no_id.4
bc_protein_yes_no_id.5
bc_protein_yes_no_id.6
bc_protein_yes_no_id.7
bc_protein_yes_no_id.8
bc_protein.1
bc_protein.2
bc_protein.3
bc_protein.4
bc_protein.5
bc_protein.6
bc_protein.7
bc_protein.8
bc_bilirubin_yes_no_id.1
bc_bilirubin_yes_no_id.2
bc_bilirubin_yes_no_id.3
bc_bilirubin_yes_no_id.4
bc_bilirubin_yes_no_id.5
bc_bilirubin_yes_no_id.6
bc_bilirubin_yes_no_id.7
bc_bilirubin_yes_no_id.8
bc_bilirubin_total_yes_no_id.1
bc_bilirubin_total_yes_no_id.2
bc_bilirubin_total_yes_no_id.3
bc_bilirubin_total_yes_no_id.4
bc_bilirubin_total_yes_no_id.5
bc_bilirubin_total_yes_no_id.6
bc_bilirubin_total_yes_no_id.7
bc_bilirubin_total_yes_no_id.8
bc_bilirubin_total.1
bc_bilirubin_total.2
bc_bilirubin_total.3
bc_bilirubin_total.4
bc_bilirubin_total.5
bc_bilirubin_total.6
bc_bilirubin_total.7
bc_bilirubin_total.8
bc_bilirubin_direct_yes_no_id.1
bc_bilirubin_direct_yes_no_id.2
bc_bilirubin_direct_yes_no_id.3
bc_bilirubin_direct_yes_no_id.4
bc_bilirubin_direct_yes_no_id.5
bc_bilirubin_direct_yes_no_id.6
bc_bilirubin_direct_yes_no_id.7
bc_bilirubin_direct_yes_no_id.8
bc_bilirubin_direct.1
bc_bilirubin_direct.2
bc_bilirubin_direct.3
bc_bilirubin_direct.4
bc_bilirubin_direct.5
bc_bilirubin_direct.6
bc_bilirubin_direct.7
bc_bilirubin_direct.8
bc_bilirubin_nondirect_yes_no_id.1
bc_bilirubin_nondirect_yes_no_id.2
bc_bilirubin_nondirect_yes_no_id.3
bc_bilirubin_nondirect_yes_no_id.4
bc_bilirubin_nondirect_yes_no_id.5
bc_bilirubin_nondirect_yes_no_id.6
bc_bilirubin_nondirect_yes_no_id.7
bc_bilirubin_nondirect_yes_no_id.8
bc_bilirubin_nondirect.1
bc_bilirubin_nondirect.2
bc_bilirubin_nondirect.3
bc_bilirubin_nondirect.4
bc_bilirubin_nondirect.5
bc_bilirubin_nondirect.6
bc_bilirubin_nondirect.7
bc_bilirubin_nondirect.8
bc_ast_yes_no_id.1
bc_ast_yes_no_id.2
bc_ast_yes_no_id.3
bc_ast_yes_no_id.4
bc_ast_yes_no_id.5
bc_ast_yes_no_id.6
bc_ast_yes_no_id.7
bc_ast_yes_no_id.8
bc_ast.1
bc_ast.2
bc_ast.3
bc_ast.4
bc_ast.5
bc_ast.6
bc_ast.7
bc_ast.8
bc_alt_yes_no_id.1
bc_alt_yes_no_id.2
bc_alt_yes_no_id.3
bc_alt_yes_no_id.4
bc_alt_yes_no_id.5
bc_alt_yes_no_id.6
bc_alt_yes_no_id.7
bc_alt_yes_no_id.8
bc_alt.1
bc_alt.2
bc_alt.3
bc_alt.4
bc_alt.5
bc_alt.6
bc_alt.7
bc_alt.8
bc_creat_yes_no_id.1
bc_creat_yes_no_id.2
bc_creat_yes_no_id.3
bc_creat_yes_no_id.4
bc_creat_yes_no_id.5
bc_creat_yes_no_id.6
bc_creat_yes_no_id.7
bc_creat_yes_no_id.8
bc_creat.1
bc_creat.2
bc_creat.3
bc_creat.4
bc_creat.5
bc_creat.6
bc_creat.7
bc_creat.8
bc_alk_phosphatase_yes_no_id.1
bc_alk_phosphatase_yes_no_id.2
bc_alk_phosphatase_yes_no_id.3
bc_alk_phosphatase_yes_no_id.4
bc_alk_phosphatase_yes_no_id.5
bc_alk_phosphatase_yes_no_id.6
bc_alk_phosphatase_yes_no_id.7
bc_alk_phosphatase_yes_no_id.8
bc_alk_phosphatase.1
bc_alk_phosphatase.2
bc_alk_phosphatase.3
bc_alk_phosphatase.4
bc_alk_phosphatase.5
bc_alk_phosphatase.6
bc_alk_phosphatase.7
bc_alk_phosphatase.8
bc_mochevina_yes_no_id.1
bc_mochevina_yes_no_id.2
bc_mochevina_yes_no_id.3
bc_mochevina_yes_no_id.4
bc_mochevina_yes_no_id.5
bc_mochevina_yes_no_id.6
bc_mochevina_yes_no_id.7
bc_mochevina_yes_no_id.8
bc_mochevina.1
bc_mochevina.2
bc_mochevina.3
bc_mochevina.4
bc_mochevina.5
bc_mochevina.6
bc_mochevina.7
bc_mochevina.8 (-1).

NPAR TESTS
/FRIEDMAN=ca125.1 ca125.2 ca125.3 ca125.4 ca125.5 ca125.6 ca125.7 ca125.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=oak_hb.1 oak_hb.2 oak_hb.3 oak_hb.4 oak_hb.5 oak_hb.6 oak_hb.7 oak_hb.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=oak_er.1 oak_er.2 oak_er.3 oak_er.4 oak_er.5 oak_er.6 oak_er.7 oak_er.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=oak_leuc.1 oak_leuc.2 oak_leuc.3 oak_leuc.4 oak_leuc.5 oak_leuc.6 oak_leuc.7 oak_leuc.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=oak_tr.1 oak_tr.2 oak_tr.3 oak_tr.4 oak_tr.5 oak_tr.6 oak_tr.7 oak_tr.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=oak_netr.1 oak_netr.2 oak_netr.3 oak_netr.4 oak_netr.5 oak_netr.6 oak_netr.7 oak_netr.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_protein.1 bc_protein.2 bc_protein.3 bc_protein.4 bc_protein.5 bc_protein.6 bc_protein.7 bc_protein.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_bilirubin_total.1 bc_bilirubin_total.2 bc_bilirubin_total.3 bc_bilirubin_total.4 bc_bilirubin_total.5 bc_bilirubin_total.6 bc_bilirubin_total.7 bc_bilirubin_total.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_bilirubin_direct.1 bc_bilirubin_direct.2 bc_bilirubin_direct.3 bc_bilirubin_direct.4 bc_bilirubin_direct.5 bc_bilirubin_direct.6 bc_bilirubin_direct.7 bc_bilirubin_direct.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_bilirubin_nondirect.1 bc_bilirubin_nondirect.2 bc_bilirubin_nondirect.3 bc_bilirubin_nondirect.4 bc_bilirubin_nondirect.5 bc_bilirubin_nondirect.6 bc_bilirubin_nondirect.7 bc_bilirubin_nondirect.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_ast.1 bc_ast.2 bc_ast.3 bc_ast.4 bc_ast.5 bc_ast.6 bc_ast.7 bc_ast.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_alt.1 bc_alt.2 bc_alt.3 bc_alt.4 bc_alt.5 bc_alt.6 bc_alt.7 bc_alt.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_creat.1 bc_creat.2 bc_creat.3 bc_creat.4 bc_creat.5 bc_creat.6 bc_creat.7 bc_creat.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_alk_phosphatase.1 bc_alk_phosphatase.2 bc_alk_phosphatase.3 bc_alk_phosphatase.4 bc_alk_phosphatase.5 bc_alk_phosphatase.6 bc_alk_phosphatase.7 bc_alk_phosphatase.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=bc_mochevina.1 bc_mochevina.2 bc_mochevina.3 bc_mochevina.4 bc_mochevina.5 bc_mochevina.6 bc_mochevina.7 bc_mochevina.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.