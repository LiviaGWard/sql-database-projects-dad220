# Project One: Quantigration Database Build
**DAD-220 | Introduction to Structured Database Environments | Grade: A**

## Objective
Build a complete relational database from scratch using an Entity Relationship Diagram (ERD) as the blueprint. Create three linked tables, define relationships using primary and foreign keys, and load production data from CSV files.

---

## Entity Relationship Diagram (ERD)

The Quantigration RMA database models the relationship between customers, their orders, and return merchandise authorizations (RMAs).

```
Customers (1) ──── (many) Orders (1) ──── (many) RMA
```

**Relationship:** One customer can have many orders. One order can have many RMAs. This is a one-to-many chain relationship enforced through foreign keys.

---

## Step 1: Create the Database

```sql
CREATE DATABASE QuantigrationUpdates;
SHOW DATABASES;
USE QuantigrationUpdates;
```

**Verification:** `SHOW DATABASES` confirmed `QuantigrationUpdates` appeared in the list of schemas.

---

## Step 2: Create Tables

### Customers Table
```sql
CREATE TABLE Customers (
    CustomerID    INT NOT NULL,
    FirstName     VARCHAR(25),
    LastName      VARCHAR(25),
    StreetAddress VARCHAR(50),
    City          VARCHAR(50),
    State         VARCHAR(25),
    ZipCode       INT,
    Telephone     VARCHAR(15),
    PRIMARY KEY (CustomerID)
);
```

### Orders Table
```sql
CREATE TABLE Orders (
    OrderID    INT NOT NULL,
    CustomerID INT,
    SKU        VARCHAR(20),
    Description VARCHAR(50),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

### RMA Table
```sql
CREATE TABLE RMA (
    RMAID   INT NOT NULL,
    OrderID INT,
    Step    VARCHAR(50),
    Status  VARCHAR(15),
    Reason  VARCHAR(25),
    PRIMARY KEY (RMAID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
```

---

## Step 3: Import CSV Data

Used `LOAD DATA INFILE` to import production data from three CSV files into the corresponding tables:

```sql
LOAD DATA INFILE '/home/codio/workspace/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Repeated for Orders.csv and RMA.csv
```

**Note:** Tables were altered as needed to match CSV column structure before import.

---

## Key Design Decisions

### Why INT for CustomerID, OrderID, RMAID?
Integer primary keys are efficient for indexing — numeric comparisons are faster than string comparisons, making JOIN operations across large datasets significantly faster.

### Why VARCHAR with defined lengths?
VARCHAR stores only the characters used (plus overhead) rather than padding to a fixed width — more storage-efficient than CHAR for variable-length fields like names and addresses.

### Why enforce FOREIGN KEY constraints?
Foreign keys enforce **referential integrity** — you cannot create an Order for a CustomerID that doesn't exist, and you cannot create an RMA for an OrderID that doesn't exist. This prevents orphaned records and data corruption at the database level.

---

## Skills Demonstrated
`MySQL` `CREATE DATABASE` `CREATE TABLE` `PRIMARY KEY` `FOREIGN KEY` `Referential Integrity` `ERD Interpretation` `LOAD DATA INFILE` `CSV Import` `VARCHAR` `INT` `Database Schema Design`
