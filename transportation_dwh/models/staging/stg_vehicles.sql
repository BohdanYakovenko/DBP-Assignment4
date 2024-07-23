with raw_vehicles as (
    select *
    from {{ ref('raw_vehicles') }}
)

select
    vehicle_id,
    vehicle_type,
    capacity,
    purchase_date
from raw_vehicles
where capacity > 0