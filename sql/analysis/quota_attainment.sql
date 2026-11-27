/* ============================================================
   File:      quota_attainment.sql
   Finding:   F2 - Is the sales team hitting its targets?
   Question:  Q3 (requirements v0.1) · KPI: % of Target Achieved
   Purpose:   Compare sales-team revenue with sales quotas.
   Rules:     Revenue = SubTotal.
              Quotas belong to salespeople only, so compare
              with sales-team orders only (OnlineOrderFlag = 0).
              Only compare the period BOTH tables cover.
   Assumption: Each QuotaDate marks the START of a 3-month
              quota period (30 May / 30 Aug / 30 Nov / 28 Feb).
   Result:    30 May 2022 - 29 May 2025:
              3,806 orders, $80.5M revenue vs $95.7M quota
              = 84% attainment, $15.2M short.
   Author:    Mohamed J
   Date:      27 Nov 2026
   ============================================================ */


/* ---- Step 1: Total quota by year ------------------------- */
SELECT YEAR(QuotaDate)  AS QuotaYear,
       SUM(SalesQuota)  AS TotalQuota
FROM Sales.SalesPersonQuotaHistory
GROUP BY YEAR(QuotaDate)
ORDER BY QuotaYear;
-- 2022 $14,263,000 · 2023 $30,172,000 · 2024 $40,920,000 · 2025 $10,359,000
-- Total = $95,714,000


/* ---- Step 2: Sales-team revenue by year ------------------ */
-- Approximate only: quota periods cross calendar years.
SELECT YEAR(OrderDate)  AS OrderYear,
       COUNT(*)         AS Orders,
       SUM(SubTotal)    AS SalesTeamRevenue
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 0
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
-- Approx. attainment: 2022 75% · 2023 84% · 2024 80%
-- 2025 shows 113% but is NOT comparable
-- (one quarter of quota vs six months of orders).


/* ---- Step 3: Final figure - overlapping window only ------ */
SELECT COUNT(*)       AS Orders,
       SUM(SubTotal)  AS SalesTeamRevenue
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 0
  AND OrderDate >= '2022-05-30'
  AND OrderDate <  '2025-05-30';
-- 3,806 orders · $80,487,704
-- $80.5M / $95.7M = 84% · shortfall $15.2M
