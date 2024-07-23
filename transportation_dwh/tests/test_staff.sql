-- Ensure no null values in the staff_id column
select count(*)
from {{ ref('raw_staff') }}
where staff_id is null
