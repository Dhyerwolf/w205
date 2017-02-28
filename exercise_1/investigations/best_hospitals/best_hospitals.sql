SET hive.cli.print.header=true;

SELECT
provider_id, hospital_name, (clinical_process_score + outcome_score + patient_exp_score + infections_score)/4 as hospital_score, clinical_process_score, outcome_score, patient_exp_score, infections_score
FROM grand_table
ORDER BY hospital_score DESC
LIMIT 10;