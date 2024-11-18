-- Switch to the database
USE test_db;

-- Drop the table if it exists
DROP TABLE IF EXISTS employees;

-- Create the employees table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DOUBLE
);

-- Drop procedures if they already exist
DROP PROCEDURE IF EXISTS CreateEmployee;
DROP PROCEDURE IF EXISTS ReadEmployees;
DROP PROCEDURE IF EXISTS UpdateEmployeeSalary;
DROP PROCEDURE IF EXISTS DeleteEmployee;

-- Stored Procedure for Create Operation
DELIMITER //
CREATE PROCEDURE CreateEmployee(
    IN emp_name VARCHAR(100),
    IN emp_email VARCHAR(100),
    IN emp_salary DOUBLE
)
BEGIN
    INSERT INTO employees (name, email, salary)
    VALUES (emp_name, emp_email, emp_salary);
END //
DELIMITER ;

-- Stored Procedure for Read Operation
DELIMITER //
CREATE PROCEDURE ReadEmployees()
BEGIN
    SELECT * FROM employees;
END //
DELIMITER ;

-- Stored Procedure for Update Operation
DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary(
    IN emp_id INT,
    IN new_salary DOUBLE
)
BEGIN
    UPDATE employees
    SET salary = new_salary
    WHERE id = emp_id;
END //
DELIMITER ;

-- Stored Procedure for Delete Operation
DELIMITER //
CREATE PROCEDURE DeleteEmployee(
    IN emp_id INT
)
BEGIN
    DELETE FROM employees
    WHERE id = emp_id;
END //
DELIMITER ;

-- Test the procedures

-- Insert sample data
CALL CreateEmployee('John Doe', 'john@example.com', 50000);
CALL CreateEmployee('Jane Smith', 'jane@example.com', 60000);

-- Read all employees
CALL ReadEmployees();

-- Update salary
CALL UpdateEmployeeSalary(1, 55000);

-- Delete an employee
CALL DeleteEmployee(2);

-- Read all employees again
CALL ReadEmployees();
