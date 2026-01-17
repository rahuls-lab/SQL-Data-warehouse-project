/*
===============================================================================
DDL Script: Silver Layer Table Definitions
===============================================================================
Purpose:
    This script defines and maintains the table structures for the Silver layer
    within the PostgreSQL data warehouse.

    The Silver layer represents cleaned, standardized, and conformed data
    derived from the Bronze layer. These tables serve as the foundation for
    analytical transformations and downstream reporting.

Behavior:
    - Drops existing Silver tables if they already exist.
    - Recreates tables with optimized PostgreSQL data types.
    - Enforces a consistent schema design aligned with warehouse standards.

Execution Notes:
    - Intended to be re-runnable and idempotent.
    - Should be executed before running Silver-layer load procedures.
    - Compatible with PostgreSQL and pgAdmin.

===============================================================================
*/

CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.crm_cust_info;

CREATE TABLE silver.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE,
	dwh_create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

 
 CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.crm_prd_info;

CREATE TABLE silver.crm_prd_info (
    prd_id        INT,
    prd_key       VARCHAR(50),
    prd_nm        VARCHAR(100),
    prd_cost      NUMERIC(10,2),
    prd_line      VARCHAR(50),
    prd_start_dt  DATE,
    prd_end_dt    DATE,
	dwh_create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.crm_sales_info;

CREATE TABLE silver.crm_sales_details (
    sls_ord_num     VARCHAR(50),
    sls_prd_key     VARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt   INT, 
    sls_ship_dt     INT,
    sls_due_dt     INT,
    sls_sales      INT,
    sls_quantity   INT,
    sls_price     INT,
	dwh_create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.erp_loc_a101 ;

CREATE TABLE silver.erp_loc_a101(
     cid VARCHAR(50),
	 cntry VARCHAR(50 ),
	 dwh_create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
      
);



CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.erp_cust_az12;

CREATE TABLE silver.erp_cust_az12(
     cid VARCHAR(50),
	 bdate DATE,
	 gen VARCHAR(50),
	 dwh_create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;

CREATE TABLE silver.erp_px_cat_g1v2(
     id  VARCHAR(50),
	 cat  VARCHAR(50),
	 subcat VARCHAR(50),
	 maintenance VARCHAR(50),
	 dwh_create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
 
