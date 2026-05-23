with cte as(select * from {{ source('tpch_source','lineitem')}})

select 
{{ dbt_utils.generate_surrogate_key(['l_orderkey','l_linenumber'])}} as sk_lineitem,
l_orderkey as orderkey,
l_partkey as partkey,
l_suppkey as supplykey,
l_linenumber as linenumber,
l_quantity as quantity,
l_extendedprice as extendprice,
l_discount as discount,
l_tax as tax,
l_returnflag as returnflag,
l_linestatus as linestatus,
l_shipdate as shipdate,
l_commitdate as commitdate,
l_receiptdate as receiptdate,
l_shipinstruct as shipinstruct,
l_shipmode as shipmode,
l_comment as comment

 from cte


