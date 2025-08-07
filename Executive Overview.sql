CREATE DATABASE smart_vehicle_project;
SELECT * FROM [dbo].[SMVP];

ALTER TABLE [dbo].[SMVP]
DROP COLUMN S_NO;
GO

ALTER TABLE [dbo].[SMVP]
ADD S_NO BIGINT IDENTITY(1,1); 
GO

ALTER TABLE [dbo].[SMVP]
DROP COLUMN REGISTRATION_OFFCIE;

SELECT COUNT(*) AS Total_Records FROM SMVP;

-- EXECUTIVE OVERVIEW
-- 1. Total Registrations
SELECT COUNT(*) AS Total_Registrations FROM dbo.SMVP;

-- 2. EV Penetration %
SELECT 
  ROUND(SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS EV_Percentage
FROM dbo.SMVP;

-- 3. Top District by Registrations
SELECT TOP 1 District, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY District
ORDER BY Total DESC;

-- 4. Top Brand
SELECT TOP 1 Brand, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY Brand
ORDER BY Total DESC;

-- 5. Line Chart: Monthly Registration Trend


SELECT 
  FORMAT([REGISTRATION_DATE], 'yyyy-MM') AS Month,
  COUNT(*) AS Registrations
FROM dbo.SMVP
GROUP BY FORMAT([REGISTRATION_DATE], 'yyyy-MM')
ORDER BY Month;

-- Pie Chart: 6. EV vs Traditional Vehicles

SELECT Fuel_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY Fuel_Category;
