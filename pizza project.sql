create table pizza
(pizza_id	int primary key,
 order_id	int,
 pizza_name_id	varchar(100),
 quantity	int,
 order_date	date,
 order_time	time,
 unit_price	float,
 total_price float,	
 pizza_size	varchar(50),
 pizza_category	varchar(50),
 pizza_ingredients	varchar(100),
 pizza_name varchar(75)
);

select * from pizza;

--1. total_revenue
Select sum(total_price) as total_revenue
from pizza

--2.average order value
Select sum(total_price)/ count(distinct order_id) as average_order_value 
from pizza

--3. total pizza sold
select sum(quantity) as total_pizza_sold from pizza

--4. total order placed
select count(distinct order_id) as total_order from pizza

--5.average pizza per order
select  cast(sum(quantity) as decimal(10,2))/
cast(count( distinct order_id) as decimal(10,2)) as average_pizza_per_order from pizza

--6.daily trend & monthly trend
select * from pizza
select extract(dow from order_date) as order_day, count(distinct order_id) as total_order
from pizza
group by 1

select to_char(order_date,'month') as order_month, count(distinct order_id) as total_order
from pizza
group by 1 order by total_order desc

--7. percentage of sale by pizza category
select * from pizza
select  pizza_category,sum(total_price)*100/ (select sum(total_price) from pizza where extract(month from order_date)= 1) as pct
from pizza
where extract(month from order_date)= 1
group by 1

--8.percentage of sale by pizza category
select * from pizza
select  pizza_size,sum(total_price)*100/ (select sum(total_price) from pizza where extract(month from order_date)= 2) as pct
from pizza
where extract(month from order_date)= 2
group by 1

--9.total pizza sold by pizza category
select pizza_category, sum(quantity) as total_sold
from pizza
group by pizza_category

--10. top 5 pizza by revenue
select pizza_name, sum(total_price) as total_sold
from pizza
group by 1
order by 2 desc
limit 5

--11.bottom 5 pizza
select pizza_name, sum(total_price) as total_sold
from pizza
group by 1
order by 2 asc
limit 5

--12.top 5 pizza by quantity
   select pizza_name, sum(quantity) 
   from pizza
   group by 1
   order by 2 desc
   limit 5
   
 --13.bottom 5 pizza by quantity
  select pizza_name, sum(quantity) 
   from pizza
   group by 1
   order by 2 asc
   limit 5
  
  --14. top 5 pizza by total order
  select * from pizza
  select pizza_name, count(distinct order_id) as total_order
  from pizza
  group by 1
  order by 2 desc
  limit 5
  
  --15. bottom 5 pizza by total order
   select pizza_name, count(distinct order_id) as total_order
  from pizza
  group by 1
  order by 2 asc
  limit 5
  

