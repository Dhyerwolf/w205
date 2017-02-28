SET hive.cli.print.header=true;

SELECT CORR(patient_exp_score, (outcome_score + clinical_process_score + infections_score)/3) as patient_overall_corr, CORR(patient_exp_score, outcome_score) as patient_outcome_corr, 
CORR(patient_exp_score, clinical_process_score) as patient_clinical_corr, CORR(patient_exp_score, infections_score) as patient_infections_corr
FROM grand_table;