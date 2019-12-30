GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\00_ovarian_patient.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.

VARIABLE LABELS
doctor  "��� �������������",
hospital_id  "����� ����� (���. ������)",
patient_number "����� ��������",
status_include  "������ ���������: 1 - �������; 0 - �� �������; -1 - �� ��������� �������� ��������� (�� ���������)",
user "������������",
insert_date "���� ����������".


VALUE LABELS
hospital_id
1 "���� 001 - ��������� ������-����������������� �������� ��������� � ���������� (���������)",
2 "���� 002 - ��������� �������������� ��������� �.������",
3 "���� 003 - ����-������������� ��������� �������������� ���������",
4 "���� 004 - �������������� ����� �. ������",
5 "���� 005 - ��������� �������������� ��������� ���",
6 "���� 006 - ������������ ��������� �������������� ���������",
7 "���� 007 - ��������-������������� ��������� �������������� ���������",
8 "���� 008 - ��������� �������������� ��������� ���",
9 "���� 009 - ���������� ��������� �������������� ���������",
10 "���� 010 - �������������� ��������� �������������� ���������",
11 "���� 011 - ��������� �������������� ��������� �. �����"
/status_include
1 "��"
0 "���"
-1 "�� ��������� �������� ���������".

FREQUENCIES VARIABLES=hospital_id
  /ORDER=ANALYSIS.

SORT CASES  BY hospital_id.
SPLIT FILE LAYERED BY hospital_id.


FREQUENCIES VARIABLES=status_include
  /ORDER=ANALYSIS.

SPLIT FILE OFF.


GET DATA
  /TYPE=XLS
  /FILE='C:\temp\ovarian_stat_20190910\data\01_ovarian_inclusion.xls'
  /SHEET=name 'Sheet 1'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME �����������4 WINDOW=FRONT.

VARIABLE LABELS
patient_id	"�������",
visit_id	"�����",
age_18_and_more_yes_no_id	"��: ������� 18 ��� ��� ������",
histol_confirmed_cr_yes_no_id	"��: ��������������� �������������� ������������� ��� �������",
ecog01_yes_no_id	"��: ECOG 0-1",
recurrent_plat_sensit_cancer_yes_no_id	"��: �������� � �������������� ��������������������� ����� ������� (������������� �������� �� 6 �� 12 �������)",
treatment_trabect_after_doxorub_yes_no_id	"��: ��������, ���������� 1-2 ������ ������� ���������� ����������� �� ������ �������� ���������������������� ���� �������",
received_no_more_one_line_plat_chem_regimes_yes_no_id	"��: ��������, ���������� �� ����� 1 ����� ������������ ������������������ ��������",
doct_decision_trabectedin_yes_no_id	"��: ������� ����� � ������� �������� �������������",
signed_consent_yes_no_id	"��: ����������� ��������������� �������� ����� ���������� � ������������",
age_18_less_yes_no_id	"��: ������� �� 18 ��� ",
received_more_two_line_plat_chem_yes_no_id	"��: ��������, ���������� ������� ����� 2 ����� ������������ ",
platinum_refractory_ov_cr_yes_no_id	"��: �������� � �������-������������ ����� ���� ������� (���������������� �� ���� ������������ 1-� �����)",
platinum_resistant_ov_cr_yes_no_id	"��: �������� � �������-������������ ����� ���� �������: ��� <6 ������� (���������������� � ������� ����� ������� ����� ������ ����� ������������ �� ������ �������)",
refusal_central_venous_catheter_yes_no_id	"��: ����� �������� �� ������������ ��������� ��������",
impaired_hepatic_function_yes_no_id	"��: �������� � ���������� ������� ������ (��������� � ���������� ������� ����������)",
impaired_renal_function_yes_no_id	"��: �������� � ���������� ������� ����� (������� ���������� >1.5 ��/��)",
impaired_hematological_parameters_yes_no_id	"��: �������� � ����������� ���������������� ����������� (������������< 1500/��� � ���������������� < 100000/���)",
impaired_cardiovascular_function_yes_no_id	"��: �������� � ���������� ����������� ��� (� ��������� � ������������� ������ � �� ��������� ������� ����������������� �������)",
kaposi_sarcoma_yes_no_id	"��: ������� ������ � ��������� �� ������, ������� ����� ���������� �������� ��������� �������� ��� ��������� �������� �����-������������ ",
pregnancy_yes_no_id	"��: ������������/��������",
checked	"��������� ���������".


VALUE LABELS
age_18_and_more_yes_no_id
histol_confirmed_cr_yes_no_id
ecog01_yes_no_id
recurrent_plat_sensit_cancer_yes_no_id
treatment_trabect_after_doxorub_yes_no_id
received_no_more_one_line_plat_chem_regimes_yes_no_id
doct_decision_trabectedin_yes_no_id
signed_consent_yes_no_id
age_18_less_yes_no_id
received_more_two_line_plat_chem_yes_no_id
platinum_refractory_ov_cr_yes_no_id
platinum_resistant_ov_cr_yes_no_id
refusal_central_venous_catheter_yes_no_id
impaired_hepatic_function_yes_no_id
impaired_renal_function_yes_no_id
impaired_hematological_parameters_yes_no_id
impaired_cardiovascular_function_yes_no_id
kaposi_sarcoma_yes_no_id
pregnancy_yes_no_id
1 "��"
0 "���".








