-- Problem 1: Show avg deep sleep time for both gender. Round result at 2 decimal places.

SELECT gender, round(avg((deep_sleep_percentage /100)*sleep_duration),2)  as 'avg_deep_sleep_time' FROM mydb.sleepy
group by gender


-- Problem 2: Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.
select id,round(avg(sleep_duration)) as 'avg_sleep_time' from mydb.sleepy where gender ='Male'
group by id
having avg_sleep_time>=7.5
order by avg_sleep_time  desc limit 15

-- Problem 3: Find out the lowest 10th to 30th light sleep percentage records where 
-- deep sleep percentage values are between 25 to 45. Display age, light
-- sleep percentage and deep sleep percentage columns only.

SELECT id, age, light_sleep_percentage, deep_sleep_percentage
FROM mydb.sleepy
WHERE light_sleep_percentage BETWEEN 10 AND 30
  AND deep_sleep_percentage BETWEEN 25 AND 45 
ORDER BY light_sleep_percentage ASC

-- Problem 4: Group by on exercise frequency and smoking status and show average deep sleep time,
--  average light sleep time and avg rem sleep time.
select exercisefrequency,smoking_status ,
round(avg((deep_sleep_percentage /100)*sleep_duration),2) as 'avg_deep',
round(avg((light_sleep_percentage /100)*sleep_duration),2) as 'avg_light',
round(avg((rem_sleep_percentage /100)*sleep_duration),2) as 'avg_rem'
from mydb.sleepy
group by exercisefrequency,smoking_status

-- Problem 5: Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol 
-- consumption only for people who do exercise atleast 3 days a week. Show result in descending order awekenings
SELECT 
  Awakenings, 
  AVG(caffeine_consumption) AS 'caffeine_consumption', 
  AVG(alcohol_consumption) AS 'alcohol_consumption',
  ROUND(AVG((deep_sleep_percentage / 100) * sleep_duration), 2) AS 'avg_deep_time'
FROM mydb.sleepy
WHERE exercisefrequency >= 3
GROUP BY Awakenings
order by Awakenings desc

