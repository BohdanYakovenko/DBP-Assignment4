with raw_staff as (
    select *
    from {{ ref('raw_staff') }}
)

select
    staff_id,
    first_name,
    last_name,
    position,
    hire_date
from raw_staff
where position is not null
