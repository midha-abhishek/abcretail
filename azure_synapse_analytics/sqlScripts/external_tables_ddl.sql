-- Creating an external file format for parquet files

-- CREATE EXTERNAL FILE FORMAT [ext_parquet_format]
-- WITH (
--     FORMAT_TYPE = PARQUET
-- );



-- Creating external data sources

-- CREATE EXTERNAL DATA SOURCE [extdatasource_curated]
--     WITH (LOCATION = 'abfss://curated@dlsaabcretail.dfs.core.windows.net/');

-- CREATE EXTERNAL DATA SOURCE [extdatasource_staging]
--     WITH (LOCATION = 'abfss://staging@dlsaabcretail.dfs.core.windows.net/');



-- Creating External Tables For Datasets From the HTTP API Source

-- CREATE EXTERNAL TABLE [http_accessories]
-- (
--     [ProductID] INT,
--     [Category] NVARCHAR(4000),
--     [SubCategory] NVARCHAR(4000),
--     [ProductName] NVARCHAR(4000),
--     [Brand] NVARCHAR(4000),
--     [Sizes] NVARCHAR(MAX),
--     [Colors] NVARCHAR(Max),
--     [Price] DECIMAL(18, 2),
--     [Description] NVARCHAR(MAX),
--     [ingestion_timestamp] DATETIME
-- )
-- WITH (
--     LOCATION = '/delta/http/accessories/*.parquet',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_parquet_format]
-- );

SELECT * FROM [http_accessories];



-- CREATE EXTERNAL TABLE [http_clothing]
-- (
--     [ProductID] INT,
--     [Category] NVARCHAR(4000),
--     [SubCategory] NVARCHAR(4000),
--     [ProductName] NVARCHAR(4000),
--     [Brand] NVARCHAR(4000),
--     [Sizes] NVARCHAR(MAX),
--     [Colors] NVARCHAR(Max),
--     [Price] DECIMAL(18, 2),
--     [Description] NVARCHAR(MAX),
--     [ingestion_timestamp] DATETIME
-- )
-- WITH (
--     LOCATION = '/delta/http/clothing/*.parquet',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_parquet_format]
-- );

SELECT * FROM [http_clothing];



-- CREATE EXTERNAL TABLE [http_footwear]
-- (
--     [ProductID] INT,
--     [Category] NVARCHAR(4000),
--     [SubCategory] NVARCHAR(4000),
--     [ProductName] NVARCHAR(4000),
--     [Brand] NVARCHAR(4000),
--     [Sizes] NVARCHAR(MAX),
--     [Colors] NVARCHAR(Max),
--     [Price] DECIMAL(18, 2),
--     [Description] NVARCHAR(MAX),
--     [ingestion_timestamp] DATETIME
-- )
-- WITH (
--     LOCATION = '/delta/http/footwear/*.parquet',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_parquet_format]
-- );

SELECT * FROM [http_footwear];



-- CREATE EXTERNAL TABLE [http_home_decor]
-- (
--     [ProductID] INT,
--     [Category] NVARCHAR(4000),
--     [SubCategory] NVARCHAR(4000),
--     [ProductName] NVARCHAR(4000),
--     [Brand] NVARCHAR(4000),
--     [Sizes] NVARCHAR(MAX),
--     [Colors] NVARCHAR(Max),
--     [Price] DECIMAL(18, 2),
--     [Description] NVARCHAR(MAX),
--     [ingestion_timestamp] DATETIME
-- )
-- WITH (
--     LOCATION = '/delta/http/home_decor/*.parquet',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_parquet_format]
-- );

SELECT * FROM [http_home_decor];



-- CREATE EXTERNAL TABLE [http_products]
-- (
--     [ProductID] INT,
--     [Category] NVARCHAR(4000),
--     [SubCategory] NVARCHAR(4000),
--     [ProductName] NVARCHAR(4000),
--     [Brand] NVARCHAR(4000),
--     [Sizes] NVARCHAR(MAX),
--     [Colors] NVARCHAR(Max),
--     [Price] DECIMAL(18, 2),
--     [Description] NVARCHAR(MAX),
--     [ingestion_timestamp] DATETIME
-- )
-- WITH (
--     LOCATION = '/delta/http/products/*.parquet',
--     DATA_SOURCE = [extdatasource_staging],
--     FILE_FORMAT = [ext_parquet_format]
-- );

SELECT * FROM [http_products];



-- Creating External Tables For Datasets From the Azure SQL Database Source

