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
