# Data Catalog for Gold Layer

## Overview
Houses business-ready data modeled into **star schema** architecture—combining **dimension tables** for descriptive attributes and **fact tables** for quantitative metrics—optimized for analytical workloads and BI consumption.

---

## 1. gold.dim_customers

**Purpose:** Stores customer details enriched with demographic and geographic data.

**Columns:**

| Column Name      | Data Type     | Description                                                                                   |
|------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT           | Surrogate key serving as the primary identifier for each customer record in the dimension table |
| customer_id      | INT           | Business key representing the unique numerical identifier from the source system              |
| customer_number  | NVARCHAR(50)  | Alphanumeric customer identifier used for business tracking and cross-reference operations    |
| first_name       | NVARCHAR(50)  | Customer's first name as captured in the source system                                        |
| last_name        | NVARCHAR(50)  | Customer's last name or surname                                                               |
| country          | NVARCHAR(50)  | Country of residence for the customer (e.g., 'Australia', 'United States')                    |
| marital_status   | NVARCHAR(50)  | Customer's marital status classification (e.g., 'Married', 'Single', 'Divorced')              |
| gender           | NVARCHAR(50)  | Gender attribute of the customer (e.g., 'Male', 'Female', 'n/a')                              |
| birthdate        | DATE          | Customer's date of birth in YYYY-MM-DD format (e.g., 1971-10-06)                              |
| create_date      | DATE          | Record creation timestamp indicating when the customer entry was added to the system          |

---

## 2. gold.dim_products

**Purpose:** Provides comprehensive product information including attributes, classifications, and lifecycle details.

**Columns:**

| Column Name         | Data Type     | Description                                                                                   |
|---------------------|---------------|-----------------------------------------------------------------------------------------------|
| product_key         | INT           | Surrogate key serving as the primary identifier for each product record in the dimension table |
| product_id          | INT           | Business key representing the unique product identifier from the source system                |
| product_number      | NVARCHAR(50)  | Structured alphanumeric SKU code used for product categorization and inventory management     |
| product_name        | NVARCHAR(50)  | Descriptive product name including specifications such as type, color, and size attributes    |
| category_id         | NVARCHAR(50)  | Foreign key linking to the product's primary category classification                          |
| category            | NVARCHAR(50)  | High-level product classification grouping (e.g., 'Bikes', 'Components', 'Accessories')       |
| subcategory         | NVARCHAR(50)  | Granular product classification within the parent category for detailed segmentation          |
| maintenance_required| NVARCHAR(50)  | Binary indicator specifying whether the product requires ongoing maintenance (e.g., 'Yes', 'No') |
| cost                | INT           | Product base cost or manufacturing price in monetary units                                    |
| product_line        | NVARCHAR(50)  | Product line or series classification (e.g., 'Road', 'Mountain', 'Touring')                   |
| start_date          | DATE          | Effective date when the product became available for sale, stored in YYYY-MM-DD format        |

---

## 3. gold.fact_sales

**Purpose:** Stores transactional sales data capturing order-level metrics for revenue analysis and performance tracking.

**Columns:**

| Column Name     | Data Type     | Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Unique alphanumeric identifier for each sales order transaction (e.g., 'SO54496')             |
| product_key     | INT           | Foreign key linking to the product dimension table for product-level analysis                 |
| customer_key    | INT           | Foreign key linking to the customer dimension table for customer-level analysis               |
| order_date      | DATE          | Transaction date when the sales order was placed by the customer                              |
| shipping_date   | DATE          | Fulfillment date when the order was dispatched to the customer                                |
| due_date        | DATE          | Payment due date for the sales order transaction                                              |
| sales_amount    | INT           | Total revenue value for the line item in whole currency units (e.g., 25)                      |
| quantity        | INT           | Number of product units ordered in the line item (e.g., 1)                                    |
| price           | INT           | Unit price of the product for the line item in whole currency units (e.g., 25)                |

---
