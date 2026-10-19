# Dataset Inventory

## Project

E-commerce Delivery & Logistics Performance Analysis

## Dataset Source

Dataset: Brazilian E-Commerce Public Dataset by Olist  
Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

## Data Storage

The original CSV files are stored locally in `data/raw/`. Raw datasets are excluded from Git tracking to keep the repository lightweight. The files should remain unchanged; cleaning and transformations should be performed on derived data.

## Files

| File name                               | Purpose                                                                |
| --------------------------------------- | ---------------------------------------------------------------------- |
| `olist_customers_dataset.csv`           | Customer IDs and customer location details                             |
| `olist_geolocation_dataset.csv`         | Brazilian ZIP-code geolocation information                             |
| `olist_order_items_dataset.csv`         | Products and seller details associated with orders                     |
| `olist_order_payments_dataset.csv`      | Payment methods, installments, and payment amounts                     |
| `olist_order_reviews_dataset.csv`       | Customer review scores and comments                                    |
| `olist_orders_dataset.csv`              | Order status and purchase, approval, shipping, and delivery timestamps |
| `olist_products_dataset.csv`            | Product attributes and category IDs                                    |
| `olist_sellers_dataset.csv`             | Seller IDs and seller location details                                 |
| `product_category_name_translation.csv` | Portuguese-to-English product category translations                    |

## Important Limitations

- The dataset represents e-commerce orders in Brazil, not India.
- Actual carrier identity and measured delivery distance may not be available in the supplied files.
- Any analysis that requires unavailable fields must be excluded or clearly documented.
- Missing timestamps and non-delivered orders must be handled explicitly when calculating delivery KPIs.

## Data Handling Rules

1. Keep original files unchanged.
2. Inspect data types, missing values, and duplicate identifiers.
3. Document cleaning decisions and excluded records.
4. Validate KPI calculations before reporting results.
