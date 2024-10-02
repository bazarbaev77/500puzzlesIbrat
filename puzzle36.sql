CREATE TABLE TestTranspose
(
 Year1 INT
,Month1 VARCHAR(3)
,Amount INT
)
GO
 
--Insert Data
 
INSERT INTO TestTranspose Values (2014,'Jan',1000),(2014,'Feb',1200),(2014,'Mar',1300)
INSERT INTO TestTranspose Values (2013,'Jan',3000)
 
--Verify Data
 
SELECT Year1,Month1,Amount FROM TestTranspose

select Year1, [Jan], [Feb], [Mar]
from 
(
    select Year1, Month1, Amount
    from TestTranspose
) SourceTable
pivot
(
    sum(Amount) 
    for Month1 in ([Jan], [Feb], [Mar]) 
) PivotTable
order by Year1;

