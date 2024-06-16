--  Sample query to retrieve orders with user and item details

SELECT o.OrderID, u.Username, p.ProductName, oi.Quantity, oi.Price
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.OrderDate;

-- Use EXPLAIN for query analysis

EXPLAIN SELECT o.OrderID, u.Username, p.ProductName, oi.Quantity, oi.Price
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.OrderDate;

-- Use SHOW PROFILE for performance profiling

SET profiling = 1;

SELECT o.OrderID, u.Username, p.ProductName, oi.Quantity, oi.Price
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.OrderDate;

SHOW PROFILES;
