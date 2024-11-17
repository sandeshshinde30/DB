-- ===========================================
-- 1. Create a Database
-- ===========================================

-- Create a new database called 'customer_db' (if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS customer_db;

-- Select the 'customer_db' database to perform operations
USE customer_db;

-- ===========================================
-- 2. Create a Table 'customers'
-- ===========================================

-- Create a 'customers' table with basic fields: id, name, email, and age
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Auto-incrementing ID for each customer
    first_name VARCHAR(50),                     -- Customer's first name (max 50 characters)
    last_name VARCHAR(50),                      -- Customer's last name (max 50 characters)
    email VARCHAR(100) UNIQUE NOT NULL,         -- Customer's email (max 100 characters), must be unique
    age INT CHECK (age >= 0),                   -- Customer's age (must be a non-negative value)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the record was created
);

-- ===========================================
-- 3. Insert Data (Create Operation)
-- ===========================================

-- Insert sample records into the 'customers' table
INSERT INTO customers (first_name, last_name, email, age)
VALUES 
('John', 'Doe', 'john.doe@example.com', 28),
('Jane', 'Smith', 'jane.smith@example.com', 35),
('Alice', 'Johnson', 'alice.johnson@example.com', 30);

-- ===========================================
-- 4. Select Data (Read Operation)
-- ===========================================

-- Retrieve all records from the 'customers' table
SELECT * FROM customers;

-- Retrieve customer details where the age is greater than 30
SELECT * FROM customers
WHERE age > 30;

-- ===========================================
-- 5. Update Data (Update Operation)
-- ===========================================

-- Update the age of the customer with 'id = 1'
UPDATE customers 
SET age = 29 
WHERE id = 1;

-- ===========================================
-- 6. Delete Data (Delete Operation)
-- ===========================================

-- Delete the customer with 'id = 2'
DELETE FROM customers 
WHERE id = 2;

-- ===========================================
-- 7. Verify Changes (Select Again)
-- ===========================================

-- Retrieve all records from the 'customers' table again to confirm the update and delete
SELECT * FROM customers;

-- ===========================================
-- 8. Delete the 'customers' Table (optional step)
-- ===========================================

-- Drop the 'customers' table (delete the entire table and all its data)
-- DROP TABLE IF EXISTS customers;

-- ===========================================
-- 9. Exit MariaDB
-- ===========================================

-- Exit from the MariaDB client
EXIT;


-- mysql -u root -p < crud_operations.sql
