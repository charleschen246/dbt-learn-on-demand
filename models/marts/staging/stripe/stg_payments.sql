with payments as (
                select         
                orderid order_id, 
                max(CREATED) as payment_finalized_date, 
                sum(AMOUNT) / 100.0 as total_amount_paid
                from {{ ref('payments') }}
                where STATUS <> 'fail'
                group by 1
)
select *
from payments