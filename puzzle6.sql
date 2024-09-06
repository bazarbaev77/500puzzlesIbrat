CREATE TABLE #NthHighest
(
 Name  varchar(5)  NOT NULL,
 Salary  int  NOT NULL
)
 
--Insert the values
INSERT INTO  #NthHighest(Name, Salary)
VALUES
('e5', 45000),
('e3', 30000),
('e2', 49000),
('e4', 36600),
('e1', 58000)
 
--Check data
SELECT Name,Salary FROM #NthHighest


select top 1 salary from #NthHighest
where salary in (select top 1 salary from #NthHighest order by salary desc)
order by salary asc


with cte77
as
(
select top 5 salary from #NthHighest 
order by salary desc 
)
select top 1 salary from cte77 order by salary 



go 
create proc l77
    @N int
as
begin
    ;with def as
    (
        select salary,
               ROW_NUMBER() over (order by salary desc) c
        from #NthHighest
    )
    select salary
    from def
    where c = @N;
end

exec l77 @n = 1

--Answer from gpt
;WITH RankedSalaries AS
(
    SELECT DISTINCT salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS Rank
    FROM #NthHighest
)
SELECT salary
FROM RankedSalaries
WHERE Rank = @N
