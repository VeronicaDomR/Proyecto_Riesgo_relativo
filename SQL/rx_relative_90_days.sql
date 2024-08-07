WITH age_groups AS (
  SELECT
    user_id,
    age,
    more_90_days_overdue,
    NTILE(4) OVER (ORDER BY age) AS age_quartile
  FROM
    `proyecto3-428922.dataset.dataset1`
),

quartile_totals AS (
  SELECT
    age_quartile,
    COUNT(*) AS total_count,
    SUM(CAST(more_90_days_overdue AS INT64)) AS total_bad_payers
  FROM
    age_groups
  GROUP BY
    age_quartile
),

exposure AS (
  -- Comparar cuartil 1
  SELECT
    'EXPOSED_1' AS group_type,
    total_count,
    total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile = 1
  UNION ALL
  SELECT
    'NOT_EXPOSED_1' AS group_type,
    SUM(total_count) AS total_count,
    SUM(total_bad_payers) AS total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile IN (2, 3, 4)

  UNION ALL
  
  -- Comparar cuartil 2
  SELECT
    'EXPOSED_2' AS group_type,
    total_count,
    total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile = 2
  UNION ALL
  SELECT
    'NOT_EXPOSED_2' AS group_type,
    SUM(total_count) AS total_count,
    SUM(total_bad_payers) AS total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile IN (1, 3, 4)
    
  UNION ALL
  
  -- Comparar cuartil 3
  SELECT
    'EXPOSED_3' AS group_type,
    total_count,
    total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile = 3
  UNION ALL
  SELECT
    'NOT_EXPOSED_3' AS group_type,
    SUM(total_count) AS total_count,
    SUM(total_bad_payers) AS total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile IN (1, 2, 4)

  UNION ALL
  
  -- Comparar cuartil 4
  SELECT
    'EXPOSED_4' AS group_type,
    total_count,
    total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile = 4
  UNION ALL
  SELECT
    'NOT_EXPOSED_4' AS group_type,
    SUM(total_count) AS total_count,
    SUM(total_bad_payers) AS total_bad_payers
  FROM
    quartile_totals
  WHERE
    age_quartile IN (1, 2, 3)
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
  -- Comparación cuartil 1 vs otros
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
    (e1.group_type = 'EXPOSED_1' AND e2.group_type = 'NOT_EXPOSED_1')
    OR (e1.group_type = 'EXPOSED_2' AND e2.group_type = 'NOT_EXPOSED_2')
    OR (e1.group_type = 'EXPOSED_3' AND e2.group_type = 'NOT_EXPOSED_3')
    OR (e1.group_type = 'EXPOSED_4' AND e2.group_type = 'NOT_EXPOSED_4')
)

SELECT
  group_type_a,
  group_type_b,
  risk_relative
FROM
  risk_relative
ORDER BY
  group_type_a,
  group_type_b;
