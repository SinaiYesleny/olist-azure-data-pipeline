-- Create view
CREATE VIEW dbo.vw_sales AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_status,
    o.order_purchase_timestamp,
    p.payment_type,
    p.payment_value
FROM dbo.orders AS o
INNER JOIN dbo.customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN dbo.payments AS p
    ON o.order_id = p.order_id;