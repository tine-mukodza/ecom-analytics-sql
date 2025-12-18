USE ecom_analytics;

SELECT
  (SELECT COUNT(*) FROM customers) AS customers,
  (SELECT COUNT(*) FROM orders) AS orders,
  (SELECT COUNT(*) FROM order_items) AS order_items,
  (SELECT COUNT(*) FROM products) AS products,
  (SELECT COUNT(*) FROM returns) AS returns,

  (SELECT ROUND(SUM(quantity * unit_price), 2) FROM order_items) AS gross_revenue,
  (SELECT ROUND(COALESCE(SUM(refund_amount),0), 2) FROM returns) AS total_refunds,
  ROUND(
    (SELECT COALESCE(SUM(quantity * unit_price),0) FROM order_items)
    - (SELECT COALESCE(SUM(refund_amount),0) FROM returns)
  , 2) AS net_revenue,

  ROUND(
    (SELECT COUNT(*) FROM returns) /
    NULLIF((SELECT COUNT(*) FROM order_items), 0)
  , 4) AS return_rate_per_item,

  ROUND(
    (SELECT COALESCE(SUM(refund_amount),0) FROM returns) /
    NULLIF((SELECT COALESCE(SUM(quantity * unit_price),0) FROM order_items), 0)
  , 4) AS refund_rate_of_revenue;
