WITH Correlations AS (
  SELECT
    'age_last_month_salary' AS pair,
    CORR(age, last_month_salary) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`
  
  UNION ALL

  SELECT
    'age_number_dependents' AS pair,
    CORR(age, number_dependents) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'age_number_times_delayed_payment_loan_30_59_days' AS pair,
    CORR(age, number_times_delayed_payment_loan_30_59_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'age_number_times_delayed_payment_loan_60_89_days' AS pair,
    CORR(age, number_times_delayed_payment_loan_60_89_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'age_more_90_days_overdue' AS pair,
    CORR(age, more_90_days_overdue) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'age_debt_ratio' AS pair,
    CORR(age, debt_ratio) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'last_month_salary_number_dependents' AS pair,
    CORR(last_month_salary, number_dependents) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'last_month_salary_number_times_delayed_payment_loan_30_59_days' AS pair,
    CORR(last_month_salary, number_times_delayed_payment_loan_30_59_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'last_month_salary_number_times_delayed_payment_loan_60_89_days' AS pair,
    CORR(last_month_salary, number_times_delayed_payment_loan_60_89_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'last_month_salary_more_90_days_overdue' AS pair,
    CORR(last_month_salary, more_90_days_overdue) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'last_month_salary_debt_ratio' AS pair,
    CORR(last_month_salary, debt_ratio) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL
 
  SELECT
    'number_dependents_number_times_delayed_payment_loan_30_59_days' AS pair,
    CORR(number_dependents, number_times_delayed_payment_loan_30_59_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_dependents_number_times_delayed_payment_loan_60_89_days' AS pair,
    CORR(number_dependents, number_times_delayed_payment_loan_60_89_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_dependents_more_90_days_overdue' AS pair,
    CORR(number_dependents, more_90_days_overdue) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_dependents_debt_ratio' AS pair,
    CORR(number_dependents, debt_ratio) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_times_delayed_payment_loan_30_59_days_number_times_delayed_payment_loan_60_89_days' AS pair,
    CORR(number_times_delayed_payment_loan_30_59_days, number_times_delayed_payment_loan_60_89_days) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_times_delayed_payment_loan_30_59_days_more_90_days_overdue' AS pair,
    CORR(number_times_delayed_payment_loan_30_59_days, more_90_days_overdue) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_times_delayed_payment_loan_30_59_days_debt_ratio' AS pair,
    CORR(number_times_delayed_payment_loan_30_59_days, debt_ratio) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_times_delayed_payment_loan_60_89_days_more_90_days_overdue' AS pair,
    CORR(number_times_delayed_payment_loan_60_89_days, more_90_days_overdue) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'number_times_delayed_payment_loan_60_89_days_debt_ratio' AS pair,
    CORR(number_times_delayed_payment_loan_60_89_days, debt_ratio) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`

  UNION ALL

  SELECT
    'more_90_days_overdue_debt_ratio' AS pair,
    CORR(more_90_days_overdue, debt_ratio) AS correlation
  FROM `proyecto3-428922.dataset.dataset_1`
)

SELECT * FROM Correlations;
