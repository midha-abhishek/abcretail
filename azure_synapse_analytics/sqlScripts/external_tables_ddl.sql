-- Creating an external file format for delta tables

-- CREATE EXTERNAL FILE FORMAT [ext_delta_format]
-- WITH (
--     FORMAT_TYPE = DELTA
-- )



---------------------------------------------------------------------------



-- Creating external data sources

-- CREATE EXTERNAL DATA SOURCE [extdatasource_curated]
--     WITH (LOCATION = 'abfss://curated@dlsaabcretail.dfs.core.windows.net/');

-- CREATE EXTERNAL DATA SOURCE [extdatasource_staging]
--     WITH (LOCATION = 'abfss://staging@dlsaabcretail.dfs.core.windows.net/');



---------------------------------------------------------------------------



-- Creating External Tables For Datasets From the HTTP API Source



-- CREATE EXTERNAL TABLE [http_Accessories]
-- (
--     ProductID INT,
--     Category NVARCHAR(4000),
--     SubCategory NVARCHAR(4000),
--     ProductName NVARCHAR(4000),
--     Brand NVARCHAR(4000),
--     Sizes NVARCHAR(MAX),
--     Colors NVARCHAR(MAX),
--     Price DECIMAL(10,2),
--     Description NVARCHAR(MAX),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/http/accessories/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [http_Accessories];



-- CREATE EXTERNAL TABLE [http_Clothing]
-- (
--     ProductID INT,
--     Category NVARCHAR(4000),
--     SubCategory NVARCHAR(4000),
--     ProductName NVARCHAR(4000),
--     Brand NVARCHAR(4000),
--     Sizes NVARCHAR(MAX),
--     Colors NVARCHAR(MAX),
--     Price DECIMAL(10,2),
--     Description NVARCHAR(MAX),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/http/clothing/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );



SELECT TOP 10 * FROM [http_Clothing];

-- CREATE EXTERNAL TABLE [http_Footwear]
-- (
--     ProductID INT,
--     Category NVARCHAR(4000),
--     SubCategory NVARCHAR(4000),
--     ProductName NVARCHAR(4000),
--     Brand NVARCHAR(4000),
--     Sizes NVARCHAR(MAX),
--     Colors NVARCHAR(MAX),
--     Price DECIMAL(10,2),
--     Description NVARCHAR(MAX),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/http/footwear/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [http_Footwear];



-- CREATE EXTERNAL TABLE [http_HomeDecor]
-- (
--     ProductID INT,
--     Category NVARCHAR(4000),
--     SubCategory NVARCHAR(4000),
--     ProductName NVARCHAR(4000),
--     Brand NVARCHAR(4000),
--     Sizes NVARCHAR(MAX),
--     Colors NVARCHAR(MAX),
--     Price DECIMAL(10,2),
--     Description NVARCHAR(MAX),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/http/home_decor/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [http_HomeDecor];



-- CREATE EXTERNAL TABLE [http_Products]
-- (
--     ProductID INT,
--     Category NVARCHAR(4000),
--     SubCategory NVARCHAR(4000),
--     ProductName NVARCHAR(4000),
--     Brand NVARCHAR(4000),
--     Sizes NVARCHAR(MAX),
--     Colors NVARCHAR(MAX),
--     Price DECIMAL(10,2),
--     Description NVARCHAR(MAX),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/http/products/',
--     DATA_SOURCE = [extdatasource_staging],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [http_Products];



---------------------------------------------------------------------------



-- Creating External Tables For Datasets From the Azure SQL Database Source



-- CREATE EXTERNAL TABLE [azsqldb_Address]
-- (
--     AddressID INT,
--     AddressLine1 NVARCHAR(4000),
--     AddressLine2 NVARCHAR(4000),
--     City NVARCHAR(4000),
--     StateProvince NVARCHAR(4000),
--     CountryRegion NVARCHAR(4000),
--     PostalCode NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/address/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );


SELECT TOP 10 * FROM [azsqldb_Address];



-- CREATE EXTERNAL TABLE [azsqldb_Customer]
-- (
--     CustomerID INT,
--     NameStyle BIT,
--     Title NVARCHAR(4000),
--     FirstName NVARCHAR(4000),
--     MiddleName NVARCHAR(4000),
--     LastName NVARCHAR(4000),
--     Suffix NVARCHAR(4000),
--     CompanyName NVARCHAR(4000),
--     SalesPerson NVARCHAR(4000),
--     EmailAddress NVARCHAR(4000),
--     Phone NVARCHAR(4000),
--     PasswordHash NVARCHAR(4000),
--     PasswordSalt NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/customer/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_Customer];



-- CREATE EXTERNAL TABLE [azsqldb_CustomerAddress]
-- (
--     CustomerID INT,
--     AddressID INT,
--     AddressType NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/customer_address/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_CustomerAddress];



-- CREATE EXTERNAL TABLE [azsqldb_Product]
-- (
--     ProductID INT,
--     Name NVARCHAR(4000),
--     ProductNumber NVARCHAR(4000),
--     Color NVARCHAR(4000),
--     StandardCost FLOAT,
--     ListPrice FLOAT,
--     Size NVARCHAR(4000),
--     Weight FLOAT,
--     ProductCategoryID INT,
--     ProductModelID INT,
--     SellStartDate DATETIME,
--     SellEndDate DATETIME,
--     DiscontinuedDate DATETIME,
--     ThumbNailPhoto VARBINARY(MAX),
--     ThumbnailPhotoFileName NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/product/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_Product];



-- CREATE EXTERNAL TABLE [azsqldb_ProductCategory]
-- (
--     ProductCategoryID INT,
--     ParentProductCategoryID INT,
--     Name NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/product_category/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_ProductCategory];



-- CREATE EXTERNAL TABLE [azsqldb_ProductDescription]
-- (
--     ProductDescriptionID INT,
--     Description NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/product_description/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_ProductDescription];



-- CREATE EXTERNAL TABLE [azsqldb_ProductModel]
-- (
--     ProductModelID INT,
--     Name NVARCHAR(4000),
--     CatalogDescription NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/product_model/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_ProductModel];



-- CREATE EXTERNAL TABLE [azsqldb_ProductModelProductDescription]
-- (
--     ProductModelID INT,
--     ProductDescriptionID INT,
--     Culture NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/productmodel_productdescription/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_ProductModelProductDescription];



-- CREATE EXTERNAL TABLE [azsqldb_SalesOrderDetail]
-- (
--     SalesOrderID INT,
--     SalesOrderDetailID INT,
--     OrderQty INT,
--     ProductID INT,
--     UnitPrice FLOAT,
--     UnitPriceDiscount FLOAT,
--     LineTotal FLOAT,
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/salesorder_detail/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_SalesOrderDetail];



-- CREATE EXTERNAL TABLE [azsqldb_SalesOrderHeader]
-- (
--     SalesOrderID INT,
--     RevisionNumber INT,
--     OrderDate DATETIME,
--     DueDate DATETIME,
--     ShipDate DATETIME,
--     Status INT,
--     OnlineOrderFlag BIT,
--     SalesOrderNumber NVARCHAR(4000),
--     PurchaseOrderNumber NVARCHAR(4000),
--     AccountNumber NVARCHAR(4000),
--     CustomerID INT,
--     ShipToAddressID INT,
--     BillToAddressID INT,
--     ShipMethod NVARCHAR(4000),
--     CreditCardApprovalCode NVARCHAR(4000),
--     SubTotal FLOAT,
--     TaxAmt FLOAT,
--     Freight FLOAT,
--     TotalDue FLOAT,
--     Comment NVARCHAR(4000),
--     rowguid NVARCHAR(4000),
--     ModifiedDate DATETIME,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/azsqldb/salesorder_header/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [azsqldb_SalesOrderHeader];



---------------------------------------------------------------------------



-- Creating External Tables For Datasets From the On-Premise Microsoft SQL Server Source



-- CREATE EXTERNAL TABLE [onprem_CountryRolling]
-- (
--     CountryID INT,
--     CountryName NVARCHAR(4000),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/country_rolling/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_CountryRolling];



-- CREATE EXTERNAL TABLE [onprem_Customer]
-- (
--     CustomerID INT,
--     FirstName NVARCHAR(4000),
--     LastName NVARCHAR(4000),
--     Email NVARCHAR(4000),
--     Phone NVARCHAR(4000),
--     AddressLine1 NVARCHAR(4000),
--     AddressLine2 NVARCHAR(4000),
--     City NVARCHAR(4000),
--     StateID INT,
--     PostalCode NVARCHAR(4000),
--     CountryID INT,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/customer/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_Customer];



-- CREATE EXTERNAL TABLE [onprem_CusomerProductReview]
-- (
--     ReviewID INT,
--     ProductID INT,
--     CustomerID INT,
--     Rating INT,
--     Review NVARCHAR(4000),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/customer_productreview/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_CusomerProductReview];



-- CREATE EXTERNAL TABLE [onprem_CustomerSellerReview]
-- (
--     ReviewID INT,
--     SellerID INT,
--     CustomerID INT,
--     Rating INT,
--     Review NVARCHAR(4000),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/customer_sellerreview/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_CustomerSellerReview];



-- CREATE EXTERNAL TABLE [onprem_Order]
-- (
--     OrderID INT,
--     PromotionProductID INT,
--     CustomerID INT,
--     Quantity INT,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/order/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_Order];



-- CREATE EXTERNAL TABLE [onprem_Product]
-- (
--     ProductID INT,
--     CategoryID INT,
--     ProductName NVARCHAR(4000),
--     Brand NVARCHAR(4000),
--     Specifications NVARCHAR(4000),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/product/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_Product];



-- CREATE EXTERNAL TABLE [onprem_ProductCategories]
-- (
--     CategoryID INT,
--     CategoryName NVARCHAR(4000),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/product_categories/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_ProductCategories];



-- CREATE EXTERNAL TABLE [onprem_ProductQuality]
-- (
--     ProductQualityID INT,
--     QualityType NVARCHAR(4000),
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/product_quality/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_ProductQuality];



-- CREATE EXTERNAL TABLE [onprem_Promotion]
-- (
--     PromotionID INT,
--     PromotionDescription NVARCHAR(4000),
--     DiscountPercentage FLOAT,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/promotion/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_Promotion];



-- CREATE EXTERNAL TABLE [onprem_Seller]
-- (
--     SellerID INT,
--     SellerName NVARCHAR(4000),
--     Email NVARCHAR(4000),
--     Phone NVARCHAR(4000),
--     AddressLine1 NVARCHAR(4000),
--     AddressLine2 NVARCHAR(4000),
--     City NVARCHAR(4000),
--     StateID INT,
--     PostalCode NVARCHAR(4000),
--     CountryID INT,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/seller/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_Seller];



-- CREATE EXTERNAL TABLE [onprem_SellerProductPromotion]
-- (
--     PromotionProductID INT,
--     ProductID INT,
--     SellerID INT,
--     ProductQualityID INT,
--     Price FLOAT,
--     PromotionID INT,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/seller_product_promotion/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_SellerProductPromotion];



-- CREATE EXTERNAL TABLE [onprem_StateProvinceRolling]
-- (
--     StateID INT,
--     StateName NVARCHAR(4000),
--     CountryID INT,
--     ingestion_timestamp DATETIME
-- )
-- WITH (
--     LOCATION = 'delta/onprem/state_province_rolling/',
--     DATA_SOURCE = [extdatasource_curated],
--     FILE_FORMAT = [ext_delta_format]
-- );

SELECT TOP 10 * FROM [onprem_StateProvinceRolling];



