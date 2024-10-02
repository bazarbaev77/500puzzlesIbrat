CREATE TABLE EmployeeSalaries (
    emp_name VARCHAR(50),
    sal_date DATE,
    sal_amt DECIMAL(10, 2)
);

INSERT INTO EmployeeSalaries (emp_name, sal_date, sal_amt) VALUES
    ('Dick', '1996-06-20', 500),
    ('Harry', '1996-07-20', 500),
    ('Harry', '1996-09-20', 700),
    ('Tom', '1996-06-20', 500),
    ('Tom', '1996-08-20', 700),
    ('Tom', '1996-10-20', 800),
    ('Tom', '1996-12-20', 900);



select Emp_Name,[1996-06-20],[1996-07-20],[1996-08-20],[1996-09-20],[1996-10-20],[1996-12-20] 
from EmployeeSalaries
PIVOT 
(max(sal_amt) for sal_date IN ([1996-06-20],[1996-07-20],[1996-08-20],[1996-09-20],[1996-10-20],[1996-12-20]))a