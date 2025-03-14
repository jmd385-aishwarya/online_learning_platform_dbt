with source as (
    select * from {{ source('OnlineLearningPlatform', 'COUNTRY_REGION') }}
),

cleaned as (
    select
        CAST(CUSTOMER_ID AS INT) AS CUSTOMER_ID,
        COUNTRY,
        REGION
    from source
    where CUSTOMER_ID is not null
    and COUNTRY is not null
    and REGION is not null
)

select * from cleaned
