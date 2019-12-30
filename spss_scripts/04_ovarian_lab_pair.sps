GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\04_ovarian_lab.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

SORT CASES BY patient_id visit_id. 
CASESTOVARS 
  /ID=patient_id 
  /INDEX=visit_id 
  /GROUPBY=VARIABLE.

VARIABLE LABELS
ca125_yes_no_id.1 "�� 125 ��/���. ����� 1",
ca125_yes_no_id.2 "�� 125 ��/���. ����� 2",
ca125_yes_no_id.3 "�� 125 ��/���. ����� 3",
ca125_yes_no_id.4 "�� 125 ��/���. ����� 4",
ca125_yes_no_id.5 "�� 125 ��/���. ����� 5",
ca125_yes_no_id.6 "�� 125 ��/���. ����� 6",
ca125_yes_no_id.7 "�� 125 ��/���. ����� 7",
ca125_yes_no_id.8 "�� 125 ��/���. ����� 8",
ca125.1 "�� 125 ��/��. ����� 1",
ca125.2 "�� 125 ��/��. ����� 2",
ca125.3 "�� 125 ��/��. ����� 3",
ca125.4 "�� 125 ��/��. ����� 4",
ca125.5 "�� 125 ��/��. ����� 5",
ca125.6 "�� 125 ��/��. ����� 6",
ca125.7 "�� 125 ��/��. ����� 7",
ca125.8 "�� 125 ��/��. ����� 8",
oak_yes_no_id.1 "��� ��/���. ����� 1",
oak_yes_no_id.2 "��� ��/���. ����� 2",
oak_yes_no_id.3 "��� ��/���. ����� 3",
oak_yes_no_id.4 "��� ��/���. ����� 4",
oak_yes_no_id.5 "��� ��/���. ����� 5",
oak_yes_no_id.6 "��� ��/���. ����� 6",
oak_yes_no_id.7 "��� ��/���. ����� 7",
oak_yes_no_id.8 "��� ��/���. ����� 8",
oak_hb.1 "��� - ���������� �/�. ����� 1",
oak_hb.2 "��� - ���������� �/�. ����� 2",
oak_hb.3 "��� - ���������� �/�. ����� 3",
oak_hb.4 "��� - ���������� �/�. ����� 4",
oak_hb.5 "��� - ���������� �/�. ����� 5",
oak_hb.6 "��� - ���������� �/�. ����� 6",
oak_hb.7 "��� - ���������� �/�. ����� 7",
oak_hb.8 "��� - ���������� �/�. ����� 8",
oak_er.1 "��� - ���������� 10�12. ����� 1",
oak_er.2 "��� - ���������� 10�12. ����� 2",
oak_er.3 "��� - ���������� 10�12. ����� 3",
oak_er.4 "��� - ���������� 10�12. ����� 4",
oak_er.5 "��� - ���������� 10�12. ����� 5",
oak_er.6 "��� - ���������� 10�12. ����� 6",
oak_er.7 "��� - ���������� 10�12. ����� 7",
oak_er.8 "��� - ���������� 10�12. ����� 8",
oak_leuc.1 "��� - ��������� 10�9. ����� 1",
oak_leuc.2 "��� - ��������� 10�9. ����� 2",
oak_leuc.3 "��� - ��������� 10�9. ����� 3",
oak_leuc.4 "��� - ��������� 10�9. ����� 4",
oak_leuc.5 "��� - ��������� 10�9. ����� 5",
oak_leuc.6 "��� - ��������� 10�9. ����� 6",
oak_leuc.7 "��� - ��������� 10�9. ����� 7",
oak_leuc.8 "��� - ��������� 10�9. ����� 8",
oak_tr.1 "��� - ���������� 10�9. ����� 1",
oak_tr.2 "��� - ���������� 10�9. ����� 2",
oak_tr.3 "��� - ���������� 10�9. ����� 3",
oak_tr.4 "��� - ���������� 10�9. ����� 4",
oak_tr.5 "��� - ���������� 10�9. ����� 5",
oak_tr.6 "��� - ���������� 10�9. ����� 6",
oak_tr.7 "��� - ���������� 10�9. ����� 7",
oak_tr.8 "��� - ���������� 10�9. ����� 8",
oak_netr.1 "��� - ���������� 10�9. ����� 1",
oak_netr.2 "��� - ���������� 10�9. ����� 2",
oak_netr.3 "��� - ���������� 10�9. ����� 3",
oak_netr.4 "��� - ���������� 10�9. ����� 4",
oak_netr.5 "��� - ���������� 10�9. ����� 5",
oak_netr.6 "��� - ���������� 10�9. ����� 6",
oak_netr.7 "��� - ���������� 10�9. ����� 7",
oak_netr.8 "��� - ���������� 10�9. ����� 8",
bc_yes_no_id.1 "��� ��/���. ����� 1",
bc_yes_no_id.2 "��� ��/���. ����� 2",
bc_yes_no_id.3 "��� ��/���. ����� 3",
bc_yes_no_id.4 "��� ��/���. ����� 4",
bc_yes_no_id.5 "��� ��/���. ����� 5",
bc_yes_no_id.6 "��� ��/���. ����� 6",
bc_yes_no_id.7 "��� ��/���. ����� 7",
bc_yes_no_id.8 "��� ��/���. ����� 8",
bc_protein_yes_no_id.1 "��� - ����� ����� ��/���. ����� 1",
bc_protein_yes_no_id.2 "��� - ����� ����� ��/���. ����� 2",
bc_protein_yes_no_id.3 "��� - ����� ����� ��/���. ����� 3",
bc_protein_yes_no_id.4 "��� - ����� ����� ��/���. ����� 4",
bc_protein_yes_no_id.5 "��� - ����� ����� ��/���. ����� 5",
bc_protein_yes_no_id.6 "��� - ����� ����� ��/���. ����� 6",
bc_protein_yes_no_id.7 "��� - ����� ����� ��/���. ����� 7",
bc_protein_yes_no_id.8 "��� - ����� ����� ��/���. ����� 8",
bc_protein.1 "��� - ����� ����� ������/�. ����� 1",
bc_protein.2 "��� - ����� ����� ������/�. ����� 2",
bc_protein.3 "��� - ����� ����� ������/�. ����� 3",
bc_protein.4 "��� - ����� ����� ������/�. ����� 4",
bc_protein.5 "��� - ����� ����� ������/�. ����� 5",
bc_protein.6 "��� - ����� ����� ������/�. ����� 6",
bc_protein.7 "��� - ����� ����� ������/�. ����� 7",
bc_protein.8 "��� - ����� ����� ������/�. ����� 8",
bc_bilirubin_yes_no_id.1 "��� - ��������� ��/���. ����� 1",
bc_bilirubin_yes_no_id.2 "��� - ��������� ��/���. ����� 2",
bc_bilirubin_yes_no_id.3 "��� - ��������� ��/���. ����� 3",
bc_bilirubin_yes_no_id.4 "��� - ��������� ��/���. ����� 4",
bc_bilirubin_yes_no_id.5 "��� - ��������� ��/���. ����� 5",
bc_bilirubin_yes_no_id.6 "��� - ��������� ��/���. ����� 6",
bc_bilirubin_yes_no_id.7 "��� - ��������� ��/���. ����� 7",
bc_bilirubin_yes_no_id.8 "��� - ��������� ��/���. ����� 8",
bc_bilirubin_total_yes_no_id.1 "��� - ��������� ����� ��/���. ����� 1",
bc_bilirubin_total_yes_no_id.2 "��� - ��������� ����� ��/���. ����� 2",
bc_bilirubin_total_yes_no_id.3 "��� - ��������� ����� ��/���. ����� 3",
bc_bilirubin_total_yes_no_id.4 "��� - ��������� ����� ��/���. ����� 4",
bc_bilirubin_total_yes_no_id.5 "��� - ��������� ����� ��/���. ����� 5",
bc_bilirubin_total_yes_no_id.6 "��� - ��������� ����� ��/���. ����� 6",
bc_bilirubin_total_yes_no_id.7 "��� - ��������� ����� ��/���. ����� 7",
bc_bilirubin_total_yes_no_id.8 "��� - ��������� ����� ��/���. ����� 8",
bc_bilirubin_total.1 "��� - ��������� ����� ������/�. ����� 1",
bc_bilirubin_total.2 "��� - ��������� ����� ������/�. ����� 2",
bc_bilirubin_total.3 "��� - ��������� ����� ������/�. ����� 3",
bc_bilirubin_total.4 "��� - ��������� ����� ������/�. ����� 4",
bc_bilirubin_total.5 "��� - ��������� ����� ������/�. ����� 5",
bc_bilirubin_total.6 "��� - ��������� ����� ������/�. ����� 6",
bc_bilirubin_total.7 "��� - ��������� ����� ������/�. ����� 7",
bc_bilirubin_total.8 "��� - ��������� ����� ������/�. ����� 8",
bc_bilirubin_direct_yes_no_id.1 "��� - ��������� ������ ��/���. ����� 1",
bc_bilirubin_direct_yes_no_id.2 "��� - ��������� ������ ��/���. ����� 2",
bc_bilirubin_direct_yes_no_id.3 "��� - ��������� ������ ��/���. ����� 3",
bc_bilirubin_direct_yes_no_id.4 "��� - ��������� ������ ��/���. ����� 4",
bc_bilirubin_direct_yes_no_id.5 "��� - ��������� ������ ��/���. ����� 5",
bc_bilirubin_direct_yes_no_id.6 "��� - ��������� ������ ��/���. ����� 6",
bc_bilirubin_direct_yes_no_id.7 "��� - ��������� ������ ��/���. ����� 7",
bc_bilirubin_direct_yes_no_id.8 "��� - ��������� ������ ��/���. ����� 8",
bc_bilirubin_direct.1 "��� - ��������� ������ ������/�. ����� 1",
bc_bilirubin_direct.2 "��� - ��������� ������ ������/�. ����� 2",
bc_bilirubin_direct.3 "��� - ��������� ������ ������/�. ����� 3",
bc_bilirubin_direct.4 "��� - ��������� ������ ������/�. ����� 4",
bc_bilirubin_direct.5 "��� - ��������� ������ ������/�. ����� 5",
bc_bilirubin_direct.6 "��� - ��������� ������ ������/�. ����� 6",
bc_bilirubin_direct.7 "��� - ��������� ������ ������/�. ����� 7",
bc_bilirubin_direct.8 "��� - ��������� ������ ������/�. ����� 8",
bc_bilirubin_nondirect_yes_no_id.1 "��� - ��������� �������� ��/���. ����� 1",
bc_bilirubin_nondirect_yes_no_id.2 "��� - ��������� �������� ��/���. ����� 2",
bc_bilirubin_nondirect_yes_no_id.3 "��� - ��������� �������� ��/���. ����� 3",
bc_bilirubin_nondirect_yes_no_id.4 "��� - ��������� �������� ��/���. ����� 4",
bc_bilirubin_nondirect_yes_no_id.5 "��� - ��������� �������� ��/���. ����� 5",
bc_bilirubin_nondirect_yes_no_id.6 "��� - ��������� �������� ��/���. ����� 6",
bc_bilirubin_nondirect_yes_no_id.7 "��� - ��������� �������� ��/���. ����� 7",
bc_bilirubin_nondirect_yes_no_id.8 "��� - ��������� �������� ��/���. ����� 8",
bc_bilirubin_nondirect.1 "��� - ��������� �������� ������/�. ����� 1",
bc_bilirubin_nondirect.2 "��� - ��������� �������� ������/�. ����� 2",
bc_bilirubin_nondirect.3 "��� - ��������� �������� ������/�. ����� 3",
bc_bilirubin_nondirect.4 "��� - ��������� �������� ������/�. ����� 4",
bc_bilirubin_nondirect.5 "��� - ��������� �������� ������/�. ����� 5",
bc_bilirubin_nondirect.6 "��� - ��������� �������� ������/�. ����� 6",
bc_bilirubin_nondirect.7 "��� - ��������� �������� ������/�. ����� 7",
bc_bilirubin_nondirect.8 "��� - ��������� �������� ������/�. ����� 8",
bc_ast_yes_no_id.1 "��� - ��� ��/���. ����� 1",
bc_ast_yes_no_id.2 "��� - ��� ��/���. ����� 2",
bc_ast_yes_no_id.3 "��� - ��� ��/���. ����� 3",
bc_ast_yes_no_id.4 "��� - ��� ��/���. ����� 4",
bc_ast_yes_no_id.5 "��� - ��� ��/���. ����� 5",
bc_ast_yes_no_id.6 "��� - ��� ��/���. ����� 6",
bc_ast_yes_no_id.7 "��� - ��� ��/���. ����� 7",
bc_ast_yes_no_id.8 "��� - ��� ��/���. ����� 8",
bc_ast.1 "��� - ��� ��/�. ����� 1",
bc_ast.2 "��� - ��� ��/�. ����� 2",
bc_ast.3 "��� - ��� ��/�. ����� 3",
bc_ast.4 "��� - ��� ��/�. ����� 4",
bc_ast.5 "��� - ��� ��/�. ����� 5",
bc_ast.6 "��� - ��� ��/�. ����� 6",
bc_ast.7 "��� - ��� ��/�. ����� 7",
bc_ast.8 "��� - ��� ��/�. ����� 8",
bc_alt_yes_no_id.1 "��� - ��� ��/���. ����� 1",
bc_alt_yes_no_id.2 "��� - ��� ��/���. ����� 2",
bc_alt_yes_no_id.3 "��� - ��� ��/���. ����� 3",
bc_alt_yes_no_id.4 "��� - ��� ��/���. ����� 4",
bc_alt_yes_no_id.5 "��� - ��� ��/���. ����� 5",
bc_alt_yes_no_id.6 "��� - ��� ��/���. ����� 6",
bc_alt_yes_no_id.7 "��� - ��� ��/���. ����� 7",
bc_alt_yes_no_id.8 "��� - ��� ��/���. ����� 8",
bc_alt.1 "��� - ��� ��/�. ����� 1",
bc_alt.2 "��� - ��� ��/�. ����� 2",
bc_alt.3 "��� - ��� ��/�. ����� 3",
bc_alt.4 "��� - ��� ��/�. ����� 4",
bc_alt.5 "��� - ��� ��/�. ����� 5",
bc_alt.6 "��� - ��� ��/�. ����� 6",
bc_alt.7 "��� - ��� ��/�. ����� 7",
bc_alt.8 "��� - ��� ��/�. ����� 8",
bc_creat_yes_no_id.1 "��� - ��������� ��/���. ����� 1",
bc_creat_yes_no_id.2 "��� - ��������� ��/���. ����� 2",
bc_creat_yes_no_id.3 "��� - ��������� ��/���. ����� 3",
bc_creat_yes_no_id.4 "��� - ��������� ��/���. ����� 4",
bc_creat_yes_no_id.5 "��� - ��������� ��/���. ����� 5",
bc_creat_yes_no_id.6 "��� - ��������� ��/���. ����� 6",
bc_creat_yes_no_id.7 "��� - ��������� ��/���. ����� 7",
bc_creat_yes_no_id.8 "��� - ��������� ��/���. ����� 8",
bc_creat.1 "��� - ��������� ��/��. ����� 1",
bc_creat.2 "��� - ��������� ��/��. ����� 2",
bc_creat.3 "��� - ��������� ��/��. ����� 3",
bc_creat.4 "��� - ��������� ��/��. ����� 4",
bc_creat.5 "��� - ��������� ��/��. ����� 5",
bc_creat.6 "��� - ��������� ��/��. ����� 6",
bc_creat.7 "��� - ��������� ��/��. ����� 7",
bc_creat.8 "��� - ��������� ��/��. ����� 8",
bc_alk_phosphatase_yes_no_id.1 "��� - �������� ��������� ��/���. ����� 1",
bc_alk_phosphatase_yes_no_id.2 "��� - �������� ��������� ��/���. ����� 2",
bc_alk_phosphatase_yes_no_id.3 "��� - �������� ��������� ��/���. ����� 3",
bc_alk_phosphatase_yes_no_id.4 "��� - �������� ��������� ��/���. ����� 4",
bc_alk_phosphatase_yes_no_id.5 "��� - �������� ��������� ��/���. ����� 5",
bc_alk_phosphatase_yes_no_id.6 "��� - �������� ��������� ��/���. ����� 6",
bc_alk_phosphatase_yes_no_id.7 "��� - �������� ��������� ��/���. ����� 7",
bc_alk_phosphatase_yes_no_id.8 "��� - �������� ��������� ��/���. ����� 8",
bc_alk_phosphatase.1 "��� - �������� ��������� ��/�. ����� 1",
bc_alk_phosphatase.2 "��� - �������� ��������� ��/�. ����� 2",
bc_alk_phosphatase.3 "��� - �������� ��������� ��/�. ����� 3",
bc_alk_phosphatase.4 "��� - �������� ��������� ��/�. ����� 4",
bc_alk_phosphatase.5 "��� - �������� ��������� ��/�. ����� 5",
bc_alk_phosphatase.6 "��� - �������� ��������� ��/�. ����� 6",
bc_alk_phosphatase.7 "��� - �������� ��������� ��/�. ����� 7",
bc_alk_phosphatase.8 "��� - �������� ��������� ��/�. ����� 8",
bc_mochevina_yes_no_id.1 "��� - �������� ��/���. ����� 1",
bc_mochevina_yes_no_id.2 "��� - �������� ��/���. ����� 2",
bc_mochevina_yes_no_id.3 "��� - �������� ��/���. ����� 3",
bc_mochevina_yes_no_id.4 "��� - �������� ��/���. ����� 4",
bc_mochevina_yes_no_id.5 "��� - �������� ��/���. ����� 5",
bc_mochevina_yes_no_id.6 "��� - �������� ��/���. ����� 6",
bc_mochevina_yes_no_id.7 "��� - �������� ��/���. ����� 7",
bc_mochevina_yes_no_id.8 "��� - �������� ��/���. ����� 8",
bc_mochevina.1 "��� - �������� ������/�. ����� 1",
bc_mochevina.2 "��� - �������� ������/�. ����� 2",
bc_mochevina.3 "��� - �������� ������/�. ����� 3",
bc_mochevina.4 "��� - �������� ������/�. ����� 4",
bc_mochevina.5 "��� - �������� ������/�. ����� 5",
bc_mochevina.6 "��� - �������� ������/�. ����� 6",
bc_mochevina.7 "��� - �������� ������/�. ����� 7",
bc_mochevina.8 "��� - �������� ������/�. ����� 8".

