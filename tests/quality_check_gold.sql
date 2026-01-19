/*
===============================================================================
Data Quality Validation: Gold Layer (PostgreSQL)
===============================================================================
Purpose:
    This script performs data quality validation checks on the Gold layer to
    ensure analytical reliability and model correctness.

    The checks focus on validating:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Proper alignment of the star schema relationships used for analytics.

    These validations help confirm that the Gold layer is consistent,
    trustworthy, and ready for reporting and business intelligence use cases.

Execution Notes:
    - All checks are expected to return ZERO rows.
    - Any returned records indicate data quality or modeling issues
      that must be investigated and resolved before downstream usage.

Environment:
    - PostgreSQL
    - Executable via pgAdmin or automated data quality pipelines

===============================================================================
*/

-- ====================================================================
-- Quality Check: gold.dim_customers
-- ====================================================================
-- Validate uniqueness of surrogate customer keys
-- Expectation: No rows returned
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;



-- ====================================================================
-- Quality Check: gold.dim_products
-- ====================================================================
-- Validate uniqueness of surrogate product keys
-- Expectation: No rows returned
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;



-- ====================================================================
-- Quality Check: gold.fact_sales (Referential Integrity)
-- ====================================================================
-- Validate fact-to-dimension relationships
-- Expectation: No rows returned
SELECT 
    f.*
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE c.customer_key IS NULL
   OR p.product_key IS NULL;
