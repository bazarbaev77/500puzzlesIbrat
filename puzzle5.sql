CREATE TABLE PQ
(
ID INT
,Name VARCHAR(10)
,Typed VARCHAR(10)
)
 

INSERT INTO PQ(ID,Name,Typed) VALUES  (1,'P',NULL) , (1,NULL,'Q')

SELECT * FROM  PQ


;with cte_combined as (
    select 
        id,
        max([name]) as [name],  
        max(typed) as typed
    from pq
    group by id
)
select 
    id,
    [name],
    typed
from cte_combined
where [name] is not null 
and typed is not null