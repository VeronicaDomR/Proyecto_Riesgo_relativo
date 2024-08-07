WITH salary_groups AS (
  SELECT
    user_id,
    last_month_salary,
    default_flag,
    NTILE(4) OVER (ORDER BY last_month_salary) AS salary_quartile
  FROM
    proyecto3-428922.dataset.dataset1
),

quartile_totals AS (
  SELECT
    salary_quartile,
    COUNT(*) AS total_count,
    SUM(CAST(default_flag AS INT64)) AS total_bad_payers
  FROM
    salary_groups
  GROUP BY
    salary_quartile
),

exposure AS (
  SELECT
    'EXPOSED' AS group_type,
    total_count,
    total_bad_payers
  FROM
    quartile_totals
  WHERE
    salary_quartile = 1
  UNION ALL
  SELECT
    'NOT_EXPOSED' AS group_type,
    SUM(total_count) AS total_count,
    SUM(total_bad_payers) AS total_bad_payers
  FROM
    quartile_totals
  WHERE
    salary_quartile IN (2, 3, 4)
),

incidence AS (
  SELECT
    group_type,
    total_count,
    total_bad_payers,
    SAFE_DIVIDE(total_bad_payers, total_count) AS incidence
  FROM
    exposure
),

risk_relative AS (
  SELECT
    e1.group_type AS group_type_a,
    e2.group_type AS group_type_b,
    e1.incidence AS incidence_a,
    e2.incidence AS incidence_b,
    SAFE_DIVIDE(e1.incidence, e2.incidence) AS risk_relative
  FROM
    incidence e1
  CROSS JOIN
    incidence e2
  WHERE
    e1.group_type = 'EXPOSED' AND e2.group_type = 'NOT_EXPOSED'
)

SELECT
  group_type_a,
  group_type_b,
  incidence_a,
  incidence_b,
  risk_relative
FROM
  risk_relative;
