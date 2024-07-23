with raw_routes as (
    select *
    from {{ ref('raw_routes') }}
)

select
    route_id,
    origin,
    destination,
    distance,
    duration
from raw_routes
where distance > 0