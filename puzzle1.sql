--create database puzzles500
--use puzzles500


CREATE TABLE #lag
(
BusinessEntityID INT
,SalesYear   INT
,CurrentQuota  DECIMAL(20,4)
)
GO

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
SELECT 275 , 2006 ,  '1324000.00'

select *, 
       lag(CurrentQuota, 1, 0) over (order by (select null)) as lagCurrentData
from #lag;
<<<<<<< HEAD

--SOLUTION 2

select BusinessEntityID, SalesYear, a.CurrentQuota, 
(
	select top 1 b.CurrentQuota
	from #lag as b 
	where a.CurrentQuota > b.CurrentQuota 
	order by b.CurrentQuota desc
) as previousnumber 
from #lag as a
order by CurrentQuota
=======
>>>>>>> e5505ac04eed6d29a50230dfbf999ff9490b8f8b
