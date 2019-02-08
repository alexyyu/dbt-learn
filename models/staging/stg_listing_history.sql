with source as (

  select * from source_data.listing_history

),

renamed as (

  select

   *
    from source)


select * from renamed


)
