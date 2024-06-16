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
