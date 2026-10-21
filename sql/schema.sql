
-- Project: E-commerce Delivery & Logistics Performance Analysis
-- Owner: Mahima Prajapati
-- Purpose: Define and verify the orders table schema
-- Database: ecommerce_logistics (MySQL)

USE ecommerce_logistics;

-- Create the orders table if it does not already exist
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

-- Verify the table definition
DESCRIBE orders;

-- Verify the primary key
SHOW KEYS FROM orders WHERE Key_name = 'PRIMARY';

-- Verify the number of records already imported
SELECT COUNT(*) AS total_orders
FROM orders;
