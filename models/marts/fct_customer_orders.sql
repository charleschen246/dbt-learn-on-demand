--join everything together, for each none fail payment, all details 
WITH order_details as (
        select 
        *
        from {{ ref('order_details') }}
        ),
--for each customer, and order_id, get first and last order, and number of orders
customer_orders as (
        select 
        * 
        from {{ ref('customer_order_details') }} ),
finals as (

select p.*,
        row_number() over (order by p.order_id) as transaction_seq,
        row_number() over (partition by customer_id order by p.order_id) as customer_sales_seq,
        case when c.first_order_date = p.order_placed_at
            then 'new'
            else 'return' end as nvsr,
        sum(total_amount_paid) over (partition by customer_id order by p.order_id asc)customer_lifetime_value,
        first_order_date as fdos
    from {{ ref('order_details') }}  p
    left join {{ ref('customer_order_details') }} as c using (customer_id)
order by order_id)

select *
from finals
