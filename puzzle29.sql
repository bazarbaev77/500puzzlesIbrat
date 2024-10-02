CREATE TABLE testMultipleValues
(
ID int
,Name varchar(100)
)
GO
 
--Insert Data
INSERT INTO testMultipleValues(ID,Name)
VALUES
(1,'a,b,c,d,e'),
(2,'a,b'),
(3,'c,d'),
(4,'e'),
(5,'f')
 
--Verify Data
SELECT ID, Name FROM testMultipleValues


SELECT id, upper(value) AS Tag
FROM testmultiplevalues
CROSS APPLY STRING_SPLIT(name, ',');

