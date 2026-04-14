# Module One Lab: Create Database and Tables
**DAD-220 | Introduction to Structured Database Environments**

## Objective
Set up a MySQL database from scratch and create the first table — establishing the foundation for all subsequent lab work.

## Steps Completed

```sql
-- Create a database named after myself
CREATE DATABASE Ward;
SHOW DATABASES;  -- Verified Ward appears in list
USE Ward;        -- Connected to the new database

-- Create first table with a single field
CREATE TABLE tb2 (user_id VARCHAR(50));
SHOW TABLES;     -- Verified tb2 appears
```

## Key Concepts
- `CREATE DATABASE` — initializes a new schema
- `SHOW DATABASES` — lists all schemas on the MySQL server
- `USE` — sets the active database for the session
- `CREATE TABLE` — defines a table with column names and data types
- `VARCHAR(50)` — variable-length string up to 50 characters

## Skills Demonstrated
`MySQL` `CREATE DATABASE` `CREATE TABLE` `SHOW DATABASES` `SHOW TABLES` `USE` `VARCHAR`
