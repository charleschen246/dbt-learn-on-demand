with customers as (
select    
    FIRST_NAME as customer_first_name,
    LAST_NAME as customer_last_name,
    ID as customer_id
from 
    {{ source('jaffle_shop', 'customers') }}
)
select *
from customers