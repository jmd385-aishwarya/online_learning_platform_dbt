SELECT
    YEAR(TO_DATE(payment_month, 'DD-MM-YYYY')) AS fiscal_year,
    MONTH(TO_DATE(payment_month, 'DD-MM-YYYY')) AS fiscal_month,
    SUM(revenue) AS mrr
FROM {{ ref('stg_transactions') }}
WHERE customer_id IS NOT NULL
GROUP BY fiscal_year, fiscal_month
ORDER BY fiscal_year ASC, fiscal_month ASC