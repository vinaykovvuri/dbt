{{ config(
    materialized = 'table'
)}}

with cte as (select * from {{source('customer_source','raw_customers')}})

select
customer_id,
customer_name
from cte