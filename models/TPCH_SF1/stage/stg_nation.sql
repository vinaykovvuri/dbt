{{ config(
    materialized = 'incremental',
    unique_key = 'nationkey'
    )
     }}

with cte as (select * from {{ ref('nation')}}),

renamed as (
    select
    n_nationkey as nationkey,
    n_name as name,
    n_regionkey as regionkey,
    last_updated_date
    from cte
 )

 select * from renamed



{% if is_incremental() %}
 where last_updated_date > (select max(last_updated_date) from {{ this }})
{% endif %}






