# 01 Requirements: AdventureWorks Commercial Performance & Marketing Review

**Client:** Sarah Chen, Sales & Marketing Director, AdventureWorks
**Consultant:** [Your name], Junior Data & Analytics Consultant
**Version:** 0.1 (draft, to be confirmed with client) · 26 Nov 2026
**Source:** kickoff meeting, 26 Nov 2026

---

## 1. Background

AdventureWorks sells bikes and accessories online and through resellers. Sales data lives in the `AdventureWorks2025` SQL Server database. Marketing spend is held separately in spreadsheets owned by Priya (Marketing team).

Every month, the Director receives three different revenue figures (from Finance, Sales and Marketing), and board meetings are spent debating which one is right. Marketing spend is significant, but its return has never been measured. The CEO is asking for proof.

## 2. Objectives (in the client's priority order)

1. **One trusted revenue figure**, by month and channel, that everyone agrees on
2. **Where to invest:** which regions and products make the most money, to inform next year's budget
3. **Does marketing pay for itself?** Show whether current marketing activity drives sales

**Out of scope:** setting the marketing budget, general sales-improvement recommendations, real-time alerts.

## 3. Business questions

### Priority 1: Trusted revenue
| # | Question |
|---|---|
| Q1 | What was our total revenue each month, split by channel (online vs reseller)? |
| Q2 | Which revenue figure is correct, and how does it reconcile with Finance's number? |
| Q3 | How did each territory perform against its sales target, and which territories missed it? |

### Priority 2: Where to invest
| # | Question |
|---|---|
| Q4 | Which regions generate the most and the least revenue, and how is that trending? |
| Q5 | Which products and categories perform best and worst by revenue? |
| Q6 | Which products and regions are most **profitable** (not just highest revenue)? |
| Q7 | What patterns might explain underperformance (e.g. falling trends, heavy discounting, low margins)? |

### Priority 3: Marketing effectiveness
| # | Question |
|---|---|
| Q8 | How much did we spend on marketing, by month and channel (paid search, social, email, reseller promotions)? |
| Q9 | How much revenue came back for every dollar spent, by channel? |
| Q10 | What did it cost to win each new customer, by channel? |
| Q11 | Do discount promotions lift sales, or just give margin away? |

> **Note on "why" questions:** sales data shows *what* happened, rarely *why*. We will report patterns that may explain results, not confirmed causes.

## 4. Draft KPIs

| KPI | Definition | Answers |
|---|---|---|
| **Monthly Revenue** | Sum of `SubTotal` (before tax and freight) for the month | Q1, Q2, Q4, Q5 |
| **% of Target Achieved** | Actual revenue ÷ sales quota × 100. 100% = target hit | Q3 |
| **Gross Margin %** | (Revenue − product cost) ÷ revenue × 100. What we keep from each sale | Q6, Q7 |
| **ROAS** (Return on Ad Spend) | Revenue ÷ marketing spend. ROAS of 5 = $5 back per $1 spent | Q9 |
| **CAC** (Customer Acquisition Cost) | Marketing spend ÷ number of new customers won | Q10 |

## 5. Users and reporting

| Item | Requirement |
|---|---|
| Primary user | Sarah Chen, Sales & Marketing Director |
| Other users | *Assumed:* territory managers, CEO (to confirm) |
| Frequency | Monthly, before the board meeting |
| Alerts | Not required |
| Format | Power BI dashboard (3 pages) + 1-page executive memo |

## 6. Data sources

| Source | Owner | Content | Known issues |
|---|---|---|---|
| `AdventureWorks2025` (SQL Server) | IT / Sales | Orders, customers, products, territories, sales quotas, discount promotions | To be assessed in data quality report |
| Marketing spend spreadsheets | Priya (Marketing) | Spend by month and channel | Last 2 years monthly; older years **quarterly and by channel only** (agency change). Described as "messy". No split by product. |

## 7. Assumptions (to confirm with client)

| # | Assumption | Risk if wrong |
|---|---|---|
| A1 | Revenue = `SubTotal` (before tax and freight). Finance may be using `TotalDue`, which could explain the mismatched numbers. | Our figure won't match Finance's, and the core problem stays unsolved |
| A2 | The sales quotas in the database are the targets Sarah means | % of Target KPI is meaningless |
| A3 | Territory managers will use the dashboard and should see only their own region | Row-level security designed wrongly |
| A4 | Priya's older quarterly spreadsheets are good enough for trend comparison | Older ROAS/CAC figures may be unreliable |
| A5 | Database product categories match how Sarah thinks about her products | Product analysis doesn't answer her real question |
| A6 | Marketing spend cannot be split by product, so ROAS and CAC are by channel only | Sarah may expect product-level marketing returns |

## 8. Open questions for the client

1. Who else will use the dashboard (territory managers, CEO, board)?
2. Should each territory manager see only their own region?
3. How does Finance calculate revenue (tax, freight, discounts, returns)?
4. What would make you say in February that this project worked?

## 9. Timeline

| Date | Milestone |
|---|---|
| 26 Nov 2026 | Kickoff meeting ✅ |
| ~10 Dec 2026 | **First look:** revenue by month and channel, to check against Finance |
| Early Feb 2027 | Full solution delivered (time for Sarah to rehearse) |
| Mid-Feb 2027 | Board meeting |
