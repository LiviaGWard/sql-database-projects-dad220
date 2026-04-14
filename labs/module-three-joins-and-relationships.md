# Module Three Lab: JOINs and Table Relationships
**DAD-220 | Introduction to Structured Database Environments**

## Objective
Rename a table, insert data, and perform INNER JOINs to answer questions across multiple related tables.

---

## Step 1: Rename Table
```sql
ALTER TABLE Branches RENAME Department;
SHOW TABLES; -- Verified: 'Department' now appears instead of 'Branches'
```

---

## Step 2: Insert Department Data
```sql
INSERT INTO Department VALUES
    (1, 'Accounting'),
    (2, 'Human Resources'),
    (3, 'Information Systems'),
    (4, 'Marketing');

SELECT * FROM Department; -- Verified all 4 rows inserted correctly
```

---

## Step 3: INNER JOINs — Employees by Department

```sql
-- Employees in Accounting (Dept 1)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department
    ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 1;

-- All employees with department names
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department
    ON Employee.Department_ID = Department.Department_ID
ORDER BY Department.Department_Name;
```

---

## How INNER JOIN Works
An `INNER JOIN` returns only rows where the join condition is satisfied in **both** tables. Rows with no match in the other table are excluded.

```
Employee Table          Department Table
--------------          ----------------
Emp_ID | Dept_ID        Dept_ID | Dept_Name
  101  |    1     JOIN     1    | Accounting
  102  |    2     ─────>   2    | Human Resources
  103  |    3              3    | Information Systems
```

The join happens where `Employee.Department_ID = Department.Department_ID` — linking each employee to their department name without storing the name redundantly in the Employee table. This is the power of relational database design.

---

## Skills Demonstrated
`ALTER TABLE` `RENAME` `INSERT INTO` `INNER JOIN` `ON` clause `WHERE` `ORDER BY` `Relational Design` `Data Normalization`
