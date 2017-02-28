SET hive.cli.print.header=true;

SELECT
state, AVG(clinical_process_score + outcome_score + patient_exp_score + infections_score)/4 as avg_state_score, AVG(clinical_process_score) as clinical_process_score, 
AVG(outcome_score) as outcome_score, AVG(patient_exp_score) as patient_exp_score, AVG(infections_score) as infections_score, STDDEV((clinical_process_score + outcome_score + patient_exp_score)/3) as stdev_state_score
FROM grand_table
WHERE clinical_process_score >= 0 AND outcome_score >= 0 AND patient_exp_score >= 0 AND infections_score >= 0 and infections_score >= 0
GROUP BY state
ORDER BY avg_state_score DESC
LIMIT 10;