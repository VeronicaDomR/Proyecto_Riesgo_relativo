WITH Percentiles AS (
  SELECT 
    PERCENTILE_CONT(age, 0.25) OVER() AS age_Q1,
    PERCENTILE_CONT(age, 0.50) OVER() AS age_Q2,
    PERCENTILE_CONT(age, 0.75) OVER() AS age_Q3,
    PERCENTILE_CONT(last_month_salary, 0.25) OVER() AS last_month_salary_Q1,
    PERCENTILE_CONT(last_month_salary, 0.50) OVER() AS last_month_salary_Q2,
    PERCENTILE_CONT(last_month_salary, 0.75) OVER() AS last_month_salary_Q3,
    PERCENTILE_CONT(number_dependents, 0.25) OVER() AS number_dependents_Q1,
    PERCENTILE_CONT(number_dependents, 0.50) OVER() AS number_dependents_Q2,
    PERCENTILE_CONT(number_dependents, 0.75) OVER() AS number_dependents_Q3,
    PERCENTILE_CONT(number_times_delayed_payment_loan_30_59_days, 0.25) OVER() AS number_times_delayed_payment_loan_30_59_days_Q1,
    PERCENTILE_CONT(number_times_delayed_payment_loan_30_59_days, 0.50) OVER() AS number_times_delayed_payment_loan_30_59_days_Q2,
    PERCENTILE_CONT(number_times_delayed_payment_loan_30_59_days, 0.75) OVER() AS number_times_delayed_payment_loan_30_59_days_Q3,
    PERCENTILE_CONT(number_times_delayed_payment_loan_60_89_days, 0.25) OVER() AS number_times_delayed_payment_loan_60_89_days_Q1,
    PERCENTILE_CONT(number_times_delayed_payment_loan_60_89_days, 0.50) OVER() AS number_times_delayed_payment_loan_60_89_days_Q2,
    PERCENTILE_CONT(number_times_delayed_payment_loan_60_89_days, 0.75) OVER() AS number_times_delayed_payment_loan_60_89_days_Q3,
    PERCENTILE_CONT(more_90_days_overdue, 0.25) OVER() AS more_90_days_overdue_Q1,
    PERCENTILE_CONT(more_90_days_overdue, 0.50) OVER() AS more_90_days_overdue_Q2,
    PERCENTILE_CONT(more_90_days_overdue, 0.75) OVER() AS more_90_days_overdue_Q3,
    PERCENTILE_CONT(debt_ratio, 0.25) OVER() AS debt_ratio_Q1,
    PERCENTILE_CONT(debt_ratio, 0.50) OVER() AS debt_ratio_Q2,
    PERCENTILE_CONT(debt_ratio, 0.75) OVER() AS debt_ratio_Q3,
 
  FROM 
    `proyecto3-428922.dataset.dataset_1`
)
SELECT DISTINCT
  age_Q1, age_Q2, age_Q3,
  last_month_salary_Q1, last_month_salary_Q2, last_month_salary_Q3,
  number_dependents_Q1, number_dependents_Q2, number_dependents_Q3,
  number_times_delayed_payment_loan_30_59_days_Q1, number_times_delayed_payment_loan_30_59_days_Q2, number_times_delayed_payment_loan_30_59_days_Q3,
  number_times_delayed_payment_loan_60_89_days_Q1, number_times_delayed_payment_loan_60_89_days_Q2, number_times_delayed_payment_loan_60_89_days_Q3,
  more_90_days_overdue_Q1, more_90_days_overdue_Q2, more_90_days_overdue_Q3,
  debt_ratio_Q1, debt_ratio_Q2, debt_ratio_Q3
  
FROM 
  Percentiles
