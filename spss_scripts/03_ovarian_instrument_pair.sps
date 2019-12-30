GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\03_ovarian_instrument.xls' 
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
instr_mrt_yes_no_id.1 "Инструментальные исследования: МРТ ОМТ да/нет. Визит 1",
instr_mrt_yes_no_id.4 "Инструментальные исследования: МРТ ОМТ да/нет. Визит 4",
instr_mrt_yes_no_id.7 "Инструментальные исследования: МРТ ОМТ да/нет. Визит 7",
instr_mrt_yes_no_id.8 "Инструментальные исследования: МРТ ОМТ да/нет. Визит 8",
instr_mrt_norm_yes_no_id.1 "Инструментальные исследования: МРТ ОМТ норма/патология. Визит 1",
instr_mrt_norm_yes_no_id.4 "Инструментальные исследования: МРТ ОМТ норма/патология. Визит 4",
instr_mrt_norm_yes_no_id.7 "Инструментальные исследования: МРТ ОМТ норма/патология. Визит 7",
instr_mrt_norm_yes_no_id.8 "Инструментальные исследования: МРТ ОМТ норма/патология. Визит 8",
instr_us_yes_no_id.1 "Инструментальные исследования: УЗИ ОБП да/нет. Визит 1",
instr_us_yes_no_id.4 "Инструментальные исследования: УЗИ ОБП да/нет. Визит 4",
instr_us_yes_no_id.7 "Инструментальные исследования: УЗИ ОБП да/нет. Визит 7",
instr_us_yes_no_id.8 "Инструментальные исследования: УЗИ ОБП да/нет. Визит 8",
instr_us_norm_yes_no_id.1 "Инструментальные исследования: УЗИ ОБП норма/патология. Визит 1",
instr_us_norm_yes_no_id.4 "Инструментальные исследования: УЗИ ОБП норма/патология. Визит 4",
instr_us_norm_yes_no_id.7 "Инструментальные исследования: УЗИ ОБП норма/патология. Визит 7",
instr_us_norm_yes_no_id.8 "Инструментальные исследования: УЗИ ОБП норма/патология. Визит 8",
instr_kt_yes_no_id.1 "Инструментальные исследования: КТ ОГК да/нет. Визит 1",
instr_kt_yes_no_id.4 "Инструментальные исследования: КТ ОГК да/нет. Визит 4",
instr_kt_yes_no_id.7 "Инструментальные исследования: КТ ОГК да/нет. Визит 7",
instr_kt_yes_no_id.8 "Инструментальные исследования: КТ ОГК да/нет. Визит 8",
instr_kt_norm_yes_no_id.1 "Инструментальные исследования: КТ ОГК норма/патология. Визит 1",
instr_kt_norm_yes_no_id.4 "Инструментальные исследования: КТ ОГК норма/патология. Визит 4",
instr_kt_norm_yes_no_id.7 "Инструментальные исследования: КТ ОГК норма/патология. Визит 7",
instr_kt_norm_yes_no_id.8 "Инструментальные исследования: КТ ОГК норма/патология. Визит 8",
instr_ekg_yes_no_id.1 "Инструментальные исследования: ЭКГ да/нет. Визит 1",
instr_ekg_yes_no_id.4 "Инструментальные исследования: ЭКГ да/нет. Визит 4",
instr_ekg_yes_no_id.7 "Инструментальные исследования: ЭКГ да/нет. Визит 7",
instr_ekg_yes_no_id.8 "Инструментальные исследования: ЭКГ да/нет. Визит 8",
instr_ekg_norm_yes_no_id.1 "Инструментальные исследования: ЭКГ норма/патология. Визит 1",
instr_ekg_norm_yes_no_id.4 "Инструментальные исследования: ЭКГ норма/патология. Визит 4",
instr_ekg_norm_yes_no_id.7 "Инструментальные исследования: ЭКГ норма/патология. Визит 7",
instr_ekg_norm_yes_no_id.8 "Инструментальные исследования: ЭКГ норма/патология. Визит 8".
VALUE LABELS
instr_mrt_yes_no_id.1
1 "да",
0 "нет"
/instr_mrt_yes_no_id.4
1 "да",
0 "нет"
/instr_mrt_yes_no_id.7
1 "да",
0 "нет"
/instr_mrt_yes_no_id.8
1 "да",
0 "нет"
/instr_mrt_norm_yes_no_id.1
1 "да",
0 "нет"
/instr_mrt_norm_yes_no_id.4
1 "да",
0 "нет"
/instr_mrt_norm_yes_no_id.7
1 "да",
0 "нет"
/instr_mrt_norm_yes_no_id.8
1 "да",
0 "нет"
/instr_us_yes_no_id.1
1 "да",
0 "нет"
/instr_us_yes_no_id.4
1 "да",
0 "нет"
/instr_us_yes_no_id.7
1 "да",
0 "нет"
/instr_us_yes_no_id.8
1 "да",
0 "нет"
/instr_us_norm_yes_no_id.1
1 "да",
0 "нет"
/instr_us_norm_yes_no_id.4
1 "да",
0 "нет"
/instr_us_norm_yes_no_id.7
1 "да",
0 "нет"
/instr_us_norm_yes_no_id.8
1 "да",
0 "нет"
/instr_kt_yes_no_id.1
1 "да",
0 "нет"
/instr_kt_yes_no_id.4
1 "да",
0 "нет"
/instr_kt_yes_no_id.7
1 "да",
0 "нет"
/instr_kt_yes_no_id.8
1 "да",
0 "нет"
/instr_kt_norm_yes_no_id.1
1 "да",
0 "нет"
/instr_kt_norm_yes_no_id.4
1 "да",
0 "нет"
/instr_kt_norm_yes_no_id.7
1 "да",
0 "нет"
/instr_kt_norm_yes_no_id.8
1 "да",
0 "нет"
/instr_ekg_yes_no_id.1
1 "да",
0 "нет"
/instr_ekg_yes_no_id.4
1 "да",
0 "нет"
/instr_ekg_yes_no_id.7
1 "да",
0 "нет"
/instr_ekg_yes_no_id.8
1 "да",
0 "нет"
/instr_ekg_norm_yes_no_id.1
1 "да",
0 "нет"
/instr_ekg_norm_yes_no_id.4
1 "да",
0 "нет"
/instr_ekg_norm_yes_no_id.7
1 "да",
0 "нет"
/instr_ekg_norm_yes_no_id.8
1 "да",
0 "нет".

