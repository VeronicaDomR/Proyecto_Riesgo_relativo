WITH base_data AS (
    SELECT 
        number_times_delayed_payment_loan_60_89_days,
        default_flag
    FROM proyecto3-428922.dataset.dataset_1
),
---Calcular los cuartiles dependiendo la edad.
quartiles AS (
    SELECT 
        number_times_delayed_payment_loan_60_89_days,
        default_flag,
        NTILE(4) OVER (ORDER BY number_times_delayed_payment_loan_60_89_days) AS number_60_89_days_quartile
    FROM base_data ---datos de donde provienen las variables
),
-- Calcula el número total de malos pagadores 
quartile_risk AS (
    SELECT 
        number_60_89_days_quartile,
        COUNT(*) AS total_count,
        SUM(default_flag) AS total_bad_payers,
    FROM quartiles
    GROUP BY number_60_89_days_quartile
),
---rango de edad (mínimo y máximo) para cada cuartil.
quartile_ranges AS (
    SELECT
       number_60_89_days_quartile,
        MIN(number_times_delayed_payment_loan_60_89_days) AS min_60_89_days,
        MAX(number_times_delayed_payment_loan_60_89_days) AS max_60_89_days
    FROM quartiles
    GROUP BY number_60_89_days_quartile
)
SELECT 
    q.number_60_89_days_quartile,
    q.total_count,
    q.total_bad_payers,
    r.min_60_89_days,
    r.max_60_89_days
FROM quartile_risk q
JOIN quartile_ranges r
ON q.number_60_89_days_quartile = r.number_60_89_days_quartile
ORDER BY number_60_89_days_quartile ASC;