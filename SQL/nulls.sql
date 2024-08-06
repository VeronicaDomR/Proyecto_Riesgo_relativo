#default and user info
SELECT
user_id,
default_flag,
age,
sex,
last_month_salary,
number_dependents,
COUNT(*) AS duplicate_count
FROM
`proyecto3-428922.dataset.default_user_info_union`
GROUP BY 
user_id,
default_flag,
age,
sex,
last_month_salary,
number_dependents
HAVING
  COUNT(*) > 1;

#loans_Detail 
SELECT
  user_id,
  more_90_days_overdue,
  debt_ratio,
  COUNT(*) AS duplicate_count
FROM
  `proyecto3-428922.dataset.loans_Detail`
GROUP BY
  user_id,
  more_90_days_overdue,
  debt_ratio
HAVING
  COUNT(*) > 1;


  #Duplicates loans outstanding

WITH Duplicates AS (
  SELECT
    user_id,
    COUNT(*) AS duplicado
  FROM
    `proyecto3-428922.dataset.loans_outstanding`
  GROUP BY
    user_id
  HAVING
    COUNT(*) > 1
)
SELECT
  user_id,
  duplicado AS numero_de_duplicados_user_id
FROM
  Duplicates;

  #another one detailed
  WITH Duplicates AS (
  SELECT
    user_id,
    COUNT(*) AS duplicado
  FROM
     `proyecto3-428922.dataset.loans_outstanding`
  GROUP BY
    user_id
  HAVING
    COUNT(*) > 1
)
SELECT
  l.user_id,
  l.loan_id,
  l.loan_type,
  d.duplicado AS numero_de_duplicados
FROM
   `proyecto3-428922.dataset.loans_outstanding` l
JOIN
  Duplicates d
ON
  l.user_id = d.user_id
ORDER BY
  l.user_id, l.loan_id;
 
 #suma
WITH Duplicates AS (
  SELECT
    user_id,
    COUNT(*) AS duplicado
  FROM
   `proyecto3-428922.dataset.loans_outstanding`
  GROUP BY
    user_id
  HAVING
    COUNT(*) > 1
)
SELECT
  user_id,
  duplicado,
  (SELECT SUM(duplicado) FROM Duplicates) AS total_duplicados
FROM
  Duplicates
ORDER BY
  user_id;