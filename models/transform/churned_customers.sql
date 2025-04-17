WITH reference AS (
    SELECT 
        *
    FROM 
        {{ ref('stg_transactions') }}
),

last_transaction AS (
    SELECT 
        customer_id, 
        MAX(TO_DATE(payment_month, 'DD-MM-YYYY')) AS last_payment_month
    FROM reference
    GROUP BY customer_id
),

churned_customers AS (
    SELECT 
        customer_id,
        last_payment_month,
        MONTH(last_payment_month) AS churn_month,
        YEAR(last_payment_month) AS churn_year
    FROM last_transaction
    WHERE last_payment_month < DATEADD('month', -1, '2020-07-01')
)

SELECT 
    churn_year,
    churn_month,
    COUNT(customer_id) AS churned_customers_count
FROM churned_customers
GROUP BY churn_year, churn_month
ORDER BY churn_year, churn_month