MISSING VALUES
instr_mrt_yes_no_id.1
instr_mrt_yes_no_id.4
instr_mrt_yes_no_id.7
instr_mrt_yes_no_id.8
instr_mrt_norm_yes_no_id.1
instr_mrt_norm_yes_no_id.4
instr_mrt_norm_yes_no_id.7
instr_mrt_norm_yes_no_id.8
instr_us_yes_no_id.1
instr_us_yes_no_id.4
instr_us_yes_no_id.7
instr_us_yes_no_id.8
instr_us_norm_yes_no_id.1
instr_us_norm_yes_no_id.4
instr_us_norm_yes_no_id.7
instr_us_norm_yes_no_id.8
instr_kt_yes_no_id.1
instr_kt_yes_no_id.4
instr_kt_yes_no_id.7
instr_kt_yes_no_id.8
instr_kt_norm_yes_no_id.1
instr_kt_norm_yes_no_id.4
instr_kt_norm_yes_no_id.7
instr_kt_norm_yes_no_id.8
instr_ekg_yes_no_id.1
instr_ekg_yes_no_id.4
instr_ekg_yes_no_id.7
instr_ekg_yes_no_id.8
instr_ekg_norm_yes_no_id.1
instr_ekg_norm_yes_no_id.4
instr_ekg_norm_yes_no_id.7
instr_ekg_norm_yes_no_id.8 (-1).

 * DATASET ACTIVATE Наборданных1.
 * NPAR TESTS
  /FRIEDMAN=instr_mrt_date.1 instr_mrt_date.4 instr_mrt_date.7 instr_mrt_date.8
  /STATISTICS DESCRIPTIVES QUARTILES
  /MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_mrt_yes_no_id.1 instr_mrt_yes_no_id.4 instr_mrt_yes_no_id.7 instr_mrt_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_mrt_norm_yes_no_id.1 instr_mrt_norm_yes_no_id.4 instr_mrt_norm_yes_no_id.7 instr_mrt_norm_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_us_yes_no_id.1 instr_us_yes_no_id.4 instr_us_yes_no_id.7 instr_us_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_us_norm_yes_no_id.1 instr_us_norm_yes_no_id.4 instr_us_norm_yes_no_id.7 instr_us_norm_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_kt_yes_no_id.1 instr_kt_yes_no_id.4 instr_kt_yes_no_id.7 instr_kt_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_kt_norm_yes_no_id.1 instr_kt_norm_yes_no_id.4 instr_kt_norm_yes_no_id.7 instr_kt_norm_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_ekg_yes_no_id.1 instr_ekg_yes_no_id.4 instr_ekg_yes_no_id.7 instr_ekg_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
NPAR TESTS
/FRIEDMAN=instr_ekg_norm_yes_no_id.1 instr_ekg_norm_yes_no_id.4 instr_ekg_norm_yes_no_id.7 instr_ekg_norm_yes_no_id.8
/STATISTICS DESCRIPTIVES QUARTILES
/MISSING LISTWISE.
