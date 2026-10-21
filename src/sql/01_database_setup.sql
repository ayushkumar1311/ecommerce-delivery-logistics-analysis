-- Project: E-commerce Delivery & Logistics Analysis
-- Purpose: Create the project database

CREATE DATABASE IF NOT EXISTS ecommerce_logistics;

USE ecommerce_logistics;

-- Check selected database
SELECT DATABASE();


-- =====================================================
-- Project: E-commerce Delivery & Logistics Analysis
-- Day 1: KPI Analysis
-- Purpose: Calculate initial business metrics
-- =====================================================

-- KPI 1: Check total orders and delivery date availability
SELECT
    COUNT(*) AS total_orders,
    SUM(order_delivered_customer_date IS NOT NULL)
        AS orders_with_delivery_date,
    ROUND(
        100.0 * SUM(order_delivered_customer_date IS NOT NULL)
        / COUNT(*),
        2
    ) AS delivery_date_available_pct
FROM orders;


-- KPI 2: Calculate on-time and late delivery rates
SELECT
    CASE
        WHEN order_delivered_customer_date
             <= order_estimated_delivery_date
        THEN 'On Time'
        ELSE 'Late'
    END AS delivery_performance,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
GROUP BY delivery_performance;


-- KPI 3: Calculate cancellation rate
SELECT
    COUNT(*) AS total_orders,
    SUM(order_status = 'canceled') AS cancelled_orders,
    ROUND(
        100.0 * SUM(order_status = 'canceled') / COUNT(*),
        2
    ) AS cancellation_rate_pct
FROM orders;


-- KPI 4: Calculate average delivery duration in days
SELECT
    COUNT(*) AS eligible_delivered_orders,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                SECOND,
                order_purchase_timestamp,
                order_delivered_customer_date
            )
        ) / 86400,
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_purchase_timestamp IS NOT NULL
  AND order_delivered_customer_date IS NOT NULL
  AND order_delivered_customer_date >= order_purchase_timestamp;
