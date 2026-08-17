-- 1. Total sales by state
SELECT
    customer_state,
    SUM(payment_value) AS total_sales
FROM vw_sales
GROUP BY customer_state
ORDER BY total_sales DESC;


-- 2. Number of orders by state
SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders
FROM vw_sales
GROUP BY customer_state
ORDER BY total_orders DESC;


-- 3. Monthly sales
SELECT
    YEAR(order_purchase_timestamp) AS sales_year,
    DATENAME(MONTH, order_purchase_timestamp) AS sales_month,
    SUM(payment_value) AS total_sales
FROM vw_sales
GROUP BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp),
    DATENAME(MONTH, order_purchase_timestamp)
ORDER BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp);


-- 4. Average order value
SELECT
    CAST(AVG(order_total) AS DECIMAL(18,2)) AS average_order_value
FROM 
    (SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM vw_sales
    GROUP BY order_id
    ) AS value_per_order;