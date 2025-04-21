SELECT 
[Date],
[YTD Gains],
[Year Loss] = IIF([YTD Gains] > 0, 'No', 'Yes')
FROM 
(	SELECT DISTINCT
	[Date],
	YEAR([Date]) AS [Year],
	MONTH([Date]) AS [Month],
	DAY([Date]) AS [Day],
	[YTD Gains]
	FROM PYPL
	) AS A
WHERE [Month] = 12 AND [Day] = 21
ORDER BY [Date]
