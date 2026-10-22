

-- =====================================================
-- Project: E-commerce Delivery & Logistics Performance Analysis
-- File: data_validation.sql
-- Purpose: Validate order IDs, timestamps and order status
-- Database: MySQL - ecommerce_logistics
-- =====================================================

USE ecommerce_logistics;

-- 1. Validate total rows and unique order IDs
SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS non_missing_order_ids,
    COUNT(DISTINCT order_id) AS unique_order_ids
FROM orders;

-- 2. Check missing delivery timestamps
SELECT
    COUNT(*) AS total_orders,
    SUM(order_delivered_customer_date IS NULL)
        AS missing_actual_delivery_date,
    SUM(order_estimated_delivery_date IS NULL)
        AS missing_estimated_delivery_date
FROM orders;

-- 3. Count orders by status
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 4. Check missing purchase timestamps
SELECT
    COUNT(*) AS total_orders,
    SUM(order_purchase_timestamp IS NULL)
        AS missing_purchase_timestamps
FROM orders;

-- 5. Validate invalid delivery date order
SELECT
    COUNT(*) AS invalid_delivery_date_rows
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL
  AND order_delivered_customer_date < order_purchase_timestamp;
