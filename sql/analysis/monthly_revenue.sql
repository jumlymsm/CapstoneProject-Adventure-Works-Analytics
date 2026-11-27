/* ============================================================
   File:      monthly_revenue.sql
   Finding:   (feeds F3 - monthly revenue trend, next session)
   Question:  Q1 (requirements v0.1) · KPI: Monthly Revenue
   Purpose:   Total revenue for each month, oldest first.
   Rules:     Revenue = SubTotal (before tax and freight).
              GROUP BY must match the grain: one row = one month,
              so group by year AND month (not by OrderDate).
   Watch out: May 2022 has only 2 days of data (30th-31st).
              June 2025 ends on the 29th.
              Flag both as partial months when reporting.
   Author:    Mohamed J
   Date:      27 Nov 2026
   ============================================================ */

SELECT YEAR(OrderDate)   AS OrderYear,
       MONTH(OrderDate)  AS OrderMonth,
       COUNT(*)          AS Orders,
       SUM(SubTotal)     AS Revenue
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;
