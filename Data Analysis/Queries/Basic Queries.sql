-- Basic Queries

-- Retrieve all customers who joined after 2021

SELECT * FROM customers WHERE join_date > '2021-01-01';

-- Calculate the total sales amount

SELECT SUM(total_amount) FROM orders;

-- Calculate the total number of orders

SELECT COUNT(*) AS total_orders FROM orders;

-- List products ordered by price descending

SELECT * FROM products ORDER BY price DESC;

-- List all customers and their join dates

SELECT name, join_date FROM customers ORDER BY join_date;