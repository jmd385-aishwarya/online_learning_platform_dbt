select
	year(payment_month) as fiscal_year,
	month(payment_month) as fiscal_month,
	sum(revenue) as mrr
from {{ ref('stg_transactions') }}
where customer_id is not null
group by year(payment_month), month(payment_month)
order by fiscal_year asc, fiscal_month asc