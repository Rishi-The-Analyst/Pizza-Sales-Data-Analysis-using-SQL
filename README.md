# 🍕 Pizza-Sales-Data-Analysis-using-SQL 🍕
## 📋 Project Overview

This project focuses on analysing <b>pizza sales data using SQL</b>. It demonstrates the complete process of database creation, table setup, data import, and query-driven insights to explore key business metrics such as revenue, order frequency, and customer preferences.

Through this project, you’ll gain an understanding of <b>SQL joins, aggregation, grouping, and analytical functions</b> in a real-world data context.

## 🧩 Database Structure

The database — <i>`final_sql_project`</i> — contains four main tables:

| Table Name      | Description                                                   |
| --------------- | ------------------------------------------------------------- |
| `pizzas`        | Contains pizza IDs, sizes, prices, and associated type IDs    |
| `pizza_types`   | Includes pizza names, categories, and descriptions            |
| `orders`        | Stores each order’s ID, date, and time                        |
| `order_details` | Links orders with pizzas, recording quantities sold per order |

## ⚙️ Setup Instructions
#### 1️⃣ Create the Database
<pre>CREATE DATABASE final_sql_project;
USE final_sql_project;</pre>

#### 2️⃣ Import the Data

Using MySQL Workbench:<br>
* Right-click on Tables → Table Data Import Wizard
* Browse and import CSVs (pizzas, pizza_types, orders, order_details)
* Create or assign to the existing table as needed

#### 3️⃣ Verify Data Import
<pre>
SELECT * FROM pizzas;
SELECT * FROM pizza_types;
SELECT * FROM orders;
SELECT * FROM order_details;
</pre>

## 🔍 Analytical Queries

A collection of 12 SQL queries explores meaningful insights from the pizza sales dataset:
| S.No.  | Query Description                        | SQL Concept Demonstrated    |
| -- | ---------------------------------------- | --------------------------- |
| 1  | Retrieve total number of orders          | COUNT(), Basic Aggregation  |
| 2  | Calculate total revenue                  | SUM(), JOIN                 |
| 3  | Identify highest-priced pizza            | ORDER BY, LIMIT             |
| 4  | Find most common pizza quantity ordered  | GROUP BY, COUNT()           |
| 5  | Determine most common pizza size         | GROUP BY, ORDER BY          |
| 6  | Top 5 most ordered pizza types           | Aggregation, JOIN, LIMIT    |
| 7  | Quantity by pizza category               | Multi-table JOIN, GROUP BY  |
| 8  | Orders by hour of day                    | HOUR(), GROUP BY            |
| 9  | Category-wise pizza distribution         | GROUP BY                    |
| 10 | Average pizzas ordered per day           | Subqueries, AVG()           |
| 11 | Top 3 pizza types by revenue             | JOIN, SUM(), ORDER BY       |
| 12 | Quarterly revenue and order distribution | CASE, GROUPING, Aggregation |

## 📊 Key Insights

🍕 Most popular pizzas can be identified by order quantity and revenue.<br>
<img width="143" height="43" alt="image" src="https://github.com/user-attachments/assets/bb5b02e3-0bcf-4ddd-9c5d-ad1a55bd3a99" />

💰 Total revenue and average daily sales reveal business performance. <br>
<img width="76" height="42" alt="image" src="https://github.com/user-attachments/assets/30c4ea5e-8e5a-4983-9e3b-d659f1560ed4" />
<img width="77" height="41" alt="image" src="https://github.com/user-attachments/assets/7f77b58f-c33b-42e8-bb66-49e4ba84c811" />
<img width="234" height="43" alt="image" src="https://github.com/user-attachments/assets/515f4599-78cd-4f5f-a402-60604b69c1bf" />


🕓 Time-based order distribution highlights peak sales hours. <br>
<img width="117" height="282" alt="image" src="https://github.com/user-attachments/assets/ee3a06a1-193d-447d-b2cd-c4eeedb978b2" />

📅 Quarterly analysis helps understand seasonal trends.<br>
<img width="315" height="94" alt="image" src="https://github.com/user-attachments/assets/13affd80-eff6-4ce6-a918-8ffbdfdd5184" />

## 💾 Tools Used

<b>MySQL Workbench</b> – for database design and query execution<br>
<b>CSV Files</b> – as the data source for pizza sales<br>
<b>GitHub</b> – for version control and project sharing

## 🏁 Conclusion

By methodically working through 12 queries, this project showcases how SQL can transform raw sales data into actionable insights. It’s an ideal demonstration of both technical querying ability and analytical thinking applied to a realistic business scenario. <br>
While the current project offers robust SQL-based insights, it can be further enhanced through <b>predictive analysis, advanced query optimisation, data quality,</b> and <b>data validation</b>.

🔗Do Follow <a href="https://www.linkedin.com/in/rishikesh-m-r-8867319875r">Rishikesh M R</a> in Linkedin

