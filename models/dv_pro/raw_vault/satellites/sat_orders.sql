{{config(
    materialized = 'incremental'
)}}

select

md5(order_id::varchar) as order_hk,
customer_id,
order_date,
status,
md5(
    customer_id::varchar || order_date::varchar || status::varchar 
) as hashdiff,

load_dts,
record_source

from {{ref('stg_dv_orders')}}

{% if is_incremental() %}

where md5(
    customer_id::varchar || order_date::varchar || status::varchar 
) not in (select hashdiff from {{this}})

{% endif %}