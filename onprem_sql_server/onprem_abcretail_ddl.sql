--CREATE TABLE ProductCategories (
--   CategoryID INT IDENTITY(1,1) PRIMARY KEY,
--   CategoryName NVARCHAR(100) NOT NULL
--);

--INSERT INTO ProductCategories (CategoryName)
--VALUES ('Books'), ('Electronics'), ('Clothing'), ('Furniture'), ('Toys'), ('Sports');

SELECT * FROM ProductCategories;

--CREATE TABLE Product (
--   ProductID INT IDENTITY(1,1) PRIMARY KEY,
--   CategoryID INT FOREIGN KEY REFERENCES ProductCategories(CategoryID),
--   ProductName NVARCHAR(100) NOT NULL,
--   Brand NVARCHAR(100),
--   Specifications NVARCHAR(MAX) -- Optional JSON column for specific details
--);

--INSERT INTO Product (CategoryID, ProductName, Brand, Specifications)
--VALUES
--   (2, 'Smartphone', 'TechBrand', '{"screen_size": "6.5 inches", "battery": "4000 mAh"}'),
--   (2, 'Laptop', 'CompBrand', '{"processor": "Intel i7", "ram": "16GB", "storage": "512GB SSD"}'),
--   (3, 'T-Shirt', 'FashionWear', '{"sizes": ["S", "M", "L"], "colors": ["Red", "Blue", "Black"]}'),
--   (4, 'Dining Table', 'HomeStyle', '{"material": "Wood", "seating_capacity": 6}'),
--   (5, 'Action Figure', 'ToyCo', '{"height": "12 inches", "material": "Plastic"}'),
--   (6, 'Football', 'SportsCo', '{"size": 5, "material": "Leather"}');

SELECT	* FROM Product;

--CREATE TABLE ProductQuality (
--   ProductQualityID INT IDENTITY(1,1) PRIMARY KEY,
--   QualityType NVARCHAR(50) NOT NULL
--);

--INSERT INTO ProductQuality (QualityType)
--VALUES ('New'), ('Used'), ('Like New'), ('Refurbished (Good)'), ('Refurbished (Acceptable)');

SELECT * FROM ProductQuality;

--CREATE TABLE CountryRolling (
--   CountryID INT IDENTITY(1,1) PRIMARY KEY,
--   CountryName NVARCHAR(100) NOT NULL
--);

--INSERT INTO CountryRolling (CountryName)
--VALUES ('Canada'), ('United States');

SELECT * FROM CountryRolling;

--CREATE TABLE StateProvinceRolling (
--   StateID INT IDENTITY(1,1) PRIMARY KEY,
--   StateName NVARCHAR(100) NOT NULL,
--   CountryID INT FOREIGN KEY REFERENCES CountryRolling(CountryID)
--);

--INSERT INTO StateProvinceRolling (StateName, CountryID)
--VALUES
--   ('Ontario', 1), ('British Columbia', 1), ('New York', 2), ('California', 2);

SELECT * FROM StateProvinceRolling;

--CREATE TABLE Customer (
--   CustomerID INT IDENTITY(1,1) PRIMARY KEY,
--   FirstName NVARCHAR(50),
--   LastName NVARCHAR(50),
--   Email NVARCHAR(100),
--   Phone NVARCHAR(15),
--   AddressLine1 NVARCHAR(200),
--   AddressLine2 NVARCHAR(200),
--   City NVARCHAR(100),
--   StateID INT FOREIGN KEY REFERENCES StateProvinceRolling(StateID),
--   PostalCode NVARCHAR(20),
--   CountryID INT FOREIGN KEY REFERENCES CountryRolling(CountryID)
--);

--INSERT INTO Customer (FirstName, LastName, Email, Phone, AddressLine1, AddressLine2, City, StateID, PostalCode, CountryID)
--VALUES
--   ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', '', 'Toronto', 1, 'M5H 2N2', 1),
--   ('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Elm St', '', 'Los Angeles', 4, '90001', 2);

