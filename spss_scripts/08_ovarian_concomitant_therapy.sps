GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\08_ovarian_concomitant_therapy.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767. 
DATASET NAME �����������1 WINDOW=FRONT. 

VARIABLE LABELS
patient_id "������� (����.����)",
visit_id "�����",
chem_2st_concomitant_therapy_descr "������������� �������: ��������",
checked "��������� ���������",
user "������������",
insert_date "���� �����������".

 * VALUE LABELS

MISSING VALUES
patient_id
visit_id (-1).

SORT CASES BY visit_id.
SPLIT FILE LAYERED BY visit_id.

FREQUENCIES VARIABLES=chem_2st_concomitant_therapy_descr
  /ORDER=ANALYSIS.

*DESCRIPTIVES VARIABLES - No parameters.

*Kolmogor-Smirnov NPAR TESTS - No parameters.
SPLIT FILE OFF.

*CROSSTABS - No parameters.




