DROP TABLE ami_death;
CREATE TABLE ami_death as
select
provider_id,cast(score as float) AS ami_death_score
FROM death_schema
WHERE measure_id = 'MORT_30_AMI';

DROP TABLE heart_failure;
CREATE TABLE heart_failure as
select
provider_id,cast(score as float) as heart_failure_score
FROM death_schema
WHERE measure_id = 'MORT_30_HF';

DROP TABLE pneumonia;
CREATE TABLE pneumonia as
select
provider_id,cast(score as float) as pneumonia_score
FROM death_schema
WHERE measure_id = 'MORT_30_PN';

DROP TABLE pregnancy_care;
CREATE TABLE pregnancy_care as
select
provider_id,cast(score as float) as pregnancy_care_score
FROM effective_care_schema
WHERE measure_id = 'PC_01';

DROP TABLE flu_vacc;
CREATE TABLE flu_vacc as
select
provider_id,cast(score as float) as flu_vacc_score
FROM effective_care_schema
WHERE measure_id = 'IMM_2';

DROP TABLE ami_death_stats;
CREATE TABLE ami_death_stats as
select
STDDEV(ami_death_score) as ami_death_stdev,	
AVG(ami_death_score) as ami_death_avg
FROM ami_death;

DROP TABLE heart_failure_stats;
CREATE TABLE heart_failure_stats as
select
STDDEV(heart_failure_score) as heart_failure_stdev,	
AVG(heart_failure_score) as heart_failure_avg
FROM heart_failure;

DROP TABLE pneumonia_stats;
CREATE TABLE pneumonia_stats as
select
STDDEV(pneumonia_score) as pneumonia_stdev,	
AVG(pneumonia_score) as pneumonia_avg
FROM pneumonia;

DROP TABLE pregnancy_care_stats;
CREATE TABLE pregnancy_care_stats as
select
STDDEV(pregnancy_care_score) as pregnancy_care_stdev,	
AVG(pregnancy_care_score) as pregnancy_care_avg
FROM pregnancy_care;

DROP TABLE flu_vacc_stats;
CREATE TABLE flu_vacc_stats as
select
STDDEV(flu_vacc_score) as flu_vacc_stdev,	
AVG(flu_vacc_score) as flu_vacc_avg
FROM flu_vacc;

DROP TABLE number_cavern;
CREATE TABLE number_cavern as
SELECT ami_death_stdev, ami_death_avg, heart_failure_stdev, heart_failure_avg, pneumonia_stdev, pneumonia_avg, pregnancy_care_stdev, pregnancy_care_avg, 
flu_vacc_stdev, flu_vacc_avg
FROM ami_death_stats, heart_failure_stats, pneumonia_stats, pregnancy_care_stats, flu_vacc_stats;

DROP TABLE grand_table;
CREATE TABLE grand_table as
select 
surveys_responses_schema.provider_ID, surveys_responses_schema.hospital_name,
surveys_responses_schema.state, cast(surveys_responses_schema.clinical_process_score as float) as clinical_process_score,
cast(surveys_responses_schema.patient_exp_score as float) as patient_exp_score,
cast(surveys_responses_schema.outcome_score as float) as outcome_score,
cast(surveys_responses_schema.infections_score as float) as infections_score,
ami_death.ami_death_score,
heart_failure.heart_failure_score,
pneumonia.pneumonia_score,
pregnancy_care.pregnancy_care_score, 
flu_vacc.flu_vacc_score
FROM surveys_responses_schema, ami_death, heart_failure, pneumonia, pregnancy_care, flu_vacc
WHERE surveys_responses_schema.provider_id = ami_death.provider_id
AND surveys_responses_schema.provider_id = heart_failure.provider_id 
AND surveys_responses_schema.provider_id = pneumonia.provider_id
AND surveys_responses_schema.provider_id = pregnancy_care.provider_id 
AND surveys_responses_schema.provider_id = flu_vacc.provider_id
ORDER BY surveys_responses_schema.provider_id;