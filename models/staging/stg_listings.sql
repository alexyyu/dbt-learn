with source as (

  select * from source_data.listings

),

renamed as (

  select

host_id,
id,
review_scores_value,
review_scores_location,
review_scores_communication,
review_scores_checkin,
review_scores_cleanliness,
review_scores_accuracy,
review_scores_rating,
number_of_reviews,
availability_365,
availability_90,
availability_60,
availability_30,
maximum_nights,
minimum_nights,
accommodates,
longitude,
latitude,
require_guest_phone_verification,
require_guest_profile_picture,
cancellation_policy,
is_business_travel_ready,
instant_bookable,
jurisdiction_names,
has_availability,
license,
requires_license,
calendar_updated,
extra_people,
guests_included,
cleaning_fee,
security_deposit,
monthly_price,
weekly_price,
nullif(replace(split_part(price,'$',2),',',"),") as price,
square_feet,
amenities
bed_type,
beds,
bedrooms,
bathrooms,
property_type,
is_location_exact,
room_type,
country,
smart_location,
country_code
zipcode,
state,
market,
neighbourhood_group_cleansed,
city,
neighbourhood_cleansed,
neighbourhood,
street,
host_identity_verified,
host_has_profile_pic,
host_verifications,
host_neighbourhood,
host_picture_url,
host_thumbnail_url,
is_superhost,
acceptance_rate,
response_rate,
response_time,
host_about,
host_location,
host_name,
host_url,
xl_picture_url,
picture_url,
medium_url,
thumbnail_url,
house_rules,
interaction,
access,
transit,
notes,
neighborhood_overview,
experiences_offered
description,
space,
summary,
name,
scrape,
url,
last_review,
first_review,
calendar_last_scraped,
host_since,
last_scraped

  from source
  where table_schema = 'source_data'
  and table_name = 'listings'

)

select * from renamed
