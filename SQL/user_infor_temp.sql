SELECT
  user_id,
  age,
  sex,
  IFNULL(last_month_salary, 5000) AS last_month_salary,
  IFNULL(number_dependents, 0) AS number_dependents
FROM
  `proyecto3-428922.dataset.user_info`
