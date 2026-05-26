{{ config(
    materialized = 'table'
)}}

with cte as(select * from {{source('sample_source','customer')}}),

renamed as(
select
c_custkey as cust_key,
c_name as name,
c_address as address,
c_nationkey as nationkey,
c_phone as phone,
c_acctbal as acctbal,
c_mktsegment as mktsegment,
c_comment as comment
from cte
)

select * from renamed