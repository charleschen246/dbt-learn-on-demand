select 
        orders.order_id,
        orders.customer_id,
        orders.order_placed_at,
        orders.order_status,
        p.total_amount_paid,
        p.payment_finalized_date,
        customer_first_name,
        customer_last_name
        FROM {{ ref('orders') }} as orders
        left join {{ ref('stg_payments') }} p 
            ON orders.order_id = p.order_id
        left join {{ ref('customers') }} C 
            on orders.customer_id = C.customer_id
