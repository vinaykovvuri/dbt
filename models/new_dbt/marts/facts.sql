select 
o.order_id,
c.customer_name,
product_name,
quantity,
price,
{{total_sales('quantity','price')}} sales_amount
from {{ref('int_customer')}} c 
left join {{ref('int_orders')}} o on c.customer_id = o.customer_id
left join {{ref('int_products')}} p on o.product_id = p.product_id
left join {{ref('int_payments')}} t on o.order_id = t.order_id