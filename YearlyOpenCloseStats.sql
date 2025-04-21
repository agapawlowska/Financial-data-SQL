/*
    Query: Yearly Open and Close Price Statistics for PYPL
    Description:
    - Calculates yearly maximum and minimum 'Open' and 'Close' prices.

    Author: Aga Pawlowska
    Date: 2025-04-21
*/

SELECT 
	[Year],
	[Year Max Open] = MAX(CAST([Open] AS DECIMAL(10,2))),
	[Year Min Open] = MIN(CAST([Open] AS DECIMAL(10,2))),
	[Year Max Close] = MAX(CAST([Close] AS DECIMAL(10,2))),
	[Year Min Close] = MIN(CAST([Close] AS DECIMAL(10,2)))
FROM (
	SELECT  [Year] = YEAR([Date]),
			[Open],
			[Close]
	FROM PYPL) AS A
GROUP BY [Year]
ORDER BY [Year]
