CREATE TABLE #lag
(
 BusinessEntityID INT
,SalesYear   INT
,CurrentQuota DECIMAL(20,4)
)
 
GO
 
--Insert Data
INSERT INTO #lag
SELECT 275 , 2005 , '367000.00'
UNION ALL
SELECT 275 , 2005 , '556000.00'
UNION ALL
SELECT 275 , 2006 , '502000.00'
UNION ALL
SELECT 275 , 2006 , '550000.00'
UNION ALL
SELECT 275 , 2006 , '1429000.00'
UNION ALL
SELECT 275 , 2006 ,   '1324000.00'

--SOLUTION 1 
SELECT 
    BusinessEntityID,
    SalesYear,
    CurrentQuota,
    lead(CurrentQuota, 1, 0) over (partition by BusinessEntityID order by SalesYear) NextQuota
FROM  #lag

--SOLUTION 2 
;with cte6 as 
(
select BusinessEntityID, SalesYear, CurrentQuota,
ROW_NUMBER() over (order by BusinessEntityID, SalesYear) RowNum
from #lag
)
select  
    a.BusinessEntityID,
    a.SalesYear,
    a.CurrentQuota,
    b.CurrentQuota as NextCurrentData
from cte6 as a
left join cte6 as b on a.RowNum = b.RowNum - 1;

--SOLUTION 3
select BusinessEntityID, SalesYear, a.CurrentQuota, 
(
	select top 1 b.CurrentQuota
	from #lag as b 
	where a.CurrentQuota < b.CurrentQuota 
	order by b.CurrentQuota asc
) as previousnumber 
from #lag as a
order by CurrentQuota
