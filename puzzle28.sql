CREATE TABLE DeleteDup
(
ID INT
)
Go
 
--Insert Data
INSERT INTO DeleteDup VALUES(1),(2),(1)
 
--Verify Data
SELECT distinct ID FROM DeleteDup


select id from DeleteDup
group by id 


;with cte4 as 
(
	select id, row_number() over (partition by id order by id) rn from DeleteDup
)
select id from cte4
where rn=1