# E-commerce Analytics in SQL (MySQL)

Foundational SQL-based e-commerce analytics project focused on transforming raw transactional data into core business KPIs and insights.

## Dataset snapshot (KPI scoreboard)
- Customers: 700  
- Orders: 5,000  
- Order Items: 11,027  
- Products: 19  
- Returns: 391  

## Key metrics
- Gross Revenue: 327,299.75  
- Total Refunds: 6,538.73  
- Net Revenue: 320,741.02  
- Return Rate (per item): 3.55%  
- Refund % of Revenue: 2.01%  

## What this project covers
- Joining transactional tables (orders, order_items, returns)
- Revenue modeling (gross vs net)
- Return rate and refund analysis
- Reusable SQL views for reporting

## How to run
1. Create and select database:
   - `sql/01_schema.sql`
2. Load CSVs locally (data files not included):
   - `sql/02_load_data.sql`
3. Create analytics views:
   - `sql/03_views.sql`
4. Run KPI scoreboard:
   - `sql/04_kpi_scoreboard.sql`
5. Run insight queries:
   - `sql/05_insights.sql`

## Next improvements (learning roadmap)
- Add repeat purchase and retention metrics
- Add discount impact analysis
- Build a small Power BI dashboard using the views

## Tools
- MySQL 8
- MySQL Workbench
