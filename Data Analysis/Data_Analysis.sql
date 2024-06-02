-- Create Database

CREATE DATABASE IF NOT EXISTS Data_Analysis;
USE  Data_Analysis;

-- Create Tables

-- Table: customers

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

-- Table: orders

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table: products

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Table: order_items

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Data

-- Insert data into customers

INSERT INTO customers (name, email, join_date) VALUES
('John Doe', 'john.doe@example.com', '2021-01-15'),
('Jane Smith', 'jane.smith@example.com', '2022-02-20'),
('Alice Johnson', 'alice.johnson@example.com', '2023-03-25'),
('Bob Brown', 'bob.brown@example.com', '2020-05-10'),
('Charlie Davis', 'charlie.davis@example.com', '2021-06-17'),
('Diana Evans', 'diana.evans@example.com', '2022-07-22'),
('Eve Foster', 'eve.foster@example.com', '2023-08-30'),
('Frank Green', 'frank.green@example.com', '2021-09-11');

-- Insert data into products

INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Tablet', 500.00),
('Monitor', 300.00),
('Keyboard', 50.00),
('Mouse', 25.00),
('Printer', 150.00),
('Headphones', 75.00);

-- Insert data into orders

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-10', 1700.00),
(2, '2023-02-15', 1300.00),
(1, '2023-03-05', 500.00),
(3, '2023-03-20', 125.00),
(4, '2023-04-05', 350.00),
(5, '2023-04-18', 275.00),
(6, '2023-05-22', 950.00),
(7, '2023-06-11', 600.00),
(8, '2023-07-14', 1150.00),
(1, '2023-08-20', 825.00),
(2, '2023-09-15', 950.00),
(3, '2023-10-10', 125.00);

-- Insert data into order_items

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 1),
(2, 3, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 5),
(6, 6, 10),
(7, 7, 1),
(8, 8, 2),
(9, 1, 1),
(9, 5, 5),
(10, 3, 2),
(11, 2, 1),
(11, 6, 2),
(12, 4, 1),
(12, 8, 1);

-- Data Exploration

-- View table structures

DESCRIBE customers;
DESCRIBE orders;
DESCRIBE products;
DESCRIBE order_items;

-- Check for missing values in customers table

SELECT * FROM customers WHERE name IS NULL OR email IS NULL;

-- Check for duplicate emails in customers table

SELECT email, COUNT(*) FROM customers GROUP BY email HAVING COUNT(*) > 1;

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

-- Join Operations

-- Join customers and orders to find the total amount spent by each customer

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Join orders and order_items to find total quantity of each product ordered

SELECT p.name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name;

-- Find all orders with product details

SELECT o.order_id, p.name, oi.quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Data Transformation

-- Convert customer join dates to a different format

SELECT customer_id, name, DATE_FORMAT(join_date, '%M %d, %Y') AS formatted_date
FROM customers;

-- Handle NULL values in a column (e.g., replace NULL email with a default value)

SELECT customer_id, name, COALESCE(email, 'noemail@domain.com') AS email
FROM customers;

-- Use aggregate functions to find the average order amount

SELECT AVG(total_amount) AS average_order_amount FROM orders;

-- Calculate the total quantity of products ordered

SELECT SUM(quantity) AS total_quantity_ordered FROM order_items;

-- Complex Queries and Analysis

-- Find the top 5 customers with the highest total spend

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- Use a window function to calculate a running total of sales

SELECT order_date, total_amount,
       SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- Find the average number of items per order

SELECT 
    AVG(item_count) AS average_items_per_order
FROM
    (SELECT 
        order_id, COUNT(*) AS item_count
    FROM
        order_items
    GROUP BY order_id) subquery;

-- Identify orders that contain more than one type of product

SELECT o.order_id, COUNT(DISTINCT oi.product_id) AS product_count
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING product_count > 1;
