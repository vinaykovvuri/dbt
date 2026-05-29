{{ config(
    materialized = 'view'
)}}

select 
v:order_id::int as order_id,
v:product_id::int as product_id,
v:quantity::int as quantity,
current_timestamp() as load_dts,
'raw_order_items' as record_source

from {{source('db_source','raw_order_items')}}