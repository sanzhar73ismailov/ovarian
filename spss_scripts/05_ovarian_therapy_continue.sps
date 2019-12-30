GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\05_ovarian_therapy_continue.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
therap_trab_continue_yes_no_id "���������� ������� ������������� � ���������� � ���: ������� ������������ ��� ��������� ��/���",
therap_trab_continue_no_cause_id "���������� ������� ������������� � ���������� � ���: ���� ���, ������� �������",
checked "��������� ���������",
user "������������",
insert_date "���� �����������".

VALUE LABELS
therap_trab_continue_yes_no_id
1 "��",
0 "���"
/therap_trab_continue_no_cause_id
-1 "��� ������",
1 "������� ��������� �� ������� ",
2 "������� ����������� �� ������� �������� ��������",
3 "������� ����������� �� ������� �������������".

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