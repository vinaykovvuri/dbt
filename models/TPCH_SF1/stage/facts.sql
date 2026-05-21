with cte as(select * from {{ source('tpch_source','lineitem')}})

select 
{{ dbt_utils.dbt_utils.generate_surrogate_key(['l_orderkey','l_linenumber'])}} from cte


