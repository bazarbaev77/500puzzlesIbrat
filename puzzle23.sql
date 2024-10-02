CREATE TABLE Test2DistinctCount
(
    a Int,
    b Int
);
GO

-- Вставка данных
INSERT INTO Test2DistinctCount (a, b) 
VALUES
(1, 5), 
(1, 4), 
(1, 4), 
(1, 5);

select * from Test2DistinctCount

;with lo as (
select a,b, count(a) i from Test2DistinctCount
group by a, b
having a<2
)
select a, b from lo


select distinct a, b from Test2DistinctCount

select a,b from Test2DistinctCount
group by a,b
