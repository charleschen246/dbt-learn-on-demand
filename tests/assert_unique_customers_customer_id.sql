select customer_id, first_order_date, most_recent_order_date, number_of_orders, count(*)
from {{ ref('customer_order_details') }}
group by customer_id, first_order_date, most_recent_order_date, number_of_orders
having count(*)>1