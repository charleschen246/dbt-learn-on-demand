
with orders as  (

    select * from {{ ref('orders' )}}

),

payments as (

    select * from {{ ref('payments') }}
    
),

order_payments as (

    select

        orderid,
        sum(case when status = 'success' then amount end) as amount_usd

    from payments
    group by 1
),

final as (

    select
    
        orders.order_id,
        case
            when orders.customer_id = 1
            then orders.customer_id +1000
            else orders.customer_id 
        end as customer_id,
        orders.order_placed_at,
        coalesce(order_payments.amount_usd, 0) as amount

    from orders
    left join order_payments 
    on orders.order_id = order_payments.orderid
)

select * from final