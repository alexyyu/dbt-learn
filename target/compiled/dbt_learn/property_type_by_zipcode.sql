select
    zipcode,
    
    -- writing sql using jinja instead of repeating the case when clause
    sum(case when lower(property_type) = 'house' then 1 else 0 end) as house_count
    
    -- writing sql using jinja instead of repeating the case when clause
    sum(case when lower(property_type) = 'apartment' then 1 else 0 end) as apartment_count
    
    -- writing sql using jinja instead of repeating the case when clause
    sum(case when lower(property_type) = 'townhouse' then 1 else 0 end) as townhouse_count
    

from source_data.listings

group by 1

limit 100