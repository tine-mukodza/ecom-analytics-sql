USE ecom_analytics;

-- 1) Line-level revenue view
CREATE OR REPLACE VIEW v_order_line_revenue AS
SELECT
  oi.order_item_id,
  oi.order_id,
  o.order_timestamp,
  o.customer_id,
  oi.product_id,
  oi.quantity,
  oi.unit_price,
  (oi.quantity * oi.unit_price) AS line_revenue
FROM order_items oi
JOIN orders o
  ON oi.order_id = o.order_id;

-- 2) Returns view (clean select)
CREATE OR REPLACE VIEW v_returns_enriched AS
SELECT
  r.return_id,
  r.order_id,
  r.order_item_id,
  r.product_id,
  r.return_date,
  r.refund_amount,
  r.return_reason
FROM returns r;

-- 3) Order-level net revenue view (gross - refunds)
CREATE OR REPLACE VIEW v_order_net_revenue AS
SELECT
  ol.order_id,
  MIN(ol.order_timestamp) AS order_timestamp,
  MIN(ol.customer_id) AS customer_id,
  SUM(ol.line_revenue) AS gross_order_revenue,
  COALESCE(SUM(r.refund_amount), 0) AS order_refunds,
  SUM(ol.line_revenue) - COALESCE(SUM(r.refund_amount), 0) AS net_order_revenue
FROM v_order_line_revenue ol
LEFT JOIN v_returns_enriched r
  ON r.order_id = ol.order_id
GROUP BY ol.order_id;
