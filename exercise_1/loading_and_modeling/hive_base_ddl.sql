DROP TABLE death_schema;
CREATE EXTERNAL TABLE death_schema
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip string,
 county string,
 phone_number string,
 measure string,
 measure_id string,
 ntl_comparison string,
 denominater int,
 score string,
 low_score string,
 high_score string,
 footnote string,
 start_date string,
 end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise1/hospital_compare/death';

DROP TABLE effective_care_schema;
CREATE EXTERNAL TABLE effective_care_schema
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip string,
 county string,
 phone_number string,
 condition string,
 measure_id string,
 measure string,
 score string,
 sample string,
 footnote string,
 start_date string,
 end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise1/hospital_compare/effective_care';

DROP TABLE surveys_responses_schema;
CREATE EXTERNAL TABLE surveys_responses_schema
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip string,
 county_name string,
 clinical_process_score string,
 weighted_clinical string,
 outcome_score string,
 weighted_outcome string,
 patient_exp_score string,
 weighted_patient string,
 infections_score string,
 weighted_infections string,
 efficiency_score string,
 weighted_efficiency string,
 total_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise1/hospital_compare/surveys_responses';









