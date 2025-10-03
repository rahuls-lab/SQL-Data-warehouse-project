/*
=================================================================
                      Create Database and Schemas
=================================================================

Script Purpose:
   This script sets up a new database named 'DataWarehouse'.
   - If the database already exists, it is dropped and recreated.
   - Three schemas are created within the database: 'bronze', 'silver', 'gold'.

-----------------------------------------------------------------
                           ⚠️  WARNING
-----------------------------------------------------------------

   Running this script will DROP the entire 'DataWarehouse' database
   if it exists. All existing data will be permanently deleted.  
   Proceed only if you have confirmed backups and are certain about
   reinitializing the database.
=================================================================


-- 1) Connect to the maintenance DB (run this in psql)
\c postgres

-- 2) Show current database
SELECT current_database();

-- 3) Terminate other connections to the target DB (so DROP will succeed) 
--    (You must be a superuser to run pg_terminate_backend)
SELECT pg_terminate_backend(pid)      --pg_stat_activity = "who’s connected?"
FROM pg_stat_activity                 --pg_terminate_backend(pid) = "force disconnect them."
WHERE datname = 'DataWarehouse'
  AND pid <> pg_backend_pid();

-- 4) Drop the database if it exists
DROP DATABASE IF EXISTS "DataWarehouse";

-- 5) Create the database
CREATE DATABASE "DataWarehouse";

-- 6) Connect to the newly created database
\c "DataWarehouse"

-- 7) Create the three schemas if they don't already exist
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;

-- 8) Verify schemas
SELECT nspname AS schema_name
FROM pg_namespace
WHERE nspname IN ('bronze','silver','gold')
ORDER BY nspname;
