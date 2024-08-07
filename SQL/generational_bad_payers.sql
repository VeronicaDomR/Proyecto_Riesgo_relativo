SELECT
  generational_group,
  SUM(CASE
      WHEN default_flag = 1 THEN 1
      ELSE 0
  END
    ) AS total_bad,
  SUM(CASE
      WHEN default_flag = 0 THEN 1
      ELSE 0
  END
    ) AS total_good
FROM
  `proyecto3-428922.dataset.dataset1`
GROUP BY
  generational_group