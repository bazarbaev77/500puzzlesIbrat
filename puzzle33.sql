CREATE TABLE TESTDuplicateCount ( ID INT ,EmpName VARCHAR(100) 
,EmpDate DATETIME ) 
GO 
 
--Insert Data
INSERT INTO TESTDuplicateCount(ID,EmpName,EmpDate) 
VALUES
(1,'Pawan','2014-01-05'),
(2,'Pawan','2014-03-05'), 
(3,'Pawan','2014-02-05'), 
(4,'Manisha','2014-07-05'), 
(5,'Sharlee','2014-09-05'), 
(6,'Barry','2014-02-05'), 
(7,'Jyoti','2014-04-05'), 
(8,'Jyoti','2014-05-05') 
 
--Check data 
SELECT ID,EmpName,EmpDate FROM TESTDuplicateCount 

;with ser1 as (
select empname, row_number() over (partition by empname order by empname) a from TESTDuplicateCount 
group by EmpDate, EmpName
)
select empname from ser1
where a=2


select EmpName , count(*) DuplicateCount FROM TESTDuplicateCount
group by EmpName 
having count(*) > 1
order by EmpName 