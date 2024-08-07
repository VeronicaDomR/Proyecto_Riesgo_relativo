SELECT
  COUNTIF(payment_classification = 'Good Payer' AND default_flag = 0) AS true_positive,
  COUNTIF(payment_classification = 'Good Payer' AND default_flag = 1) AS false_positive,
  COUNTIF(payment_classification = 'Bad Payer' AND default_flag = 0) AS false_negative,
  COUNTIF(payment_classification = 'Bad Payer' AND default_flag = 1) AS true_negative
FROM
  `proyecto3-428922.dataset.dataset_classified`
