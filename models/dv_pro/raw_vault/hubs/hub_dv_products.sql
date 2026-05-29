{{ config(
    materialized = 'incremental'
)}} 

select
md5(product_id::varchar) as product_hk,
product_id,
load_dts,
record_source

from {{ref('stg_dv_products')}}

{% if is_incremental() %}

where product_id not in (select product_id from {{this}})

{% endif %}