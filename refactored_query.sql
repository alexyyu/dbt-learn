
-- Put referencing tables on the top
with orders as (select * from source_data.orders )
     order_items as (select * from {{ref('stg')}})

a as (select
  id,
  number,
  completed_at,
  completed_at::date as completed_at_date,
  sum(orders.total) as net_rev,
  sum(orders.item_total) as gross_rev,
  count(orders.id) as order_count
from orders
where orders.state != 'canceled'
and extract(year from orders.completed_at) < '2018'
and orders.email not like '%company.com'
group by completed_at_date) a
order by completed_at_date desc),

b as (select
  order_items.order_id,
  orders.completed_at::date as completed_at_date,
  sum(order_items.quantity) as qty
from source_data.order_items
left join source_data.orders on order_items.order_id = orders.id
where orders.state != 'canceled'
and extract(year from orders.completed_at) < '2018'
and orders.email not like '%company.com'
and (orders.is_cancelled_order = false OR orders.is_pending_order != true)
group by completed_at_date),

select
completed_at_date as date,
gross_rev,
net_rev as net_sales,
qty,
order_count as orders,
qty/a.distinct_orders as avg_unit_per_order,
Gross_Rev/a.distinct_orders as aov_gross,
Net_Rev/a.distinct_orders as aov_net
from a left join b using (completed_at_date)
where a.net_rev >= 150000
