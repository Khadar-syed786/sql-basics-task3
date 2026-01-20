/* ============================================================
   TASK 3: SQL BASICS – FILTERING, SORTING, AGGREGATIONS
   Dataset: Chinook Database
   ============================================================ */

---------------------------------------------------------------
-- 1. View sample records & understand dataset
---------------------------------------------------------------
SELECT * FROM Invoice LIMIT 10;

SELECT COUNT(*) AS total_invoices FROM Invoice;

---------------------------------------------------------------
-- 2. Filtering using WHERE
-- Find invoices from USA customers
---------------------------------------------------------------
SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    BillingCountry,
    Total
FROM Invoice
WHERE BillingCountry = 'USA';

---------------------------------------------------------------
-- 3. Sorting using ORDER BY
-- Top 10 highest invoice totals
---------------------------------------------------------------
SELECT
    InvoiceId,
    CustomerId,
    Total
FROM Invoice
ORDER BY Total DESC
LIMIT 10;

---------------------------------------------------------------
-- 4. Aggregation: Total Sales
---------------------------------------------------------------
SELECT
    SUM(Total) AS total_sales
FROM Invoice;

---------------------------------------------------------------
-- 5. Aggregation with GROUP BY
-- Sales by Country
---------------------------------------------------------------
SELECT
    BillingCountry,
    SUM(Total) AS country_sales
FROM Invoice
GROUP BY BillingCountry
ORDER BY country_sales DESC;

---------------------------------------------------------------
-- 6. Average Invoice Value by Country
---------------------------------------------------------------
SELECT
    BillingCountry,
    AVG(Total) AS avg_invoice_value
FROM Invoice
GROUP BY BillingCountry;

---------------------------------------------------------------
-- 7. HAVING Clause
-- Countries with sales greater than 1000
---------------------------------------------------------------
SELECT
    BillingCountry,
    SUM(Total) AS total_sales
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 1000
ORDER BY total_sales DESC;

---------------------------------------------------------------
-- 8. BETWEEN for Date Filtering
-- Sales between 2012-01-01 and 2012-12-31
---------------------------------------------------------------
SELECT
    InvoiceDate,
    Total
FROM Invoice
WHERE InvoiceDate BETWEEN '2012-01-01' AND '2012-12-31';

---------------------------------------------------------------
-- 9. LIKE for Pattern Search
-- Customers with name starting with 'A'
---------------------------------------------------------------
SELECT
    FirstName,
    LastName,
    Email
FROM Customer
WHERE FirstName LIKE 'A%';

---------------------------------------------------------------
-- 10. Final Aggregated Output (Export to CSV)
-- Sales Summary by Country
---------------------------------------------------------------
SELECT
    BillingCountry,
    COUNT(*) AS total_orders,
    SUM(Total) AS total_sales,
    AVG(Total) AS avg_order_value
FROM Invoice
GROUP BY BillingCountry
ORDER BY total_sales DESC;
