use shopping_trend;

select *
from shopping_trends;

select
case when Age<20 then 'under_20'
when Age>=20 and Age<40 then '20-40'
when Age>=40 and Age<60 then '40-60'
when Age>=60 then '60_and_60+'
end as Age_Group,
count(*) as total_customers,
avg(`Purchase Amount (USD)`) as avg_spend
from shopping_trends
group by Age_Group;

select Gender,avg(`Purchase Amount (USD)`)
from shopping_trends
group by Gender;

select Gender,Category,count(*) as total_customers
from shopping_trends
group by Gender,Category
order by Category;

select Category,count(*) as purchase_count
from shopping_trends
group by Category;

select Category,sum(`Purchase Amount (USD)`) as total_spend
from shopping_trends
group by Category
order by total_spend;

select 
case when Age<20 then 'under_20'
when Age>=20 and Age<40 then '20-40'
when Age>=40 and Age<60 then '40-60'
when Age>=60 then '60_and_60+'
end as Age_Group,
Category,count(*) as purchase_count
from shopping_trends
group by Age_Group,Category
order by Age_Group;

select Location,count(*) as purchase_count
from shopping_trends
group by Location
order by purchase_count;

select Location,`Payment Method`,count(distinct `Customer ID`) as purchase_count
from shopping_trends
group by Location,`Payment Method`
order by `Payment Method`;

select Location,sum(`Purchase Amount (USD)`) as total_purchase,
rank()over(order by sum(`Purchase Amount (USD)`) desc) as rank_by_spend
from shopping_trends
group by Location;

select Location,sum(`Purchase Amount (USD)`) as total_purchase,
avg(sum(`Purchase Amount (USD)`))over(partition by Location) as avg_spend
from shopping_trends
group by Location;

select Location,sum(`Purchase Amount (USD)`) as total_spend
from shopping_trends
group by Location
having total_spend=
(
select max(total_spend)
from
(select sum(`Purchase Amount (USD)`) as total_spend
from shopping_trends
group by Location) as a
);

select `Customer ID`,`Purchase Amount (USD)`
from shopping_trends
where `Purchase Amount (USD)`>
(select avg(`Purchase Amount (USD)`) as avg_spend
from shopping_trends);











