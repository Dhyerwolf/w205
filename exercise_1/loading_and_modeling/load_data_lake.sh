#!/bin/bash
tail -n +2 'Readmissions and Deaths - Hospital.csv' > death.csv
tail -n +2 'Timely and Effective Care - Hospital.csv' > effective_care.csv
tail -n +2 'hvbp_tps_11_10_2016.csv' > surveys_responses.csv

hdfs dfs -mkdir -p /user/w205/exercise1/hospital_compare/death
hdfs dfs -mkdir -p /user/w205/exercise1/hospital_compare/effective_care
hdfs dfs -mkdir -p /user/w205/exercise1/hospital_compare/surveys_responses
hdfs dfs -put death.csv /user/w205/exercise1/hospital_compare/death
hdfs dfs -put effective_care.csv /user/w205/exercise1/hospital_compare/effective_care
hdfs dfs -put surveys_responses.csv /user/w205/exercise1/hospital_compare/surveys_responses
