-- ============================================================
-- Sample SQL Queries — DAD-220 Labs
-- Livia Ward | SNHU 2024
-- ============================================================

USE QuantigrationUpdates;

-- ------------------------------------------------------------
-- MODULE TWO: Basic Queries on Employee Table
-- ------------------------------------------------------------

-- Total salary for Department 3 (Information Systems)
-- Result: 170,000
SELECT SUM(Salary)
FROM Employee
WHERE Department_ID = 3;

-- Highest salary across all employees
-- Result: 90,000
SELECT MAX(Salary)
FROM Employee;

-- Non-exempt employees
-- Result: Employee IDs 101 and 104
SELECT *
FROM Employee
WHERE Classification != 'Exempt';

-- ------------------------------------------------------------
-- MODULE THREE: Inserts and INNER JOINs
-- ------------------------------------------------------------

-- Rename Branches table to Department
ALTER TABLE Branches RENAME Department;

-- Insert department data
INSERT INTO Department VALUES
    (1, 'Accounting'),
    (2, 'Human Resources'),
    (3, 'Information Systems'),
    (4, 'Marketing');

-- INNER JOIN: Employees in Accounting (Department 1)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 1;

-- INNER JOIN: All employees with their department names
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
ORDER BY Department.Department_Name;

-- ------------------------------------------------------------
-- MODULE FOUR: Cardinality and Data Operations
-- ------------------------------------------------------------

-- Retrieve order details for specific order numbers
SELECT *
FROM Orders
WHERE OrderID IN (10330, 10338, 10194);
-- Result shows one-to-many relationship:
-- Order 10194 → 10 products
-- Order 10330 → 4 products
-- Order 10338 → 3 products

-- Orders for customers in Framingham, MA
-- Result: 505 records
SELECT COUNT(*) AS Order_Count
FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Framingham'
  AND Customers.State = 'Massachusetts';

-- Delete payments for customer 103
DELETE FROM Payments
WHERE CustomerNumber = 103;

-- Verify deletion
SELECT *
FROM Payments
WHERE CustomerNumber = 103;
-- Should return 0 rows

-- ------------------------------------------------------------
-- MODULE FOUR: CSV Data Import
-- ------------------------------------------------------------

-- Load Customers data from CSV
LOAD DATA INFILE '/home/codio/workspace/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Load Orders data from CSV
LOAD DATA INFILE '/home/codio/workspace/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Load RMA data from CSV
LOAD DATA INFILE '/home/codio/workspace/RMA.csv'
INTO TABLE RMA
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- ------------------------------------------------------------
-- MODULE FIVE: Fleet Maintenance Analysis
-- ------------------------------------------------------------

-- Most frequently replaced parts
SELECT Part_Type, COUNT(*) AS Replacement_Count
FROM Parts_Maintenance
GROUP BY Part_Type
ORDER BY Replacement_Count DESC;
-- Top results:
-- Fuel Tank          → 95
-- Tire Repair        → 74
-- Tire Replacement   → 66
-- Windshield Replace → 63
-- Battery Replace    → 56

-- Part replacements by region
SELECT Region, Part_Type, COUNT(*) AS Count
FROM Parts_Maintenance
GROUP BY Region, Part_Type
ORDER BY Region, Count DESC;
