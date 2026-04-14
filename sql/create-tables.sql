-- ============================================================
-- Quantigration RMA Database — Table Definitions
-- DAD-220 | Livia Ward | SNHU 2024
-- Based on the Quantigration RMA ERD
-- ============================================================

USE QuantigrationUpdates;

-- ------------------------------------------------------------
-- Customers Table
-- Primary key: CustomerID
-- ------------------------------------------------------------
CREATE TABLE Customers (
    CustomerID    INT          NOT NULL,
    FirstName     VARCHAR(25),
    LastName      VARCHAR(25),
    StreetAddress VARCHAR(50),
    City          VARCHAR(50),
    State         VARCHAR(25),
    ZipCode       INT,
    Telephone     VARCHAR(15),
    PRIMARY KEY (CustomerID)
);

-- ------------------------------------------------------------
-- Orders Table
-- Primary key: OrderID
-- Foreign key: CustomerID references Customers
-- ------------------------------------------------------------
CREATE TABLE Orders (
    OrderID     INT          NOT NULL,
    CustomerID  INT,
    SKU         VARCHAR(20),
    Description VARCHAR(50),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ------------------------------------------------------------
-- RMA Table
-- Primary key: RMAID
-- Foreign key: OrderID references Orders
-- ------------------------------------------------------------
CREATE TABLE RMA (
    RMAID   INT          NOT NULL,
    OrderID INT,
    Step    VARCHAR(50),
    Status  VARCHAR(15),
    Reason  VARCHAR(25),
    PRIMARY KEY (RMAID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- ------------------------------------------------------------
-- Employee Table (from Module Two lab)
-- ------------------------------------------------------------
CREATE TABLE Employee (
    Employee_ID   SMALLINT,
    First_Name    VARCHAR(40),
    Last_Name     VARCHAR(60),
    Department_ID SMALLINT,
    Classification VARCHAR(10),
    Status        VARCHAR(10),
    Salary        DECIMAL(7,2)
);

-- ------------------------------------------------------------
-- Department Table (renamed from Branches in Module Three)
-- ------------------------------------------------------------
CREATE TABLE Department (
    Department_ID   SMALLINT,
    Department_Name VARCHAR(50)
);

-- Verify tables created
SHOW TABLES;
