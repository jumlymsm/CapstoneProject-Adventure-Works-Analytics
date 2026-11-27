/* ============================================================
   File:      channel_split.sql
   Finding:   F1 - Where does revenue come from?
   Question:  Q1 (requirements v0.1)
   Purpose:   2024 orders and revenue by channel
              (sales team vs online), comparing the two
              revenue definitions side by side.
   Rules:     Revenue = SubTotal (before tax and freight).
              TotalDue = SubTotal + tax + freight (NOT revenue).
              OnlineOrderFlag: 0 = sales team, 1 = online.
   Result:    Sales team 1,598 orders, $32.9M SubTotal ($37.1M TotalDue)
              Online    12,646 orders, $10.8M SubTotal ($11.9M TotalDue)
              Gap SubTotal vs TotalDue for 2024 = $5.3M (12%)
   Author:    Mohamed J
   Date:      27 Nov 2026
   ============================================================ */

SELECT OnlineOrderFlag,
       COUNT(*)       AS Orders,
       SUM(SubTotal)  AS Revenue_SubTotal,
       SUM(TotalDue)  AS Revenue_TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2024-01-01'
  AND OrderDate <  '2025-01-01'
GROUP BY OnlineOrderFlag
ORDER BY OnlineOrderFlag;
