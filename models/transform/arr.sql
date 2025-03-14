select 
	year(payment_month) as fiscal_year, 
	sum(revenue) as arr
from {{ ref('stg_transactions') }}
where customer_id is not null
group by year(payment_month)
order by fiscal_year