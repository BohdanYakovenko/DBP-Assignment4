with bookings as (
    select *
    from {{ ref('stg_bookings') }}
),

customers as (
    select *
    from {{ ref('stg_customers') }}
),

customer_activity as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        count(b.booking_id) as total_bookings,
        min(b.booking_date) as first_booking,
        max(b.booking_date) as last_booking
    from customers c
    left join bookings b on c.customer_id = b.customer_id
    group by c.customer_id, c.first_name, c.last_name
)

select *
from customer_activity
