{{ config(
    materialized = 'incremental'
)}}

select
md5(product_id::varchar) as product_hk,
product_id,
product_name,
category,
brand,
price,
md5(product_name::varchar || category::varchar || brand::varchar || price::varchar) as hashdiff,
load_dts,
record_source 

from {{ref('stg_dv_products')}}

{% if is_incremental() %}

where md5(product_name::varchar || category::varchar || brand::varchar || price::varchar) not in (select hashdiff from {{this}})

{% endif %}