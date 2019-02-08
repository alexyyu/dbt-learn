with reviews as (

  select * from {{ref('stg_reviews')}}

),

listings as (

  select * from {{ref('stg_listings')}}

),

final as (

  select

  reviews.id,
  reviewer_name,
  min(date) as first_review_date,
  count(distinct reviews.id) as num_reviews

  from reviews
  left join listings on reviews.listing_id = listings.id

group by 1,2
order by 2

)

select * from joined
