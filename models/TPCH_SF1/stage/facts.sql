{{ config(materialized='table')}}

with cte as(
select * from {{source('tpch_source','lineitem')}} )

select
{{ dbt_utils.generate_surrogate_key(['l_orderkey','l_linenumber'])}} as line_order_key
from cte
