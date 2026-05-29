{{config(
    materialized = 'incremental'
)}}

select
md5(order_id::varchar || product_id::varchar) as order_product_hk,
md5(order_id::varchar) as order_hk,
md5(product_id::varchar) as product_hk,
load_dts,
record_source

from {{ref('stg_dv_order_items')}}

{% if is_incremental() %}

where md5(order_id::varchar || product_id::varchar) not in (select order_product_hk from {{this}})

{% endif %}