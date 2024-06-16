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
