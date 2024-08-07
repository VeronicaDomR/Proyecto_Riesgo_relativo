WITH stats AS (
  SELECT
    AVG(age) AS mean_age,
    STDDEV(age) AS stddev_age
  FROM
    `proyecto3-428922.dataset.default_user_info_union`
),
outliers AS (
  SELECT
    user_id,
    last_month_salary,
    age,
    (age - mean_age) / stddev_age AS z_score_age
  FROM
    `proyecto3-428922.dataset.default_user_info_union`,
    stats
  WHERE
    ABS((age - mean_age) / stddev_age) > 3
)
SELECT
  COUNT(*) AS number_of_outliers_age
FROM
  outliers;