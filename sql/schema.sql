
-- =====================================================
-- Project: E-commerce Delivery & Logistics Performance Analysis
-- Owner: Mahima Prajapati
-- File: schema.sql
-- Purpose: Define the orders table structure
-- Database: MySQL - ecommerce_logistics
-- =====================================================

-- Select the project database
USE ecommerce_logistics;

-- Create the orders table if it does not exist
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(50) NOT NULL,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    CONSTRAINT pk_orders PRIMARY KEY (order_id)
);

-- Verify the table structure
DESCRIBE orders;

-- Verify the primary key
SHOW KEYS
FROM orders
WHERE Key_name = 'PRIMARY';

-- Verify total imported orders
SELECT COUNT(*) AS total_orders
FROM orders;

