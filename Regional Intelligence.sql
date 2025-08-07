-- Regional Intelligence

-- 1. Telangana RTO-wise Density
SELECT [REGISTRATION_OFFICE], COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY [REGISTRATION_OFFICE];

-- 2. Heatmap: EV Penetration by District
SELECT District,
  COUNT(*) AS Total,
  SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) AS EV_Units,
  ROUND(SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS EV_Percent
FROM dbo.SMVP
GROUP BY District
ORDER BY EV_Percent DESC;

-- 3. Heatmap: EV Penetration by Zone
SELECT ZONE,
  COUNT(*) AS Total,
  SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) AS EV_Units,
  ROUND(SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS EV_Percent
FROM dbo.SMVP
GROUP BY ZONE
ORDER BY EV_Percent DESC;

-- 4. RTO Office Performance
SELECT [REGISTRATION_OFFICE], COUNT(*) AS Registrations
FROM dbo.SMVP
GROUP BY [REGISTRATION_OFFICE]
ORDER BY Registrations DESC;

-- 5. Zone-wise Vehicle Class Split
SELECT Zone, Vehicle_Class_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY Zone, Vehicle_Class_Category;

-- 6. District-wise Vehicle Class Split
SELECT DISTRICT, Vehicle_Class_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY DISTRICT, Vehicle_Class_Category;


SELECT 
  FORMAT([REGISTRATION_DATE], 'yyyy-MM') AS Month,
  COUNT(*) AS Total_Registrations
FROM dbo.SMVP
GROUP BY FORMAT([REGISTRATION_DATE], 'yyyy-MM')
ORDER BY Month;


