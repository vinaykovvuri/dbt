{{config(
    materialized = 'incremental'
)}}

select
md5(customer_id::varchar) as customer_hk,
customer_id,
load_dts,
record_source

from {{ref('stg_dv_customer')}}

{% if is_incremental() %}

where customer_id not in (select customer_id from {{this}})

{% endif %}
