# Design and Optimization Database

## Overview

This project involves creating a relational database for a fictional e-commerce platform. The database is designed to store information about users, categories, products, orders, and order items. Additionally, it includes optimized queries to ensure efficient data retrieval and performance profiling to identify potential bottlenecks.

## Database Structure

The database consists of the following tables:
- `Users`: Stores user information.
- `Categories`: Stores product categories.
- `Products`: Stores product details.
- `Orders`: Stores order information.
- `OrderItems`: Stores details of items in each order.

## Database Creation and Initialization

The SQL script provided performs the following actions:
1. Creates the `DesignAndOptimization` database if it doesn't already exist.
2. Drops any existing tables to ensure a clean state for testing purposes.
3. Creates the necessary tables with appropriate primary and foreign keys.
4. Inserts sample data into the tables.

## Table Descriptions

### Users Table
- `UserID`: Primary key, auto-incremented.
- `Username`: Username of the user.
- `Email`: Email address of the user (unique).
- `CreatedAt`: Timestamp of when the user was created.

### Categories Table
- `CategoryID`: Primary key, auto-incremented.
- `CategoryName`: Name of the category.

### Products Table
- `ProductID`: Primary key, auto-incremented.
- `ProductName`: Name of the product.
- `CategoryID`: Foreign key referencing `CategoryID` in the `Categories` table.
- `Price`: Price of the product.
- `Stock`: Number of items in stock.

### Orders Table
- `OrderID`: Primary key, auto-incremented.
- `UserID`: Foreign key referencing `UserID` in the `Users` table.
- `OrderDate`: Timestamp of when the order was placed.
- `Total`: Total cost of the order.

### OrderItems Table
- `OrderItemID`: Primary key, auto-incremented.
- `OrderID`: Foreign key referencing `OrderID` in the `Orders` table.
- `ProductID`: Foreign key referencing `ProductID` in the `Products` table.
- `Quantity`: Quantity of the product in the order.
- `Price`: Price of the product at the time of order.

## Optimizing Queries

Indexes are created on various columns to optimize query performance:
- `UserID` and `OrderDate` in the `Orders` table.
- `OrderID` and `ProductID` in the `OrderItems` table.
- `CategoryID` in the `Products` table.
- Non-clustered indexes on `Email` in the `Users` table and `ProductName` in the `Products` table.

## Performance Profiling

The script includes examples of using `EXPLAIN` and `SHOW PROFILE` to analyze and profile query performance.

## How to Use

1. Execute the SQL script in a MySQL database environment.
2. The script will create the `DesignAndOptimization` database, create the tables, and insert sample data.
3. Review the provided sample query and performance analysis tools to understand data retrieval and optimization techniques.

## Sample Query

A sample query is provided to retrieve orders with user and item details within a specified date range.

```sql
SELECT o.OrderID, u.Username, p.ProductName, oi.Quantity, oi.Price
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.OrderDate;
```
Author: **Bairoju Saidachary**