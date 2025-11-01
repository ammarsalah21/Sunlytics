--highest population by country

SELECT TOP 10 Country, [Total population, 2018] AS Population
FROM dimCountryIndicators
ORDER BY [Total population, 2018] DESC;


select * from ['Country indicators$']

-- أعلى 10 دول من حيث عدد السكان
SELECT TOP 10 "Country or region", [Total population, 2018] AS Population
FROM [dbo].['Country indicators$']
ORDER BY [Total population, 2018] DESC;

-- تصنيف الدول حسب مستوى الدخل وعددها
SELECT [World Bank's income classification], COUNT(*) AS NumCountries
FROM dbo.Main_Cleaned$
GROUP BY [World Bank's income classification];
 
 -- تصنيف الدول حسب مستوى الدخل وعددها (لسنة 2018)
SELECT "World Bank's income classification", COUNT(Country) AS NumCountries
FROM dbo.Main_Cleaned$
WHERE Year = 2018
GROUP BY "World Bank's income classification";


-- الدول ذات أعلى مؤشر تنمية بشرية
SELECT TOP 10 "Country or region", "Human development _Index, 2017"
FROM dbo.['Country indicators$']
ORDER BY "Human development _Index, 2017" DESC;

