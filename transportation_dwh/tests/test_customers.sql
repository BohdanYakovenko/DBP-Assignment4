-- Ensure no null values in the customer_id column
select count(*)
from {{ ref('raw_customers') }}
where customer_id is null

