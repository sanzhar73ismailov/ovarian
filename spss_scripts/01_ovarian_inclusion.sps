GET DATA 
  /TYPE=XLS 
  /FILE='C:\temp\ovarian_stat_20190910\data\00_ovarian_patient.xls' 
  /SHEET=name 'Sheet 1' 
  /CELLRANGE=full 
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.

VARIABLE LABELS
doctor  "ФИО исследователя",
hospital_id  "Номер сайта (мед. центра)",
patient_number "Номер пациента",
status_include  "Статус включения: 1 - включен; 0 - не включен; -1 - не заполняли критерии включения (по умолчанию)",
user "Пользователь",
insert_date "Дата заполнения".


VALUE LABELS
hospital_id
1 "Сайт 001 - Казахский научно-исследовательский институт онкологии и радиологии (КазНИИОиР)",
2 "Сайт 002 - Городской онкологический диспансер г.Алматы",
3 "Сайт 003 - Южно-Казахстанский областной онкологический диспансер",
4 "Сайт 004 - Онкологический центр г. Астана",
5 "Сайт 005 - Областной онкологический диспансер ЗКО",
6 "Сайт 006 - Павлодарский областной онкологический диспансер",
7 "Сайт 007 - Восточно-Казахстанский областной онкологический диспансер",
8 "Сайт 008 - Областной онкологический диспансер СКО",
9 "Сайт 009 - Жамбылский областной онкологический диспансер",
10 "Сайт 010 - Кызылординский областной онкологический диспансер",
11 "Сайт 011 - Областной онкологический диспансер г. Семей"
/status_include
1 "Да"
0 "Нет"
-1 "Не заполняли критерии включения".

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
DATASET NAME Наборданных4 WINDOW=FRONT.

VARIABLE LABELS
patient_id	"Пациент",
visit_id	"Визит",
age_18_and_more_yes_no_id	"КВ: Возраст 18 лет или старше",
histol_confirmed_cr_yes_no_id	"КВ: Гистологический подтвержденный эпителиальный рак яичника",
ecog01_yes_no_id	"КВ: ECOG 0-1",
recurrent_plat_sensit_cancer_yes_no_id	"КВ: Пациенты с рецидивирующим платиночувствительным раком яичника (Бесплатиновый интервал от 6 до 12 месяцев)",
treatment_trabect_after_doxorub_yes_no_id	"КВ: Пациенты, получившие 1-2 циклов лечения препаратом трабектедин по поводу рецидива платиночувствительного рака яичника",
received_no_more_one_line_plat_chem_regimes_yes_no_id	"КВ: Пациенты, получившие не более 1 линии химиотерапии платиносодержащими режимами",
doct_decision_trabectedin_yes_no_id	"КВ: Решение врача о терапии пациента трабектедином",
signed_consent_yes_no_id	"КВ: Подписанное информированное согласие перед включением в исследование",
age_18_less_yes_no_id	"КИ: Возраст до 18 лет ",
received_more_two_line_plat_chem_yes_no_id	"КИ: Пациенты, получившие лечение более 2 линии химиотерапии ",
platinum_refractory_ov_cr_yes_no_id	"КИ: Пациенты с платино-рефрактерным типом рака яичника (прогрессирование на фоне химиотерапии 1-й линии)",
platinum_resistant_ov_cr_yes_no_id	"КИ: Пациенты с платино-резистентным типом рака яичника: БПИ <6 месяцев (прогрессирование в течение шести месяцев после первой линии химиотерапии на основе платины)",
refusal_central_venous_catheter_yes_no_id	"КИ: Отказ пациента от центрального венозного катетера",
impaired_hepatic_function_yes_no_id	"КИ: Пациенты с нарушением функции печени (пациентов с повышенным уровнем билирубина)",
impaired_renal_function_yes_no_id	"КИ: Пациенты с нарушением функции почек (клиренс креатинина >1.5 мг/дл)",
impaired_hematological_parameters_yes_no_id	"КИ: Пациенты с нарушениями гематологических показателей (нейтропенией< 1500/мкл и тромбоцитопенией < 100000/мкл)",
impaired_cardiovascular_function_yes_no_id	"КИ: Пациенты с серьезными нарушениями ССС (у пациентов с заболеваниями сердца и со снижением фракции левожелудочкового выброса)",
kaposi_sarcoma_yes_no_id	"КИ: Саркома Капоши у пациентов со СПИДом, которые могут эффективно лечиться локальной терапией или системной терапией альфа-интерфероном ",
pregnancy_yes_no_id	"КИ: Беременность/лактация",
checked	"Проверено монитором".


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
1 "Да"
0 "Нет".








