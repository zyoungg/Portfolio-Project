SELECT
  [ProductKey],
  [SalesOrderNumber],
  [OrderQuantity],
  [SalesAmount],
  [OrderDateKey],
  [DueDateKey],
  [ShipDateKey],
  [CustomerKey]
FROM 
  [AdventureWorksDW2022].[dbo].[FactInternetSales]
WHERE 
  LEFT(OrderDateKey, 4) >= YEAR(GETDATE())-2 --To extract only the data from recent 2 years
ORDER BY 
  ProductKey

  /* Fields from 'FactInternetSales' Table
  --[UnitPrice],
  --[PromotionKey],
  --[CurrencyKey],
  --[SalesTerritoryKey],
  --[SalesOrderLineNumber],
  --[RevisionNumber],
  --[OrderQuantity],
  --[ExtendedAmount],
  --[UnitPriceDiscountPct],
  --[DiscountAmount],
  --[ProductStandardCost],
  --[TotalProductCost],
  --[TaxAmt],
  --[Freight],
  --[CarrierTrackingNumber],
  --[CustomerPONumber],
  --[OrderDate],
  --[DueDate],
  --[ShipDate]
  */
