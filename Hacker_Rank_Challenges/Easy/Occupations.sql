--Occupations

SELECT Doctor, Professor, Singer, Actor
FROM (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rn, 
        name, 
        occupation 
    FROM occupations
) AS RankedNames
PIVOT (
    MAX(name) FOR occupation IN ([Doctor], [Professor], [Singer], [Actor])
) AS PivotTable
ORDER BY rn;
