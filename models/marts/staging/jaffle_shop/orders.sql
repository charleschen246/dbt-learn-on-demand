with orders as (
    select 
        Orders.ID as order_id,  
        Orders.USER_ID    as customer_id,
        Orders.ORDER_DATE AS order_placed_at,
        Orders.STATUS AS order_status,
    from {{ source('jaffle_shop', 'orders') }}
)
select *
from orders

 