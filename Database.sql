/* ================================================================
   TELECOM CUSTOMER CHURN & RETENTION INTELLIGENCE
   DATABASE SETUP SCRIPT
   ================================================================
   Project      : Telecom Customer Churn Analysis
   Database     : Telecom_Churn_DB
   Main Table   : dbo.telecom_churn
   Source File  : telecom_churn(2).csv

   Dataset columns:
   customer_id, telecom_partner, gender, age, state, city, pincode,
   date_of_registration, num_dependents, estimated_salary, calls_made,
   sms_sent, data_used, churn

   IMPORTANT:
   1. Download this SQL file and telecom_churn(2).csv to your computer.
   2. Change @CsvPath below to the FULL local path of the CSV file.
   3. Run this script in SQL Server Management Studio (SSMS).
   4. The script creates the database, table, imports the CSV and validates it.

   The source CSV contains 243,553 data records (plus the header row).
   Source values are preserved; no business values are silently changed.
   ================================================================ */

USE master;
GO

/* ================================================================
   1. CREATE DATABASE
   ================================================================ */

IF DB_ID(N'Telecom_Churn_DB') IS NULL
BEGIN
    CREATE DATABASE Telecom_Churn_DB;
    PRINT 'Database Telecom_Churn_DB created successfully.';
END
ELSE
BEGIN
    PRINT 'Database Telecom_Churn_DB already exists.';
END;
GO

USE Telecom_Churn_DB;
GO

/* ================================================================
   2. CREATE MAIN TABLE
   ================================================================ */

IF OBJECT_ID(N'dbo.telecom_churn', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.telecom_churn
    (
        customer_id           INT            NOT NULL,
        telecom_partner       VARCHAR(50)    NULL,
        gender                CHAR(1)        NULL,
        age                   INT            NULL,
        state                 VARCHAR(100)   NULL,
        city                  VARCHAR(100)   NULL,
        pincode               INT            NULL,
        date_of_registration  DATE           NULL,
        num_dependents        INT            NULL,
        estimated_salary      DECIMAL(18,2)  NULL,
        calls_made            INT            NULL,
        sms_sent              INT            NULL,
        data_used             INT            NULL,
        churn                  BIT            NULL,

        CONSTRAINT PK_telecom_churn
            PRIMARY KEY CLUSTERED (customer_id)
    );

    PRINT 'Table dbo.telecom_churn created successfully.';
END
ELSE
BEGIN
    PRINT 'Table dbo.telecom_churn already exists.';
END;
GO

/* ================================================================
   3. OPTIONAL INDEXES FOR ANALYTICAL QUERIES
   ================================================================ */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_telecom_churn_partner'
      AND object_id = OBJECT_ID(N'dbo.telecom_churn')
)
BEGIN
    CREATE INDEX IX_telecom_churn_partner
        ON dbo.telecom_churn (telecom_partner);
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_telecom_churn_state'
      AND object_id = OBJECT_ID(N'dbo.telecom_churn')
)
BEGIN
    CREATE INDEX IX_telecom_churn_state
        ON dbo.telecom_churn (state);
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_telecom_churn_churn'
      AND object_id = OBJECT_ID(N'dbo.telecom_churn')
)
BEGIN
    CREATE INDEX IX_telecom_churn_churn
        ON dbo.telecom_churn (churn);
END;
GO

/* ================================================================
   4. SET YOUR CSV FILE PATH
   ================================================================
   Example:
   C:\Users\YourName\Downloads\telecom_churn(2).csv

   SQL Server must be able to access this path.
   If SQL Server is running as a service, use a path accessible
   to the SQL Server service account.
   ================================================================ */

DECLARE @CsvPath NVARCHAR(4000) =
    N'C:\YOUR_PATH\telecom_churn(2).csv';

/* ================================================================
   5. CREATE STAGING TABLE
   ================================================================
   Raw values are first loaded as text. This avoids problems caused
   by the CSV's DD-MM-YYYY date format and allows controlled conversion.
   ================================================================ */

IF OBJECT_ID(N'dbo.telecom_churn_staging', N'U') IS NOT NULL
    DROP TABLE dbo.telecom_churn_staging;
GO

CREATE TABLE dbo.telecom_churn_staging
(
    customer_id           VARCHAR(50),
    telecom_partner       VARCHAR(100),
    gender                VARCHAR(10),
    age                   VARCHAR(50),
    state                 VARCHAR(150),
    city                  VARCHAR(150),
    pincode               VARCHAR(50),
    date_of_registration  VARCHAR(50),
    num_dependents        VARCHAR(50),
    estimated_salary      VARCHAR(100),
    calls_made            VARCHAR(50),
    sms_sent              VARCHAR(50),
    data_used             VARCHAR(50),
    churn                  VARCHAR(20)
);
GO

