SELECT TOP 10 
    [Country],
    [Annual CO2 emissions (per capita)] AS CO2Emissions_perCapita
FROM [Environment_Cleaned$]
ORDER BY [Annual CO2 emissions (per capita)] ASC


SELECT TOP 10 
    [Country],
    [Solar (TWh growth - equivalent)] AS [Solar Growth (TWh Equivalent)]
FROM [Environment_Cleaned$]
ORDER BY [Solar (TWh growth - equivalent)] DESC


SELECT 
    [Country],
    [Electricity from solar (TWh)] AS [Electricity from Solar (TWh)],
    [Annual CO2 emissions (per capita)] AS [CO? Emissions per Capita]
FROM [Environment_Cleaned$]
ORDER BY [Electricity from solar (TWh)] DESC


SELECT TOP 10 
    [Country],
    [Solar (% equivalent primary energy)] AS [Solar % of Primary Energy]
FROM [Environment_Cleaned$]
ORDER BY [Solar (% equivalent primary energy)] DESC


SELECT 
    [Country],
    [Solar (% equivalent primary energy)] AS [Solar % of Primary Energy],
    [Annual CO2 emissions (per capita)] AS [CO? Emissions per Capita]
FROM [Environment_Cleaned$]
WHERE [Solar (% equivalent primary energy)] IS NOT NULL
  AND [Annual CO2 emissions (per capita)] IS NOT NULL
ORDER BY [Solar (% equivalent primary energy)] DESC, [Annual CO2 emissions (per capita)] ASC


SELECT 
    [Country],
    [Solar (TWh growth - equivalent)] AS [Solar Growth (TWh Equivalent)],
    [Electricity from solar (TWh)] AS [Electricity from Solar (TWh)]
FROM [Environment_Cleaned$]
ORDER BY [Solar (TWh growth - equivalent)] DESC
