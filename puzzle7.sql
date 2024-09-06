CREATE TABLE #List
(
ID INT
)

 
INSERT INTO #List(ID) VALUES (1),(2),(3),(4),(5)


select * from #list

select id,
sum(id) over(order by id) total_num
from #List


;with cte7 as
(
    select *, row_number() over (order by (select null)) abc
    from #List
)
select ID , (select sum(ID) from cte7 c2 where c2.abc <= c1.abc) sums
from cte7 c1



