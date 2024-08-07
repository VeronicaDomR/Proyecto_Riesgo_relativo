WITH o AS (
  SELECT 
    user_id
  FROM `proyecto3-428922.dataset.loans_outstanding`
  GROUP BY user_id
),
filtered_loans_detail AS (
  SELECT *
  FROM `proyecto3-428922.dataset.loans_Detail_temp`
  WHERE more_90_days_overdue < 96
    AND number_times_delayed_payment_loan_30_59_days < 96
    AND number_times_delayed_payment_loan_60_89_days < 96
)

SELECT 
  u.user_id,
  u.age,
  EXTRACT(YEAR FROM CURRENT_DATE()) - u.age AS birth_year,
  CASE
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - u.age >= 2011 THEN 'Generacion Alpha'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - u.age BETWEEN 1994 AND 2010 THEN 'Generacion Z'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - u.age BETWEEN 1981 AND 1993 THEN 'Millenials'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - u.age BETWEEN 1969 AND 1980 THEN 'Generacion X'
    ELSE 'Baby Boomers'
  END AS generational_group,
  IFNULL(u.last_month_salary, 5000) AS last_month_salary,
  IFNULL(u.number_dependents, 0) AS number_dependents,
  d.* EXCEPT(user_id),
  l.* EXCEPT(user_id),
  clt.* EXCEPT(user_id)
FROM filtered_loans_detail l
LEFT JOIN `proyecto3-428922.dataset.user_info_temp` u
  ON u.user_id = l.user_id
LEFT JOIN `proyecto3-428922.dataset.default` d
  ON u.user_id = d.user_id
LEFT JOIN o
  ON o.user_id = l.user_id
LEFT JOIN `proyecto3-428922.dataset.cantidad_loans_type` clt
  ON clt.user_id = u.user_id
ORDER BY u.user_id;


