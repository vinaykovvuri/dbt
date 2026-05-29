{{
    config(
        materialized = 'incremental'
    )
}}

select
md5(customer_id::varchar || order_id::varchar) as customer_order_hk,
md5(customer_id::varchar) as customer_hk,
md5(order_id::varchar) as order_hk,
load_dts,
record_source
from {{ref('stg_dv_orders')}}

{% if is_incremental() %}

where md5(customer_id::varchar || order_id::varchar)  not in (select customer_order_hk from {{this}})

{% endif %}