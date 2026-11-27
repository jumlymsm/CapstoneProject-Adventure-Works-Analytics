/* ============================================================
   File:      data_profiling.sql
   Finding:   (supports data quality report, S8-S9)
   Purpose:   Check what each table contains and which
              dates it covers, BEFORE comparing tables.
   Author:    Mohamed J
   Date:      27 Nov 2026
   ============================================================ */


/* ---- What does one row of the quota table look like? ----- */
SELECT TOP 10 *
FROM Sales.SalesPersonQuotaHistory;
-- One row = one salesperson's quota for one 3-month period.


/* ---- Date coverage: quotas ------------------------------- */
SELECT MIN(QuotaDate)  AS FirstQuotaDate,
       MAX(QuotaDate)  AS LastQuotaDate
FROM Sales.SalesPersonQuotaHistory;
-- 30 May 2022 -> 28 Feb 2025


/* ---- Date coverage: orders ------------------------------- */
SELECT MIN(OrderDate)  AS FirstOrderDate,
       MAX(OrderDate)  AS LastOrderDate
FROM Sales.SalesOrderHeader;
-- 30 May 2022 -> 29 Jun 2025
-- Orders run ~4 months past the last quota period.
