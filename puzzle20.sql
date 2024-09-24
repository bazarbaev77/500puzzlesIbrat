-- Создание таблицы и вставка данных в одном запросе
CREATE TABLE emp_loyees (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    GENDER CHAR(1)
);

-- Вставка данных
INSERT INTO emp_loyees (ID, NAME, GENDER) VALUES
    (10, 't', 'f'),
    (9, 'g', 'f'),
    (3, 'Pawan', 'M'),
    (4, 'Gopal', 'M'),
    (5, 'Sandeep', 'M'),
    (6, 'Isha', 'F'),
    (7, 'Sugandha', 'F'),
    (8, 'Kritika', 'F');

with cte as (
select *, ROW_NUMBER() over(partition by gender order by id)rn from emp_loyees
)
select id, name, gender from cte order by rn, id


