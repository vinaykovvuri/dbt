{{config(
    materialized = 'incremental'
)
}}

select 
md5(order_id::varchar) as order_hk,
order_id,
load_dts,
record_source

from {{ref('stg_dv_orders')}}

{% if is_incremental()%}

where order_id not in (select order_id from {{this}})

{% endif %}