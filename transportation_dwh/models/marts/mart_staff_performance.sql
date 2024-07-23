with bookings as (
    select *
    from {{ ref('stg_bookings') }}
),

staff as (
    select *
    from {{ ref('stg_staff') }}
),

staff_performance as (
    select
        s.staff_id,
        s.first_name,
        s.last_name,
        count(b.booking_id) as total_bookings_handled
    from staff s
    left join bookings b on s.staff_id = b.staff_id
    group by s.staff_id, s.first_name, s.last_name
)

select *
from staff_performance
