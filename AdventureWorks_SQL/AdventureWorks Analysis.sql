-- Monthly Sales Trend
SELECT
  DATEPART(MONTH, OrderDate) AS Month,
  SUM(SalesAmount) AS TotalSales
FROM
  AdventureWorksDW2022.dbo.FactInternetSales
WHERE 
  DATEPART(YEAR, OrderDate) = 2023
GROUP BY
  DATEPART(MONTH, OrderDate)
ORDER BY
 Month;


-- Customer Segment
--
SELECT
  c.CustomerKey,
  c.FirstName + ' ' + c.LastName AS CustomerName,
  COUNT(s.SalesOrderNumber) AS OrderCount,
  SUM(s.SalesAmount) AS CustomerTotalSpent
FROM
  AdventureWorksDW2022.dbo.FactInternetSales s
LEFT JOIN 
  AdventureWorksDW2022.dbo.DimCustomer c
  ON s.CustomerKey = c.CustomerKey
GROUP BY
  c.CustomerKey,
  c.FirstName, c.LastName
ORDER BY
  CustomerTotalSpent DESC;


--Product Analysis
/*Best Selling Products in terms of order qty and sales*/
SELECT
  ps.EnglishProductSubcategoryName AS ProductSubcategory,
  p.EnglishProductName AS ProductName,
  COUNT(s.SalesOrderNumber) AS TotalUnitsSold,
  SUM(s.SalesAmount) AS TotalSales
FROM 
  AdventureWorksDW2022.dbo.DimProduct p
LEFT JOIN
  AdventureWorksDW2022.dbo.DimProductSubcategory ps
  ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT JOIN
  AdventureWorksDW2022.dbo.FactInternetSales s
  ON p.ProductKey = s.ProductKey
WHERE
  SalesAmount IS NOT NULL
GROUP BY 
  ps.EnglishProductSubcategoryName,
  p.EnglishProductName
ORDER BY
  TotalSales DESC;
