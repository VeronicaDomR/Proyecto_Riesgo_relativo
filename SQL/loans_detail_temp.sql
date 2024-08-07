WITH
  delayed_payments AS (
  SELECT
    user_id,
    number_times_delayed_payment_loan_30_59_days,
    number_times_delayed_payment_loan_60_89_days,
    more_90_days_overdue,
    CASE
      WHEN more_90_days_overdue = 0 THEN 'Poco Retraso'
      WHEN more_90_days_overdue BETWEEN 1
    AND 7 THEN 'Medio Retraso'
      WHEN more_90_days_overdue BETWEEN 8 AND 15 THEN 'Mucho Retraso'
      ELSE 'Fuera de Rango'
  END
    AS more_90_days_overdue_status,
    CASE
      WHEN number_times_delayed_payment_loan_30_59_days >= 10 THEN 'Mucho Retraso'
      WHEN number_times_delayed_payment_loan_30_59_days >= 5 THEN 'Medio Retraso'
      ELSE 'Poco Retraso'
  END
    AS number_times_delayed_payment_30_59_status,
    CASE
      WHEN number_times_delayed_payment_loan_60_89_days >= 10 THEN 'Mucho Retraso'
      WHEN number_times_delayed_payment_loan_60_89_days >= 5 THEN 'Medio Retraso'
      ELSE 'Poco Retraso'
  END
    AS number_times_delayed_payment_60_89_status
  FROM
    proyecto3-428922.dataset.loans_Detail_temp ),
  user_info AS (
  SELECT
    user_id,
    using_lines_not_secured_personal_assets,
    CASE
      WHEN using_lines_not_secured_personal_assets < 0.30 THEN 'Bajo'
      WHEN using_lines_not_secured_personal_assets >= 0.30
    AND using_lines_not_secured_personal_assets <= 0.60 THEN 'Medio'
      WHEN using_lines_not_secured_personal_assets > 0.60 THEN 'Alto'
      ELSE 'Otro'
  END
    AS Capacidad_Endeudamiento,
    debt_ratio,
    CASE
      WHEN debt_ratio < 0.30 THEN 'Bajo Riesgo'
      WHEN debt_ratio >= 0.30
    AND debt_ratio <= 0.60 THEN 'Riesgo Medio'
      WHEN debt_ratio > 0.60 THEN 'Alto Riesgo'
      ELSE 'Otro'
  END
    AS Riesgo_Deuda
  FROM
    proyecto3-428922.dataset.loans_Detail
  WHERE
    more_90_days_overdue < 96
    AND number_times_delayed_payment_loan_30_59_days < 96
    AND number_times_delayed_payment_loan_60_89_days < 96 )
SELECT
  u.user_id,
  d.number_times_delayed_payment_loan_30_59_days,
  d.number_times_delayed_payment_30_59_status,
  d.number_times_delayed_payment_loan_60_89_days,
  d.number_times_delayed_payment_60_89_status,
  d.more_90_days_overdue,
  d.more_90_days_overdue_status,
  u.using_lines_not_secured_personal_assets,
  u.Capacidad_Endeudamiento,
  u.debt_ratio,
  u.Riesgo_Deuda,
  CASE
    WHEN d.more_90_days_overdue_status = 'Poco Retraso' AND d.number_times_delayed_payment_30_59_status = 'Poco Retraso' AND d.number_times_delayed_payment_60_89_status = 'Poco Retraso' THEN 'Cumplido'
    WHEN d.more_90_days_overdue_status = 'Mucho Retraso'
  OR d.number_times_delayed_payment_30_59_status = 'Mucho Retraso'
  OR d.number_times_delayed_payment_60_89_status = 'Mucho Retraso' THEN 'Incumplido'
    ELSE 'Intermedio'
END
  AS payment_compliance_status
FROM
  user_info u
LEFT JOIN
  delayed_payments d
ON
  u.user_id = d.user_id
ORDER BY
  u.user_id;