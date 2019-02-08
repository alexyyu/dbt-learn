

  create view "dbt_alex"."property_type_by_zipcode__dbt_tmp" as (
    



select
   zipcode,
   
       

       sum(case when property_type = 'Apartment' then 1 else 0 end)
          as apartment_count,
       

       sum(case when property_type = 'Bed and breakfast' then 1 else 0 end)
          as bed_and_breakfast_count,
       

       sum(case when property_type = 'Boutique hotel' then 1 else 0 end)
          as boutique_hotel_count,
       

       sum(case when property_type = 'Bungalow' then 1 else 0 end)
          as bungalow_count,
       

       sum(case when property_type = 'Camper/RV' then 1 else 0 end)
          as camper_rv_count,
       

       sum(case when property_type = 'Castle' then 1 else 0 end)
          as castle_count,
       

       sum(case when property_type = 'Condominium' then 1 else 0 end)
          as condominium_count,
       

       sum(case when property_type = 'Cottage' then 1 else 0 end)
          as cottage_count,
       

       sum(case when property_type = 'Farm stay' then 1 else 0 end)
          as farm_stay_count,
       

       sum(case when property_type = 'Guest suite' then 1 else 0 end)
          as guest_suite_count


from source_data.listings

group by 1

limit 100
  ) ;