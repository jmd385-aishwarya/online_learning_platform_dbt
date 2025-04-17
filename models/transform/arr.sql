SELECT 
    YEAR(TO_DATE(payment_month, 'DD-MM-YYYY')) AS fiscal_year, 
    SUM(revenue) AS arr
FROM {{ ref('stg_transactions') }}
WHERE customer_id IS NOT NULL
GROUP BY fiscal_year
ORDER BY fiscal_year