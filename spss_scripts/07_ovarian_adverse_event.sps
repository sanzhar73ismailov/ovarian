GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\07_ovarian_adverse_event.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
adverse_event_yes_no_id "���������� ��������������� ������� ��/���",
checked "��������� ���������",
user "������������",
insert_date "���� �����������".
VALUE LABELS
adverse_event_yes_no_id
1 "��",
0 "���".

MISSING VALUES
patient_id
visit_id
adverse_event_yes_no_id (-1).

SORT CASES BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=
adverse_event_yes_no_id
/ORDER=ANALYSIS.

*DESCRIPTIVES VARIABLES - No parameters.

*Kolmogor-Smirnov NPAR TESTS - No parameters.
SPLIT FILE OFF.

CROSSTABS
/TABLES=adverse_event_yes_no_id BY visit_id
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT ROW
/COUNT ROUND CELL.