# Project Two: RMA Analysis Report — Quantigration
**DAD-220 | Introduction to Structured Database Environments | Grade: A**

## Overview
Wrote multi-table SQL queries against the Quantigration database to analyze return merchandise authorization (RMA) data and produced a professional business report for non-technical stakeholders.

---

## Analysis A: Returns by State

### SQL Query
```sql
SELECT Collaborators.State AS State, COUNT(*) AS Product_RMA
FROM RMA
INNER JOIN Orders ON Orders.OrderID = RMA.RMAID
INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID
GROUP BY State
ORDER BY Product_RMA;
```

### Findings

| State | Return Count |
|---|---|
| Nebraska | 263 (fewest) |
| ... | ... |
| Massachusetts | 362 (most) |

**Business insight:** Massachusetts has nearly 38% more returns than Nebraska. This could indicate higher sales volume in MA (more transactions = more returns), a fulfillment or quality issue specific to the northeast region, or customer demographic differences. Recommendation: Cross-reference return counts against total orders by state to calculate a **return rate** before drawing conclusions — raw counts without context can be misleading.

---

## Analysis B: Returns by Product Type

### SQL Query
```sql
SELECT SKU, Description, COUNT(*) AS Return_Count
FROM RMA
INNER JOIN Orders ON Orders.OrderID = RMA.RMAID
GROUP BY SKU, Description
ORDER BY Return_Count DESC;
```

### Findings — Top Returned Products (National)

| Product | Returns |
|---|---|
| BAS-48-1C | 8,282 |
| ENT-48-40F | 6,118 |
| ENT-48-10F | 4,287 |

### Findings — Top Sold Products (National, for comparison)

| Product | Sales |
|---|---|
| BAS-48-1C | 8,385 |
| ENT-48-40F | 6,186 |
| ENT-48-10F | 4,329 |

**Business insight:** The top returned products are nearly identical to the top sold products — and in nearly the same proportions. This suggests the return rate is **consistent across the product line** rather than being driven by a defective product. The company should investigate whether:
- These high-volume products have a systemic quality issue
- Returns are concentrated in specific order batches or date ranges
- Certain customer segments are responsible for a disproportionate share of returns

---

## Analysis C: Regional Sales & Returns

### Southeast Region (VA, NC, SC, GA)

**Top products sold:**
1. BAS-48-1C — 504 sales
2. ENT-48-40F — 337 sales
3. BAS-08-1C — 257 sales

**Top customer states nationally:**
1. Massachusetts — 982 customers
2. Arkansas — 854 customers
3. West Virginia — 843 customers

---

## Executive Summary (Non-Technical)

This report analyzes Quantigration's return merchandise data to identify patterns that can help streamline operations.

**Key findings:**
- Massachusetts generates the most returns of any state; Nebraska generates the fewest. However, MA also likely has higher overall order volume — further analysis is recommended before drawing operational conclusions.
- The three products with the highest return counts (BAS-48-1C, ENT-48-40F, ENT-48-10F) are also the three best-selling products nationally. Returns appear proportional to sales volume rather than indicating product-specific defects.
- The southeastern region mirrors national sales patterns, with BAS-48-1C as the clear top seller.

**Recommendations:**
1. Calculate **return rate** (returns ÷ total orders) by state to identify true outliers
2. Investigate whether high-return products share manufacturing batches, suppliers, or shipping carriers
3. Monitor new order cohorts to determine whether return trends are improving or worsening over time

---

## Skills Demonstrated
`INNER JOIN` `Multi-Table Queries` `GROUP BY` `ORDER BY` `COUNT()` `Aggregate Analysis` `Business Report Writing` `Data Interpretation` `Return Rate Analysis` `Regional Sales Analysis` `Non-Technical Communication`
