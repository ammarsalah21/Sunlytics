-- =========================================================
-- IN 2023 1️⃣ Top 10 countries by CO₂ emissions per capita (Annual CO₂ emissions per capita)
-- =========================================================
SELECT  TOP 10
    c.Country,
    f.[Annual CO₂ emissions (per capita)] AS CO2Emissions_perCapita,
    f.YearID
FROM factSolar f
JOIN dimCountry c ON f.CountryID = c.CountryID
WHERE f.YearID=2023
ORDER BY f.[Annual CO₂ emissions (per capita)] ASC

-- =========================================================
-- 2️⃣ In 2023 Top 10 countries by solar growth (Solar Growth TWh Equivalent)
-- =========================================================
SELECT TOP 10 
    c.Country,
    f.[Solar (TWh growth - equivalent)] AS [Solar Growth (TWh Equivalent)],
    f.YearID
FROM factSolar f
JOIN dimCountry c ON f.CountryID = c.CountryID
WHERE f.YearID=2023
ORDER BY f.[Solar (TWh growth - equivalent)] DESC


-- =========================================================
-- 3️⃣ In 2023 TOP 10 Countries by electricity from solar and CO₂ emissions
-- =========================================================
SELECT Top 10
    c.Country,
    f.[Electricity from solar (TWh)] AS [Electricity from Solar (TWh)],
    f.[Annual CO₂ emissions (per capita)] AS [CO2 Emissions per Capita] ,
    f.YearID
FROM factSolar f
JOIN dimCountry c ON f.CountryID = c.CountryID 
WHERE f.YearID=2023
ORDER BY f.[Electricity from solar (TWh)] DESC


-- =========================================================
-- 4️⃣ Top 10 countries by solar share of primary energy
-- =========================================================
SELECT TOP 10 
    c.Country,
    f.[Solar (% equivalent primary energy)] AS [Solar % of Primary Energy],
    f.YearID
FROM factSolar f
JOIN dimCountry c ON f.CountryID = c.CountryID
ORDER BY f.[Solar (% equivalent primary energy)] DESC


-- =========================================================
-- 5️⃣ In 2023 TOP 10 Countries with solar share of primary energy and CO₂ emissions
-- =========================================================
SELECT TOP 10
    c.Country,
    f.[Solar (% equivalent primary energy)] AS [Solar % of Primary Energy],
    f.[Annual CO₂ emissions (per capita)] AS [CO2 Emissions per Capita],
    f.YearID
FROM factSolar f
JOIN dimCountry c ON f.CountryID = c.CountryID
WHERE f.[Solar (% equivalent primary energy)] IS NOT NULL
  AND f.[Annual CO₂ emissions (per capita)] IS NOT NULL
  AND f.YearID = 2023
ORDER BY f.[Solar (% equivalent primary energy)] DESC,
         f.[Annual CO₂ emissions (per capita)] ASC


-- =========================================================
-- 6️⃣ In 2023 top 10 Countries by solar growth and electricity from solar
-- =========================================================
SELECT Top 10
    c.Country,
    f.[Solar (TWh growth - equivalent)] AS [Solar Growth (TWh Equivalent)],
    f.[Electricity from solar (TWh)] AS [Electricity from Solar (TWh)] ,
    f.YearID
FROM factSolar f
JOIN dimCountry c ON f.CountryID = c.CountryID
WHERE f.YearID = 2023
ORDER BY f.[Solar (TWh growth - equivalent)] DESC

-- Global Solar Trends --

 

-- Change in solar panel prices over the years --
SELECT DISTINCT
       g.year_Date,
       g.[Solar photovoltaic module price]
FROM solarGlobal g
WHERE g.[Solar photovoltaic module price] IS NOT NULL
ORDER BY g.year_Date



----------------------------------------------------------
-- Global growth in installed capacity --
SELECT DISTINCT
g.year_Date,
       g.[Solar photovoltaic cumulative capacity]
FROM solarGlobal g
ORDER BY g.year_Date

----------------------------------------------------------
-- Annual rate of change in global capacity --
WITH yearly AS (
    SELECT year_Date,
           MAX([Solar photovoltaic cumulative capacity]) AS capacity
    FROM solarGlobal
    WHERE [Solar photovoltaic cumulative capacity] IS NOT NULL
    GROUP BY year_Date
)
SELECT year_Date,
       capacity - LAG(capacity) OVER (ORDER BY year_Date) AS growth
FROM yearly
ORDER BY year_Date




--highest population by country

SELECT TOP 10
       c.Country,
       f.Population AS Population,
       f.YearID
FROM factSolar f
JOIN dimCountry c 
     ON f.CountryID = c.CountryID   -- assuming this is the join key
WHERE f.YearID = 2023
ORDER BY f.Population DESC



-- Classification of countries by income level and their count --
SELECT i.[World Bank's income classification], 
       COUNT(*) AS CountryCount
FROM dimIncome i
JOIN factSolar f 
     ON f.IncomeID = i.IncomeID
GROUP BY i.[World Bank's income classification]
ORDER BY CountryCount DESC




-- Top 10 countries by Human Development Index --
SELECT DISTINCT TOP 10 
       h.Country, 
       h.[Human Development Index] ,
       h.Year
FROM HDI h
ORDER BY h.[Human Development Index] DESC

---
SELECT f.GSTI, 
       f.YearID, 
       c.Country
FROM factSolar f
JOIN dimCountry c 
     ON f.CountryID = c.CountryID
WHERE c.Country = 'China'








