-- Ensure no null values in the vehicle_id column
select count(*)
from {{ ref('raw_vehicles') }}
where vehicle_id is null
