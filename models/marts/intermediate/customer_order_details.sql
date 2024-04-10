select C.customer_id as customer_id
        , min(order_placed_at) as first_order_date
        , max(order_placed_at) as most_recent_order_date
        , count(ORDERS.customer_id) AS number_of_orders
    from {{ ref('customers') }} C 
    left join {{ ref('orders') }} as Orders
    on orders.customer_id = C.customer_id 
    group by 1