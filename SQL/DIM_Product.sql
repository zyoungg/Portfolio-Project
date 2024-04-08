SELECT
  p.ProductKey,
  p.ProductAlternateKey AS ProductCode,
  p.EnglishProductName AS ProductName,
  ps.EnglishProductSubcategoryName AS [ProductSubcategory],
  pc.EnglishProductCategoryName AS [ProductCategory],
  [Color] AS [ProductColor],
  [Size],
  [Weight],
  [ProductLine],
  [StandardCost],
  [ListPrice],
  [DealerPrice],
  [EnglishDescription],
  ISNULL (p.[Status], 'Obsolete') as ProductStatus
FROM 
  [AdventureWorksDW2022].[dbo].[DimProduct] AS p
  LEFT JOIN AdventureWorksDW2022.dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  LEFT JOIN AdventureWorksDW2022.dbo.DimProductCategory AS pc ON pc.ProductCategoryKey = ps.ProductCategoryKey
ORDER BY
  p.ProductKey asc

 -- [WeightUnitMeasureCode],
  --[SizeUnitMeasureCode],
  --[SpanishProductName],
  --[FrenchProductName],
  --[FinishedGoodsFlag],
  --[SafetyStockLevel],
  --[ReorderPoint],
  --[SizeRange],
  --[DaysToManufacture],
  --[Class],
  --[Style],
  --[ModelName],
  --[LargePhoto],
  --[FrenchDescription],
  --[ChineseDescription],
  --[ArabicDescription],
  --[HebrewDescription],
  --[ThaiDescription],
  --[GermanDescription],
  --[JapaneseDescription],
  --[TurkishDescription],
  --[StartDate],
  --[EndDate],
