{{config(
    materialized = 'table'
)}}

select 
{{dbt_utils.generate_surrogate_key(['order_id'])}} as order_sk,
order_id,
customer_id,
product_id,
quantity,
order_date
from {{ref('orders')}}