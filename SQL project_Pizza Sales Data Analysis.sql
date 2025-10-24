Show databases;

-- Create a database for storing the final sql project
Create database final_Sql_project;
use final_Sql_project;

/* 
To create table and import data: 
-- right click the 'tables' in schemas
-- click 'table data import wizard'
-- browse the data to be imported i.e. 'pizzas', 'pizza_types'
-- create in new table 
*/

SELECT * FROM pizzas;

SELECT * FROM pizza_types;

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);

/*
Right-click orders in schemas:
-- go to 'table data import wizard'
-- browse the data to be imported i.e. 'orders'
-- choose existing table 'final_sql_project.orders'
-- then next, check whether the columns are prefectly assigned
-- at last click finish
*/

SELECT * FROM orders;

CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

/*
Right-click order_details in schemas
-- go to 'table data import wizard'
-- browse the data to be imported i.e. 'order_details'
-- choose exixting table 'final_sql_project.order_details'
-- then next, check whether the columns are prefectly assigned
-- at last finish
*/

SELECT * FROM order_details;

/* Understanding pizza sales data using SQL querries: */
-- 1. Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- 2. Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS total_sales
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id;

-- 3. Identify the highest-priced pizza.
SELECT 
    pt.name, p.price
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- 4. Identify the most common pizza quantity ordered.
SELECT 
    quantity, COUNT(order_details_id) as "Total of quantity"
FROM
    order_details
GROUP BY quantity;

-- 5. Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(od.order_details_id) order_count
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY order_count DESC;

-- 6. List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(od.quantity) AS total_quantity
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;

-- 7. Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(od.quantity) AS quantity
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY quantity DESC;

-- 8. Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);

-- 9. Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category; 

-- 10. Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity), 0) AS 'Avareage number of pizzas ordered per day'
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS quantity
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_date) AS order_quantity;

-- 11. Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name, SUM(od.quantity * p.price) AS revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

-- 12. Join relevant tables to calculate the highest revenue and number of orders for 1st, 2nd, 3rd, and 4th quarter of the year
SELECT 
    Quarter_category, MAX(revenue) AS highest_revenue, COUNT(*) AS number_of_orders
FROM
    (SELECT 
        o.order_date,
		MONTH(o.order_date) AS month_number,
            CASE
                WHEN MONTH(o.order_date) BETWEEN 1 AND 3 THEN '1st Quarter'
                WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN '2nd Quarter'
                WHEN MONTH(o.order_date) BETWEEN 7 AND 9 THEN '3rd Quarter'
                WHEN MONTH(o.order_date) BETWEEN 10 AND 12 THEN '4th Quarter'
            END AS Quarter_category,
            (p.price * od.quantity) AS revenue
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN pizzas p ON p.pizza_id = od.pizza_id) AS revenue_data
GROUP BY Quarter_category
ORDER BY Quarter_category;

