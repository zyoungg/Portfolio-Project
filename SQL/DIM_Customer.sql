SELECT
  c.CustomerKey,
  c.FirstName,
  c.LastName,
  c.BirthDate,
  CASE c.MaritalStatus 
    WHEN 'M' THEN 'Married' 
    WHEN 'S' THEN 'Single' 
	END AS MaritalStatus,
  CASE c.Gender
    WHEN 'M' THEN 'Male'
	WHEN 'F' THEN 'Female'
	END AS Gender,
  c.DateFirstPurchase,
  g.City
FROM 
  [AdventureWorksDW2022].[dbo].[DimCustomer] as c
JOIN -- Join 'City' from Geography table
  AdventureWorksDW2022.dbo.DimGeography AS g
    ON g.GeographyKey = c.GeographyKey
ORDER BY
  CustomerKey ASC

 /* Fields from Customer Table
  --[MiddleName],
  --[Suffix],
  --[GeographyKey],
  --[CustomerAlternateKey],
  --[Title],
  --[NameStyle],
  --[EmailAddress],
  --[YearlyIncome],
  --[TotalChildren],
  --[NumberChildrenAtHome],
  --[EnglishEducation],
  --[SpanishEducation],
  --[FrenchEducation],
  --[EnglishOccupation],
  --[SpanishOccupation],
  --[FrenchOccupation],
  --[HouseOwnerFlag],
  --[NumberCarsOwned],
  --[AddressLine1],
  --[AddressLine2],
  --[Phone],
  --[CommuteDistance]
  */