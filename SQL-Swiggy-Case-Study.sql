USE zomato ;
-- 1. Find customers who have never ordered

SELECT user_id,name FROM users 
WHERE user_id NOT IN (SELECT user_id FROM orders) ;

-- 2. Average Price/dish


SELECT f.f_name,AVG(price) as AVG_Price FROM menu m
JOIN food f ON f.f_id = m.f_id
GROUP BY f.f_id,f.f_name;


-- 3. Find the top restaurant in terms of the number of orders for a given month

SELECT r.r_name, monthname(date) as month ,count(*) as orders from  orders o
join restaurants r on r.r_id = o.r_id
where  monthname(date) = 'June'
group by month,r.r_name
order by orders desc limit 1 ;



-- 4. restaurants with monthly sales greater than x for 
 
select * from (select r.r_name,monthname(date) as month ,sum(amount) as revenue from orders o
			   join restaurants r on r.r_id = o.r_id
			   group by month,r.r_name ) t
where revenue > 500 ;

-- 5. Show all orders with order details for a particular customer in a particular date range
select o.order_id ,r.r_name,r.r_name from orders o
join  restaurants r on r.r_id = o.r_id
join order_details od on o.order_id = od. order_id
join food f on od.f_id 
where user_id = (select user_id from users where name like 'Ankit')
and date between '2022-06-10' and '2022-07-10'


-- 6. Find restaurants with max repeated customers 
-- 7. Month over month revenue growth of swiggy
-- 8. Customer - favorite food
