-- create database swiggy;
use swiggy;
select * from swiggy_data;

select city, count(*) as total_restaurants from swiggy_data
group by City order by total_restaurants desc limit 10;

select City ,avg(Price) as avg_price from swiggy_data
group by City order by avg_price desc limit 10;

ALTER TABLE swiggy_data
RENAME COLUMN `Avg ratings` TO Avg_ratings;

select Restaurant , City , Avg_ratings from swiggy_data
order by Avg_ratings desc limit 5;

select 
	case
		when Price <200 then 'low'
		when price between 200 and 400 then 'medium'
		else 'high'
	end as price_category,
    avg(Avg_ratings) as avg_rating
from swiggy_data group by price_category;

ALTER TABLE swiggy_data
RENAME COLUMN `Delivery time` TO Delivery_time;

SELECT Restaurant, City, Delivery_time
FROM swiggy_data
WHERE Delivery_time <= 30
ORDER BY Delivery_time;

ALTER TABLE swiggy_data
RENAME COLUMN `Food type` TO Food_types;

select Food_types, count(*) as food_count
from swiggy_data group by Food_types order by food_count desc;

SELECT Restaurant, City, Price, Avg_ratings
FROM swiggy_data
WHERE Avg_ratings >= 4.2
AND Price <= 300
ORDER BY Avg_ratings DESC;

SELECT 
    CASE
        WHEN Delivery_time <= 30 THEN 'Fast'
        WHEN Delivery_time BETWEEN 31 AND 45 THEN 'Medium'
        ELSE 'Slow'
    END AS Delivery_speed,
    avg(Avg_ratings) as avg_rating
FROM swiggy_data
GROUP BY Delivery_speed;









