CREATE OR REPLACE TABLE `proyecto3-428922.dataset.dataset_classified` AS
SELECT
  *,
  CASE 
    WHEN risk_score > 0.5 THEN 'Bad Payer'
    ELSE 'Good Payer'
  END AS payment_classification
FROM
  `proyecto3-428922.dataset.dataset_risk_scores`