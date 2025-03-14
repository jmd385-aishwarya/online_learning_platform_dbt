with source as (
    select * from {{ source('OnlineLearningPlatform', 'CUSTOMERS') }}
),

cleaned as (
    select
        CAST(CUSTOMER_ID AS INT) AS CUSTOMER_ID,
        CUSTOMERNAME,
        COMPANY
    from source
    where CUSTOMER_ID is not null
    and CUSTOMERNAME is not null
    and COMPANY is not null
)

select * from cleaned
