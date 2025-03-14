with reference as (
    select 
        *
    from 
        {{ ref('stg_transactions') }}
),

first_transaction as (
    select 
        customer_id, 
        min(payment_month) as first_payment_month
    from reference
    group by customer_id
)

select 
    year(first_payment_month) as fiscal_year,
    month(first_payment_month) as fiscal_month,
    count(distinct customer_id) as new_logos    
from first_transaction
group by 
    year(first_payment_month),
    month(first_payment_month),
    first_payment_month
order by
    fiscal_year asc,
    fiscal_month asc
