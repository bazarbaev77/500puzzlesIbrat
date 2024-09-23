--Create table
 
CREATE TABLE IndAusSeries
(
TeamA VARCHAR(3)
,TeamB VARCHAR(3)
,MatchDate varchar(15)
,WinsBy VARCHAR(3)
)
--Insert Data
 go
INSERT INTO IndAusSeries(TeamA,TeamB,MatchDate,WinsBy)
VALUES
('Ind','Aus','01-10-2014','Ind'),
('Ind','Aus','01-15-2014','Ind'),
('Ind','Aus','01-19-2014','Ind'),
('Ind','Aus','01-23-2014','Aus'),
('Ind','Aus','01-27-2014','Ind'),
('Ind','Aus','01-31-2014','Ind')


-- NOT DYNAMIC))
SELECT top 3
    TeamA,
    TeamB,
    MatchDate,
    WinsBy,
    ROW_NUMBER() OVER (ORDER BY MatchDate) AS rn
FROM IndAusSeries
WHERE WinsBy = 'Ind'
order by matchdate



with r as 
(
select *,
row_number() over(order by matchdate)
-row_number() over (partition by winsby order by matchdate) as rn 
from IndAusSeries
),
e as 
(
select winsby,
       rn,
       rank() over(order by count(1) desc) as rnk 
	   from r 
	   group by winsby,rn
	   )
select r.TeamA,r.TeamB,r.MatchDate,r.WinsBy
from r
join e
on r.winsby = e.winsby and r.rn=e.rn and e.rnk=1;