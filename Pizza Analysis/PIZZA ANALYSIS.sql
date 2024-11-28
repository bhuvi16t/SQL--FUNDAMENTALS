use pizza ;

-- --- --- --BASIC--------------------------
-- 1. Retrieve the total number of orders placed.
SELECT 
    COUNT(*) AS total_orders
FROM
    orders
ORDER BY order_id;

-- 2. Calculate the total revenue generated from pizza sales .
SELECT 
    SUM(price) AS Total_revenue
FROM
    pizza;

-- 3.Identify the highest-priced pizza.

SELECT 
    p.pizza_id, pt.name, MAX(price) AS price
FROM
    pizza p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY p.pizza_type_id , pt.name
ORDER BY price DESC
LIMIT 1;

-- 4.Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(*) AS frequency
FROM
    order_details od
        JOIN
    pizza p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY frequency DESC;


-- 5 List the top 5 most ordered pizza types along with their quantities.
SELECT 
    od.pizza_id,
    pt.pizza_type_id,
    pt.name,
    SUM(quantity) AS Quantity,
    COUNT(*) AS orders
FROM
    order_details od
        JOIN
    pizza p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY od.pizza_id , pt.pizza_type_id , pt.name
ORDER BY Quantity DESC
LIMIT 5;


-- -----------------INTERMEDIATE----------------------------

-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category, SUM(od.quantity) AS Quantity
FROM
    pizza p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

-- 7. Determine the distribution of orders by hour of the day.
SELECT 
    DAY(time) AS day,
    HOUR(time) AS hour,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY day , hour
ORDER BY day , hour;

-- 8. Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(pizza_type_id) AS pizzas
FROM
    pizza_types
GROUP BY category;
 
 -- 9.Group the orders by date and calculate the average number of pizzas ordered per day.
 
SELECT 
    AVG(orders) avg_orders_perday
FROM
    (SELECT 
        o.date, SUM(od.Quantity) AS orders
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.date) t;

-- 10. Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    p.pizza_type_id, pt.name, SUM(p.price) AS revenue
FROM
    order_details o
        JOIN
    pizza p ON o.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY p.pizza_type_id , pt.name
ORDER BY revenue DESC
LIMIT 3 ;

-- ----------------Advanced:---------------------------------------
-- 11.Calculate the percentage contribution of each pizza type to total revenue.-

with revenues as (select pt.category,sum(price) as revenue from pizza p
join order_details od on p.pizza_id = od.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by pt.category )

SELECT 
    category,
    CONCAT(ROUND((revenue * 100) / (SELECT 
                            SUM(revenue)
                        FROM
                            revenues),
                    2),
            '%') AS percent_contribution
FROM
    revenues;


-- 12.Analyze the cumulative revenue generated over time.

select p.pizza_id,
o.time,
sum(price) 
over(order by time) as cumalative_revenue 
from pizza p
join order_details od on p.pizza_id = od.pizza_id
join orders o on od.order_id =o.order_id ;

-- 13.Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT 
    p.pizza_id,
    o.time,
    SUM(price) OVER (ORDER BY o.time) AS cumulative_revenue
FROM 
    pizza p
JOIN 
    order_details od ON p.pizza_id = od.pizza_id
JOIN 
    orders o ON od.order_id = o.order_id;

-- 13.Determine the top 3 most ordered pizza types based on revenue for each pizza category.
WITH category AS (
    SELECT 
        p.size,
        pt.category,
        SUM(od.quantity * p.price) AS total_revenue
    FROM 
        order_details od
    JOIN 
        pizza p ON od.pizza_id = p.pizza_id
    JOIN 
        pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY 
        p.size, 
        pt.category
)
SELECT 
    *
FROM (
    SELECT 
        category.*,
        RANK() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS rank
    FROM 
        category
) t
WHERE 
    t.rank < 4;












