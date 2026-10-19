# Data Quality Audit

## 1. Project Overview

**Project:** E-commerce Delivery & Logistics Performance Analysis  
**Dataset:** Brazilian E-Commerce Public Dataset by Olist  
**Purpose:** Identify data-quality issues that may affect delivery performance KPIs and business conclusions.

## 2. Audit Summary

The initial audit examined nine CSV files containing order, customer, seller, product, payment, review, and geolocation information.

| Dataset              |      Rows | Columns | Duplicate rows | Missing cells |
| -------------------- | --------: | ------: | -------------: | ------------: |
| Customers            |    99,441 |       5 |              0 |             0 |
| Geolocation          | 1,000,163 |       5 |        261,831 |             0 |
| Order items          |   112,650 |       7 |              0 |             0 |
| Payments             |   103,886 |       5 |              0 |             0 |
| Reviews              |    99,224 |       7 |              0 |       145,903 |
| Orders               |    99,441 |       8 |              0 |         4,908 |
| Products             |    32,951 |       9 |              0 |         2,448 |
| Sellers              |     3,095 |       4 |              0 |             0 |
| Category translation |        71 |       2 |              0 |             0 |

**Interpretation:** The audit reports exact duplicate rows and missing cells. These measures do not automatically indicate invalid records; each issue requires context-specific investigation.

## 3. Key Findings

### 3.1 Orders

The orders dataset contains 4,908 missing cells:

- `order_approved_at`: 160 missing values
- `order_delivered_carrier_date`: 1,783 missing values
- `order_delivered_customer_date`: 2,965 missing values

The actual delivery timestamp is essential for calculating delivery duration and on-time performance. Orders without a valid actual delivery timestamp must be excluded from those calculations or handled under a clearly documented rule.

Missing delivery timestamps may be expected for orders that were cancelled, unavailable, or not yet delivered. These cases must not automatically be classified as late deliveries.

### 3.2 Reviews

The reviews dataset contains 145,903 missing cells:

- `review_comment_title`: 87,656 missing values
- `review_comment_message`: 58,247 missing values

Text comments are optional for many reviews. Review-score analysis can still be possible when `review_score` and a valid order relationship are available.

### 3.3 Products

The products dataset contains 2,448 missing cells:

- Product category and three descriptive fields each have 610 missing values.
- Weight, length, height, and width each have 2 missing values.

Category analysis may require an explicit missing-category label or a documented exclusion rule. Physical dimensions should only be used when valid values are available.

### 3.4 Geolocation

The geolocation dataset contains 1,000,163 rows and 261,831 exact duplicate rows according to the audit output.

Repeated ZIP-code prefixes are not necessarily duplicates because multiple geographic records may share a prefix. Before removing records, verify exact duplicates and decide how multiple coordinates per ZIP-code prefix should be handled.

## 4. Data Types and Validation

The audit reports timestamp fields as strings. Convert relevant timestamps to datetime values before calculating delivery duration, lateness, or processing time.

Recommended validation checks:

1. Parse timestamps consistently and count parsing failures.
2. Check missing values separately for each important column.
3. Verify key uniqueness before joining tables.
4. Check that delivery and purchase timestamps are logically consistent.
5. Distinguish exact duplicate rows from repeated identifiers.
6. Validate KPI counts against the source order-status counts.

## 5. Impact on Delivery KPIs

- **On-time delivery rate:** Requires a valid actual delivery date and estimated delivery date.
- **Late delivery rate:** Use the same eligible delivered-order population as the on-time rate.
- **Delivery delay:** Calculate the difference between actual and estimated delivery dates, and document the unit and sign convention.
- **Cancellation rate:** Calculate separately from delivery performance, using a clearly defined denominator.
- **Customer review analysis:** Link reviews to orders carefully and check for multiple reviews or repeated order IDs.

## 6. Recommended Actions

1. Preserve all original CSV files unchanged.
2. Correct and verify the audit script's raw-data folder path for consistent cross-platform execution.
3. Create cleaned or derived data separately from raw inputs.
4. Document exclusions, missing-value treatment, and duplicate-handling decisions.
5. Re-run the audit after any cleaning operation and compare results.
6. Validate all final KPI figures against the documented rules.

## 7. Limitations

This audit describes the supplied dataset and the checks currently recorded in the audit reports. It does not establish the root cause of missing values or duplicate records. Carrier identity and actual delivery distance must not be assumed unless supported by available source fields.

The dataset represents Brazilian e-commerce activity, not Indian e-commerce activity.
