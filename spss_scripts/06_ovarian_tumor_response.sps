GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\06_ovarian_tumor_response.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
full_response_yes_no_id "����������� ������ ������������� ������� (RECIST*) ������ ����� (��, ���)",
partial_response_yes_no_id "����������� ������ ������������� ������� (RECIST*) ��������� ����� (��, ���)",
progress_desease_yes_no_id "����������� ������ ������������� ������� (RECIST*) ���������������� ����������� (��, ���)",
stabilization_desease_yes_no_id "����������� ������ ������������� ������� (RECIST*) ������������ ����������� (��, ���)",
response "������������� �������", 
checked "��������� ���������",
user "������������",
insert_date "���� �����������".
VALUE LABELS
full_response_yes_no_id
1 "��",
0 "���"
/partial_response_yes_no_id
1 "��",
0 "���"
/progress_desease_yes_no_id
1 "��",
0 "���"
/stabilization_desease_yes_no_id
1 "��",
0 "���"
/response
1 "���������������� �����������",
2 "������������ �����������",
3 "��������� �����",
4 "������ �����"
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