VALUE LABELS
ca125_yes_no_id.1
1 "��",
0 "���"
/ca125_yes_no_id.2
1 "��",
0 "���"
/ca125_yes_no_id.3
1 "��",
0 "���"
/ca125_yes_no_id.4
1 "��",
0 "���"
/ca125_yes_no_id.5
1 "��",
0 "���"
/ca125_yes_no_id.6
1 "��",
0 "���"
/ca125_yes_no_id.7
1 "��",
0 "���"
/ca125_yes_no_id.8
1 "��",
0 "���"
/oak_yes_no_id.1
1 "��",
0 "���"
/oak_yes_no_id.2
1 "��",
0 "���"
/oak_yes_no_id.3
1 "��",
0 "���"
/oak_yes_no_id.4
1 "��",
0 "���"
/oak_yes_no_id.5
1 "��",
0 "���"
/oak_yes_no_id.6
1 "��",
0 "���"
/oak_yes_no_id.7
1 "��",
0 "���"
/oak_yes_no_id.8
1 "��",
0 "���"
/bc_yes_no_id.1
1 "��",
0 "���"
/bc_yes_no_id.2
1 "��",
0 "���"
/bc_yes_no_id.3
1 "��",
0 "���"
/bc_yes_no_id.4
1 "��",
0 "���"
/bc_yes_no_id.5
1 "��",
0 "���"
/bc_yes_no_id.6
1 "��",
0 "���"
/bc_yes_no_id.7
1 "��",
0 "���"
/bc_yes_no_id.8
1 "��",
0 "���"
/bc_protein_yes_no_id.1
1 "��",
0 "���"
/bc_protein_yes_no_id.2
1 "��",
0 "���"
/bc_protein_yes_no_id.3
1 "��",
0 "���"
/bc_protein_yes_no_id.4
1 "��",
0 "���"
/bc_protein_yes_no_id.5
1 "��",
0 "���"
/bc_protein_yes_no_id.6
1 "��",
0 "���"
/bc_protein_yes_no_id.7
1 "��",
0 "���"
/bc_protein_yes_no_id.8
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.1
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.2
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.3
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.4
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.5
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.6
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.7
1 "��",
0 "���"
/bc_bilirubin_yes_no_id.8
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.1
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.2
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.3
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.4
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.5
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.6
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.7
1 "��",
0 "���"
/bc_bilirubin_total_yes_no_id.8
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.1
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.2
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.3
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.4
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.5
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.6
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.7
1 "��",
0 "���"
/bc_bilirubin_direct_yes_no_id.8
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.1
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.2
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.3
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.4
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.5
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.6
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.7
1 "��",
0 "���"
/bc_bilirubin_nondirect_yes_no_id.8
1 "��",
0 "���"
/bc_ast_yes_no_id.1
1 "��",
0 "���"
/bc_ast_yes_no_id.2
1 "��",
0 "���"
/bc_ast_yes_no_id.3
1 "��",
0 "���"
/bc_ast_yes_no_id.4
1 "��",
0 "���"
/bc_ast_yes_no_id.5
1 "��",
0 "���"
/bc_ast_yes_no_id.6
1 "��",
0 "���"
/bc_ast_yes_no_id.7
1 "��",
0 "���"
/bc_ast_yes_no_id.8
1 "��",
0 "���"
/bc_alt_yes_no_id.1
1 "��",
0 "���"
/bc_alt_yes_no_id.2
1 "��",
0 "���"
/bc_alt_yes_no_id.3
1 "��",
0 "���"
/bc_alt_yes_no_id.4
1 "��",
0 "���"
/bc_alt_yes_no_id.5
1 "��",
0 "���"
/bc_alt_yes_no_id.6
1 "��",
0 "���"
/bc_alt_yes_no_id.7
1 "��",
0 "���"
/bc_alt_yes_no_id.8
1 "��",
0 "���"
/bc_creat_yes_no_id.1
1 "��",
0 "���"
/bc_creat_yes_no_id.2
1 "��",
0 "���"
/bc_creat_yes_no_id.3
1 "��",
0 "���"
/bc_creat_yes_no_id.4
1 "��",
0 "���"
/bc_creat_yes_no_id.5
1 "��",
0 "���"
/bc_creat_yes_no_id.6
1 "��",
0 "���"
/bc_creat_yes_no_id.7
1 "��",
0 "���"
/bc_creat_yes_no_id.8
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.1
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.2
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.3
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.4
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.5
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.6
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.7
1 "��",
0 "���"
/bc_alk_phosphatase_yes_no_id.8
1 "��",
0 "���"
/bc_mochevina_yes_no_id.1
1 "��",
0 "���"
/bc_mochevina_yes_no_id.2
1 "��",
0 "���"
/bc_mochevina_yes_no_id.3
1 "��",
0 "���"
/bc_mochevina_yes_no_id.4
1 "��",
0 "���"
/bc_mochevina_yes_no_id.5
1 "��",
0 "���"
/bc_mochevina_yes_no_id.6
1 "��",
0 "���"
/bc_mochevina_yes_no_id.7
1 "��",
0 "���"
/bc_mochevina_yes_no_id.8
1 "��",
0 "���".

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