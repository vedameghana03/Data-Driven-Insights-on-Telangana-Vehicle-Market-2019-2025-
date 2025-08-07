# Data-Driven-Insights-on-Telangana-Vehicle-Market-2019-2025-
🚗 Data-Driven Insights on Telangana Vehicle Market (2019–2025)
🔍 A comprehensive analysis of vehicle registration trends in Telangana, with a focused lens on the growth and future of Electric Vehicles (EVs).
📌 Project Overview
👩‍💻 Author: Veda Meghana
🗓️ Timeline Covered: January 2019 – June 2025
📂 Data Source: Telangana Road Transport Authority (RTA)
🛠️ Tools Used: Excel, Python, SQL, Power BI, Machine Learning
🎯 Focus: EV market trends, geographic spread, and predictive modeling

🔄 Project Workflow
✅ Phase 1: Overall Vehicle Data (2019)
Performed EDA on complete 2019 dataset
Analyzed fuel types, vehicle classes, brands, districts, and zones
Built interactive Power BI Dashboard for 2019 trends

✅ Phase 2: Electric Vehicles (EVs) Focus (2019–2025)
Filtered for Fuel = Battery to isolate EVs
Standardized brand names, color, district info
Created derived fields like vehicle class category and registration year/month
Built an EV-specific Power BI Dashboard

✅ Phase 3: EV Forecasting Using Machine Learning
Model 1: Linear Regression – Year-wise EV prediction (2025 & 2026)
Model 2: Random Forest – Monthly EV forecast (Jul 2025 to Dec 2026)
Model 3: Linear Regression – District-wise EV forecast for 2026

🧹 Data Preparation & Cleaning
--> Raw Dataset Fields (Before Cleaning)
S.No, Model Description, Fuel, Colour, Vehicle Class, Maker Name, Make Year, Seat Capacity, Second Vehicle, Temporary Reg No., Category, Office Code, From Date, End Date

--> Cleaned Dataset
Retained and transformed:
Fuel, Fuel Category, Vehicle Class Category, Manufacture Date, Brand, District, Zone, Reg Date, Month, Year

-->Removed redundant/inconsistent fields like:
Model Description, Colour, To Date, Category, Temp Reg Number, Second Vehicle

📊 EDA Highlights – 2019
Data Length: 21.3 lakh records
Fuel Categories: Dominated by Traditional (Petrol/Diesel); EVs = 0.11%
Vehicle Class: 86% Private, 13.5% Commercial
Top 5 Districts: Nizamabad, Medchal, Rangareddy, Sangareddy, Nalgonda
Top 5 Brands: Honda, Hero, Bajaj, TVS, Maruti Suzuki

⚡ EV-Specific Analysis (2019–2025)
EV penetration began post-2019, steadily growing each year
Created new vehicle class categories for EVs (2W, 4W, Commercial, etc.)
Created year & month features to identify seasonal adoption trends
Built full-year & district-level EV datasets for modeling

🤖 Machine Learning Forecasts
🔵 Model 1: Linear Regression – Yearly Forecast
Target: Total EV Registrations per Year
Train-Test Split: 80/20
Evaluation Metrics:
R² Score: -2.41 (underfitting)
2025 Prediction: ~94,000 EVs
2026 Prediction: ~1.38 lakh EVs

🟢 Model 2: Random Forest – Monthly Forecast
Target: Monthly EV Registrations (Jul 2025–Dec 2026)
Evaluation Metrics:
R² Score: 0.77 (better fit than Linear Regression)
Trend: Steady monthly growth forecast

🟣 Model 3: Linear Regression – District-Wise Forecast
Features: Year-wise registration counts, avg growth
Target: 2026 registration per district
Evaluation Metrics:
R² Score: 1.0 (perfect fit)
Output: Predicted Top 10 Districts for 2026 EV adoption

📈 Power BI Dashboards
Interactive dashboards built using cleaned data and uploaded in .pbix format:
2019 Overall Vehicle Dashboard
EV-Specific Dashboard (2019–2025)
📎 Links available in the repo

🧾 SQL Business Insights
Used SQL to extract deeper insights from the 2019 and EV datasets:
Category & fuel-based trends
Vehicle type distribution
District & brand-wise summaries
📎 SQL queries stored in /sql folder
