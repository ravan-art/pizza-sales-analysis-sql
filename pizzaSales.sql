use [Pizza DB]
select * from pizza_sales;
select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price)/ count(distinct order_id) as Evg_Order_Values from pizza_sales;
select Sum(quantity) as Total_Pizza_sold from pizza_sales;
select Count(distinct order_id) as Total_Order from pizza_sales;
select sum(quantity) /count(distinct order_id)  as avd_pizza_order from pizza_sales
select cast(sum(quantity) /count(distinct order_id) as decimal (10,0)) as avd_pizza_order from pizza_sales

-- weekday trends
select DATENAME(dw,order_date) as order_Day, count(distinct order_id) as total_order from pizza_sales
group by DATENAME(dw,order_date)

-- hour order
select DATEPART(hour, order_time) as hour_order, count(distinct order_id) as total_order from pizza_sales
group by DATEPART(hour, order_time) order by DATEPART(hour, order_time)

-- category
select pizza_category , sum(total_price) *100 / (select sum(total_price) from pizza_sales) as Pct_sales from pizza_sales
group by pizza_category
select sum(total_price) as category from pizza_sales where  MONTH(order_date)=1--order_date >= '2015-01-01' and order_date<='2015-01-31'
group by pizza_category

-- percentage of pizza size
select pizza_size ,sum(total_price) as total_earning, cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales where MONTH(order_date)= 2 ) as decimal (10,2 ))as percenatge_size_sales from pizza_sales
where MONTH(order_date)= 2
group by pizza_size

-- total pizza sold by pizza category
select pizza_category , sum(quantity) as sold,sum(total_price) as price from pizza_sales
where month(order_date)=1
group by pizza_category

-- top 5 name
select top 5 pizza_name, sum(quantity) as number_of_pizza from pizza_sales
group by pizza_name 
order by sum(quantity) desc;

-- bottom 5
select top 5 pizza_name, sum(quantity) as number_of_pizza from pizza_sales
group by pizza_name 
order by sum(quantity) asc;