/* ================================================================
   6. IMPORT CSV INTO STAGING TABLE
   ================================================================ */

DECLARE @BulkSQL NVARCHAR(MAX);

SET @BulkSQL = N'
BULK INSERT dbo.telecom_churn_staging
FROM ''' + REPLACE(@CsvPath, '''', '''''') + N'''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    FIELDTERMINATOR = '','',
    ROWTERMINATOR = ''0x0a'',
    TABLOCK,
    CODEPAGE = ''65001''
);';

PRINT 'Importing CSV from: ' + @CsvPath;
EXEC sys.sp_executesql @BulkSQL;
GO

/* ================================================================
   7. LOAD CLEANLY TYPED DATA INTO MAIN TABLE
   ================================================================ */

IF NOT EXISTS (SELECT 1 FROM dbo.telecom_churn)
BEGIN
    INSERT INTO dbo.telecom_churn
    (
        customer_id,
        telecom_partner,
        gender,
        age,
        state,
        city,
        pincode,
        date_of_registration,
        num_dependents,
        estimated_salary,
        calls_made,
        sms_sent,
        data_used,
        churn
    )
    SELECT
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(customer_id)), '')),
        NULLIF(LTRIM(RTRIM(telecom_partner)), ''),
        NULLIF(LTRIM(RTRIM(gender)), ''),
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(age)), '')),
        NULLIF(LTRIM(RTRIM(state)), ''),
        NULLIF(LTRIM(RTRIM(city)), ''),
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(pincode)), '')),
        TRY_CONVERT(DATE, NULLIF(LTRIM(RTRIM(date_of_registration)), ''), 105),
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(num_dependents)), '')),
        TRY_CONVERT(DECIMAL(18,2), NULLIF(LTRIM(RTRIM(estimated_salary)), '')),
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(calls_made)), '')),
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(sms_sent)), '')),
        TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(data_used)), '')),
        TRY_CONVERT(BIT, NULLIF(LTRIM(RTRIM(churn)), ''))
    FROM dbo.telecom_churn_staging;

    PRINT 'CSV data loaded into dbo.telecom_churn.';
END
ELSE
BEGIN
    PRINT 'dbo.telecom_churn already contains data. Import was skipped to prevent duplicate records.';
END;
GO

/* ================================================================
   8. DROP STAGING TABLE
   ================================================================ */

DROP TABLE IF EXISTS dbo.telecom_churn_staging;
GO

/* ================================================================
   9. VALIDATION / DATABASE CHECKS
   ================================================================ */

SELECT
    COUNT(*) AS total_records
FROM dbo.telecom_churn;
GO

SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM dbo.telecom_churn;
GO

SELECT
    SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn = 0 THEN 1 ELSE 0 END) AS active_customers,
    ROUND(
        SUM(CASE WHEN churn = 1 THEN 1.0 ELSE 0.0 END)
        * 100.0 / NULLIF(COUNT(*), 0),
        2
    ) AS overall_churn_rate
FROM dbo.telecom_churn;
GO

SELECT
    telecom_partner,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 1 THEN 1.0 ELSE 0.0 END)
        * 100.0 / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate
FROM dbo.telecom_churn
GROUP BY telecom_partner
ORDER BY churn_rate DESC;
GO

/* ================================================================
   10. DATA MODEL REFERENCE
   ================================================================

   dbo.telecom_churn
   |
   +-- customer_id
   +-- telecom_partner
   +-- gender
   +-- age
   +-- state
   +-- city
   +-- pincode
   +-- date_of_registration
   +-- num_dependents
   +-- estimated_salary
   +-- calls_made
   +-- sms_sent
   +-- data_used
   +-- churn

   The project uses a single central customer-level analytical table.
   The analytical SQL file operates on dbo.telecom_churn.

   ================================================================ */

/* ================================================================
   11. PROJECT ANALYSIS FILE
   ================================================================

   After successful database creation/import, run:

       SQL_QUERY(1).sql

   That file contains:
       Phase 1  -> 15 KPI Analyses
       Phase 2  -> 15 Univariate Analyses
       Phase 3  -> 15 Bivariate Analyses
       Phase 4  -> 15 Multivariate Analyses

   ================================================================ */

PRINT '===============================================================';
PRINT 'Telecom Customer Churn Database Setup Completed';
PRINT 'Database : Telecom_Churn_DB';
PRINT 'Table    : dbo.telecom_churn';
PRINT 'Next Step: Run SQL_QUERY(1).sql';
PRINT '===============================================================';
GO
