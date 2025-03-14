with source as (
    select * from {{ source('OnlineLearningPlatform', 'PRODUCTS') }}
),

cleaned as (
    select 
        CAST(PRODUCT_ID AS VARCHAR(255)) AS PRODUCT_ID,
        PRODUCT_FAMILY,
        PRODUCT_SUB_FAMILY 
    from source
    where PRODUCT_ID is not null
    and PRODUCT_FAMILY is not null
    and PRODUCT_SUB_FAMILY is not null
)

select * from cleaned
