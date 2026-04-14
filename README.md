# 🗄️ DAD-220: Introduction to Structured Database Environments
**Southern New Hampshire University | Grade: A | Term: 2024 C-5 (Sep – Oct)**

> Hands-on SQL and relational database course — designing schemas from ERDs, writing DDL/DML, performing multi-table JOINs, importing CSV data, and producing business analysis reports from real datasets. All work completed in MySQL via Codio.

---

## 📋 Course Overview
This course built both the theory and practice of relational databases. Starting from scratch in MySQL, I designed and built real databases from Entity Relationship Diagrams (ERDs), loaded production-scale CSV data, and wrote queries to answer real business questions — producing a professional RMA (Return Merchandise Authorization) report for a fictional company called Quantigration.

**Environment:** MySQL running in Codio virtual lab
**Key skills:** DDL (CREATE, ALTER, RENAME), DML (INSERT, SELECT, UPDATE, DELETE), JOIN operations, aggregate functions, data import, business reporting

---

## 📁 Repository Structure

```
sql-database-projects-dad220/
│
├── projects/
│   ├── project-one-quantigration-database-build.md
│   └── project-two-rma-analysis-report.md
│
├── labs/
│   ├── module-one-create-database-and-tables.md
│   ├── module-two-table-design-and-queries.md
│   ├── module-three-joins-and-relationships.md
│   ├── module-four-cardinality-and-data-import.md
│   └── module-five-fleet-and-sales-analysis.md
│
├── sql/
│   ├── create-quantigration-database.sql
│   ├── create-tables.sql
│   ├── sample-queries.sql
│   └── rma-analysis-queries.sql
│
└── README.md
```

---

## 📝 Projects

### 🔵 Project One — Quantigration Database Build
Built a complete relational database from an ERD blueprint in MySQL. Created three linked tables (Customers, Orders, RMA) with appropriate primary and foreign keys, then loaded production data from CSV files.

**Tables created:**
- `Customers` — CustomerID (PK), FirstName, LastName, StreetAddress, City, State, ZipCode, Telephone
- `Orders` — OrderID (PK), CustomerID (FK), SKU, Description
- `RMA` — RMAID (PK), OrderID (FK), Step, Status, Reason

**Skills demonstrated:** Database schema design, ERD interpretation, CREATE TABLE, PRIMARY KEY, FOREIGN KEY, LOAD DATA INFILE, CSV import

---

### 🔵 Project Two — RMA Analysis Report
Wrote complex multi-table SQL queries against the Quantigration database and produced a professional business report for non-technical stakeholders analyzing return patterns by state and product type.

**Key findings:**
- Nebraska: fewest returns (263) | Massachusetts: most returns (362)
- Top returned products: BAS-48-1C, ENT-48-40F, ENT-48-10F
- Southeast region top returns matched national top-sellers — indicating high-volume products drive return volume proportionally

**Skills demonstrated:** INNER JOIN, GROUP BY, ORDER BY, COUNT(), aggregate analysis, business report writing for non-technical audiences

---

## 🗂️ Labs

### Module One — Create Database and Tables
- Created a new MySQL database named `Ward`
- Created table `tb2` with a `user_id` field
- Used `SHOW DATABASES` and `SHOW TABLES` to verify creation
- Practiced `USE` statement to connect to a database

### Module Two — Table Design and Queries
- Created `Employee` and `Branches` tables with appropriate data types
- Used `DESCRIBE` to inspect table structure
- Answered analytical questions about table properties and query results:
  - `SELECT SUM(Salary) FROM Employee WHERE Department_ID=3` → **170,000**
  - `SELECT MAX(Salary) FROM Employee` → **90,000**
  - Non-exempt employees query → returned IDs **101 and 104**

### Module Three — JOINs and Table Relationships
- Renamed `Branches` table to `Department` using `ALTER TABLE ... RENAME`
- Inserted department records (Accounting, Human Resources, Information Systems, Marketing)
- Performed INNER JOINs between `Employee` and `Department` tables
- Displayed employee counts per department

### Module Four — Cardinality and Data Import
- Identified cardinality from query results: Order 10194 (10 products), 10330 (4 products), 10338 (3 products) → **one-to-many relationship**
- Imported CSV data into Quantigration tables using `LOAD DATA INFILE`
- Queried orders for customers in Framingham, MA → **505 records**
- Deleted payment records for customer 103 and verified removal

### Module Five — Fleet Maintenance & Sales Analysis
- Analyzed `FleetMaintenanceRecords` dataset for part replacement patterns:
  - Most replaced: **Fuel Tank (95)**, Tire Repair (74), Tire Replacement (66)
- Analyzed Quantigration sales by state and region:
  - Largest customer base: **Massachusetts (982)**, Arkansas (854), West Virginia (843)
  - Top US products: **BAS-48-1C (8,385 sales)**, ENT-48-40F (6,186), ENT-48-10F (4,329)
  - Southeast top products: **BAS-48-1C (504)**, ENT-48-40F (337), BAS-08-1C (257)

---

## 💡 Key Concepts Mastered
- Relational database design from ERDs
- MySQL DDL: `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE`, `DROP`
- MySQL DML: `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- Data types: `INT`, `VARCHAR`, `DECIMAL`, `SMALLINT`
- Primary keys and foreign keys — enforcing referential integrity
- `INNER JOIN`, `LEFT JOIN` — multi-table queries
- Aggregate functions: `COUNT()`, `SUM()`, `MAX()`, `MIN()`, `AVG()`
- `GROUP BY`, `ORDER BY`, `WHERE`, `HAVING`
- CSV data import: `LOAD DATA INFILE`
- Cardinality: one-to-one, one-to-many, many-to-many relationships
- Business analysis and non-technical reporting from query results

---

## 🛠️ Tools Used
- **MySQL** — relational database management
- **Codio** — cloud-based IDE and virtual lab environment
- **SQL** — DDL and DML

## 📚 Course
- **DAD-220** — Introduction to Structured Database Environments | Grade: A | SNHU 2024
