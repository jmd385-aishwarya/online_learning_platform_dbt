with source as (
    select * from {{ source('OnlineLearningPlatform', 'TRANSACTIONS') }}
),

cleaned as (
    select * 
    from source
    where CUSTOMER_ID is not null
    and PRODUCT_ID is not null
    and PAYMENT_MONTH is not null
    and REVENUE_TYPE is not null
    and REVENUE is not null
    and QUANTITY is not null
    and DIMENSION_1 is not null
    and DIMENSION_2 is not null
    and DIMENSION_3 is not null
    and DIMENSION_4 is not null
    and DIMENSION_5 is not null
    and DIMENSION_6 is not null
    and DIMENSION_7 is not null
    and DIMENSION_8 is not null
    and DIMENSION_9 is not null
    and DIMENSION_10 is not null
    AND COMPANIES is not null
)

select * from cleaned
