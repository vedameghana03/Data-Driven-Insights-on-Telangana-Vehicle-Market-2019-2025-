-- BRAND INSIGHTS

-- 1. Top 10 BRANDS
SELECT TOP 10 Brand, COUNT(*) AS Registrations
FROM dbo.SMVP
GROUP BY Brand
ORDER BY Registrations DESC;

-- 2. Brand-wise Fuel Split
SELECT Brand, Fuel_Category, COUNT(*) AS Total
FROM dbo.SMVP
GROUP BY Brand, Fuel_Category
ORDER BY FUEL_CATEGORY;

-- 3. Top EV Brands
SELECT TOP 10 Brand, COUNT(*) AS EV_Count
FROM dbo.SMVP
WHERE Fuel_Category = 'EV'
GROUP BY Brand
ORDER BY EV_Count DESC;

-- 4. 
SELECT DISTINCT Brand, Vehicle_Class_Category
FROM dbo.SMVP;

--5. Avg Vehicle Age by Brand
SELECT Brand, AVG(Vehicle_Age) AS Avg_Age FROM dbo.SMVP GROUP BY Brand;

-- 6.Most Common Seat Capacity	
SELECT Seat_Capacity, COUNT(*) AS Count FROM dbo.SMVP GROUP BY Seat_Capacity ORDER BY Count DESC;