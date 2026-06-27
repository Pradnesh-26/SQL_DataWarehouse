/*
===============================================================================
Script: Database Initialization (DataWarehouse)

Purpose:
- Drops the existing DataWarehouse database (if it exists).
- Creates a fresh DataWarehouse database.
- Creates the Bronze, Silver, and Gold schemas for the data warehouse.

Warning:
- This script permanently deletes the existing DataWarehouse database and all
  its data. Run only in development or test environments, or ensure a backup
  exists before executing.
===============================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO
