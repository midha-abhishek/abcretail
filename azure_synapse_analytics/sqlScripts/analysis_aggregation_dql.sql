-- Count of Softline Products by Category

SELECT Category, COUNT(*) AS ProductCount
FROM (
    SELECT Category FROM [http_Accessories]
    UNION ALL
    SELECT Category FROM [http_Clothing]
    UNION ALL
    SELECT Category FROM [http_Footwear]
) AS AllProducts
GROUP BY Category
ORDER BY ProductCount DESC;



-- Top 5 Sellers by Sales Revenue

SELECT TOP 5 s.SellerName, SUM(sp.Price) AS TotalRevenue
FROM [onprem_SellerProductPromotion] sp
JOIN [onprem_Seller] s ON sp.SellerID = s.SellerID
GROUP BY s.SellerName
ORDER BY TotalRevenue DESC;



-- Average Softline Product Price by Category

SELECT Category, AVG(Price) AS AveragePrice
FROM [http_Products]
GROUP BY Category
ORDER BY AveragePrice DESC;



-- Customer Product Review Analysis

-- Average Product Rating

SELECT TOP 10 ProductID, AVG(Rating) AS AverageRating, COUNT(*) AS ReviewCount
FROM [onprem_CusomerProductReview]
GROUP BY ProductID
ORDER BY AverageRating DESC;

-- Products with Most Reviews

SELECT TOP 5 ProductID, COUNT(*) AS ReviewCount
FROM [onprem_CusomerProductReview]
GROUP BY ProductID
ORDER BY ReviewCount DESC;



-- Top 5 States/Provinces by Number of Customers

SELECT TOP 5 sp.StateName, COUNT(c.CustomerID) AS CustomerCount
FROM [onprem_Customer] c
JOIN [onprem_StateProvinceRolling] sp ON c.StateID = sp.StateID
GROUP BY sp.StateName
ORDER BY CustomerCount DESC;



-- Sales Order Analysis

-- Total Revenue per Order

SELECT TOP 10 soh.SalesOrderID, SUM(sod.LineTotal) AS TotalOrderRevenue
FROM [azsqldb_SalesOrderHeader] soh
JOIN [azsqldb_SalesOrderDetail] sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.SalesOrderID
ORDER BY TotalOrderRevenue DESC;



-- Product Quality Analysis

-- List of Product Quality Types and the Number of Products

SELECT pq.QualityType, COUNT(sp.PromotionProductID) AS ProductCount
FROM [onprem_ProductQuality] pq
JOIN [onprem_SellerProductPromotion] sp ON sp.ProductQualityID = pq.ProductQualityID
GROUP BY pq.QualityType
ORDER BY ProductCount DESC;



-- Promotion and Discount Analysis

-- Highest Discount Promotions and Number of Products Involved

SELECT TOP 5 p.PromotionID, p.PromotionDescription, AVG(p.DiscountPercentage) AS AvgDiscountPercentage, COUNT(sp.PromotionProductID) AS ProductCount
FROM [onprem_Promotion] p
JOIN [onprem_SellerProductPromotion] sp ON p.PromotionID = sp.PromotionID
GROUP BY p.PromotionID, p.PromotionDescription
ORDER BY AvgDiscountPercentage DESC;



-- Product Categories with Highest Sales Revenue

SELECT TOP 5 p.ProductCategoryID, SUM(sod.LineTotal) AS TotalSalesRevenue
FROM [azsqldb_Product] p
JOIN [azsqldb_SalesOrderDetail] sod ON p.ProductID = sod.ProductID
GROUP BY p.ProductCategoryID
ORDER BY TotalSalesRevenue DESC;


