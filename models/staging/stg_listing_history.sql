with source as (

  select * from source_data.listing_history

),

renamed as (

  select

listing_id,
nullif(replace(split_part(price,'$',2),',',"),") as price,
available,
date

from source
where table_schema = 'source_data'
and table_name = 'listing_history'

)

select * from renamed


)
