SET hive.cli.print.header=true;

SELECT
(ami_death_stdev)/(ami_death_avg) as ami_death_ratio, (heart_failure_stdev)/(heart_failure_avg) as heart_failure_ratio, (pneumonia_stdev)/(pneumonia_avg) as pneumonia_ratio, 
(pregnancy_care_stdev)/(pregnancy_care_avg) as pregnancy_care_ratio, (flu_vacc_stdev)/(flu_vacc_avg) as flu_vacc_ratio, ami_death_stdev, ami_death_avg, heart_failure_stdev,
heart_failure_avg, pneumonia_stdev, pneumonia_avg, pregnancy_care_stdev, pregnancy_care_avg, flu_vacc_stdev, flu_vacc_avg
FROM number_cavern;