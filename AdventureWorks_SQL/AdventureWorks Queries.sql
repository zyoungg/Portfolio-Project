--Date Table
SELECT
  DateKey,
  CalendarYear AS Year,
  CalendarQuarter AS Quarter,
  EnglishMonthName AS Month,
  DayNumberOfMonth AS Day
FROM 
  AdventureWorksDW2022.dbo.DimDate
WHERE 
  CalendarYear BETWEEN 2021 AND 2023;

--Product Table
SELECT 
  ProductKey,
  ProductAlternateKey,
  ps.ProductSubcategoryKey,
  ps.ProductCategoryKey,
  ISNULL (pc.EnglishProductCategoryName, 'Other') AS Category,
  ps.EnglishProductSubcategoryName AS Subcategory,
  EnglishProductName,
  ISNULL ([Status], 'Obsolete') AS ProductStatus
FROM
  AdventureWorksDW2022.dbo.DimProduct p
JOIN AdventureWorksDW2022.dbo.DimProductSubcategory ps
  ON ps.ProductCategoryKey = p.ProductSubcategoryKey
JOIN AdventureWorksDW2022.dbo.DimProductCategory pc
  ON pc.ProductCategoryKey = ps.ProductCategoryKey

--Customer Table
SELECT
  CustomerKey,
  g.GeographyKey,
  FirstName,
  LastName,
  DATEDIFF(Year, BirthDate, GETDATE()) AS Age,
  CASE MaritalStatus WHEN 'M' THEN 'Married' WHEN 'S' THEN 'Single' END AS MaritalStatus,
  CASE Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
  YearlyIncome AS Salary,
  City,
  StateProvinceName AS State,
  EnglishCountryRegionName AS Country,
  SalesTerritoryKey
FROM
  AdventureWorksDW2022.dbo.DimCustomer c
JOIN AdventureWorksDW2022.dbo.DimGeography g
  ON g.GeographyKey = c.GeographyKey

--InternetSales Table
SELECT
  ProductKey,
  OrderDateKey,
  CustomerKey,
  p.PromotionKey,
  SalesTerritoryKey,
  SalesOrderNumber,
  SalesAmount,
  EnglishPromotionName,
  DiscountPct,
  EnglishPromotionCategory
FROM
  AdventureWorksDW2022.dbo.FactInternetSales s
JOIN AdventureWorksDW2022.dbo.DimPromotion p
  ON p.PromotionKey = s.PromotionKey
