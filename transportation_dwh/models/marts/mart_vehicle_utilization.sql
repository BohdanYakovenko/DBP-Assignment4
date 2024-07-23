with bookings as (
    select *
    from {{ ref('stg_bookings') }}
),

vehicles as (
    select *
    from {{ ref('stg_vehicles') }}
),

vehicle_utilization as (
    select
        v.vehicle_id,
        v.vehicle_type,
        count(b.booking_id) as total_bookings,
        avg(v.capacity) as avg_capacity
    from vehicles v
    left join bookings b on v.vehicle_id = b.vehicle_id
    group by v.vehicle_id, v.vehicle_type
)

select *
from vehicle_utilization
