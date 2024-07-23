with bookings as (
    select *
    from {{ ref('stg_bookings') }}
),

booking_counts as (
    select
        route_id,
        count(*) as total_bookings
    from bookings
    group by route_id
)

select *
from booking_counts
