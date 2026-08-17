--Validate the number of records per table
SELECT
    'customers' AS table_name,
    COUNT(*) AS records
FROM dbo.customers

UNION ALL

SELECT
    'orders' AS table_name,
    COUNT(*) AS records
FROM dbo.orders

UNION ALL

SELECT
    'payments' AS table_name,
    COUNT(*) AS records
FROM dbo.payments;


-- Validate the range of dates
SELECT
    MIN(order_purchase_timestamp) AS first_purchase_date,
    MAX(order_purchase_timestamp) AS last_purchase_date
FROM dbo.orders;