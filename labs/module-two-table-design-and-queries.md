# Module Two Lab & Activity: Table Design and Queries
**DAD-220 | Introduction to Structured Database Environments**

## Lab: Create and Describe Tables

### Employee Table
```sql
CREATE TABLE Employee (
    Employee_ID    SMALLINT,
    First_Name     VARCHAR(40),
    Last_Name      VARCHAR(60),
    Department_ID  SMALLINT,
    Classification VARCHAR(10),
    Status         VARCHAR(10),
    Salary         DECIMAL(7,2)
);
```

### Branches (Department) Table
```sql
CREATE TABLE Branches (
    Department_ID   SMALLINT,
    Department_Name VARCHAR(50)
);
```

### Describe Tables
```sql
DESCRIBE Employee;
DESCRIBE Branches;
```

`DESCRIBE` returns column names, data types, nullability, key status, and defaults — essential for understanding and auditing table structure.

---

## Activity: Analytical Questions

**Q: How many records in the Employee table?** → **5**

**Q: How many attributes in Branches table?** → **2** (Department_ID, Department_Name)

**Q: Which attribute could be a primary key for Employee?** → **Employee_ID** — unique identifier per employee

**Q: Maximum decimal places in Salary field?** → **2** (DECIMAL(7,2) = up to 2 decimal places)

**Q: Maximum decimal places in Department_ID?** → **0** (SMALLINT is an integer — no decimals)

**Q: What three rules do tables obey?**
1. Each column must have a unique name
2. No duplicate rows allowed
3. Must have a unique primary key column (or composite key)

### Query Results

```sql
-- Total salary for Department 3
SELECT SUM(Salary) FROM Employee WHERE Department_ID = 3;
-- Result: 170,000

-- Highest salary
SELECT MAX(Salary) FROM Employee;
-- Result: 90,000

-- Non-exempt employees (NULL values excluded)
SELECT * FROM Employee WHERE Classification != 'Exempt';
-- Result: Employee IDs 101 and 104
```

## Skills Demonstrated
`CREATE TABLE` `DESCRIBE` `DECIMAL` `SMALLINT` `VARCHAR` `SUM()` `MAX()` `WHERE` `NULL handling`
