
select
    zipcode,
    {% for property_type in ['house','apartment','townhouse'] %}
    -- writing sql using jinja instead of repeating the case when clause
    sum(case when lower(property_type) = '{{property_type}}' then 1 else 0 end) as {{property_type}}_count

    {{- "," if not loop.last -}}

    {%- endfor %}

from source_data.listings

group by 1

limit 100
