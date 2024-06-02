--  Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS DesignAndOptimization;

--  Use the database
USE DesignAndOptimization;

--  Drop existing tables for testing purposes
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Users;

--  Create Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--  Create Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

--  Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

--  Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

--  Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--  Insert data into Users table
INSERT INTO Users (Username, Email)
VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Alice Smith', 'alice.smith@example.com'),
    ('Emma Johnson', 'emma.johnson@example.com'),
    ('Daniel Brown', 'daniel.brown@example.com'),
    ('Olivia Wilson', 'olivia.wilson@example.com'),
    ('Liam Taylor', 'liam.taylor@example.com'),
    ('Sophia Anderson', 'sophia.anderson@example.com'),
    ('Noah Martinez', 'noah.martinez@example.com'),
    ('Ava Jones', 'ava.jones@example.com'),
    ('William Garcia', 'william.garcia@example.com'),
    ('Isabella Rodriguez', 'isabella.rodriguez@example.com'),
    ('James Davis', 'james.davis@example.com'),
    ('Emily Hernandez', 'emily.hernandez@example.com'),
    ('Benjamin Moore', 'benjamin.moore@example.com'),
    ('Mia Lee', 'mia.lee@example.com'),
    ('Ethan Clark', 'ethan.clark@example.com'),
    ('Charlotte Lewis', 'charlotte.lewis@example.com'),
    ('Alexander Walker', 'alexander.walker@example.com'),
    ('Harper Hall', 'harper.hall@example.com'),
    ('Michael Allen', 'michael.allen@example.com'),
    ('Evelyn Young', 'evelyn.young@example.com'),
    ('Daniel Wright', 'daniel.wright@example.com'),
    ('Lily King', 'lily.king@example.com'),
    ('Matthew Hill', 'matthew.hill@example.com'),
    ('Amelia Scott', 'amelia.scott@example.com'),
    ('David Baker', 'david.baker@example.com'),
    ('Abigail Green', 'abigail.green@example.com'),
    ('Joseph Adams', 'joseph.adams@example.com'),
    ('Samantha Nelson', 'samantha.nelson@example.com'),
    ('Owen Carter', 'owen.carter@example.com'),
    ('Avery Thomas', 'avery.thomas@example.com'),
    ('Lucas Evans', 'lucas.evans@example.com'),
    ('Madison Martinez', 'madison.martinez@example.com'),
    ('Jackson Garcia', 'jackson.garcia@example.com'),
    ('Elizabeth Martinez', 'elizabeth.martinez@example.com'),
    ('Gabriel Hernandez', 'gabriel.hernandez@example.com'),
    ('Avery Scott', 'avery.scott@example.com'),
    ('Evelyn Garcia', 'evelyn.garcia@example.com'),
    ('Ryan Hernandez', 'ryan.hernandez@example.com'),
    ('Sophie Thompson', 'sophie.thompson@example.com'),
    ('Jayden Lopez', 'jayden.lopez@example.com'),
    ('Victoria Clark', 'victoria.clark@example.com'),
    ('William Thompson', 'william.thompson@example.com'),
    ('Penelope Lee', 'penelope.lee@example.com'),
    ('Lincoln Perez', 'lincoln.perez@example.com');

--  Insert data into Categories table
INSERT INTO Categories (CategoryName)
VALUES
    ('Electronics'),
    ('Clothing'),
    ('Books'),
    ('Home & Kitchen'),
    ('Toys'),
    ('Sports'),
    ('Beauty'),
    ('Health & Personal Care'),
    ('Automotive');

--  Insert data into Products table
INSERT INTO Products (ProductName, CategoryID, Price, Stock)
VALUES
    ('Smartphone', 1, 599.99, 100),
    ('Laptop', 1, 1299.99, 50),
    ('T-shirt', 2, 19.99, 200),
    ('Jeans', 2, 39.99, 150),
    ('Book', 3, 12.99, 300),
    ('Coffee Maker', 4, 49.99, 80),
    ('Action Figure', 5, 9.99, 120),
    ('Basketball', 6, 29.99, 40),
    ('Shampoo', 7, 8.99, 150),
    ('Toothpaste', 7, 3.99, 200),
    ('Multivitamin', 8, 19.99, 100),
    ('Car Battery', 9, 99.99, 30);

-- Insert data into Orders table
INSERT INTO Orders (UserID, Total)
SELECT UserID, ROUND(RAND() * 1000 + 50, 2)
FROM Users
ORDER BY RAND()
LIMIT 50;

--  Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
SELECT o.OrderID, p.ProductID, ROUND(RAND() * 5 + 1), p.Price
FROM Orders o
CROSS JOIN Products p
WHERE p.Stock > 0
ORDER BY RAND()
LIMIT 100;

-- Create indexes to optimize queries

CREATE INDEX idx_orders_userid ON Orders(UserID);
CREATE INDEX idx_orders_orderdate ON Orders(OrderDate); 
CREATE INDEX idx_orderitems_orderid ON OrderItems(OrderID); 
CREATE INDEX idx_orderitems_productid ON OrderItems(ProductID); 
CREATE INDEX idx_products_categoryid ON Products(CategoryID);

-- Non-clustered index examples

CREATE INDEX idx_users_email ON Users(Email);
CREATE INDEX idx_products_productname ON Products(ProductName);

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
