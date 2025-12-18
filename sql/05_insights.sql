USE ecom_analytics;

-- Top products by refund loss
SELECT
  p.product_name,
  ROUND(SUM(r.refund_amount), 2) AS refund_loss
FROM returns r
JOIN products p ON p.product_id = r.product_id
GROUP BY p.product_name
ORDER BY refund_loss DESC
LIMIT 10;

-- Top customers by net revenue
SELECT
  c.customer_name,
  ROUND(SUM(onr.net_order_revenue), 2) AS net_spend
FROM v_order_net_revenue onr
JOIN customers c ON c.customer_id = onr.customer_id
GROUP BY c.customer_name
ORDER BY net_spend DESC
LIMIT 10;

-- Monthly net revenue trend
SELECT
  DATE_FORMAT(order_timestamp, '%Y-%m') AS month,
  ROUND(SUM(net_order_revenue), 2) AS net_revenue
FROM v_order_net_revenue
GROUP BY month
ORDER BY month;
