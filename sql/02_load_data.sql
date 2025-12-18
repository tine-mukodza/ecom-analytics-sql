USE ecom_analytics;

-- NOTE:
-- This project loads CSVs via MySQL Workbench using LOAD DATA INFILE.
-- Data files are intentionally NOT included in this repo.

-- If you want to reproduce locally:
-- 1) Place your CSVs in the MySQL secure_file_priv directory (commonly):
--    C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/
-- 2) Update the file paths below to match your machine
-- 3) Run each LOAD statement

SET FOREIGN_KEY_CHECKS = 0;

-- Example patterns (edit filenames/columns to match your CSVs):

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecom_customers.csv'
-- INTO TABLE customers
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecom_products.csv'
-- INTO TABLE products
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecom_orders.csv'
-- INTO TABLE orders
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (order_id, customer_id, order_timestamp, channel, status, delivery_method, order_discount_pct);

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecom_order_items.csv'
-- INTO TABLE order_items
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (order_item_id, order_id, product_id, quantity, base_price, item_discount_pct, unit_price);

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecom_returns.csv'
-- INTO TABLE returns
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (return_id, order_id, order_item_id, product_id, return_date, refund_amount, return_reason);

SET FOREIGN_KEY_CHECKS = 1;