SELECT * FROM Customer;

--CREATE TABLE Seller (
--   SellerID INT IDENTITY(1,1) PRIMARY KEY,
--   SellerName NVARCHAR(100),
--   Email NVARCHAR(100),
--   Phone NVARCHAR(15),
--   AddressLine1 NVARCHAR(200),
--   AddressLine2 NVARCHAR(200),
--   City NVARCHAR(100),
--   StateID INT FOREIGN KEY REFERENCES StateProvinceRolling(StateID),
--   PostalCode NVARCHAR(20),
--   CountryID INT FOREIGN KEY REFERENCES CountryRolling(CountryID)
--);

--INSERT INTO Seller (SellerName, Email, Phone, AddressLine1, AddressLine2, City, StateID, PostalCode, CountryID)
--VALUES
--   ('ElectroWorld', 'contact@electroworld.com', '1234567890', '789 Tech Park', '', 'New York', 3, '10001', 2),
--   ('FashionHub', 'support@fashionhub.com', '0987654321', '321 Market Street', '', 'Vancouver', 2, 'V6B 1A1', 1);

SELECT * FROm Seller;

--CREATE TABLE CustomerSellerReview (
--   ReviewID INT IDENTITY(1,1) PRIMARY KEY,
--   SellerID INT FOREIGN KEY REFERENCES Seller(SellerID),
--   CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
--   Rating INT CHECK (Rating BETWEEN 1 AND 5),
--   Review NVARCHAR(MAX)
--);

--INSERT INTO CustomerSellerReview (SellerID, CustomerID, Rating, Review)
--VALUES
--   (1, 1, 5, 'Great service and fast delivery!'),
--   (2, 2, 4, 'Good quality products.');

SELECT * FROM CustomerSellerReview;

--CREATE TABLE CustomerProductReview (
--   ReviewID INT IDENTITY(1,1) PRIMARY KEY,
--   ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
--   CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
--   Rating INT CHECK (Rating BETWEEN 1 AND 5),
--   Review NVARCHAR(MAX)
--);

--INSERT INTO CustomerProductReview (ProductID, CustomerID, Rating, Review)
--VALUES
--   (1, 1, 5, 'The smartphone is excellent!'),
--   (2, 2, 4, 'Laptop performance is good but battery life could be better.');

SELECT * FROM CustomerProductReview;

--CREATE TABLE Promotion (
--   PromotionID INT IDENTITY(1,1) PRIMARY KEY,
--   PromotionDescription NVARCHAR(200),
--   DiscountPercentage DECIMAL(5,2)
--);

--INSERT INTO Promotion (PromotionDescription, DiscountPercentage)
--VALUES
--   ('Black Friday Sale', 20.00),
--   ('Holiday Discount', 15.00);

SELECT * FROM Promotion;

--CREATE TABLE SellerProductPromotion (
--   PromotionProductID INT IDENTITY(1,1) PRIMARY KEY,
--   ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
--   SellerID INT FOREIGN KEY REFERENCES Seller(SellerID),
--   ProductQualityID INT FOREIGN KEY REFERENCES ProductQuality(ProductQualityID),
--   Price DECIMAL(10,2),
--   PromotionID INT FOREIGN KEY REFERENCES Promotion(PromotionID)
--);

--INSERT INTO SellerProductPromotion (ProductID, SellerID, ProductQualityID, Price, PromotionID)
--VALUES
--   (1, 1, 1, 699.99, 1),
--   (3, 2, 1, 19.99, 2);

SELECT * FROM SellerProductPromotion;

--CREATE TABLE [Order] (
--   OrderID INT IDENTITY(1,1) PRIMARY KEY,
--   PromotionProductID INT FOREIGN KEY REFERENCES SellerProductPromotion(PromotionProductID),
--   CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
--   Quantity INT
--);

--INSERT INTO [Order] (PromotionProductID, CustomerID, Quantity)
--VALUES
--   (1, 1, 2),
--   (2, 2, 3);

Select * FROM [Order];

