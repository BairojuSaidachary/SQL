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