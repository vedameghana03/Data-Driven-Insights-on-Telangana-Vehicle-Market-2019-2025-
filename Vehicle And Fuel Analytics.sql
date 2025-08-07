-- VEHICLE AND FUEL ANALYTICS

-- 1. Fuel category by District
SELECT District, Fuel_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY District, FUEL_CATEGORY
ORDER BY DISTRICT

-- 2. Vehicle Class Category by fuel
SELECT Vehicle_Class_Category, Fuel_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY Vehicle_Class_Category, Fuel_Category
ORDER BY VEHICLE_CLASS_CATEGORY;

-- 3. Vehicle Class share
SELECT Vehicle_Class_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY Vehicle_Class_Category;

-- 4. Top 3 Brands with EV Share %
SELECT TOP 10 
    BRAND,
    COUNT(*) AS TotalRegistrations,
    SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) AS EV_Units,
    CAST(SUM(CASE WHEN Fuel_Category = 'EV' THEN 1 ELSE 0 END) AS DECIMAL(10,2)) * 100.0 / COUNT(*) AS EV_Share_Percentage
FROM dbo.SMVP
GROUP BY BRAND
ORDER BY EV_Share_Percentage DESC, TotalRegistrations DESC;

-- 5. Heatmap: District vs Vehicle Class
SELECT District, Vehicle_Class_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY District, Vehicle_Class_Category;