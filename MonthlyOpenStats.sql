/*
    Query: Monthly Open Price Statistics for PYPL
    Description:
    - Calculates monthly maximum and minimum 'Open' prices.
    - Computes month-to-month absolute and percentage differences.
    - Uses window functions for change calculations.

    Author: Aga Pawlowska
    Date: 2025-04-21
*/

WITH MonthlyStats AS (
	SELECT 
		[Year] = YEAR([Date]), 
		[Month] = MONTH([Date]),
		[Max Open] = MAX(CAST([Open] AS DECIMAL(10,2))),
		[Min Open] = MIN(CAST([Open] AS DECIMAL(10,2)))
	FROM PYPL
	GROUP BY 
		YEAR([Date]), 
		MONTH([Date])
)

SELECT
	[Year],
	[Month],
	[Max Open],
	[Monthly Max Open Diff] = [Max Open] - LAG([Max Open]) OVER (ORDER BY [Year], [Month]),
	[MaxOpenChangePct ] = CAST(([Max Open] - LAG([Max Open]) OVER (ORDER BY [Year], [Month])) / [Max Open] * 100 AS DECIMAL(10,2)),
	[Min Open],
	[Monthly Min Open Diff] = [Min Open] - LAG([Min Open]) OVER (ORDER BY [Year], [Month]),
	[MinOpenChangePct] = CAST(([Min Open] - LAG([Min Open]) OVER (ORDER BY [Year], [Month])) / [Min Open] * 100 AS DECIMAL(10,2))
FROM MonthlyStats
ORDER BY 
	[Year], 
	[Month]