CREATE OR REPLACE TABLE `proyecto3-428922.dataset.dataset_dummies` AS
SELECT
  *,
  IF(more_90_days_overdue_status = 'Yes', 1, 0) AS overdue_yes,
  IF(more_90_days_overdue_status = 'No', 1, 0) AS overdue_no,
  IF(Riesgo_Deuda = 'Bajo Riesgo', 1, 0) AS risk_low,
  IF(Riesgo_Deuda = 'Riesgo Medio', 1, 0) AS risk_medium,
  IF(Riesgo_Deuda = 'Alto Riesgo', 1, 0) AS risk_high,
  IF(Capacidad_Endeudamiento = 'Bajo', 1, 0) AS debt_capacity_low,
  IF(Capacidad_Endeudamiento = 'Medio', 1, 0) AS debt_capacity_medium,
  IF(Capacidad_Endeudamiento = 'Alto', 1, 0) AS debt_capacity_high,
  IF(age BETWEEN 0 AND 20, 1, 0) AS age_0_20,
  IF(age BETWEEN 21 AND 40, 1, 0) AS age_21_40,
  IF(age BETWEEN 41 AND 60, 1, 0) AS age_41_60,
  IF(age BETWEEN 61 AND 80, 1, 0) AS age_61_80,
  IF(age BETWEEN 81 AND 100, 1, 0) AS age_81_100
FROM
  `proyecto3-428922.dataset.dataset_1`
