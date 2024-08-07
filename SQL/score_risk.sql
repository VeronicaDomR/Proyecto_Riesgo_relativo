CREATE OR REPLACE TABLE `proyecto3-428922.dataset.dataset_risk_scores` AS
SELECT
  *,
  0.4 * IF(more_90_days_overdue_status = 'Yes', 1, 0) AS more_90_days_overdue_score,
  0.3 * debt_ratio AS debt_ratio_score,
  0.2 * IF(Capacidad_Endeudamiento = 'Alto', 1, 0) +
  0.1 * IF(Capacidad_Endeudamiento = 'Medio', 1, 0) AS capacity_score,
  0.1 * IF(age BETWEEN 0 AND 20, 1, 0) * 0.2 +
  0.1 * IF(age BETWEEN 21 AND 40, 1, 0) * 0.5 +
  0.1 * IF(age BETWEEN 41 AND 60, 1, 0) * 0.3 AS age_score,
  (0.4 * IF(more_90_days_overdue_status = 'Yes', 1, 0)) +
  (0.3 * debt_ratio) +
  (0.2 * IF(Capacidad_Endeudamiento = 'Alto', 1, 0) + 0.1 * IF(Capacidad_Endeudamiento = 'Medio', 1, 0)) +
  (0.1 * IF(age BETWEEN 0 AND 20, 1, 0) * 0.2 + 0.1 * IF(age BETWEEN 21 AND 40, 1, 0) * 0.5 + 0.1 * IF(age BETWEEN 41 AND 60, 1, 0) * 0.3) AS risk_score
FROM
  `proyecto3-428922.dataset.dataset_1`

