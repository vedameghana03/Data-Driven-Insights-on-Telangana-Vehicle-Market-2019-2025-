SELECT * FROM [dbo].[EV CLEAN DATASET]

-- Top 10 most registered brands
SELECT TOP 10 BRAND,
COUNT(*) AS TotalRegistrations
FROM [dbo].[EV CLEAN DATASET]
GROUP BY BRAND
ORDER BY TotalRegistrations DESC;

-- Top 5 most popular colors
SELECT TOP 5 COLOR,
COUNT(*) AS TotalRegistrations
FROM [dbo].[EV CLEAN DATASET]
GROUP BY COLOR
ORDER BY TotalRegistrations DESC;

-- EV Registrations per district, showing top 10
SELECT TOP 10 DISTRICT,
COUNT(*) AS TotalRegistrations
FROM [dbo].[EV CLEAN DATASET]
GROUP BY DISTRICT
ORDER BY TotalRegistrations DESC;

-- Monthly registrations to see trends (combining Year and Month)
-- This assumes a column 'REG_DATE' or similar is available.
-- You can use YEAR and MONTH columns to create a chronological order.
SELECT YEAR, MONTH,
COUNT(*) AS TotalRegistrations
FROM [dbo].[EV CLEAN DATASET]
GROUP BY YEAR, MONTH
ORDER BY YEAR ASC,
    -- Case statement to sort months chronologically, not alphabetically
    CASE MONTH
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END ASC;

-- Market share by brand (overall)
-- This requires a subquery or a CTE to get the total count
WITH BrandRegistrations AS (
    SELECT
        BRAND,
        COUNT(*) AS BrandCount
    FROM
        [dbo].[EV CLEAN DATASET]
    GROUP BY
        BRAND
),
TotalRegistrations AS (
    SELECT
        COUNT(*) AS TotalCount
    FROM
        [dbo].[EV CLEAN DATASET]
)
SELECT
    br.BRAND,
    br.BrandCount,
    CAST(br.BrandCount * 100.0 / tr.TotalCount AS DECIMAL(5,2)) AS MarketSharePercentage
FROM
    BrandRegistrations br,
    TotalRegistrations tr
ORDER BY
    MarketSharePercentage DESC;

    -- Registrations by vehicle class
SELECT
    VEHICLE_CLASS_CATEGORY,
    COUNT(*) AS TotalRegistrations
FROM
    [dbo].[EV CLEAN DATASET]
GROUP BY
    VEHICLE_CLASS_CATEGORY
ORDER BY
    TotalRegistrations DESC;