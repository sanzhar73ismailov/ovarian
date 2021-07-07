GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\02_ovarian_general_data.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
  
* ovarian_general_data.
VARIABLE LABELS
age_diag "������� �� ������ ������������� ��������",
age_visit "������� �� ������ ��������� � ������������",
id "",
patient_id "������� (����.����)",
visit_id "�����",
visit_date "���� ������",
date_birth "���� ��������",
weight_kg "����� ���� � �����������",
height_sm "���� � �����������",
nationality_id "���������� ��������������",
nationality_if_other "���������� �������������� (���� ��� � ������)",
place_living_id "����� ����������",
education_id "�����������",
social_economic_status_id "���������-������������� ���������",
diag_cancer_estab_date "���� ���������� �������� ��� ��������",
diag_cancer_tnm_stage_t_id "TNM ������ �� ������ ���������� �������� - T",
diag_cancer_tnm_stage_n_id "TNM ������ �� ������ ���������� �������� - N",
diag_cancer_tnm_stage_m_id "TNM ������ �� ������ ���������� �������� - M",
diag_cancer_clin_stage_id "����������� ������ ����������� �� ������ ���������� ��������",
surgical_treat_yes_no_id "������������� �������: ��/���",
surgical_treat_ecstir_yes_no_id "������������� �������: 1. ����������� ����� � ����������",
surgical_treat_ecstir_date "������������� �������: 1. ����������� ����� � ���������� ����",
surgical_treatment_gister01_yes_no_id "������������� �������: 2. ������������� I",
surgical_treatment_gister01_date "������������� �������: 2. ������������� I ����",
surgical_treatment_gister02_yes_no_id "������������� �������: 3. ������������� II",
surgical_treatment_gister02_date "������������� �������: 3. ������������� II ����",
surgical_treatment_gister03_yes_no_id "������������� �������: 4. ������������� III",
surgical_treatment_gister03_date "������������� �������: 4. ������������� III ����",
surgical_treatment_diag_laparotomia_yes_no_id "������������� �������: 5. ��������������� �����������",
surgical_treatment_diag_laparotomia_date "������������� �������: 5. ��������������� ����������� ����",
surgical_treatment_diag_laparoscopia_yes_no_id "������������� �������: 6. ��������������� ������������",
surgical_treatment_diag_laparoscopia_date "������������� �������: 6. ��������������� ������������ ����",
surgical_treatment_explorat_laparotomia_yes_no_id "������������� �������: 7. �������������� �����������",
surgical_treatment_explorat_laparotomia_date "������������� �������: 7. �������������� ����������� ����",
chem_treat_yes_no_id "�������������/����������� ������������: ��/���",
chem_treat_antracyc_yes_no_id "�������������/����������� ������������: ������������",
chem_treat_platina_yes_no_id "�������������/����������� ������������: ��������� �������",
chem_treat_taxans_yes_no_id "�������������/����������� ������������: �������",
chem_treat_cyclophosph_yes_no_id "�������������/����������� ������������: �������������",
chem_treat_other_yes_no_id "�������������/����������� ������������: ������ ������������",
chem_treat_other_descr "�������������/����������� ������������: ���� ��, ����������� ��� ���������:",
progress_date "���� ����������� ���������������� �����������",
progress_ca125_yes_no_id "���������������� �����������, ���.�������: �� 125 ��/���",
progress_ca125 "���������������� �����������, ���.�������: �� 125 ��/��",
progress_instr_mrt_yes_no_id "���������������� �����������, ���������������� ������������: ��� ��� ��/���",
progress_instr_mrt_date "���������������� �����������, ���������������� ������������: ��� ��� ����",
progress_instr_mrt_norm_yes_no_id "���������������� �����������, ���������������� ������������: ��� ��� �����/���������",
progress_instr_mrt_descr "���������������� �����������, ���������������� ������������: ��� ��� ����������",
progress_instr_us_yes_no_id "���������������� �����������, ���������������� ������������: ��� ��� ��/���",
progress_instr_us_date "���������������� �����������, ���������������� ������������: ��� ��� ����",
progress_instr_us_norm_yes_no_id "���������������� �����������, ���������������� ������������: ��� ��� �����/���������",
progress_instr_us_descr "���������������� �����������, ���������������� ������������: ��� ��� ����������",
progress_instr_kt_yes_no_id "���������������� �����������, ���������������� ������������: �� ��� ��/���",
progress_instr_kt_date "���������������� �����������, ���������������� ������������: �� ��� ����",
progress_instr_kt_norm_yes_no_id "���������������� �����������, ���������������� ������������: �� ��� �����/���������",
progress_instr_kt_descr "���������������� �����������, ���������������� ������������: �� ��� ����������",
progress_instr_ekg_yes_no_id "���������������� �����������, ���������������� ������������: ��� ��/���",
progress_instr_ekg_date "���������������� �����������, ���������������� ������������: ��� ����",
progress_instr_ekg_norm_yes_no_id "���������������� �����������, ���������������� ������������: ��� �����/���������",
progress_instr_ekg_descr "���������������� �����������, ���������������� ������������: ��� ����������",
recidive_yes_no_id "������� �����������: ��/���",
metastases_yes_no_id "���������: ��/���",
metastases_lung_yes_no_id "���������: �����",
metastases_lung_date "���������: ����� ����",
metastases_hepat_yes_no_id "���������: ������",
metastases_hepat_date "���������: ������ ����",
metastases_osteo_yes_no_id "���������: �����",
metastases_osteo_date "���������: ����� ����",
metastases_renal_yes_no_id "���������: �����",
metastases_renal_date "���������: ����� ����",
metastases_lymph_nodes_yes_no_id "���������: �/����",
metastases_lymph_nodes_date "���������: �/���� ����",
metastases_plevra_yes_no_id "���������: ������",
metastases_plevra_date "���������: ������ ����",
metastases_other_descr "���������: ����",
metastases_surgical_treat_yes_no_id "���������: ���� ��������� ������������� �������������",
metastases_surgical_treat_date "���������: ���� ���������� �������������� �������������",
metastases_surgical_treat_descr "���������: ����� ������������ �������������",
chem_1st_line_treat_yes_no_id "1-�� ����� �� �������. ���� ��������: ��/���",
chem_1st_karboplatin_yes_no_id "1-�� ����� �� �������. ���� ��������: ����������� (��, ���)",
chem_1st_cisplatin_yes_no_id "1-�� ����� �� �������. ���� ��������: ��������� (��, ���)",
chem_1st_ciklofosfan_yes_no_id "1-�� ����� �� �������. ���� ��������: ����������� (��, ���)",
chem_1st_paklitaksel_yes_no_id "1-�� ����� �� �������. ���� ��������: ����������� (��, ���)",
chem_1st_doksorubicin_yes_no_id "1-�� ����� �� �������. ���� ��������: ������������ (��, ���)",
chem_1st_bevacizumab_yes_no_id "1-�� ����� �� �������. ���� ��������: ����������� (��, ���)",
chem_1st_topotekan_yes_no_id "1-�� ����� �� �������. ���� ��������: ��������� (��, ���)",
chem_1st_gemcitabin_yes_no_id "1-�� ����� �� �������. ���� ��������: ���������� (��, ���)",
chem_1st_vinorelbin_yes_no_id "1-�� ����� �� �������. ���� ��������: ����������� (��, ���)",
chem_1st_irinotekan_yes_no_id "1-�� ����� �� �������. ���� ��������: ���������� (��, ���)",
chem_1st_etopozid_yes_no_id "1-�� ����� �� �������. ���� ��������: �������� (��, ���)",
chem_1st_epirubicin_yes_no_id "1-�� ����� �� �������. ���� ��������: ���������� (��, ���)",
chem_1st_docetaxel_yes_no_id "1-�� ����� �� �������. ���� ��������: ���������� (��, ���)",
chem_1st_oksaliplatin_yes_no_id "1-�� ����� �� �������. ���� ��������: ������������ (��, ���)",
chem_1st_trabektidin_yes_no_id "1-�� ����� �� �������. ���� ��������: ����������� (��, ���)",
chem_1st_other_yes_no_id "1-�� ����� �� �������. ���� ��������: ������ (��, ���)",
chem_1st_other_descr "1-�� ����� �� �������. ���� ��������: ���� ��, ������� ������� �������� �������� ���������",
chem_1st_date_start "1-�� ����� �� �������. ���� ��������: ���� ������ �������",
chem_1st_date_finish "1-�� ����� �� �������. ���� ��������: ���� ��������� �������",
chem_1st_course_number "1-�� ����� �� �������. ���� ��������: ����� ������",
chem_1st_concomitant_therapy_descr "1-�� ����� �� �������. ���� ��������: ������������� �������",
chem_2st_trabectedin_yes_no_id "2-�� ����� �� �������. ���� �������� (1 ���� �������): ����������� (��, ���)",
chem_2st_trabectedin_dose "2-�� ����� �� �������. ���� �������� (1 ���� �������): �����������, ����",
chem_2st_pld_yes_no_id "2-�� ����� �� �������. ���� �������� (1 ���� �������): ��� (��, ���)",
chem_2st_pld_dose "2-�� ����� �� �������. ���� �������� (1 ���� �������): ���, ����",
chem_2st_doxopeg_yes_no_id "2-�� ����� �� �������. ���� �������� (1 ���� �������): �������� (��, ���)",
chem_2st_doxopeg_dose "2-�� ����� �� �������. ���� �������� (1 ���� �������): ��������, ����",
chem_2st_kelix_yes_no_id "2-�� ����� �� �������. ���� �������� (1 ���� �������): ������ (��, ���)",
chem_2st_kelix_dose "2-�� ����� �� �������. ���� �������� (1 ���� �������): ������ , ����",
chem_2st_doksorubicin_yes_no_id "2-�� ����� �� �������. ���� �������� (1 ���� �������): ������������ (��, ���)",
chem_2st_doksorubicin_dose "2-�� ����� �� �������. ���� �������� (1 ���� �������): ������������ , ����",
chem_2st_other_yes_no_id "2-�� ����� �� �������. ���� �������� (1 ���� �������): ���� (��, ���)",
chem_2st_other_dose "2-�� ����� �� �������. ���� �������� (1 ���� �������): ����, ����",
chem_2st_concomitant_therapy_descr "2-�� ����� �� �������. ���� ��������: ������������� �������",
pld_or_doxopeg_or_kelix_sum "2-�� ����� �� �������. ���� �������� (1 ���� �������): ��� (��������/������), ����",
undesirable_event_yes_no_id "������������� ������� (��, ���) - ������� �� ������� �����-���� ������������� ������� ��� ���������� ������������ ����������� � ���������� � ���? ���� ��, ������� ��������� ����� ��",
checked "��������� ���������",
user "",
insert_date "���� �����������".
VALUE LABELS
nationality_id
1 "������",
2 "�������",
3 "������",
4 "������",
5 "������� ",
6 "������"
/place_living_id
1 "�����",
2 "����"
/education_id
1 "��� ������������ �����������",
2 "��������� �����",
3 "������� �����",
4 "�������/�����������/������ ����������� "
/social_economic_status_id
1 "������",
2 "�������",
3 "�������"
/diag_cancer_tnm_stage_t_id
-1 "��� ������",
1 "T0",
2 "Tis",
3 "T1",
4 "T2",
5 "T3",
6 "T4",
7 "Tx"
/diag_cancer_tnm_stage_n_id
-1 "��� ������",
1 "N0",
2 "N1",
3 "N2",
4 "N3",
5 "Nx"
/diag_cancer_tnm_stage_m_id
-1 "��� ������",
1 "M0",
2 "M1",
3 "Mx"
/diag_cancer_clin_stage_id
-1 "��� ������",
1 "I",
2 "II",
3 "III",
4 "IV"
/surgical_treat_yes_no_id
1 "��",
0 "���"
/surgical_treat_ecstir_yes_no_id
1 "��",
0 "���"
/surgical_treatment_gister01_yes_no_id
1 "��",
0 "���"
/surgical_treatment_gister02_yes_no_id
1 "��",
0 "���"
/surgical_treatment_gister03_yes_no_id
1 "��",
0 "���"
/surgical_treatment_diag_laparotomia_yes_no_id
1 "��",
0 "���"
/surgical_treatment_diag_laparoscopia_yes_no_id
1 "��",
0 "���"
/surgical_treatment_explorat_laparotomia_yes_no_id
1 "��",
0 "���"
/chem_treat_yes_no_id
1 "��",
0 "���"
/chem_treat_antracyc_yes_no_id
1 "��",
0 "���"
/chem_treat_platina_yes_no_id
1 "��",
0 "���"
/chem_treat_taxans_yes_no_id
1 "��",
0 "���"
/chem_treat_cyclophosph_yes_no_id
1 "��",
0 "���"
/chem_treat_other_yes_no_id
1 "��",
0 "���"
/progress_ca125_yes_no_id
1 "��",
0 "���"
/progress_instr_mrt_yes_no_id
1 "��",
0 "���"
/progress_instr_mrt_norm_yes_no_id
1 "��",
0 "���"
/progress_instr_us_yes_no_id
1 "��",
0 "���"
/progress_instr_us_norm_yes_no_id
1 "��",
0 "���"
/progress_instr_kt_yes_no_id
1 "��",
0 "���"
/progress_instr_kt_norm_yes_no_id
1 "��",
0 "���"
/progress_instr_ekg_yes_no_id
1 "��",
0 "���"
/progress_instr_ekg_norm_yes_no_id
1 "��",
0 "���"
/recidive_yes_no_id
1 "��",
0 "���"
/metastases_yes_no_id
1 "��",
0 "���"
/metastases_lung_yes_no_id
1 "��",
0 "���"
/metastases_hepat_yes_no_id
1 "��",
0 "���"
/metastases_osteo_yes_no_id
1 "��",
0 "���"
/metastases_renal_yes_no_id
1 "��",
0 "���"
/metastases_lymph_nodes_yes_no_id
1 "��",
0 "���"
/metastases_plevra_yes_no_id
1 "��",
0 "���"
/metastases_surgical_treat_yes_no_id
1 "��",
0 "���"
/chem_1st_line_treat_yes_no_id
1 "��",
0 "���"
/chem_1st_karboplatin_yes_no_id
1 "��",
0 "���"
/chem_1st_cisplatin_yes_no_id
1 "��",
0 "���"
/chem_1st_ciklofosfan_yes_no_id
1 "��",
0 "���"
/chem_1st_paklitaksel_yes_no_id
1 "��",
0 "���"
/chem_1st_doksorubicin_yes_no_id
1 "��",
0 "���"
/chem_1st_bevacizumab_yes_no_id
1 "��",
0 "���"
/chem_1st_topotekan_yes_no_id
1 "��",
0 "���"
/chem_1st_gemcitabin_yes_no_id
1 "��",
0 "���"
/chem_1st_vinorelbin_yes_no_id
1 "��",
0 "���"
/chem_1st_irinotekan_yes_no_id
1 "��",
0 "���"
/chem_1st_etopozid_yes_no_id
1 "��",
0 "���"
/chem_1st_epirubicin_yes_no_id
1 "��",
0 "���"
/chem_1st_docetaxel_yes_no_id
1 "��",
0 "���"
/chem_1st_oksaliplatin_yes_no_id
1 "��",
0 "���"
/chem_1st_trabektidin_yes_no_id
1 "��",
0 "���"
/chem_1st_other_yes_no_id
1 "��",
0 "���"
/chem_2st_trabectedin_yes_no_id
1 "��",
0 "���"
/chem_2st_pld_yes_no_id
1 "��",
0 "���"
/chem_2st_doxopeg_yes_no_id
1 "��",
0 "���"
/chem_2st_kelix_yes_no_id
1 "��",
0 "���"
/chem_2st_doksorubicin_yes_no_id
1 "��",
0 "���"
/chem_2st_other_yes_no_id
1 "��",
0 "���"
/undesirable_event_yes_no_id
1 "��",
0 "���".

