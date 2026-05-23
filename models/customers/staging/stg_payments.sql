{{ config(
    materialized = 'table'
)}}

with cte as (select * from {{source('customer_source','raw_payments')}})

select
payment_id,
order_id,
payment_amount

from cte