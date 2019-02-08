with reviews as (

  select * from {{ref('stg_reviews')}}

),

listing_history as (

  select * from {{ref('stg_listing')}}

),
