{{ config(
    materialized = 'table'
)}}

select
{{dbt_utils.generate_surrogate_key(['payment_id'])}} as payments_sk,
payment_id,
order_id,
payment_method,
amount
from {{ref('payments')}}