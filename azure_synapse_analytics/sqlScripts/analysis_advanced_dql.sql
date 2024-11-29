-- Top 5 Products by Total Sales Revenue

SELECT TOP 5 p.Name AS ProductName, 
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfSales
FROM [azsqldb_Product] p
JOIN [azsqldb_SalesOrderDetail] sod ON p.ProductID = sod.ProductID
JOIN [azsqldb_SalesOrderHeader] soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE soh.Status = 5  -- 5 indicates completed orders
GROUP BY p.Name
ORDER BY TotalRevenue DESC;



-- Monthly Sales Analysis

SELECT YEAR(soh.OrderDate) AS SalesYear,
    MONTH(soh.OrderDate) AS SalesMonth,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(soh.TotalDue) AS TotalSales
FROM [azsqldb_SalesOrderHeader] soh
WHERE soh.OrderDate IS NOT NULL
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY SalesYear, SalesMonth;



-- Top Customers by Total Spending

SELECT TOP 10 c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    SUM(soh.TotalDue) AS TotalSpent
FROM [azsqldb_Customer] c
JOIN [azsqldb_SalesOrderHeader] soh ON c.CustomerID = soh.CustomerID
WHERE soh.Status = 5
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;



-- Products with High Discounts

SELECT p.Name AS ProductName,
    AVG(sod.UnitPriceDiscount) AS AvgDiscount,
    AVG(sod.UnitPrice) AS AvgUnitPrice,
    (AVG(sod.UnitPriceDiscount) / AVG(sod.UnitPrice)) * 100 AS DiscountPercentage
FROM [azsqldb_Product] p
JOIN [azsqldb_SalesOrderDetail] sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
HAVING (AVG(sod.UnitPriceDiscount)) > 0.20 -- Unit price discount above 20%
ORDER BY DiscountPercentage DESC;



-- Customer Purchase Patterns

-- Average Number of Products Purchased Per Customer Per Order

SELECT c.CustomerID,
    c.FirstName,
    c.LastName,
    AVG(sod.OrderQty) AS AvgProductsPerOrder
FROM [azsqldb_Customer] c
JOIN [azsqldb_SalesOrderHeader] soh ON c.CustomerID = soh.CustomerID
JOIN [azsqldb_SalesOrderDetail] sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE soh.Status = 5  -- 5 indicates completed orders
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY AvgProductsPerOrder DESC;



-- Product Availability Analaysis

-- Number of Products Out of Stock or Discontinued

SELECT COUNT(*) AS OutOfStockProducts,
    SUM(CASE WHEN p.DiscontinuedDate IS NOT NULL THEN 1 ELSE 0 END) AS DiscontinuedProducts
FROM [azsqldb_Product] p
WHERE p.SellEndDate < GETDATE() OR p.DiscontinuedDate IS NOT NULL;



-- Customer Retention Analysis

-- Customers Who Have Placed More Than 5 Orders
-- Currently There are None

SELECT c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(soh.SalesOrderID) AS TotalOrders
FROM [azsqldb_Customer] c
JOIN [azsqldb_SalesOrderHeader] soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(soh.SalesOrderID) > 5
ORDER BY TotalOrders DESC;



-- Running Total Sales Over Time

SELECT soh.OrderDate, 
       SUM(soh.TotalDue) OVER (ORDER BY soh.OrderDate) AS RunningTotalSales
FROM [azsqldb_SalesOrderHeader] soh
WHERE soh.OrderDate IS NOT NULL
ORDER BY soh.OrderDate;



-- Year-Over-Year Sales Growth

WITH SalesByYear AS (
    SELECT YEAR(OrderDate) AS SalesYear, 
        SUM(TotalDue) AS TotalSales
    FROM [azsqldb_SalesOrderHeader]
    WHERE OrderDate IS NOT NULL
    GROUP BY YEAR(OrderDate)
)
SELECT SalesYear, 
    TotalSales, 
    LAG(TotalSales, 1) OVER (ORDER BY SalesYear) AS LastYearSales,
    ((TotalSales - LAG(TotalSales, 1) OVER (ORDER BY SalesYear)) / LAG(TotalSales, 1) OVER (ORDER BY SalesYear)) * 100 AS SalesGrowthPercentage
FROM SalesByYear
ORDER BY SalesYear;


