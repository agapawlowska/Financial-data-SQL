/*
    Query: Open Price Statistics for PYPL and NVDA in 2020
    Description:
    - Computes day-to-day absolute and percentage differences.
    - Uses window functions for change calculations.

    Author: Aga Pawlowska
    Date: 2025-04-21
*/


WITH OpenPYPLNVDA2020 AS (
	SELECT DISTINCT
		[Date] = PYPL.[Date],
		[PYPL Open] = CAST(PYPL.[Open] AS DECIMAL(10,3)),
		[NVDA Open] = CAST(NVDA.[Open] AS DECIMAL(10,3))
		FROM PYPL 
	LEFT JOIN 
		NVDA ON PYPL.[Date] = NVDA.[Date]
	WHERE YEAR(PYPL.[Date]) = 2020
)

SELECT 
	[Date],
	[PYPL Open],
	[PYPL Daily Diff] = [PYPL Open] - LAG([PYPL Open]) OVER (ORDER BY [Date]),
	[PYPL Daily % Diff] = CAST(([PYPL Open] - LAG([PYPL Open]) OVER (ORDER BY [Date])) / [PYPL Open] * 100 AS DECIMAL(10,2)),
	[NVDA Open],
	[NVDA Daily Diff] = [NVDA Open] - LAG([NVDA Open]) OVER (ORDER BY [Date]),
	[NVDA Daily % Diff] = CAST(([NVDA Open] - LAG([NVDA Open]) OVER (ORDER BY [Date])) / [NVDA Open] * 100 AS DECIMAL(10,2))
FROM OpenPYPLNVDA2020
