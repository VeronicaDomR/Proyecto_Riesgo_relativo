  # Tabla DEFAULT nulos
SELECT
  'user_id' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.default`
WHERE
  user_id IS NULL
UNION ALL
SELECT
  'default_flag' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.default`
WHERE
  default_flag IS NULL; 

  #Tabla loans_Detail nulos
SELECT
  'user_id' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
WHERE
  user_id IS NULL
UNION ALL
SELECT
  'more_90_days_overdue' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
WHERE
  more_90_days_overdue IS NULL
UNION ALL
SELECT
  'using_lines_not_secured_personal_assets' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
WHERE
  using_lines_not_secured_personal_assets IS NULL
UNION ALL
SELECT
  'number_times_delayed_payment_loan_30_59_days' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
WHERE
  number_times_delayed_payment_loan_30_59_days IS NULL
UNION ALL
SELECT
  'debt_ratio' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
WHERE
  debt_ratio IS NULL
UNION ALL
SELECT
  'number_times_delayed_payment_loan_60_89_days' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
WHERE
  number_times_delayed_payment_loan_60_89_days IS NULL;
  #Tabla loans_outstandig nulos
SELECT
  'user_id' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_outstanding`
WHERE
  user_id IS NULL
UNION ALL
SELECT
  'loan_id' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_outstanding`
WHERE
  loan_id IS NULL
UNION ALL
SELECT
  'loan_type' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.loans_outstanding`
WHERE
  loan_type IS NULL; 
  
  # Tabla user_info nulos
SELECT
  'user_id' AS colum_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.user_info`
WHERE
  user_id IS NULL
UNION ALL
SELECT
  'age' AS column_name,
  COUNT (*) AS null_count
FROM
  `proyecto3-428922.dataset.user_info`
WHERE
  age IS NULL
UNION ALL
SELECT
  'sex' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.user_info`
WHERE
  sex IS NULL
UNION ALL
SELECT
  'last_month_salary' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.user_info`
WHERE
  last_month_salary IS NULL
UNION ALL
SELECT
  'number_dependents' AS column_name,
  COUNT(*) AS null_count
FROM
  `proyecto3-428922.dataset.user_info`
WHERE
  number_dependents IS NULL;