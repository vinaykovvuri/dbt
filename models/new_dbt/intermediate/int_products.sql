{{ config(
    materialized = 'table'
)}}

select 
{{dbt_utils.generate_surrogate_key(['product_id'])}} as product_sk,
product_id,
product_name,
category,
price
from {{ref('products')}}