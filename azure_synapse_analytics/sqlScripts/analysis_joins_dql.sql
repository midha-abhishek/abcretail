-- Total Sales Revenue by Seller and Product

SELECT TOP 10 s.SellerName, p.ProductName, SUM(sp.Price) AS TotalRevenue
FROM [onprem_Seller] s
JOIN [onprem_SellerProductPromotion] sp ON s.SellerID = sp.SellerID
JOIN [onprem_Product] p ON sp.ProductID = p.ProductID
GROUP BY s.SellerName, p.ProductName
ORDER BY TotalRevenue DESC;



-- Top 5 Customers by Total Order Amount

SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpent
FROM [onprem_Customer] c
JOIN [azsqldb_SalesOrderHeader] soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;



-- Products and Their Associated Promotions

SELECT TOP 10 p.ProductName, p.Brand, pr.PromotionDescription, sp.Price, pr.DiscountPercentage
FROM [onprem_Product] p
JOIN [onprem_SellerProductPromotion] sp ON p.ProductID = sp.ProductID
JOIN [onprem_Promotion] pr ON sp.PromotionID = pr.PromotionID
ORDER BY p.ProductName;



-- Products and Reviews Analysis

SELECT TOP 10 p.ProductName, AVG(cr.Rating) AS AvgRating, COUNT(cr.ReviewID) AS ReviewCount
FROM [onprem_Product] p
JOIN [onprem_CusomerProductReview] cr ON p.ProductID = cr.ProductID
GROUP BY p.ProductName
ORDER BY AvgRating DESC;



-- Orders with Customer Details

SELECT TOP 10 soh.SalesOrderID, c.FirstName, c.LastName, soh.OrderDate, soh.TotalDue
FROM [azsqldb_SalesOrderHeader] soh
JOIN [azsqldb_Customer] c ON soh.CustomerID = c.CustomerID
ORDER BY soh.OrderDate DESC;



-- Count of Products Sold by Category

SELECT TOP 10 pc.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM [onprem_ProductCategories] pc
JOIN [onprem_Product] p ON pc.CategoryID = p.CategoryID
GROUP BY pc.CategoryName
ORDER BY ProductCount DESC;



-- Customer Reviews by State/Province

SELECT TOP 5 sp.StateName, COUNT(cr.ReviewID) AS ReviewCount
FROM [onprem_CusomerProductReview] cr
JOIN [onprem_Customer] c ON cr.CustomerID = c.CustomerID
JOIN [onprem_StateProvinceRolling] sp ON c.StateID = sp.StateID
GROUP BY sp.StateName
ORDER BY ReviewCount DESC;



-- Sales Orders with Detailed Product Information

SELECT TOP 10 soh.SalesOrderID, p.Name, sod.OrderQty, sod.UnitPrice, sod.LineTotal
FROM [azsqldb_SalesOrderHeader] soh
JOIN [azsqldb_SalesOrderDetail] sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN [azsqldb_Product] p ON sod.ProductID = p.ProductID
ORDER BY soh.SalesOrderID;



-- Total Revenue by Product Category and Promotion

SELECT TOP 5 pc.CategoryName, pr.PromotionDescription, SUM(sp.Price) AS TotalRevenue
FROM [onprem_SellerProductPromotion] sp
JOIN [onprem_Product] p ON sp.ProductID = p.ProductID
JOIN [onprem_ProductCategories] pc ON p.CategoryID = pc.CategoryID
JOIN [onprem_Promotion] pr ON sp.PromotionID = pr.PromotionID
GROUP BY pc.CategoryName, pr.PromotionDescription
ORDER BY TotalRevenue DESC;



-- Product Quality and Seller Analysis

SELECT TOP 10 pq.QualityType, s.SellerName, AVG(sp.Price) AS AvgPrice
FROM [onprem_ProductQuality] pq
JOIN [onprem_SellerProductPromotion] sp ON pq.ProductQualityID = sp.ProductQualityID
JOIN [onprem_Seller] s ON sp.SellerID = s.SellerID
GROUP BY pq.QualityType, s.SellerName
ORDER BY AvgPrice DESC;



