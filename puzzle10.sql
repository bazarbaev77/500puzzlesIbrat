-- Create the Department table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY NOT NULL,
    DeptName VARCHAR(50) NOT NULL
);

-- Insert data into the Department table
INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'Finance'),
(2, 'IT'),
(3, 'HR');

-- Create the Emps table
CREATE TABLE Emps (
    EmpID INT PRIMARY KEY NOT NULL,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT NOT NULL,
    EmpSalary INT NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert data into the Emps table
INSERT INTO Emps (EmpID, EmpName, DeptID, EmpSalary) VALUES
(101, 'Isha', 1, 7000),
(111, 'Esha', 1, 8970),
(102, 'Mayank', 1, 8900),
(103, 'Ramesh', 2, 4000),
(104, 'Avtaar', 2, 9000),
(105, 'Gopal', 3, 17000),
(106, 'Krishna', 3, 1000),
(107, 'Suchita', 3, 7000),
(108, 'Ranjan', 3, 17900);


select * from Emps
select * from Department



;with cte as
(
select *,
rank() over(partition by deptid order by empsalary desc) [rank]
from Emps
)
select a.EmpID,
       a.EmpName,
       b.DeptName,
       a.EmpSalary as n_HighestSalary
from cte a
join Department b
on a.DeptID = b.DeptID
where [rank] = 3


