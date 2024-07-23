-- Ensure no null values in the route_id column
select count(*)
from {{ ref('raw_routes') }}
where route_id is null
