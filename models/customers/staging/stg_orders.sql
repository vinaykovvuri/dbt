{{ config(
    materialized = 'table'
)}}

select 
order_id,
customer_id,
order_date 

from {{source('customer_source','raw_orders')}}