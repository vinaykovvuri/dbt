{{ config(
    materialized = 'incremental'
)
}}

select
md5(customer_id::varchar) as customer_hk,
customer_id,
customer_name,
email,
city,
state,
country,
signup_date,
md5(
    customer_name::varchar || email::varchar || city::varchar || state::varchar || country::varchar || signup_date::varchar
) as hashdiff,
load_dts,
record_source
from {{ref('stg_dv_customer')}}

{% if is_incremental() %}

where md5(
    customer_name::varchar || email::varchar || city::varchar || state::varchar || country::varchar || signup_date::varchar
    ) not in (select hashdiff from {{this}})

{% endif %}