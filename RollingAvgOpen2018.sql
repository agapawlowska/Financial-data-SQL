/*
    Query: 7-day Rolling Average of 'Open' Prices in 2018
    Description:
    - Calculates rolling average over 7 days for PYPL.

    Author: Aga Pawlowska
    Date: 2025-04-21
*/

WITH RollingAvgOpen2018 AS (
	SELECT 
		[Date],
		[Open] = CAST([Open] AS DECIMAL(10,2)),
		[7DaysOpenRollingAverage] = (AVG([Open]) OVER (ORDER BY [Date] ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS DECIMAL(10,2))
	FROM PYPL
	WHERE YEAR([Date]) = 2018
)

SELECT 
	[Date],
	[Open],
	[7DaysOpenRollingAverage],
	[RollingAvg7DaysOpenChange] = [7DaysOpenRollingAverage] - LAG([7DaysOpenRollingAverage]) OVER (ORDER BY [Date])
FROM RollingAvgOpen2018
ORDER BY [Date]


