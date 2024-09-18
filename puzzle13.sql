CREATE TABLE RateTable (
    dt DATE PRIMARY KEY,
    Rate INT NOT NULL
);

INSERT INTO RateTable (dt, Rate) VALUES
('2014-09-18', 27000),
('2014-09-19', 27000),
('2014-09-20', 31000),
('2014-09-21', 31000),
('2014-09-22', 31000),
('2014-09-23', 32000),
('2014-09-24', 31000),
('2014-09-25', 32000),
('2014-09-26', 27000);

select * from RateTable

select min(dt) startdate, max(dt) enddate, max(rate) rate
from
(
SELECT
dt,
Rate,
ROW_NUMBER() OVER (ORDER BY dt) 
-ROW_NUMBER() OVER (partition by rate ORDER BY dt) AS grp
FROM ratetable
) as d
group by grp,rate
order by 1




; WITH CTE1 AS
( 
       SELECT dt , Rate , ROW_NUMBER() OVER (ORDER BY dt) Rnk  FROM RateTable 
)
,CTE2 AS
(
       SELECT *,  CASE WHEN Rate = lag(Rate) over(order by rnk) THEN 0 ELSE 1 END cols FROM CTE1 c2
)
,CTE3 AS
(
       SELECT *,  SUM(cols) over(order by rnk) Grouper FROM CTE2 c2
)
SELECT MIN(dt) StartDate , MAX(dt) EndDate , MAX(Rate) Rate FROM CTE3 GROUP BY Grouper


select * FROM INFORMATION_SCHEMA.COLUMNS