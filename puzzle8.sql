CREATE TABLE #YearlyMaxValues
(
    Year1 INT,
    Max1 INT,
    Max2 INT,
    Max3 INT
);

INSERT INTO #YearlyMaxValues (Year1, Max1, Max2, Max3)
VALUES
    (2001, 10, 101, 87),
    (2002, 103, 19, 88),
    (2003, 21, 23, 89),
    (2004, 27, 28, 91);

SELECT * FROM #YearlyMaxValues

SELECT 
    Year1,
    GREATEST(Max1, Max2, Max3) AS MaxValue
FROM 
    #YearlyMaxValues



;with ud 
as
(
SELECT Year1, MaxValue
FROM #YearlyMaxValues
unpivot(
    MaxValue FOR MaxColumn IN (Max1, Max2, Max3)
) AS Unpivoted
)

select Year1, max(MaxValue) from ud
group by year1



select Year1, max(MaxValue)
from #YearlyMaxValues
cross apply (values (Max1), (Max2), (Max3)) AS valuetable(MaxValue)
group by year1

;
with unio_n
as
(
select Year1, Max1 as MaxValue from #YearlyMaxValues
union all
select Year1, Max2 from #YearlyMaxValues
union all
select Year1, Max3 from #YearlyMaxValues
)
select year1, max(maxvalue) from unio_n
group by year1