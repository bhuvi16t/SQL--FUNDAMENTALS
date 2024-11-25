
use sports ;
-- 1.Display the names of athletes who won a gold medal in the 2008 Olympics
-- and whose height is greater than the average height of all athletes in the 2008 Olympics.


select name,medal from olympics 
where Medal = 'Gold' and Height > (SELECT avg(Height) FROM olympics  
                                   where year = 2008 ) and year =2008 ;
						
-- 2.Display the names of athletes who won a medal in the sport of basketball in the 2016 Olympics and whose weight is less than the average weight of all athletes 
-- who won a medal in the 2016 Olympics.
SELECT Name,Medal FROM olympics
WHERE Weight < (SELECT AVG(Weight) FROM olympics 
WHERE year = 2016 and Medal is not NULL) and year = 2016 and Medal is not null and Sport ='Basketball';

-- 3. Display the names of all athletes who have won a medal in the sport of swimming in both the 2008 and 2016 Olympics.
SELECT   distinct Name ,medal from olympics
WHERE Sport = 'Swimming' 
AND Medal IS NOT NULL
and name in (SELECT Name FROM olympics 
			   WHERE year = 2016 and Sport = 'swimming' and Medal is not null) 
AND Name in (SELECT Name FROM olympics 
WHERE year = 2008 and Sport = 'swimming' and Medal is not null) ;

-- Display the names of all countries that have won more than 50 medals in a single year.
WITH MedalCounts AS (
    SELECT country, year, COUNT(medal) AS medal_count
    FROM olympics
    WHERE medal IS NOT NULL
    GROUP BY country, year )
SELECT distinct country
FROM MedalCounts
WHERE medal_count > 50;  

-- 5.Display the names of all athletes who have won medals in more than one sport in the same year.
with moresports as (SELECT name
   FROM olympics
   WHERE medal IS NOT NULL
   GROUP BY year,name
   HAVING COUNT(DISTINCT sport) > 1)
select name from moresports ;

-- 6.What is the average weight difference between male and female athletes in the Olympics who have won a medal in the same event?

WITH GenderWeights AS (
    SELECT 
        Event,
        Sex,
        AVG(Weight) AS AvgWeight
    FROM olympics
    WHERE Medal IS NOT NULL
    GROUP BY Event, Sex
),
EventWeightDiff AS (
    SELECT 
        Event,
        ABS(
            MAX(CASE WHEN Sex = 'M' THEN AvgWeight ELSE NULL END) - 
            MAX(CASE WHEN Sex = 'F' THEN AvgWeight ELSE NULL END)
        ) AS WeightDifference
    FROM GenderWeights
    GROUP BY Event
    HAVING COUNT(DISTINCT Sex) = 2
)
SELECT AVG(WeightDifference) AS AverageWeightDifference
FROM EventWeightDiff;

--  using Insurance Dataset :
use mydb;
-- 1. How many patients have claimed more than the average claim amount for patients who are smokers and have at least one child, and belong to the southeast region?
select count(*) as patients from insurance
where claim > (select avg(claim) from insurance 
where smoker = 'Yes' and children >=1 and region = 'southeast' and claim is not null );

-- 2. How many patients have claimed more than the average claim amount for patients who are not smokers and have a BMI greater than the average BMI for patients who have at least one child?
select count(*) from insurance 
where bmi > (select  avg(bmi) from insurance 
where children >=1  ) 
and  claim > (select avg(claim) from insurance
where smoker = 'No' ) ;

-- How many patients have claimed more than the average claim amount for patients who have a BMI greater than the average BMI for patients who are diabetic, have at least one child, and are from the southwest region?
select count(*)  from insurance
where claim > (select avg(claim ) from insurance 
where bmi > (select avg(bmi) from insurance
             where diabetic ='Yes' and children >= 1 and region = 'southwest') and claim is not null) ;

-- What is the difference in the average claim amount between patients who are smokers and patients who are non-smokers, and have the same BMI and number of children?
with  difference as (
      select abs( (select avg(claim) from insurance 
				  where smoker = 'Yes' and bmi = i.bmi and children = i.children and claim is not null)
               -  (select avg(claim) from insurance 
				  where smoker = 'No' and bmi = i.bmi and children = i.children and claim is not null) ) as claimDifference 
	  from insurance i)
select claimDifference  from difference
where claimDifference is not null ;
 -- 2nd query for  that question 
 WITH grouped_claims AS (
    SELECT 
        bmi, 
        children,
        AVG(CASE WHEN smoker = 'Yes' THEN claim END) AS avg_claim_smokers,
        AVG(CASE WHEN smoker = 'No' THEN claim END) AS avg_claim_non_smokers
    FROM insurance
    WHERE claim IS NOT NULL
    GROUP BY bmi, children
),
difference AS (
    SELECT 
        ABS(avg_claim_smokers - avg_claim_non_smokers) AS claimDifference
    FROM grouped_claims
    WHERE avg_claim_smokers IS NOT NULL AND avg_claim_non_smokers IS NOT NULL
)
SELECT claimDifference
FROM difference;



            
    



                
					

                  





