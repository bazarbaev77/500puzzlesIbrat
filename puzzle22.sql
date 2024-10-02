--CREATE TABLE
CREATE TABLE TestTable 
(
  StudentName VARCHAR(100)
, Course VARCHAR(100)
, Instructor VARCHAR(100)
, RoomNo VARCHAR(100)
)
GO
 
-- Populate table
 
INSERT INTO TestTable (StudentName, Course, Instructor, RoomNo)
SELECT 'Mark', 'Algebra', 'Dr. James', '101'
UNION ALL
SELECT 'Mark', 'Maths', 'Dr. Jones', '201'
UNION ALL
SELECT 'Joe', 'Algebra', 'Dr. James', '101'
UNION ALL
SELECT 'Joe', 'Science', 'Dr. Ross', '301'
UNION ALL
SELECT 'Joe', 'Geography', 'Dr. Lisa', '401'
UNION ALL
SELECT 'Jenny', 'Algebra', 'Dr. James', '101'
GO
 
-- Check orginal data
 
SELECT 
    StudentName, 
    STRING_AGG(CONCAT(Course, ' by ', Instructor, ' in Room No ', RoomNo), ', ') AS TaughtBy
FROM 
    TestTable
GROUP BY 
    StudentName;
