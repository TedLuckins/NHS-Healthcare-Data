/*
Creates a Database and Schemas
Script purpose: This script checks for prexisting 'NHSHealthcareData', where if found, the original table will be dropped 
				and a new database with 'bronze', 'silver' and 'gold' schemas will be created
*/

USE Master
GO

IF EXISTS (SELECT 1 FROM sys.Databases WHERE name = 'NHSHealthcareData')
BEGIN
	ALTER DATABASE NHSHealthcareData SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE NHSHealthcareData 
END;
GO

-- Creates Database 'DaraWarehouse'
CREATE DATABASE NHSHealthcareData;
GO

USE NHSHealthcareData;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO