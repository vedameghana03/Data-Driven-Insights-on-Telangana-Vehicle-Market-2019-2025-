USE DataDB
SELECT TOP 10 * FROM [dbo].[SMVP];

-- Column names
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SMVP';


SELECT COUNT(*) FROM [dbo].[SMVP];

--1. FUEL_TYPE

SELECT Fuel_Category, COUNT(*) AS total
FROM [dbo].[SMVP]
GROUP BY Fuel_Category;

SELECT 
COUNT(Fuel_Type) AS NonNull_Fuel_Count,
COUNT(DISTINCT Fuel_Type) AS Unique_Fuel_Types,
  MAX(Fuel_Type) AS Max_Fuel,
  MIN(Fuel_Type) AS Min_Fuel
FROM dbo.SMVP;

-- Vehicle class wise distribution
SELECT Vehicle_Class_Category, COUNT(*) AS count
FROM dbo.SMVP
GROUP BY Vehicle_Class_Category
ORDER BY count DESC;

-- Top 5 Brands
SELECT TOP 5 BRAND, COUNT(*) AS count
FROM dbo.SMVP
GROUP BY BRAND
ORDER BY count DESC

-- District, zone- Based analysis
SELECT TOP 5 District, COUNT(*) AS registrations
FROM dbo.SMVP
GROUP BY District
ORDER BY registrations DESC;

SELECT TOP 5 Zone, COUNT(*) AS registrations
FROM dbo.SMVP
GROUP BY Zone
ORDER BY registrations DESC;


-- EV registration by district
SELECT District, COUNT(*) AS ev_count
FROM dbo.SMVP
WHERE Fuel_Category = 'EV'
GROUP BY District
ORDER BY ev_count DESC;


-- Monthly Registration Trends
SELECT
 FORMAT(Registration_Start_Date, 'yyyy-MM') AS Month,
 COUNT(*) AS Total_Registrations
FROM dbo.SMVP
GROUP BY FORMAT(Registration_Start_Date, 'yyyy-MM')
ORDER BY Month;

-- FUEL PREF OVER TIME 
SELECT 
  FORMAT(Registration_Start_Date, 'yyyy-MM') AS Month,
  Fuel_Category,
  COUNT(*) AS Count
FROM dbo.SMVP
GROUP BY FORMAT(Registration_Start_Date, 'yyyy-MM'), Fuel_Category
ORDER BY Month, Count DESC;

-- Vehicle Type Preference based on brand
SELECT 
BRAND, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY BRAND
ORDER BY Total DESC;

-- TOP EV BRANDS
SELECT TOP 10 
BRAND, COUNT(*) AS EV_Registrations
FROM dbo.SMVP
WHERE Fuel_Category = 'EV'
GROUP BY BRAND
ORDER BY EV_Registrations DESC;

-- EV PENETRATION BY DISTRICT
SELECT 
  District,
  COUNT(*) AS Total_Registrations,
  SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) AS EV_Registrations,
  ROUND(
    CAST(SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) * 100.0 
         / COUNT(*) AS decimal(5,2)), 2
  ) AS EV_Penetration_Percent
FROM dbo.SMVP
GROUP BY District
ORDER BY EV_Penetration_Percent DESC;

-- AVERAGE SEAT CAPACITY
SELECT 
  Vehicle_Class_Category,
  AVG(Seat_Capacity) AS Avg_Seats
FROM dbo.SMVP
GROUP BY Vehicle_Class_Category
ORDER BY Avg_Seats DESC;

-- TOP brands by fuel type
SELECT
BRAND,
Fuel_Category,
COUNT(*) AS Count
FROM dbo.SMVP
GROUP BY BRAND, Fuel_Category
ORDER BY Count DESC;

-- District wise Traditional vs EV vs Hybrid
SELECT 
District,
Fuel_Category,
COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY District, Fuel_Category
ORDER BY District;




