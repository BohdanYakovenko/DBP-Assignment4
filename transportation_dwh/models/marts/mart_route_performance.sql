with routes_data as (
    select
        route_id,
        origin,
        destination,
        {{ concat_route('origin', 'destination') }} as route_description,
        distance,
        duration
    from {{ ref('stg_routes') }}
),

bookings_data as (
    select
        booking_id,
        route_id
    from {{ ref('stg_bookings') }}
),

route_performance as (
    select
        r.route_id,
        r.route_description,
        r.distance,
        r.duration,
        count(b.booking_id) as total_bookings
    from routes_data r
    left join bookings_data b on r.route_id = b.route_id
    group by r.route_id, r.route_description, r.distance, r.duration
)

select * from route_performance