MISSING VALUES
id
patient_id
visit_id
weight_kg
height_sm
nationality_id
place_living_id
education_id
social_economic_status_id
diag_cancer_tnm_stage_t_id
diag_cancer_tnm_stage_n_id
diag_cancer_tnm_stage_m_id
diag_cancer_clin_stage_id
surgical_treat_yes_no_id
surgical_treat_ecstir_yes_no_id
surgical_treatment_gister01_yes_no_id
surgical_treatment_gister02_yes_no_id
surgical_treatment_gister03_yes_no_id
surgical_treatment_diag_laparotomia_yes_no_id
surgical_treatment_diag_laparoscopia_yes_no_id
surgical_treatment_explorat_laparotomia_yes_no_id
chem_treat_yes_no_id
chem_treat_antracyc_yes_no_id
chem_treat_platina_yes_no_id
chem_treat_taxans_yes_no_id
chem_treat_cyclophosph_yes_no_id
chem_treat_other_yes_no_id
progress_ca125_yes_no_id
progress_ca125
progress_instr_mrt_yes_no_id
progress_instr_mrt_norm_yes_no_id
progress_instr_us_yes_no_id
progress_instr_us_norm_yes_no_id
progress_instr_kt_yes_no_id
progress_instr_kt_norm_yes_no_id
progress_instr_ekg_yes_no_id
progress_instr_ekg_norm_yes_no_id
recidive_yes_no_id
metastases_yes_no_id
metastases_lung_yes_no_id
metastases_hepat_yes_no_id
metastases_osteo_yes_no_id
metastases_renal_yes_no_id
metastases_lymph_nodes_yes_no_id
metastases_plevra_yes_no_id
metastases_surgical_treat_yes_no_id
chem_1st_line_treat_yes_no_id
chem_1st_karboplatin_yes_no_id
chem_1st_cisplatin_yes_no_id
chem_1st_ciklofosfan_yes_no_id
chem_1st_paklitaksel_yes_no_id
chem_1st_doksorubicin_yes_no_id
chem_1st_bevacizumab_yes_no_id
chem_1st_topotekan_yes_no_id
chem_1st_gemcitabin_yes_no_id
chem_1st_vinorelbin_yes_no_id
chem_1st_irinotekan_yes_no_id
chem_1st_etopozid_yes_no_id
chem_1st_epirubicin_yes_no_id
chem_1st_docetaxel_yes_no_id
chem_1st_oksaliplatin_yes_no_id
chem_1st_trabektidin_yes_no_id
chem_1st_other_yes_no_id
chem_1st_course_number
chem_2st_trabectedin_yes_no_id
chem_2st_trabectedin_dose
chem_2st_pld_yes_no_id
chem_2st_pld_dose
chem_2st_doxopeg_yes_no_id
chem_2st_doxopeg_dose
chem_2st_kelix_yes_no_id
chem_2st_kelix_dose
chem_2st_doksorubicin_yes_no_id
chem_2st_doksorubicin_dose
chem_2st_other_yes_no_id
chem_2st_other_dose
undesirable_event_yes_no_id
checked (-1).

