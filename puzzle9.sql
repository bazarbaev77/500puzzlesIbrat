-- Drop the table if it already exists (optional, for cleanup)
DROP TABLE IF EXISTS emp_test_table;

-- Create the emp_test_table with the EmpSalary column
CREATE TABLE emp_test_table (
    employee_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(25) NULL,
    salary INT NULL,
    manager_id INT NULL
);

-- Insert data into the emp_test_table
INSERT INTO emp_test_table (employee_id, first_name, salary, manager_id) VALUES
(1, 'Pawan', 80000, 4),
(2, 'Dheeraj', 70000, 4),
(3, 'Isha', 100000, 4),
(4, 'Joteep', 90000, NULL),
(5, 'Suchita', 110000, 4);



select * from emp_test_table


select a.*
from emp_test_table a
join emp_test_table b on b.employee_id = a.manager_id
where a.salary > any (
    select salary
    from emp_test_table
    where employee_id = 4
)