select
c.customer_id as customer_id,
c.customer_name as customer_name,
sum(payment_amount) as total_payments,
min(order_date) as first_order_date,
max(order_date) as latest_order_date
from {{ref('stg_customer')}} c
inner join {{ref('stg_orders')}} o on c.customer_id = o.customer_id 
inner join {{ref('stg_payments')}} p on o.order_id = p.order_id 
group by c.customer_id,c.customer_name


