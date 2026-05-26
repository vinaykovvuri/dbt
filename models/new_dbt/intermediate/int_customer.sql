{{ config(
    materialized = 'table'
)}}


select

{{dbt_utils.generate_surrogate_key(['customer_id'])}} as cust_sk,
customer_id,
customer_name,
city,
signup_date
from {{ref('customer')}}

