# Module Four Lab: Cardinality and Data Import
**DAD-220 | Introduction to Structured Database Environments**

## Lab Part 1: Identifying Cardinality

### Query: Order Details by Order Number
```sql
SELECT * FROM Orders WHERE OrderID IN (10194, 10330, 10338);
```

### Results
| Order Number | Associated Products |
|---|---|
| 10194 | 10 products |
| 10330 | 4 products |
| 10338 | 3 products |

### Cardinality Identified: One-to-Many
One order can have **many** order detail records, but each order detail belongs to exactly **one** order. This is a classic one-to-many (1:N) relationship — enforced in the database through the foreign key on the order details table.

**Types of cardinality:**
| Type | Symbol | Example |
|---|---|---|
| One-to-One | 1:1 | Person ↔ Passport |
| One-to-Many | 1:N | Order → Order Details |
| Many-to-Many | M:N | Students ↔ Courses (requires junction table) |

---

## Lab Part 2: Employee Location Query
```sql
-- Employees in San Francisco (California)
SELECT firstName, lastName, jobTitle, offices.city
FROM employees
INNER JOIN offices ON employees.officeCode = offices.officeCode
WHERE state = 'CA';

-- Employees in New York (written independently)
SELECT firstName, lastName, jobTitle, offices.city
FROM employees
INNER JOIN offices ON employees.officeCode = offices.officeCode
WHERE offices.city = 'New York';
```

---

## Lab Part 3: Delete Records
```sql
-- Inspect the Payments table structure first
DESCRIBE Payments;

-- View records for customer 103 before deletion
SELECT * FROM Payments WHERE CustomerNumber = 103;

-- Delete records for customer 103
DELETE FROM Payments WHERE CustomerNumber = 103;

-- Verify deletion — should return 0 rows
SELECT * FROM Payments WHERE CustomerNumber = 103;
```

---

## Major Activity: CSV Data Import & Querying

### Import CSV Files
```sql
LOAD DATA INFILE '/home/codio/workspace/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';
```
*Repeated for Orders.csv and RMA.csv*

### Query: Orders from Framingham, MA
```sql
SELECT COUNT(*) AS Order_Count
FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Framingham'
  AND Customers.State = 'Massachusetts';
```
**Result: 505 records**

> **Troubleshooting note:** Initially queried `State = 'MA'` and got 0 results — the data stored the full state name, not abbreviations. Always inspect actual data values before writing WHERE conditions.

## Skills Demonstrated
`Cardinality` `One-to-Many` `LOAD DATA INFILE` `CSV Import` `DELETE` `DESCRIBE` `COUNT()` `WHERE` `INNER JOIN` `Data Troubleshooting`
