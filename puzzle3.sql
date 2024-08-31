-- Create the table
CREATE TABLE #EmpBirth (
    EmpId INT PRIMARY KEY,
    EmpName VARCHAR(50),
    BirthDate DATE
);

-- Insert the data
INSERT INTO #EmpBirth (EmpId, EmpName, BirthDate)
VALUES 
    (1, 'Pawan', CONVERT(DATE, '04-12-1983', 103)),  
    (2, 'Zuzu', CONVERT(DATE, '28-11-1986', 103)),   
    (3, 'Parveen', CONVERT(DATE, '07-05-1977', 103)),
    (4, 'Mahesh', CONVERT(DATE, '13-01-1983', 103)), 
    (5, 'Ramesh', CONVERT(DATE, '09-05-1983', 103)); 


select *
from #EmpBirth
where datepart(MM, BirthDate) = 5 
  and datepart(DD, BirthDate) between 7 and 15

