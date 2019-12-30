GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\07a_ovarian_adverse_event_details.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
hospital_id  "����� ����� (���. ������)",
patient_number "����� ��������",
adverse_event_yes_no_id "���������� ��������������� ������� ��/���",
user "������������",
insert_date "���� �����������",
name "������������ ������� (��������� ��������)",
serious_yes_no_id "��� ��������� �������? ��/���",
start_date "���� ������",
resolved_yes_no_id "������� �����������? ��/���",
resolved_date "���� ���������� �������",
event_intensity_decreased_yes_no_id "������������ ������� ��������� ����� ����������� ������ ��������� ��� ���������� ��� ����?",
event_occurred_again_yes_no_id "������� �������� �������� ����� ������������� ������ ���������?",
event_associated_with_drug_yes_no_id "������� ������� � ������� ��������� �������� J&J?".

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
11 "���� 011 - ��������� �������������� ��������� �. �����",
/adverse_event_yes_no_id
serious_yes_no_id
resolved_yes_no_id
event_intensity_decreased_yes_no_id
event_occurred_again_yes_no_id
event_associated_with_drug_yes_no_id
1 "��",
0 "���".

MISSING VALUES
patient_id
visit_id
adverse_event_yes_no_id (-1).

USE ALL.
COMPUTE filter_$=(adverse_event_yes_no_id=1).
VARIABLE LABEL filter_$ 'adverse_event_yes_no_id=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=
name serious_yes_no_id 
resolved_yes_no_id 
event_intensity_decreased_yes_no_id 
event_occurred_again_yes_no_id 
event_associated_with_drug_yes_no_id
  /ORDER=ANALYSIS.


SORT CASES  BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=name serious_yes_no_id resolved_yes_no_id event_intensity_decreased_yes_no_id 
    event_occurred_again_yes_no_id event_associated_with_drug_yes_no_id
  /ORDER=ANALYSIS.
