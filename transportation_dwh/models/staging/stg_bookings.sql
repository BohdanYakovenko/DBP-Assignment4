with source as (
    select *
    from {{ ref('raw_bookings') }}
)

select
    booking_id,
    customer_id,
    route_id,
    vehicle_id,
    staff_id,
    booking_date,
    status
from source
