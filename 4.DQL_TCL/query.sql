-- ========================================================
-- SQL File: customer_information.sql
-- Title: Create Database 'customer_information' and Implement DQL and TCL Commands
-- ========================================================

-- ========================================================
-- 1. Creating the Database and Table
-- ========================================================

-- Creating the database 'customer_information'
CREATE DATABASE customer_information;

-- Using the database 'customer_information'
USE customer_information;

-- Creating the CUSTOMER table with appropriate schema
CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY,          -- Unique identifier for each customer
    FirstName VARCHAR(50),               -- Customer's first name
    LastName VARCHAR(50),                -- Customer's last name
    Email VARCHAR(100),                  -- Customer's email address
    Age INT,                             -- Customer's age
    Gender CHAR(1),                      -- Customer's gender ('M' or 'F')
    City VARCHAR(50),                    -- City where the customer resides
    TotalPurchase DECIMAL(10, 2)         -- Total purchase amount by the customer
);

-- ========================================================
-- 2. Inserting Sample Data into the CUSTOMER Table
-- ========================================================
INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email, Age, Gender, City, TotalPurchase)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', 30, 'M', 'New York', 1500.75);

INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email, Age, Gender, City, TotalPurchase)
VALUES 
(2, 'Jane', 'Smith', 'jane.smith@example.com', 28, 'F', 'Los Angeles', 2100.50);

INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email, Age, Gender, City, TotalPurchase)
VALUES 
(3, 'Michael', 'Brown', 'michael.brown@example.com', 35, 'M', 'Chicago', 3200.00);

INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email, Age, Gender, City, TotalPurchase)
VALUES 
(4, 'Emily', 'Davis', 'emily.davis@example.com', 40, 'F', 'Houston', 2700.25);

-- ========================================================
-- 3. DQL Commands (Data Query Language)
-- ========================================================

-- Query 1: Select all records from the CUSTOMER table
SELECT * FROM CUSTOMER;

-- Query 2: Use of SQL operators (comparison, logical, and arithmetic operators)
-- Example 1: Display customers who have made purchases greater than $2000
SELECT * FROM CUSTOMER WHERE TotalPurchase > 2000;

-- Example 2: Display customers from 'Chicago' or 'Houston'
SELECT * FROM CUSTOMER WHERE City = 'Chicago' OR City = 'Houston';

-- Example 3: Display customers whose age is between 30 and 40
SELECT * FROM CUSTOMER WHERE Age BETWEEN 30 AND 40;

-- Example 4: Display customers whose first name starts with 'J'
SELECT * FROM CUSTOMER WHERE FirstName LIKE 'J%';

-- Example 5: Display total purchase amount after applying a 10% discount
SELECT CustomerID, FirstName, LastName, (TotalPurchase * 0.9) AS DiscountedPurchase
FROM CUSTOMER;

-- ========================================================
-- 4. TCL Commands (Transaction Control Language)
-- ========================================================

-- Starting a transaction
START TRANSACTION;

-- Query 1: Insert a new customer record
INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email, Age, Gender, City, TotalPurchase)
VALUES (5, 'David', 'Wilson', 'david.wilson@example.com', 45, 'M', 'Phoenix', 3500.00);

-- Creating a savepoint after the first insert
SAVEPOINT sp_after_insert;

-- Query 2: Update the age of a customer
UPDATE CUSTOMER SET Age = 50 WHERE CustomerID = 5;

-- Creating a savepoint after the update
SAVEPOINT sp_after_update;

-- Query 3: Delete a customer record
DELETE FROM CUSTOMER WHERE CustomerID = 3;

-- Creating a savepoint after the delete operation
SAVEPOINT sp_after_delete;

-- ========================================================
-- 5. Rollback Example
-- ========================================================

-- Rolling back to the savepoint 'sp_after_update'
-- This will undo the delete operation but keep the insert and update changes.
ROLLBACK TO sp_after_update;

-- ========================================================
-- 6. Commit Example
-- ========================================================

-- Committing the transaction to save the changes permanently
COMMIT;

-- ========================================================
-- 7. Verification of Changes
-- ========================================================

-- Display all records from the CUSTOMER table to verify changes
SELECT * FROM CUSTOMER;

-- ========================================================
-- Explanation of Commands:
--
-- 1. DQL (Data Query Language):
--    - SELECT: Used to query data from the CUSTOMER table with various conditions and operators.
--
-- 2. TCL (Transaction Control Language):
--    - START TRANSACTION: Begins a new transaction.
--    - SAVEPOINT: Creates a savepoint within a transaction, allowing partial rollback.
--    - ROLLBACK: Reverts the changes to the last savepoint or the beginning of the transaction.
--    - COMMIT: Saves all the changes made during the transaction permanently.
--
-- 3. SQL Operators Used:
--    - Comparison Operators: '>', '=', 'BETWEEN'
--    - Logical Operators: 'AND', 'OR'
--    - LIKE Operator: Used for pattern matching.
--    - Arithmetic Operators: '*', used to calculate discounted purchase.
-- ========================================================
