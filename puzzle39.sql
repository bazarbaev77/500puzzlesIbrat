CREATE TABLE GenderCount
(
NAME VARCHAR(10)
,Gender VARCHAR(1)
)
GO
 
--INSERT Data
INSERT INTO GenderCount(NAME,Gender)
VALUES
('Pawan','M'),
('Isha','F'),
('Neeraj','M'),
('Mayank','M'),
('Sandeep','M'),
('Gopal','M'),
('Sugandha','F'),
('Kritika','F')
 
--Verify Data
;with cte3 as (
SELECT NAME, Gender, row_number() over(partition by gender order by gender) d FROM GenderCount
group by name, Gender)
select gender, max(d) from cte3
group by gender


;with cte4 as (
select gender, count(gender) MaleCount from GenderCount
group by gender
),
cte5 as (
select gender, count(gender) FemaleCount from GenderCount
group by gender
)
select MaleCount, FemaleCount from cte4, cte5
where cte4.Gender='F' and cte5.Gender = 'M'