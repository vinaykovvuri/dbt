{{ config(
    materialized = 'view'
) }}

select * from {{source('dbt_pro_1','raw_payments')}}