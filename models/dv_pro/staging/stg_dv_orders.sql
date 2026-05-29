 {{ config(
    materialized = 'view'
 )}}

 select 
 v:order_id::int as order_id,
 v:customer_id::int as customer_id,
 v:order_date::timestamp as order_date,
 v:status::varchar as status,
 current_timestamp() as load_dts,
 'raw_orders' as record_source

 from {{source('db_source','raw_orders')}}