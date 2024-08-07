SELECT
  CORR(l.cantidad_total_tipo_prestamo, d.more_90_days_overdue) AS correlacion_tipo_prestamo_overdue,
  CORR(l.cantidad_total_tipo_prestamo, d.debt_ratio) AS correlacion_tipo_prestamo_debt_ratio
FROM
  proyecto3-428922.dataset.loans_Detail AS d
JOIN
  (
    -- Tu consulta para obtener cantidad_total_tipo_prestamo
    WITH tipos_prestamos AS (
      SELECT DISTINCT loan_type_lower
      FROM proyecto3-428922.dataset.lower_loan_type
    )
    SELECT
      l.user_id,
      t.loan_type_lower,
      COUNT(*) AS cantidad_total_tipo_prestamo
    FROM
      proyecto3-428922.dataset.lower_loan_type AS l
    JOIN
      tipos_prestamos AS t
    ON
      l.loan_type_lower = t.loan_type_lower
    GROUP BY
      l.user_id,
      t.loan_type_lower
  ) AS l
ON
  d.user_id = l.user_id
