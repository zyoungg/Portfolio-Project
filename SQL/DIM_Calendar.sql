SELECT
  [DateKey],
  [FullDateAlternateKey] AS Date,
--[DayNumberOfWeek],
  [EnglishDayNameOfWeek] AS Day,
--[SpanishDayNameOfWeek],
--[FrenchDayNameOfWeek],
--[DayNumberOfMonth],
--[DayNumberOfYear],
  [WeekNumberOfYear] AS WeekNum,
  [EnglishMonthName] AS Month,
--[SpanishMonthName],
--[FrenchMonthName],
  [MonthNumberOfYear] AS MonthNum,
  [CalendarQuarter] As Quarter,
  [CalendarYear] AS Year
--[CalendarSemester],
--[FiscalQuarter],
--[FiscalYear],
--[FiscalSemester]
FROM 
  [AdventureWorksDW2022].[dbo].[DimDate]
WHERE
  CalendarYear >= 2020
