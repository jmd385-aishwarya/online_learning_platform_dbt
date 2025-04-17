WITH reference AS (
    SELECT 
        *
    FROM 
        {{ ref('stg_transactions') }}
),

first_transaction AS (
    SELECT 
        customer_id, 
        MIN(TO_DATE(payment_month, 'DD-MM-YYYY')) AS first_payment_month
    FROM reference
    GROUP BY customer_id
)

SELECT 
    YEAR(first_payment_month) AS fiscal_year,
    MONTH(first_payment_month) AS fiscal_month,
    COUNT(DISTINCT customer_id) AS new_logos    
FROM first_transaction
GROUP BY 
    fiscal_year,
    fiscal_month
ORDER BY
    fiscal_year ASC,
    fiscal_month ASC