
-- SORTING ==>
-- 1. find top 5 samsung phones with biggest screen size
SELECT model,screen_size FROM newdb.smartphones  WHERE brand_name ='samsung'
ORDER BY screen_size DESC  limit 10 ;

-- 2. sort all the phone with in decending order of number of total cameras
SELECT  model, num_front_cameras + num_rear_cameras  as 'total_cameraras'FROM newdb.smartphones
order by  total_cameras desc limit 10 ;

-- 3. sort data on the basis of ppi in decreasing order
SELECT  model, round(sqrt(resolution_width*resolution_width + resolution_height*resolution_height) / screen_size) as 'PPI' FROM newdb.smartphones 
ORDER BY PPI  DESC ;

-- 4.  find the phone with 2nd largest battery
SELECT model,battery_capacity from newdb.smartphones
order by battery_capacity desc limit 1,1;

-- 5.  find the name and rating of the worst rated apple phone
SELECT model , rating FROM newdb.smartphones 
WHERE  brand_name='apple'
ORDER BY rating asc limit 1;

-- 6.  sort phones alphabetically and then on the basic of rating in desc order
SELECT * FROM newdb.smartphones 
order by model asc ,rating asc;

-- 7.  sort phones alphabetically and then on the basic of price in asc order
SELECT * FROM newdb.smartphones
order by model asc ,price asc;

-- GROUPING ==> 

-- 1. Group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity-- 
SELECT  brand_name,count(*) as 'num phones ',
round(AVG( price ) ) as 'avg price',
max(rating) as 'max rating ',
round(AVG( screen_size ) ) as 'avg screen size ',
round(AVG( battery_capacity) ) as 'avg battery'
FROM newdb.smartphones
group by brand_name ;

-- 2. Group smartphones by whether they have an NFC and get the average price and rating
select fast_charging_available,
avg(price ) as 'avg price ',
avg(rating ) as 'avg rating '

FROM newdb.smartphones 
group by fast_charging_available;

-- 3. Group smartphones by the extended memory available and get the average price
select extended_memory_available,

round(avg(price)) as ' avg price'

FROM newdb.smartphones 
group by extended_memory_available;
-- 4. Group smartphones by the brand and processor brand and get the count of models and the average primary camera resolution
-- (rear)

select brand_name , processor_brand,
count(*) as 'num phones',
round(avg(primary_camera_rear) ) as 'avg camera resolution'

FROM newdb.smartphones 
group by brand_name,processor_brand;

-- 5. find top 5 most costly phone brands

select brand_name,round(avg(price)) as  'avg_price '
from newdb.smartphones
group by brand_name
order by avg_price desc limit 5;

-- 6. which brand makes the smallest screen smartphones
SELECT brand_name , round(avg(screen_size)) as  'avg_screen_size'
FROM newdb.smartphones 
group by brand_name
order by avg_screen_size asc limit 1;
-- 7. Avg price of 5g phones vs avg price of non 59 phones
SELECT has_5g, round(avg(price)) as  'avg_price'
FROM newdb.smartphones 
group by has_5g;

-- 8. Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster
SELECT brand_name , count(*) as 'count'
from newdb.smartphones 
where has_nfc ='TRUE' and has_ir_blaster ='TRUE'
group by brand_name
order by count desc limit 1;


-- 9. Find all samsung Sg enabled smartphones and find out the avg price for NFC and Non-NFC phones
SELECT has_nfc, avg(price) as 'avg_price'
from newdb.smartphones 
where brand_name='samsung'
group by has_nfc
order by avg_price desc limit 2;


-- Having clause 

-- 1.find the avg rating  of the smartphone brand which have more than 20 phones 

select brand_name ,
count(*) as 'count',round(avg (price)) as 'avg price',
round(avg (rating)) as 'avg rating'
from newdb.smartphones
group by brand_name
having count >20;

--  2.find the top 3 brand with the highest avg ram that have a refres rate >90 and fast charzing available dont consider brand with have less than 10 phones 
select brand_name, 
round(avg(ram_capacity)) as 'avg_ram'
from newdb.smartphones
Where refresh_rate >90 and fast_charging_available = 1
group by brand_name
having  count(*)  > 10 
order by avg_ram   desc ;

-- 3. find the avg price of all the phone brand  with avg rating > 70 and no. of phones is more than 10 all phone 5g enabled 
select brand_name, 
round(avg(price)) as 'avg_price'
from newdb.smartphones
Where refresh_rate > 90 and has_5g = 'TRUE'
group by brand_name
having  count(*)  > 10 and avg (rating) > 70
order by avg_price  desc ;
-- TO count the no , of  rows 
-- select count(*) from newdb.smartphones
-- runs