FREQUENCIES VARIABLES=
nationality_id
place_living_id
education_id
social_economic_status_id
diag_cancer_tnm_stage_t_id
diag_cancer_tnm_stage_n_id
diag_cancer_tnm_stage_m_id
diag_cancer_clin_stage_id
surgical_treat_yes_no_id
surgical_treat_ecstir_yes_no_id
surgical_treatment_gister01_yes_no_id
surgical_treatment_gister02_yes_no_id
surgical_treatment_gister03_yes_no_id
surgical_treatment_diag_laparotomia_yes_no_id
surgical_treatment_diag_laparoscopia_yes_no_id
surgical_treatment_explorat_laparotomia_yes_no_id
chem_treat_yes_no_id
chem_treat_antracyc_yes_no_id
chem_treat_platina_yes_no_id
chem_treat_taxans_yes_no_id
chem_treat_cyclophosph_yes_no_id
chem_treat_other_yes_no_id
progress_ca125_yes_no_id
progress_instr_mrt_yes_no_id
progress_instr_mrt_norm_yes_no_id
progress_instr_us_yes_no_id
progress_instr_us_norm_yes_no_id
progress_instr_kt_yes_no_id
progress_instr_kt_norm_yes_no_id
progress_instr_ekg_yes_no_id
progress_instr_ekg_norm_yes_no_id
recidive_yes_no_id
metastases_yes_no_id
metastases_lung_yes_no_id
metastases_hepat_yes_no_id
metastases_osteo_yes_no_id
metastases_renal_yes_no_id
metastases_lymph_nodes_yes_no_id
metastases_plevra_yes_no_id
metastases_surgical_treat_yes_no_id
chem_1st_line_treat_yes_no_id
chem_1st_karboplatin_yes_no_id
chem_1st_cisplatin_yes_no_id
chem_1st_ciklofosfan_yes_no_id
chem_1st_paklitaksel_yes_no_id
chem_1st_doksorubicin_yes_no_id
chem_1st_bevacizumab_yes_no_id
chem_1st_topotekan_yes_no_id
chem_1st_gemcitabin_yes_no_id
chem_1st_vinorelbin_yes_no_id
chem_1st_irinotekan_yes_no_id
chem_1st_etopozid_yes_no_id
chem_1st_epirubicin_yes_no_id
chem_1st_docetaxel_yes_no_id
chem_1st_oksaliplatin_yes_no_id
chem_1st_trabektidin_yes_no_id
chem_1st_other_yes_no_id
chem_2st_trabectedin_yes_no_id
chem_2st_pld_yes_no_id
chem_2st_doxopeg_yes_no_id
chem_2st_kelix_yes_no_id
chem_2st_doksorubicin_yes_no_id
chem_2st_other_yes_no_id
undesirable_event_yes_no_id
/ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=
age_diag
age_visit
weight_kg
height_sm
progress_ca125
chem_1st_course_number
chem_2st_trabectedin_dose
pld_or_doxopeg_or_kelix_sum
chem_2st_doksorubicin_dose
chem_2st_other_dose
checked
/STATISTICS=MEAN STDDEV VARIANCE RANGE MIN MAX SEMEAN.

 * chem_2st_pld_dose
chem_2st_doxopeg_dose
chem_2st_kelix_dose

NPAR TESTS
K-S(NORMAL)=
weight_kg
height_sm
progress_ca125
chem_1st_course_number
chem_2st_trabectedin_dose
chem_2st_pld_dose
chem_2st_doxopeg_dose
chem_2st_kelix_dose
chem_2st_doksorubicin_dose
chem_2st_other_dose
pld_or_doxopeg_or_kelix_sum
/MISSING ANALYSIS.

* �������������� �����.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /XLS  DOCUMENTFILE='C:\temp\ovarian_stat_20190910\report\02_ovarian_general_data.xls'
     OPERATION=CREATEFILE
     LOCATION=LASTCOLUMN  NOTESCAPTIONS=YES.
