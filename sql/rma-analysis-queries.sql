-- ============================================================
-- Quantigration RMA Analysis Queries — Project Two
-- DAD-220 | Livia Ward | SNHU 2024
-- ============================================================

USE QuantigrationUpdates;

-- ------------------------------------------------------------
-- ANALYSIS A: Returns by State
-- ------------------------------------------------------------

SELECT
    Collaborators.State    AS State,
    COUNT(*)               AS Product_RMA
FROM RMA
INNER JOIN Orders      ON Orders.OrderID           = RMA.RMAID
INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID
GROUP BY State
ORDER BY Product_RMA;

-- Results:
-- Nebraska         → 263 returns (fewest)
-- Massachusetts    → 362 returns (most)

-- ------------------------------------------------------------
-- ANALYSIS B: Returns by Product Type (National)
-- ------------------------------------------------------------

SELECT
    SKU,
    Description,
    COUNT(*) AS Return_Count
FROM RMA
INNER JOIN Orders ON Orders.OrderID = RMA.RMAID
GROUP BY SKU, Description
ORDER BY Return_Count DESC;

-- Top returned products:
-- BAS-48-1C   → 8,282 returns
-- ENT-48-40F  → 6,118 returns
-- ENT-48-10F  → 4,287 returns

-- ------------------------------------------------------------
-- ANALYSIS C: Sales by State (Customer Count)
-- ------------------------------------------------------------

SELECT
    State,
    COUNT(*) AS Customer_Count
FROM Customers
GROUP BY State
ORDER BY Customer_Count DESC;

-- Top states by customer count:
-- Massachusetts → 982
-- Arkansas      → 854
-- West Virginia → 843

-- ------------------------------------------------------------
-- ANALYSIS D: Top Products Sold Nationally
-- ------------------------------------------------------------

SELECT
    SKU,
    COUNT(*) AS Total_Sales
FROM Orders
GROUP BY SKU
ORDER BY Total_Sales DESC
LIMIT 3;

-- Top products nationally:
-- BAS-48-1C  → 8,385 sales
-- ENT-48-40F → 6,186 sales
-- ENT-48-10F → 4,329 sales

-- ------------------------------------------------------------
-- ANALYSIS E: Top Products Sold — Southeast Region
-- Southeastern states: Virginia, North Carolina,
--                      South Carolina, Georgia
-- ------------------------------------------------------------

SELECT
    Orders.SKU,
    COUNT(*) AS Southeast_Sales
FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.State IN ('Virginia', 'North Carolina', 'South Carolina', 'Georgia')
GROUP BY Orders.SKU
ORDER BY Southeast_Sales DESC
LIMIT 3;

-- Southeast top products:
-- BAS-48-1C  → 504 sales
-- ENT-48-40F → 337 sales
-- BAS-08-1C  → 257 sales

-- ------------------------------------------------------------
-- ANALYSIS F: Top Products Returned — Northwest Region
-- ------------------------------------------------------------

SELECT
    Orders.SKU,
    COUNT(*) AS Northwest_Returns
FROM RMA
INNER JOIN Orders    ON Orders.OrderID          = RMA.RMAID
INNER JOIN Customers ON Customers.CustomerID    = Orders.CustomerID
WHERE Customers.State IN ('Washington', 'Oregon', 'Idaho', 'Montana')
GROUP BY Orders.SKU
ORDER BY Northwest_Returns DESC
LIMIT 3;

-- ------------------------------------------------------------
-- BONUS: Return Rate by Product (Returns / Sales)
-- ------------------------------------------------------------

SELECT
    s.SKU,
    s.Total_Sales,
    r.Total_Returns,
    ROUND((r.Total_Returns / s.Total_Sales) * 100, 2) AS Return_Rate_Pct
FROM
    (SELECT SKU, COUNT(*) AS Total_Sales FROM Orders GROUP BY SKU) s
JOIN
    (SELECT Orders.SKU, COUNT(*) AS Total_Returns
     FROM RMA
     INNER JOIN Orders ON Orders.OrderID = RMA.RMAID
     GROUP BY Orders.SKU) r
ON s.SKU = r.SKU
ORDER BY Return_Rate_Pct DESC;
