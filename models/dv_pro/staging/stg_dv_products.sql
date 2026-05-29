{{config(
    materialized = 'view'
)}}

select
v:product_id::int as product_id,
v:product_name::varchar as product_name,
v:category::varchar as category,
v:brand::varchar as brand,
v:price::varchar as price,
current_timestamp() as load_dts,
'raw_products' as record_source
from {{source('db_source','raw_products')}}