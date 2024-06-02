# README

## Overview

This script sets up a relational database for a simple e-commerce platform using SQL. The database includes tables for customers, orders, products, and order items. It also includes a variety of SQL queries to explore and analyze the data.

## Database Creation and Usage

1. **Create Database and Tables**:
   - The script creates a database named `Data_Analysis`.
   - It sets up four tables: `customers`, `orders`, `products`, and `order_items`, each with appropriate fields and foreign key relationships.

### Tables

#### customers

| Column       | Type         | Description               |
|--------------|--------------|---------------------------|
| customer_id  | INT          | Primary key, auto-increment |
| name         | VARCHAR(100) | Customer's name           |
| email        | VARCHAR(100) | Customer's email          |
| join_date    | DATE         | Date customer joined      |

#### orders

| Column       | Type         | Description               |
|--------------|--------------|---------------------------|
| order_id     | INT          | Primary key, auto-increment |
| customer_id  | INT          | Foreign key to customers  |
| order_date   | DATE         | Date of the order         |
| total_amount | DECIMAL(10,2)| Total amount of the order |

#### products

| Column       | Type         | Description               |
|--------------|--------------|---------------------------|
| product_id   | INT          | Primary key, auto-increment |
| name         | VARCHAR(100) | Product name              |
| price        | DECIMAL(10,2)| Product price             |

#### order_items

| Column       | Type         | Description               |
|--------------|--------------|---------------------------|
| order_item_id| INT          | Primary key, auto-increment |
| order_id     | INT          | Foreign key to orders     |
| product_id   | INT          | Foreign key to products   |
| quantity     | INT          | Quantity of the product   |

2. **Insert Data**:
   - Sample data is inserted into each table, representing a basic e-commerce scenario with customers, their orders, products, and the items in each order.

## Data Exploration and Basic Queries

1. **View Table Structures**:
   - The `DESCRIBE` command is used to display the structure of each table.

2. **Check for Missing Values and Duplicates**:
   - Queries check for missing values in the `customers` table and for duplicate emails.

3. **Basic Data Retrieval**:
   - Various queries retrieve customers who joined after a specific date, calculate total sales, count total orders, list products by price, and display all customers with their join dates.

## Join Operations

1. **Customer and Order Analysis**:
   - A join between `customers` and `orders` calculates the total amount spent by each customer.

2. **Product Quantity Analysis**:
   - A join between `order_items` and `products` finds the total quantity ordered for each product.

3. **Detailed Order Information**:
   - A join between `orders`, `order_items`, and `products` retrieves detailed information for each order, including product names and quantities.

## Data Transformation

1. **Format and Handle Data**:
   - Dates in the `customers` table are reformatted.
   - Null values in the `email` field are handled using the `COALESCE` function.

2. **Aggregate Functions**:
   - Queries calculate the average order amount and the total quantity of products ordered.

## Complex Queries and Analysis

1. **Top Customers**:
   - A query identifies the top 5 customers based on total spending.

2. **Running Total of Sales**:
   - A window function calculates a running total of sales over time.

3. **Average Items per Order**:
   - A subquery calculates the average number of items per order.

4. **Orders with Multiple Product Types**:
   - A query identifies orders that contain more than one type of product.

## How to Use

1. **Setting Up the Database**:
   - Run the script in an SQL environment to create the database and tables, and to insert the sample data.

2. **Executing Queries**:
   - Use the provided queries to explore and analyze the data. Modify them as needed to suit specific analytical requirements.

3. **Understanding the Data**:
   - The dataset and queries provide insights into customer behavior, sales performance, and product popularity, which can inform business decisions.

This script serves as a foundational setup for a simple e-commerce database and includes common queries for data exploration and analysis. It can be expanded with more complex data and additional tables as needed for more comprehensive analysis.

Author: **Bairoju Saidachary**
