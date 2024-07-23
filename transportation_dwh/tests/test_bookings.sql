-- Ensure no null values in the booking_id column
select count(*)
from {{ ref('raw_bookings') }}
where booking_id is null
