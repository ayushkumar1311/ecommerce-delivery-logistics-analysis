# Data Dictionary

## Project

E-commerce Delivery & Logistics Performance Analysis

## Purpose

This document describes the main fields used in the Olist Brazilian E-Commerce dataset for delivery and logistics analysis.

### 1. Orders — `olist_orders_dataset.csv`

| Column                          | Meaning                                            | Analytical use                         |
| ------------------------------- | -------------------------------------------------- | -------------------------------------- |
| `order_id`                      | Unique order identifier                            | Count and link orders                  |
| `customer_id`                   | Customer identifier                                | Link orders to customer location       |
| `order_status`                  | Current/final order status recorded in the dataset | Delivered and cancelled order analysis |
| `order_purchase_timestamp`      | Time the order was placed                          | Monthly order trends                   |
| `order_approved_at`             | Order payment approval timestamp                   | Approval-time analysis, if available   |
| `order_delivered_carrier_date`  | Date the order was handed to the carrier           | Handover-time analysis, if available   |
| `order_delivered_customer_date` | Actual customer delivery timestamp                 | Delivery duration and lateness         |
| `order_estimated_delivery_date` | Estimated delivery date                            | On-time and late delivery KPIs         |

### 2. Customers — `olist_customers_dataset.csv`

| Column                     | Meaning                                 | Analytical use                      |
| -------------------------- | --------------------------------------- | ----------------------------------- |
| `customer_id`              | Identifier linked to an order           | Join with orders                    |
| `customer_unique_id`       | Identifier for a customer across orders | Customer-level analysis             |
| `customer_city`            | Customer city                           | Geographic analysis                 |
| `customer_state`           | Brazilian state abbreviation            | State-wise delivery comparison      |
| `customer_zip_code_prefix` | Customer ZIP-code prefix                | Location analysis where appropriate |

### 3. Order Items — `olist_order_items_dataset.csv`

| Column                | Meaning                                        | Analytical use             |
| --------------------- | ---------------------------------------------- | -------------------------- |
| `order_id`            | Related order                                  | Join items to orders       |
| `order_item_id`       | Item sequence within an order                  | Item counts                |
| `product_id`          | Product identifier                             | Product-level analysis     |
| `seller_id`           | Seller identifier                              | Seller analysis            |
| `shipping_limit_date` | Seller shipping deadline recorded for the item | Shipping-deadline analysis |
| `price`               | Item price                                     | Sales analysis             |
| `freight_value`       | Freight amount for the item                    | Freight-cost analysis      |

### 4. Reviews — `olist_order_reviews_dataset.csv`

| Column         | Meaning                        | Analytical use                                  |
| -------------- | ------------------------------ | ----------------------------------------------- |
| `review_id`    | Review identifier              | Review records                                  |
| `order_id`     | Related order                  | Link reviews to delivery outcomes               |
| `review_score` | Customer rating, typically 1–5 | Compare ratings for on-time and late deliveries |

### 5. Payments — `olist_order_payments_dataset.csv`

| Column                 | Meaning                 | Analytical use            |
| ---------------------- | ----------------------- | ------------------------- |
| `order_id`             | Related order           | Link payment to order     |
| `payment_type`         | Payment method          | Payment-method analysis   |
| `payment_installments` | Number of installments  | Payment behavior analysis |
| `payment_value`        | Recorded payment amount | Payment-value analysis    |

### 6. Products — `olist_products_dataset.csv`

| Column                  | Meaning                                       | Analytical use                   |
| ----------------------- | --------------------------------------------- | -------------------------------- |
| `product_id`            | Product identifier                            | Join products to order items     |
| `product_category_name` | Original product category name                | Category analysis                |
| `product_weight_g`      | Product weight in grams, where recorded       | Product shipping characteristics |
| `product_length_cm`     | Product length in centimeters, where recorded | Product size analysis            |
| `product_height_cm`     | Product height in centimeters, where recorded | Product size analysis            |
| `product_width_cm`      | Product width in centimeters, where recorded  | Product size analysis            |

## Data interpretation notes

- The source dataset represents Brazilian e-commerce orders.
- A column's presence does not guarantee that every record has a valid value.
- Check missing values and duplicate keys before joining tables.
- `order_id` can appear multiple times in order items, payments, and reviews; validate join cardinality before calculating order-level KPIs.
- Carrier identity and actual delivery distance should not be assumed unless supported by available source fields.
