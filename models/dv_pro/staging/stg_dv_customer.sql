{{ config(
    materialized = 'view'
)}}

with cte as (select
v:customer_id::int as customer_id,
v:customer_name::varchar as customer_name,
v:email::varchar as email,
v:city::varchar as city,
v:state::varchar as state,
v:country::varchar as country,
v:signup_date::timestamp as signup_date,
current_timestamp() as load_dts,
'raw_customer' as record_source

from {{source('db_source','raw_customer')}})

select *,monthname(signup_date) as month from cte