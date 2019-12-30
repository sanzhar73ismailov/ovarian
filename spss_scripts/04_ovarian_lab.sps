GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\04_ovarian_lab.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
visit_date "���� ������",
ca125_yes_no_id "�� 125 ��/���",
ca125 "�� 125 ��/��",
ca125_date "�� 125 - ���� ����������",
oak_yes_no_id "��� ��/���",
oak_date "��� - ���� ����������",
oak_hb "��� - ���������� �/�",
oak_er "��� - ���������� 10�12",
oak_leuc "��� - ��������� 10�9",
oak_tr "��� - ���������� 10�9",
oak_netr "��� - ���������� 10�9",
bc_yes_no_id "��� ��/���",
bc_protein_yes_no_id "��� - ����� ����� ��/���",
bc_protein "��� - ����� ����� ������/�",
bc_protein_date "��� - ����� ����� ���� ����������",
bc_bilirubin_yes_no_id "��� - ��������� ��/���",
bc_bilirubin_total_yes_no_id "��� - ��������� ����� ��/���",
bc_bilirubin_total "��� - ��������� ����� ������/�",
bc_bilirubin_total_date "��� - ��������� ����� ���� ����������",
bc_bilirubin_direct_yes_no_id "��� - ��������� ������ ��/���",
bc_bilirubin_direct "��� - ��������� ������ ������/�",
bc_bilirubin_direct_date "��� - ��������� ������ ���� ����������",
bc_bilirubin_nondirect_yes_no_id "��� - ��������� �������� ��/���",
bc_bilirubin_nondirect "��� - ��������� �������� ������/�",
bc_bilirubin_nondirect_date "��� - ��������� �������� ���� ����������",
bc_ast_yes_no_id "��� - ��� ��/���",
bc_ast "��� - ��� ��/�",
bc_ast_date "��� - ��� ���� ����������",
bc_alt_yes_no_id "��� - ��� ��/���",
bc_alt "��� - ��� ��/�",
bc_alt_date "��� - ��� ���� ����������",
bc_creat_yes_no_id "��� - ��������� ��/���",
bc_creat "��� - ��������� ��/��",
bc_creat_date "��� - ��������� ���� ����������",
bc_alk_phosphatase_yes_no_id "��� - �������� ��������� ��/���",
bc_alk_phosphatase "��� - �������� ��������� ��/�",
bc_alk_phosphatase_date "��� - �������� ��������� ���� ����������",
bc_mochevina_yes_no_id "��� - �������� ��/���",
bc_mochevina "��� - �������� ������/�",
bc_mochevina_date "��� - �������� ���� ����������",
checked "��������� ���������",
user "������������",
insert_date "���� �����������".

VALUE LABELS
ca125_yes_no_id
1 "��",
0 "���"
/oak_yes_no_id
1 "��",
0 "���"
/bc_yes_no_id
1 "��",
0 "���"
/bc_protein_yes_no_id
1 "��",
0 "���"
/bc_bilirubin_yes_no_id
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id
1 "��",
0 "���"
/bc_ast_yes_no_id
1 "��",
0 "���"
/bc_alt_yes_no_id
1 "��",
0 "���"
/bc_creat_yes_no_id
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id
1 "��",
0 "���"
/bc_mochevina_yes_no_id
1 "��",
0 "���".

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