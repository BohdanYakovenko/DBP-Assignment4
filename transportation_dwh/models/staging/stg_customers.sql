with raw_customers as (
    select *
    from {{ ref('raw_customers') }}
)

select
    customer_id,
    first_name,
    last_name,
    email,
    signup_date
from raw_customers
where email is not null