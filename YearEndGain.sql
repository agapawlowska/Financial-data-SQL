/*
    Query: Year-End YTD Gains Check for PYPL
    Description:
    - Checks YTD Gains on December 31st each year.
    - Marks year as 'Loss' or 'No' based on YTD Gains.

    Author: Aga Pawlowska
    Date: 2025-04-21
*/

SELECT DISTINCT
	[Date],
	[YTD Gains] = CAST([YTD Gains] AS DECIMAL(10,5)),
	[Year Loss] = IIF([YTD Gains] > 0, 'No', 'Yes')
FROM PYPL
WHERE MONTH([Date]) = 12 AND DAY([Date]) = 31
ORDER BY [Date]
