GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\03_ovarian_instrument.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
instr_mrt_yes_no_id "���������������� ������������: ��� ��� ��/���",
instr_mrt_date "���������������� ������������: ��� ��� ����",
instr_mrt_norm_yes_no_id "���������������� ������������: ��� ��� �����/���������",
instr_mrt_descr "���������������� ������������: ��� ��� ����������",
instr_us_yes_no_id "���������������� ������������: ��� ��� ��/���",
instr_us_date "���������������� ������������: ��� ��� ����",
instr_us_norm_yes_no_id "���������������� ������������: ��� ��� �����/���������",
instr_us_descr "���������������� ������������: ��� ��� ����������",
instr_kt_yes_no_id "���������������� ������������: �� ��� ��/���",
instr_kt_date "���������������� ������������: �� ��� ����",
instr_kt_norm_yes_no_id "���������������� ������������: �� ��� �����/���������",
instr_kt_descr "���������������� ������������: �� ��� ����������",
instr_ekg_yes_no_id "���������������� ������������: ��� ��/���",
instr_ekg_date "���������������� ������������: ��� ����",
instr_ekg_norm_yes_no_id "���������������� ������������: ��� �����/���������",
instr_ekg_descr "���������������� ������������: ��� ����������",
checked "��������� ���������",
user "������������",
insert_date "���� �����������".
VALUE LABELS
instr_mrt_yes_no_id
1 "��",
0 "���"
/instr_mrt_norm_yes_no_id
1 "��",
0 "���"
/instr_us_yes_no_id
1 "��",
0 "���"
/instr_us_norm_yes_no_id
1 "��",
0 "���"
/instr_kt_yes_no_id
1 "��",
0 "���"
/instr_kt_norm_yes_no_id
1 "��",
0 "���"
/instr_ekg_yes_no_id
1 "��",
0 "���"
/instr_ekg_norm_yes_no_id
1 "��",
0 "���".

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