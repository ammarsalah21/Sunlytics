-- Global Solar Trends --

-- All Tables --
select * from ['solar-pv-prices-vs-cumulative-c$']
select * from Main_Cleaned$
order by year
select * from Environment_Cleaned$
order by year
select * from Efficiency_Cleaned$
order by year
select * from ['Country indicators$']
----------------------------------------------------------

-- تغير سعر الألواح الشمسية عبر السنوات --
select Year, [Solar photovoltaic module price] from ['solar-pv-prices-vs-cumulative-c$']
order by Year
----------------------------------------------------------
-- النمو العالمى فى السعة المركبة --
select Year, [Solar photovoltaic cumulative capacity] from ['solar-pv-prices-vs-cumulative-c$']
order by Year
----------------------------------------------------------
-- معدل التغير السنوى فى السعة العالمية --
select year,
	   [Solar photovoltaic cumulative capacity] - LAG([Solar photovoltaic cumulative capacity]) over
	   (order by year) as growth
from ['solar-pv-prices-vs-cumulative-c$']
