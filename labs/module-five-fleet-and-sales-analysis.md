# Module Five Labs: Fleet Maintenance & Sales Analysis
**DAD-220 | Introduction to Structured Database Environments**

## Lab: Fleet Maintenance Analysis

### Objective
Analyze the `FleetMaintenanceRecords` dataset to identify part replacement patterns and form a hypothesis the fleet management team can act on.

### Setup
```sql
-- Create Parts_Maintenance table in the Ward database
CREATE TABLE Parts_Maintenance (
    Record_ID    INT,
    Part_Type    VARCHAR(50),
    Region       VARCHAR(50),
    Replace_Date DATE
);

-- Load fleet data
LOAD DATA INFILE '/home/codio/workspace/FleetMaintenanceRecords.csv'
INTO TABLE Parts_Maintenance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
```

### Query: Most Frequently Replaced Parts
```sql
SELECT Part_Type, COUNT(*) AS Replacement_Count
FROM Parts_Maintenance
GROUP BY Part_Type
ORDER BY Replacement_Count DESC;
```

### Results
| Part Type | Replacements |
|---|---|
| Fuel Tank | 95 |
| Tire Repair | 74 |
| Tire Replacement | 66 |
| Windshield Replacement | 63 |
| Battery Replacement | 56 |

### Hypothesis
Fuel tanks, tires, and windshields are the highest-maintenance components in the fleet. The fleet management team should:
1. Pre-stock higher quantities of fuel tank components and tire repair kits
2. Establish a proactive tire inspection schedule to reduce emergency replacements
3. Investigate whether windshield replacements are concentrated in specific routes (highway debris vs. urban driving)

---

## Major Activity: Quantigration Sales & Returns Analysis

### Sales by State — Top Customer Base
```sql
SELECT State, COUNT(*) AS Customer_Count
FROM Customers
GROUP BY State
ORDER BY Customer_Count DESC
LIMIT 5;
```
**Top 3:** Massachusetts (982), Arkansas (854), West Virginia (843)

### Top Products Sold Nationally
```sql
SELECT SKU, COUNT(*) AS Total_Sales
FROM Orders
GROUP BY SKU
ORDER BY Total_Sales DESC
LIMIT 3;
```
**Top 3:** BAS-48-1C (8,385), ENT-48-40F (6,186), ENT-48-10F (4,329)

### Top Products — Southeast Region (VA, NC, SC, GA)
```sql
SELECT Orders.SKU, COUNT(*) AS Southeast_Sales
FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.State IN ('Virginia', 'North Carolina', 'South Carolina', 'Georgia')
GROUP BY Orders.SKU
ORDER BY Southeast_Sales DESC
LIMIT 3;
```
**Top 3:** BAS-48-1C (504), ENT-48-40F (337), BAS-08-1C (257)

### Top Products Returned Nationally
```sql
SELECT Orders.SKU, COUNT(*) AS Return_Count
FROM RMA
INNER JOIN Orders ON Orders.OrderID = RMA.RMAID
GROUP BY Orders.SKU
ORDER BY Return_Count DESC
LIMIT 3;
```
**Top 3:** BAS-48-1C (8,282 returns), ENT-48-40F (6,118), ENT-48-10F (4,287)

### Key Insight
The top returned products mirror the top sold products almost exactly — suggesting return rate is consistent across the product line rather than driven by defective items. The analysis points toward volume, not quality, as the primary return driver.

## Skills Demonstrated
`LOAD DATA INFILE` `GROUP BY` `ORDER BY` `COUNT()` `LIMIT` `Regional Filtering` `IN clause` `Multi-Table Analysis` `Business Hypothesis Formation` `Data-Driven Recommendations`
