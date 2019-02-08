with source as (

  select * from source_data.reviews

),

renamed as (

  select

  review,
  listing_id,
  id,
  comments,
  reviewer_name,
  date

from source
where table_schema = 'source_data'
and table_name = 'reviews'

)

select * from renamed
